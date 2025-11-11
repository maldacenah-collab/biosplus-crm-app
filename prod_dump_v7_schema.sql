

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "postgis" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."condicion_iva_enum" AS ENUM (
    'Responsable Inscripto',
    'Monotributista',
    'Consumidor Final',
    'Exento',
    'No Responsable'
);


ALTER TYPE "public"."condicion_iva_enum" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_deuda_total_proveedor"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    UPDATE public.proveedores
    SET deuda_actual = (
        SELECT COALESCE(SUM(debe), 0) - COALESCE(SUM(haber), 0)
        FROM public.movimientos_cuenta_proveedor
        WHERE proveedor_id = COALESCE(NEW.proveedor_id, OLD.proveedor_id)
    )
    WHERE id = COALESCE(NEW.proveedor_id, OLD.proveedor_id);
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."actualizar_deuda_total_proveedor"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_estado_envio"("p_envio_id" bigint, "p_nuevo_estado" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  UPDATE logistica_envios SET estado = p_nuevo_estado WHERE id = p_envio_id;
END;
$$;


ALTER FUNCTION "public"."actualizar_estado_envio"("p_envio_id" bigint, "p_nuevo_estado" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_estado_logistica_v2"("p_pedido_id" bigint, "p_nuevo_estado_nombre" "text") RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_pedido RECORD;
    v_nuevo_estado_id INT;
    v_producto JSONB;
    v_saldo_pedido NUMERIC;
    v_vendedor RECORD;
    v_monto_comision NUMERIC;
BEGIN
    SELECT id INTO v_nuevo_estado_id FROM public.estados_pedido WHERE nombre = p_nuevo_estado_nombre;
    IF v_nuevo_estado_id IS NULL THEN
        RAISE EXCEPTION 'Estado de logística no válido: %', p_nuevo_estado_nombre;
    END IF;

    SELECT * INTO v_pedido FROM public.pedidos WHERE id = p_pedido_id FOR UPDATE;

    -- Actualizar estado
    UPDATE public.pedidos SET estado_id = v_nuevo_estado_id WHERE id = p_pedido_id;

    -- Lógica especial al marcar como 'Entregado'
    IF p_nuevo_estado_nombre = 'Entregado' THEN
        FOR v_producto IN SELECT * FROM jsonb_array_elements(v_pedido.productos)
        LOOP
            -- Descontar del stock reservado
            UPDATE public.lotes
            SET stock_reservado = stock_reservado - (v_producto->>'cantidad')::int
            WHERE id = (v_producto->>'lote_seleccionado_id')::bigint;
        END LOOP;
        
        -- Lógica de Comisión
        -- 1. Verificar si el pedido está pagado
        SELECT public.get_pedido_saldo(p_pedido_id) INTO v_saldo_pedido;
        
        -- 2. Si está pagado (saldo <= 0) y no tiene comisión, generarla
        IF v_saldo_pedido <= 0 AND NOT EXISTS (SELECT 1 FROM public.comisiones WHERE pedido_id = p_pedido_id) THEN
            SELECT * INTO v_vendedor FROM public.vendedores WHERE id = v_pedido.vendedor_id;
            IF FOUND AND v_vendedor.porcentaje_comision > 0 THEN
                v_monto_comision := v_pedido.valor * (v_vendedor.porcentaje_comision / 100.0);
                INSERT INTO public.comisiones (pedido_id, vendedor_id, monto_comision, porcentaje_aplicado, estado, fecha_generacion)
                VALUES (p_pedido_id, v_pedido.vendedor_id, v_monto_comision, v_vendedor.porcentaje_comision, 'pendiente', CURRENT_DATE);
            END IF;
        END IF;
    END IF;

    RETURN 'Estado de logística actualizado.';
END;
$$;


ALTER FUNCTION "public"."actualizar_estado_logistica_v2"("p_pedido_id" bigint, "p_nuevo_estado_nombre" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_estado_pedido_desde_logistica"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    estado_entregado_id BIGINT;
BEGIN
    IF NEW.estado = 'Entregado' AND OLD.estado IS DISTINCT FROM 'Entregado' THEN
        SELECT id INTO estado_entregado_id FROM public.estados_pedido WHERE nombre = 'Entregado' LIMIT 1;
        IF estado_entregado_id IS NOT NULL THEN
            UPDATE public.pedidos
            SET estado_id = estado_entregado_id
            WHERE id = NEW.pedido_id;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."actualizar_estado_pedido_desde_logistica"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_fecha_ultima_compra"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    UPDATE public.contactos SET ultima_compra = NEW.created_at::date WHERE id = NEW.contacto_id;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."actualizar_fecha_ultima_compra"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_precio_producto_pedido"("p_pedido_id" bigint, "p_producto_id" bigint, "p_nuevo_precio" numeric, "p_usuario_id" "uuid", "p_usuario_nombre" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_pedido record; v_productos_actualizados jsonb; v_precio_anterior numeric; v_nuevo_valor_total numeric; v_diferencia_valor numeric;
BEGIN
    SELECT * INTO v_pedido FROM public.pedidos WHERE id = p_pedido_id FOR UPDATE;
    IF NOT FOUND THEN RAISE EXCEPTION 'Pedido no encontrado.'; END IF;
    SELECT (elem->>'precio_unitario')::numeric INTO v_precio_anterior FROM jsonb_array_elements(v_pedido.productos) elem WHERE (elem->>'producto_id')::bigint = p_producto_id;
    SELECT jsonb_agg(CASE WHEN (p->>'producto_id')::bigint = p_producto_id THEN jsonb_set(p, '{precio_unitario}', to_jsonb(p_nuevo_precio)) ELSE p END)
    INTO v_productos_actualizados FROM jsonb_array_elements(v_pedido.productos) p;
    SELECT COALESCE(SUM((p_upd->>'cantidad')::numeric * (p_upd->>'precio_unitario')::numeric), 0)
    INTO v_nuevo_valor_total FROM jsonb_array_elements(v_productos_actualizados) p_upd;
    v_diferencia_valor := v_nuevo_valor_total - v_pedido.valor;
    UPDATE public.pedidos
    SET productos = (SELECT jsonb_agg(jsonb_set(p_upd, '{subtotal}', to_jsonb((p_upd->>'cantidad')::numeric * (p_upd->>'precio_unitario')::numeric))) FROM jsonb_array_elements(v_productos_actualizados) p_upd),
        valor = v_nuevo_valor_total
    WHERE id = p_pedido_id;
    IF abs(v_diferencia_valor) > 0.01 THEN
        INSERT INTO public.movimientos_cuenta_corriente(cliente_id, pedido_id, concepto, debe, haber, fecha)
        VALUES (v_pedido.contacto_id, p_pedido_id, 'Ajuste de precio en Pedido N°' || v_pedido.numero_pedido,
                CASE WHEN v_diferencia_valor > 0 THEN v_diferencia_valor ELSE 0 END,
                CASE WHEN v_diferencia_valor < 0 THEN -v_diferencia_valor ELSE 0 END,
                CURRENT_DATE);
    END IF;
    INSERT INTO public.auditoria_precios(usuario_id, usuario_nombre, entidad_tipo, entidad_id, producto_id, precio_anterior, precio_nuevo, justificacion)
    VALUES(p_usuario_id, p_usuario_nombre, 'Pedido', p_pedido_id, p_producto_id, v_precio_anterior, p_nuevo_precio, 'Cambio de precio manual por gerente en pedido.');
END;
$$;


ALTER FUNCTION "public"."actualizar_precio_producto_pedido"("p_pedido_id" bigint, "p_producto_id" bigint, "p_nuevo_precio" numeric, "p_usuario_id" "uuid", "p_usuario_nombre" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."actualizar_saldo_cuenta_corriente"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    ultimo_saldo NUMERIC;
BEGIN
    SELECT saldo INTO ultimo_saldo
    FROM public.movimientos_cuenta_corriente
    WHERE cliente_id = NEW.cliente_id
    ORDER BY fecha DESC, id DESC
    LIMIT 1;
    IF ultimo_saldo IS NULL THEN
        ultimo_saldo := 0;
    END IF;
    NEW.saldo := ultimo_saldo + NEW.debito - NEW.credito;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."actualizar_saldo_cuenta_corriente"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."ajustar_stock_lote"("p_lote_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    v_producto_id bigint;
    v_tipo_ajuste text;
BEGIN
    SELECT producto_id INTO v_producto_id FROM lotes WHERE id = p_lote_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'El lote especificado no existe.';
    END IF;
    UPDATE lotes
    SET stock_disponible = stock_disponible + p_cantidad_ajuste
    WHERE id = p_lote_id;
    IF p_cantidad_ajuste > 0 THEN
        v_tipo_ajuste := 'Entrada';
    ELSE
        v_tipo_ajuste := 'Salida';
    END IF;
    INSERT INTO stock_ajustes (producto_id, lote_id, tipo_ajuste, cantidad, justificacion, operador)
    VALUES (v_producto_id, p_lote_id, v_tipo_ajuste, ABS(p_cantidad_ajuste), p_justificacion, p_operador);
END;
$$;


ALTER FUNCTION "public"."ajustar_stock_lote"("p_lote_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."ajustar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    v_producto_id bigint;
    v_tipo_ajuste text;
    v_vendedor_nombre text;
BEGIN
    SELECT producto_id INTO v_producto_id FROM public.lotes WHERE id = p_lote_id;
    IF NOT FOUND THEN RAISE EXCEPTION 'El lote especificado no existe.'; END IF;
    SELECT nombre INTO v_vendedor_nombre FROM public.perfiles WHERE vendedor_id = p_vendedor_id;
    IF NOT FOUND THEN RAISE EXCEPTION 'El vendedor especificado no existe.'; END IF;
    INSERT INTO public.stock_vendedores (lote_id, vendedor_id, cantidad_asignada)
    VALUES (p_lote_id, p_vendedor_id, p_cantidad_ajuste)
    ON CONFLICT (lote_id, vendedor_id)
    DO UPDATE SET cantidad_asignada = stock_vendedores.cantidad_asignada + p_cantidad_ajuste;
    IF p_cantidad_ajuste > 0 THEN v_tipo_ajuste := 'Entrada a Vendedor';
    ELSE v_tipo_ajuste := 'Salida de Vendedor';
    END IF;
    INSERT INTO stock_ajustes (producto_id, lote_id, tipo_ajuste, cantidad, justificacion, operador)
    VALUES (v_producto_id, p_lote_id, v_tipo_ajuste, ABS(p_cantidad_ajuste), p_justificacion, p_operador || ' -> ' || v_vendedor_nombre);
END;
$$;


ALTER FUNCTION "public"."ajustar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_movimiento_cliente"("p_movimiento_id" bigint) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE mov_original RECORD; pago_maestro RECORD; anulacion_existente INT; v_cliente_id BIGINT;
BEGIN
    SELECT * INTO mov_original FROM public.movimientos_cuenta_corriente WHERE id = p_movimiento_id AND haber > 0 AND pago_id IS NOT NULL;
    IF NOT FOUND THEN RETURN; END IF;
    v_cliente_id := mov_original.cliente_id;
    SELECT count(*) INTO anulacion_existente FROM public.movimientos_cuenta_corriente WHERE pago_id = mov_original.pago_id AND concepto LIKE 'ANULACIÓN de:%';
    IF anulacion_existente > 0 THEN RAISE EXCEPTION 'El pago ya fue anulado previamente.'; END IF;
    DELETE FROM public.aplicacion_pagos WHERE pago_id = mov_original.pago_id;
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, debe, fecha, pago_id)
    VALUES(v_cliente_id, 'ANULACIÓN de: ' || mov_original.concepto, mov_original.haber, CURRENT_DATE, mov_original.pago_id);
    SELECT * INTO pago_maestro FROM public.pagos WHERE id = mov_original.pago_id;
    IF FOUND AND pago_maestro.es_pago_cruzado THEN
        PERFORM public.anular_movimiento_proveedor_desde_pago(mov_original.pago_id);
    END IF;
END;
$$;


ALTER FUNCTION "public"."anular_movimiento_cliente"("p_movimiento_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_movimiento_cliente_desde_pago"("p_pago_id" bigint) RETURNS "void"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, debe, fecha, pago_id) SELECT cliente_id, 'ANULACIÓN de: ' || concepto, haber, CURRENT_DATE, pago_id FROM public.movimientos_cuenta_corriente WHERE pago_id = p_pago_id AND haber > 0 AND NOT EXISTS (SELECT 1 FROM movimientos_cuenta_corriente WHERE pago_id = p_pago_id AND debe > 0);
$$;


ALTER FUNCTION "public"."anular_movimiento_cliente_desde_pago"("p_pago_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_movimiento_proveedor"("p_movimiento_id" bigint) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE mov_original RECORD; pago_maestro RECORD; anulacion_existente INT;
BEGIN
    SELECT * INTO mov_original FROM public.movimientos_cuenta_proveedor WHERE id = p_movimiento_id AND haber > 0;
    IF NOT FOUND OR mov_original.pago_id IS NULL THEN RETURN; END IF;
    SELECT count(*) INTO anulacion_existente FROM public.movimientos_cuenta_proveedor WHERE pago_id = mov_original.pago_id AND debe > 0;
    IF anulacion_existente > 0 THEN RETURN; END IF;
    INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, concepto, debe, fecha, pago_id) VALUES(mov_original.proveedor_id, 'ANULACIÓN de: ' || mov_original.concepto, mov_original.haber, CURRENT_DATE, mov_original.pago_id);
    SELECT * INTO pago_maestro FROM public.pagos WHERE id = mov_original.pago_id;
    IF pago_maestro.es_pago_cruzado THEN PERFORM public.anular_movimiento_cliente_desde_pago(mov_original.pago_id); END IF;
END;
$$;


ALTER FUNCTION "public"."anular_movimiento_proveedor"("p_movimiento_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_movimiento_proveedor_desde_pago"("p_pago_id" bigint) RETURNS "void"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, concepto, debe, fecha, pago_id) SELECT proveedor_id, 'ANULACIÓN de: ' || concepto, haber, CURRENT_DATE, pago_id FROM public.movimientos_cuenta_proveedor WHERE pago_id = p_pago_id AND haber > 0 AND NOT EXISTS (SELECT 1 FROM movimientos_cuenta_proveedor WHERE pago_id = p_pago_id AND debe > 0);
$$;


ALTER FUNCTION "public"."anular_movimiento_proveedor_desde_pago"("p_pago_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_pedido_v2"("p_pedido_id" bigint) RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_pedido RECORD;
    v_estado_anulado_id INT;
    v_estado_borrador_id INT;
    v_producto JSONB;
BEGIN
    SELECT id INTO v_estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado';
    SELECT id INTO v_estado_borrador_id FROM public.estados_pedido WHERE nombre = 'Borrador';

    SELECT * INTO v_pedido FROM public.pedidos WHERE id = p_pedido_id FOR UPDATE;
    
    IF v_pedido.estado_id = v_estado_anulado_id THEN
        RETURN 'El pedido ya estaba anulado.';
    END IF;

    -- Reversión de Stock y Creación de Movimiento de Ajuste (solo si no estaba en borrador)
    IF v_pedido.estado_id != v_estado_borrador_id THEN
        FOR v_producto IN SELECT * FROM jsonb_array_elements(v_pedido.productos)
        LOOP
            IF v_producto->>'lote_seleccionado_id' IS NOT NULL THEN
                
                -- Loguear el movimiento de ajuste ANTES de modificar el stock
                INSERT INTO public.stock_ajustes (
                    producto_id,
                    lote_id,
                    tipo_ajuste,
                    cantidad,
                    justificacion,
                    origen,
                    destino,
                    operador
                )
                VALUES (
                    (v_producto->>'producto_id')::bigint,
                    (v_producto->>'lote_seleccionado_id')::bigint,
                    'DEVOLUCIÓN POR ANULACIÓN',
                    (v_producto->>'cantidad')::int,
                    'Reversión por anulación del Pedido N°' || v_pedido.numero_pedido,
                    'Indefinido',
                    'Indefinido',
                    'Sistema (Anulación)'
                );

                -- Revertir stock según el origen
                IF v_pedido.origen_stock = 'deposito_principal' THEN
                    -- Si el stock estaba reservado, se libera y vuelve a disponible.
                    -- Si ya estaba entregado, la lógica de anulación debe asegurar que el stock reservado sea 0 y solo sumar a disponible.
                    -- Esta lógica simplificada asume que si no es borrador, la reserva se hizo.
                    UPDATE public.lotes
                    SET stock_reservado = stock_reservado - (v_producto->>'cantidad')::int,
                        stock_disponible = stock_disponible + (v_producto->>'cantidad')::int
                    WHERE id = (v_producto->>'lote_seleccionado_id')::bigint;
                ELSIF v_pedido.origen_stock = 'stock_vendedor' THEN
                    -- Devuelve el stock al vendedor.
                    UPDATE public.stock_vendedores
                    SET cantidad_asignada = cantidad_asignada + (v_producto->>'cantidad')::int
                    WHERE vendedor_id = v_pedido.vendedor_id AND lote_id = (v_producto->>'lote_seleccionado_id')::bigint;
                END IF;

            END IF;
        END LOOP;
    END IF;

    -- Reversión de Cuenta Corriente (si corresponde)
    IF EXISTS (SELECT 1 FROM public.movimientos_cuenta_corriente WHERE pedido_id = p_pedido_id AND debe > 0) THEN
      IF NOT EXISTS (SELECT 1 FROM public.movimientos_cuenta_corriente WHERE pedido_id = p_pedido_id AND concepto LIKE 'Anulación%') THEN
        INSERT INTO public.movimientos_cuenta_corriente (cliente_id, pedido_id, concepto, haber, fecha)
        VALUES (v_pedido.contacto_id, p_pedido_id, 'Anulación de Pedido N°' || v_pedido.numero_pedido, v_pedido.valor, CURRENT_DATE);
      END IF;
    END IF;

    -- Actualizar estado final del pedido
    UPDATE public.pedidos SET estado_id = v_estado_anulado_id WHERE id = p_pedido_id;

    RETURN 'Pedido anulado correctamente.';
END;
$$;


ALTER FUNCTION "public"."anular_pedido_v2"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_pedidos_borrador_antiguos"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE id_estado_borrador BIGINT; id_estado_anulado BIGINT;
BEGIN
    SELECT id INTO id_estado_borrador FROM public.estados_pedido WHERE nombre = 'Borrador';
    SELECT id INTO id_estado_anulado FROM public.estados_pedido WHERE nombre = 'Anulado';
    IF id_estado_borrador IS NOT NULL AND id_estado_anulado IS NOT NULL THEN
        UPDATE public.pedidos SET estado_id = id_estado_anulado, observaciones = COALESCE(observaciones, '') || E'\n- Anulado automáticamente por el sistema (borrador no completado).'
        WHERE estado_id = id_estado_borrador AND created_at < NOW() - INTERVAL '12 hours';
    END IF;
END;
$$;


ALTER FUNCTION "public"."anular_pedidos_borrador_antiguos"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."anular_pedidos_reserva_expirada"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    pedido_anulado RECORD;
    estado_anulado_id BIGINT;
BEGIN
    SELECT id INTO estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1;
    IF estado_anulado_id IS NULL THEN
        RAISE WARNING 'No se encontró el estado "Anulado".';
        RETURN;
    END IF;
    FOR pedido_anulado IN
        UPDATE public.pedidos p
        SET estado_id = estado_anulado_id,
            observaciones = COALESCE(observaciones, '') || E'\n- Anulado automáticamente por reserva de stock expirada.'
        WHERE p.id IN (
            SELECT r.pedido_id FROM public.reservas_stock r WHERE r.fecha_expiracion < now()
        )
        RETURNING p.id
    LOOP
        RAISE NOTICE 'Pedido ID % anulado por reserva expirada.', pedido_anulado.id;
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."anular_pedidos_reserva_expirada"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."asignar_stock_masivo"("p_vendedor_id" integer, "p_asignaciones" "jsonb") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    asignacion RECORD;
    cantidad_a_mover INT;
    lote_rec RECORD;
    v_vendedor_nombre TEXT;
    v_operador_nombre TEXT;
    v_origen_nombre TEXT;
    v_producto_nombre TEXT;
BEGIN
    SELECT nombre INTO v_vendedor_nombre FROM public.perfiles WHERE vendedor_id = p_vendedor_id;
    SELECT nombre INTO v_operador_nombre FROM public.perfiles WHERE id = auth.uid() LIMIT 1;

    IF v_vendedor_nombre IS NULL THEN
        RAISE EXCEPTION 'Vendedor con ID % no encontrado en perfiles', p_vendedor_id;
    END IF;

    FOR asignacion IN SELECT * FROM jsonb_to_recordset(p_asignaciones) AS x(producto_id INT, cantidad INT)
    LOOP
        cantidad_a_mover := asignacion.cantidad;

        FOR lote_rec IN
            SELECT id, stock_disponible, numero_lote
            FROM public.lotes l
            WHERE l.producto_id = asignacion.producto_id AND l.stock_disponible > 0
            ORDER BY l.fecha_vencimiento ASC
        LOOP
            IF cantidad_a_mover <= 0 THEN
                EXIT;
            END IF;

            DECLARE
                cantidad_del_lote INT := LEAST(cantidad_a_mover, lote_rec.stock_disponible);
            BEGIN
                UPDATE public.lotes SET stock_disponible = stock_disponible - cantidad_del_lote WHERE id = lote_rec.id;
                INSERT INTO public.stock_vendedores (vendedor_id, lote_id, cantidad_asignada)
                VALUES (p_vendedor_id, lote_rec.id, cantidad_del_lote)
                ON CONFLICT (vendedor_id, lote_id)
                DO UPDATE SET cantidad_asignada = stock_vendedores.cantidad_asignada + cantidad_del_lote;
                
                SELECT d.nombre INTO v_origen_nombre
                FROM public.lotes l
                JOIN public.compras c ON l.compra_id = c.id
                JOIN public.depositos d ON c.deposito_id = d.id
                WHERE l.id = lote_rec.id;

                INSERT INTO public.stock_ajustes (
                    producto_id, lote_id, tipo_ajuste, cantidad, justificacion, operador
                )
                VALUES (
                    asignacion.producto_id, lote_rec.id, 'Salida por Asignación', cantidad_del_lote,
                    'Asignado a vendedor: ' || v_vendedor_nombre,
                    COALESCE(v_operador_nombre, 'Sistema')
                );
                cantidad_a_mover := cantidad_a_mover - cantidad_del_lote;
            END;
        END LOOP;
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."asignar_stock_masivo"("p_vendedor_id" integer, "p_asignaciones" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."asignar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    stock_actual integer;
BEGIN
    SELECT stock_disponible INTO stock_actual FROM public.lotes WHERE id = p_lote_id;
    IF stock_actual IS NULL OR stock_actual < p_cantidad THEN
        RAISE EXCEPTION 'Stock insuficiente en el lote de origen.';
    END IF;
    UPDATE public.lotes
    SET stock_disponible = stock_disponible - p_cantidad
    WHERE id = p_lote_id;
    INSERT INTO public.stock_vendedores (vendedor_id, lote_id, cantidad_asignada)
    VALUES (p_vendedor_id, p_lote_id, p_cantidad)
    ON CONFLICT (vendedor_id, lote_id) 
    DO UPDATE SET cantidad_asignada = stock_vendedores.cantidad_asignada + EXCLUDED.cantidad_asignada;
END;
$$;


ALTER FUNCTION "public"."asignar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."auditar_cambio_precio_producto"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE user_id_val UUID; user_name_val TEXT;
BEGIN
    IF OLD.precio_base IS DISTINCT FROM NEW.precio_base THEN
        user_id_val := auth.uid();
        SELECT nombre INTO user_name_val FROM public.perfiles WHERE id = user_id_val;
        INSERT INTO public.auditoria_precios(usuario_id, usuario_nombre, entidad_tipo, entidad_id, producto_id, precio_anterior, precio_nuevo, justificacion)
        VALUES(user_id_val, COALESCE(user_name_val, 'Usuario Desconocido'), 'Producto', NEW.id, NEW.id, OLD.precio_base, NEW.precio_base, 'Cambio de precio de lista del producto.');
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."auditar_cambio_precio_producto"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."auditar_stock_completo"() RETURNS TABLE("producto_id" bigint, "producto_nombre" "text", "lote_id" bigint, "numero_lote" "text", "cantidad_inicial" integer, "total_entradas" integer, "total_salidas" integer, "stock_fisico_teorico" integer, "stock_fisico_actual" integer, "diferencia" integer)
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    SELECT 
        inv.producto_id, inv.producto_nombre, inv.lote_id, inv.numero_lote,
        inv.cantidad_inicial, 0, 0, -- Simplificado, ya no se usan
        inv.stock_teorico::integer,
        inv.stock_actual_fisico::integer,
        (inv.stock_actual_fisico - inv.stock_teorico)::integer AS diferencia
    FROM public.get_inventario_completo() inv
    WHERE (inv.stock_actual_fisico - inv.stock_teorico) != 0;
$$;


ALTER FUNCTION "public"."auditar_stock_completo"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."calcular_costo_envio"("p_zona_destino" "text", "p_valor_productos" numeric) RETURNS numeric
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_costo NUMERIC;
    v_monto_minimo NUMERIC;
BEGIN
    -- Busca el costo y el monto de bonificación para la zona especificada.
    -- Usamos `ILIKE` para que no sea sensible a mayúsculas/minúsculas (ej: "CABA" vs "caba").
    SELECT
        costo,
        monto_minimo_bonificacion
    INTO
        v_costo,
        v_monto_minimo
    FROM
        public.zonas_envio
    WHERE
        nombre ILIKE p_zona_destino -- FIX: Changed from 'zona' to 'nombre'
    LIMIT 1;

    -- Si no se encuentra la zona, devuelve 0 para no bloquear la operación.
    IF NOT FOUND THEN
        RETURN 0;
    END IF;

    -- Si hay un monto mínimo para bonificación y el valor de los productos lo supera, el envío es gratis.
    IF v_monto_minimo IS NOT NULL AND p_valor_productos >= v_monto_minimo THEN
        RETURN 0;
    END IF;

    -- Devuelve el costo encontrado o 0 si no se pudo determinar.
    RETURN COALESCE(v_costo, 0);
END;
$$;


ALTER FUNCTION "public"."calcular_costo_envio"("p_zona_destino" "text", "p_valor_productos" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_contact_relations"("p_contact_id" bigint) RETURNS TABLE("has_opportunities" boolean, "has_pedidos" boolean)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT EXISTS(SELECT 1 FROM oportunidades WHERE contacto_id = p_contact_id) AS has_opportunities,
           EXISTS(SELECT 1 FROM pedidos WHERE contacto_id = p_contact_id) AS has_pedidos;
END;
$$;


ALTER FUNCTION "public"."check_contact_relations"("p_contact_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_stage_relations"("p_etapa_id" bigint) RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE relations_data jsonb;
BEGIN
    SELECT jsonb_build_object('count', COUNT(*), 'opportunity_names', COALESCE(jsonb_agg(nombre), '[]'::jsonb))
    INTO relations_data FROM public.oportunidades WHERE etapa_id = p_etapa_id;
    RETURN relations_data;
END;
$$;


ALTER FUNCTION "public"."check_stage_relations"("p_etapa_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_user_permission"("p_permiso_nombre" "text") RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE tiene_permiso BOOLEAN; BEGIN SELECT EXISTS (SELECT 1 FROM public.usuario_roles ur JOIN public.rol_permisos rp ON ur.rol_id = rp.rol_id JOIN public.permisos p ON rp.permiso_id = p.id WHERE ur.usuario_id = auth.uid() AND p.nombre_permiso = p_permiso_nombre) INTO tiene_permiso; RETURN tiene_permiso; END; $$;


ALTER FUNCTION "public"."check_user_permission"("p_permiso_nombre" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."confirmar_reserva_pedido"("p_pedido_id" integer) RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare v_pedido public.pedidos%rowtype; r record;
begin
    select * into v_pedido from public.pedidos where id = p_pedido_id for update;
    if not found then return json_build_object('ok', false, 'error', 'Pedido no encontrado'); end if;
    if coalesce(v_pedido.origen_stock,'deposito_principal') <> 'deposito_principal' then return json_build_object('ok', true, 'msg', 'No requiere confirmación'); end if;
    if not v_pedido.reserva_creada then return json_build_object('ok', false, 'error', 'No hay reserva previa'); end if;
    if v_pedido.reserva_confirmada then return json_build_object('ok', true, 'msg', 'Reserva ya confirmada'); end if;
    for r in select * from public.reservas_pedido where pedido_id = p_pedido_id and confirmado = false for update loop
        update public.lotes set stock_reservado = stock_reservado - r.cantidad where id = r.lote_id;
        update public.reservas_pedido set confirmado = true where id = r.id;
    end loop;
    update public.pedidos set reserva_confirmada = true where id = p_pedido_id;
    return json_build_object('ok', true, 'msg', 'Reserva confirmada');
end;
$$;


ALTER FUNCTION "public"."confirmar_reserva_pedido"("p_pedido_id" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."crear_deuda_proveedor_por_compra_v2"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.movimientos_cuenta_proveedor WHERE compra_id = NEW.id AND debe > 0) THEN
        IF NEW.estado = 'Recibida' AND OLD.estado IS DISTINCT FROM 'Recibida' THEN
            INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, concepto, debe, compra_id, fecha)
            VALUES(NEW.proveedor_id, 'Deuda por Compra OC-' || NEW.id, NEW.total_compra, NEW.id, CURRENT_DATE);
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."crear_deuda_proveedor_por_compra_v2"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."crear_registro_envio"("p_pedido_id" bigint, "p_transportista_id" integer) RETURNS TABLE("id" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  RETURN QUERY INSERT INTO logistica_envios (pedido_id, transportista_id) VALUES (p_pedido_id, p_transportista_id) RETURNING logistica_envios.id;
END;
$$;


ALTER FUNCTION "public"."crear_registro_envio"("p_pedido_id" bigint, "p_transportista_id" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."devolver_stock_vendedor_a_deposito"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer, "p_justificacion" "text", "p_operador" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_producto_id bigint; v_vendedor_nombre text;
BEGIN
    SELECT producto_id INTO v_producto_id FROM public.lotes WHERE id = p_lote_id;
    IF NOT FOUND THEN RAISE EXCEPTION 'El lote no existe.'; END IF;
    SELECT nombre INTO v_vendedor_nombre FROM public.perfiles WHERE vendedor_id = p_vendedor_id;
    IF NOT FOUND THEN RAISE EXCEPTION 'El vendedor no existe.'; END IF;
    UPDATE public.stock_vendedores SET cantidad_asignada = cantidad_asignada - p_cantidad WHERE lote_id = p_lote_id AND vendedor_id = p_vendedor_id;
    UPDATE public.lotes SET stock_disponible = stock_disponible + p_cantidad WHERE id = p_lote_id;
    INSERT INTO stock_ajustes (producto_id, lote_id, tipo_ajuste, cantidad, justificacion, operador)
    VALUES (v_producto_id, p_lote_id, 'Devolución a Depósito', p_cantidad, p_justificacion, 'Desde Vendedor: ' || v_vendedor_nombre);
END;
$$;


ALTER FUNCTION "public"."devolver_stock_vendedor_a_deposito"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer, "p_justificacion" "text", "p_operador" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."finalizar_resolucion_aprobacion"("p_solicitud_id" bigint, "p_es_aprobado" boolean, "p_gerente_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_solicitud record; v_oportunidad record; v_productos_actualizados jsonb; v_etapa_propuesta_id bigint;
BEGIN
    SELECT id INTO v_etapa_propuesta_id FROM public.etapas_venta WHERE nombre = 'Propuesta Enviada' LIMIT 1;
    IF v_etapa_propuesta_id IS NULL THEN RAISE EXCEPTION 'Config Error: Etapa "Propuesta Enviada" no existe.'; END IF;
    SELECT * INTO v_solicitud FROM public.solicitudes_aprobacion WHERE id = p_solicitud_id FOR UPDATE;
    IF v_solicitud IS NULL OR v_solicitud.estado != 'Pendiente' THEN RAISE EXCEPTION 'La solicitud no es válida o ya ha sido resuelta.'; END IF;
    IF p_es_aprobado THEN
        BEGIN
            SELECT * INTO v_oportunidad FROM public.oportunidades WHERE id = v_solicitud.oportunidad_id;
            IF v_oportunidad.productos IS NULL OR jsonb_typeof(v_oportunidad.productos) != 'array' THEN v_oportunidad.productos := '[]'::jsonb; END IF;
            SELECT jsonb_agg(CASE WHEN (elem->>'producto_id')::bigint = v_solicitud.producto_id THEN jsonb_set(jsonb_set(elem, '{precio_unitario}', to_jsonb(v_solicitud.precio_solicitado)), '{promo_aplicada}', to_jsonb('Precio Aprobado')) ELSE elem END)
            INTO v_productos_actualizados FROM jsonb_array_elements(v_oportunidad.productos) elem;
            v_productos_actualizados := COALESCE(v_productos_actualizados, '[]'::jsonb);
            UPDATE public.oportunidades
            SET productos = (SELECT jsonb_agg(jsonb_set(p, '{subtotal}', to_jsonb((p->>'cantidad')::numeric * (p->>'precio_unitario')::numeric))) FROM jsonb_array_elements(v_productos_actualizados) p),
                valor = (SELECT COALESCE(SUM((p->>'cantidad')::numeric * (p->>'precio_unitario')::numeric), 0) FROM jsonb_array_elements(v_productos_actualizados) p),
                etapa_id = v_etapa_propuesta_id
            WHERE id = v_solicitud.oportunidad_id;
            UPDATE public.solicitudes_aprobacion SET estado = 'Aprobada', gerente_id = p_gerente_id, fecha_decision = now() WHERE id = p_solicitud_id;
        EXCEPTION WHEN OTHERS THEN RAISE EXCEPTION 'FALLO INTERNO. SQLSTATE: %, SQLERRM: %', SQLSTATE, SQLERRM; END;
    ELSE
        UPDATE public.solicitudes_aprobacion SET estado = 'Rechazada', gerente_id = p_gerente_id, fecha_decision = now() WHERE id = p_solicitud_id;
        UPDATE public.oportunidades SET etapa_id = v_etapa_propuesta_id WHERE id = v_solicitud.oportunidad_id;
    END IF;
END;
$$;


ALTER FUNCTION "public"."finalizar_resolucion_aprobacion"("p_solicitud_id" bigint, "p_es_aprobado" boolean, "p_gerente_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."finish_user_setup"("p_user_id" "uuid", "p_nombre" "text", "p_roles_nombres" "text"[], "p_es_vendedor" boolean, "p_comision" numeric, "p_meta" numeric) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_vendedor_id_nuevo bigint;
BEGIN
    UPDATE public.perfiles SET nombre = p_nombre, email = (SELECT email FROM auth.users WHERE id = p_user_id) WHERE id = p_user_id;
    IF p_es_vendedor THEN
        INSERT INTO public.vendedores (porcentaje_comision, meta_ventas) VALUES (p_comision, p_meta) RETURNING id INTO v_vendedor_id_nuevo;
        UPDATE public.perfiles SET vendedor_id = v_vendedor_id_nuevo WHERE id = p_user_id;
    END IF;
    PERFORM public.set_usuario_roles(p_user_id, p_roles_nombres);
END;
$$;


ALTER FUNCTION "public"."finish_user_setup"("p_user_id" "uuid", "p_nombre" "text", "p_roles_nombres" "text"[], "p_es_vendedor" boolean, "p_comision" numeric, "p_meta" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."funcion_auditoria_pedidos"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE user_name TEXT; estado_anterior_nombre TEXT; estado_nuevo_nombre TEXT; estado_anulado_id BIGINT;
BEGIN
    user_name := public.get_current_user_vendedor_name();
    SELECT id INTO estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1;
    IF (TG_OP = 'UPDATE') THEN
        IF OLD.estado_id IS DISTINCT FROM NEW.estado_id THEN
            SELECT nombre INTO estado_anterior_nombre FROM public.estados_pedido WHERE id = OLD.estado_id;
            SELECT nombre INTO estado_nuevo_nombre FROM public.estados_pedido WHERE id = NEW.estado_id;
            INSERT INTO public.auditoria_pedidos (pedido_id, usuario_modificacion, campo_modificado, valor_anterior, valor_nuevo, descripcion)
            VALUES (NEW.id, user_name, 'estado', estado_anterior_nombre, estado_nuevo_nombre, 'Cambio de estado del pedido');
            IF NEW.estado_id = estado_anulado_id THEN
                INSERT INTO public.auditoria_pedidos (pedido_id, usuario_modificacion, campo_modificado, valor_nuevo, descripcion)
                VALUES (NEW.id, user_name, 'stock', 'revertido', 'Anulación de pedido: Se inició la reversión de stock y deuda asociada.');
            END IF;
        END IF;
        IF OLD.fecha_entrega_prevista IS DISTINCT FROM NEW.fecha_entrega_prevista THEN
             INSERT INTO public.auditoria_pedidos (pedido_id, usuario_modificacion, campo_modificado, valor_anterior, valor_nuevo, descripcion)
            VALUES (NEW.id, user_name, 'fecha_entrega', OLD.fecha_entrega_prevista::text, NEW.fecha_entrega_prevista::text, 'Cambio de fecha de entrega');
        END IF;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO public.auditoria_pedidos (pedido_id, usuario_modificacion, campo_modificado, valor_nuevo, descripcion)
        VALUES (NEW.id, user_name, 'pedido', NEW.numero_pedido, 'Pedido Creado');
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."funcion_auditoria_pedidos"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generar_codigo_aleatorio"() RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
BEGIN
    RETURN (SELECT string_agg(substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', floor(random() * 36 + 1)::int, 1), '') FROM generate_series(1, 6));
END;
$$;


ALTER FUNCTION "public"."generar_codigo_aleatorio"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generar_comision_si_pedido_esta_saldado"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    pedido_afectado RECORD;
    vendedor_afectado RECORD;
    total_aplicado_al_pedido NUMERIC;
    comision_existente INT;
    monto_comision NUMERIC;
BEGIN
    IF NEW.tipo_documento = 'Pedido' THEN
        SELECT * INTO pedido_afectado FROM public.pedidos WHERE id = NEW.documento_id;
        IF pedido_afectado.estado_id = 4 THEN
            SELECT COALESCE(SUM(monto_aplicado), 0) INTO total_aplicado_al_pedido
            FROM public.aplicacion_pagos
            WHERE documento_id = NEW.documento_id AND tipo_documento = 'Pedido';
            IF total_aplicado_al_pedido >= (pedido_afectado.valor - 0.01) THEN
                SELECT COUNT(*) INTO comision_existente FROM public.comisiones WHERE pedido_id = NEW.documento_id;
                IF comision_existente = 0 AND pedido_afectado.vendedor_id IS NOT NULL THEN
                    SELECT * INTO vendedor_afectado FROM public.vendedores WHERE id = pedido_afectado.vendedor_id;
                    IF FOUND AND vendedor_afectado.porcentaje_comision > 0 THEN
                        monto_comision := pedido_afectado.valor * (vendedor_afectado.porcentaje_comision / 100.0);
                        INSERT INTO public.comisiones (pedido_id, vendedor_id, monto_comision, porcentaje_aplicado, estado, fecha_generacion)
                        VALUES (NEW.documento_id, vendedor_afectado.id, monto_comision, vendedor_afectado.porcentaje_comision, 'pendiente', CURRENT_DATE);
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."generar_comision_si_pedido_esta_saldado"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generar_nuevo_numero_pedido"("id_deposito_param" integer) RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    siguiente_numero BIGINT;
    numero_formateado TEXT;
BEGIN
    siguiente_numero := nextval('public.pedido_numero_seq');
    numero_formateado := LPAD(id_deposito_param::TEXT, 4, '0') || '-' || LPAD(siguiente_numero::TEXT, 8, '0');
    RETURN numero_formateado;
END;
$$;


ALTER FUNCTION "public"."generar_nuevo_numero_pedido"("id_deposito_param" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_evolucion"() RETURNS TABLE("anio" integer, "ventas_ars" numeric, "ventas_usd" numeric, "pedidos" bigint, "ticket_promedio_ars" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT EXTRACT(YEAR FROM p.created_at)::int AS anio, SUM(p.valor) AS ventas_ars, SUM(p.valor / NULLIF(tc.valor_venta, 0)) AS ventas_usd, COUNT(DISTINCT p.id)::bigint AS pedidos, COALESCE(AVG(p.valor), 0) as ticket_promedio_ars
    FROM pedidos p LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
    WHERE p.estado_id = 4 GROUP BY 1 ORDER BY 1;
END;
$$;


ALTER FUNCTION "public"."get_analisis_evolucion"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("linea" "text", "unidades" bigint, "ventas_ars" numeric, "ventas_usd" numeric, "ventas_ars_anterior" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
     WITH ventas_actuales AS (
        SELECT
            pr.linea_marca AS linea,
            SUM((item->>'cantidad')::int) AS unidades,
            SUM(
                COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                )
            ) AS ventas_ars,
            SUM(
                COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                ) / NULLIF(tc.valor_venta, 0)
            ) AS ventas_usd
        FROM pedidos p
        CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
        JOIN productos pr ON (item->>'producto_id')::bigint = pr.id
        LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta AND pr.linea_marca IS NOT NULL
        GROUP BY 1
    ), ventas_pasadas AS (
        SELECT
            pr.linea_marca AS linea,
            SUM(
                COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                )
            ) AS ventas_ars_anterior
        FROM pedidos p
        CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
        JOIN productos pr ON (item->>'producto_id')::bigint = pr.id
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') AND pr.linea_marca IS NOT NULL
        GROUP BY 1
    )
    SELECT
        va.linea,
        va.unidades,
        va.ventas_ars,
        va.ventas_usd,
        COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
    FROM ventas_actuales va
    LEFT JOIN ventas_pasadas vp ON va.linea = vp.linea
    ORDER BY va.ventas_ars DESC;
END;
$$;


ALTER FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint DEFAULT NULL::bigint) RETURNS TABLE("linea" "text", "unidades" bigint, "ventas_ars" numeric, "ventas_usd" numeric, "ventas_ars_anterior" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
     WITH ventas_actuales AS (
        SELECT pr.linea_marca AS linea, SUM((item->>'cantidad')::int) AS unidades, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric)) AS ventas_ars, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric) / NULLIF(tc.valor_venta, 0)) AS ventas_usd
        FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item JOIN productos pr ON (item->>'producto_id')::bigint = pr.id LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta AND pr.linea_marca IS NOT NULL AND (p.vendedor_id = p_vendedor_id OR p_vendedor_id IS NULL)
        GROUP BY 1
    ), ventas_pasadas AS (
        SELECT pr.linea_marca AS linea, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric)) AS ventas_ars_anterior
        FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item JOIN productos pr ON (item->>'producto_id')::bigint = pr.id
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') AND pr.linea_marca IS NOT NULL AND (p.vendedor_id = p_vendedor_id OR p_vendedor_id IS NULL)
        GROUP BY 1
    )
    SELECT va.linea, va.unidades, va.ventas_ars, va.ventas_usd, COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
    FROM ventas_actuales va LEFT JOIN ventas_pasadas vp ON va.linea = vp.linea ORDER BY va.ventas_ars DESC;
END;
$$;


ALTER FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("nombre" "text", "linea" "text", "unidades" bigint, "ventas_ars" numeric, "ventas_usd" numeric, "ventas_ars_anterior" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH ventas_actuales AS (
        SELECT
            (item->>'producto_id')::bigint AS producto_id,
            SUM((item->>'cantidad')::int) AS unidades,
            SUM(
                COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                )
            ) AS ventas_ars,
            SUM(
                COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                ) / NULLIF(tc.valor_venta, 0)
            ) AS ventas_usd
        FROM pedidos p
        CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
        LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta
        GROUP BY 1
    ), ventas_pasadas AS (
        SELECT
            (item->>'producto_id')::bigint AS producto_id,
            SUM(
                 COALESCE(
                    (item->>'subtotal')::numeric,
                    (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric
                )
            ) AS ventas_ars_anterior
        FROM pedidos p
        CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year')
        GROUP BY 1
    )
    SELECT
        pr.nombre,
        pr.linea_marca AS linea,
        va.unidades,
        va.ventas_ars,
        va.ventas_usd,
        COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
    FROM productos pr
    JOIN ventas_actuales va ON pr.id = va.producto_id
    LEFT JOIN ventas_pasadas vp ON pr.id = vp.producto_id
    ORDER BY va.ventas_ars DESC;
END;
$$;


ALTER FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint DEFAULT NULL::bigint) RETURNS TABLE("nombre" "text", "linea" "text", "unidades" bigint, "ventas_ars" numeric, "ventas_usd" numeric, "ventas_ars_anterior" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH ventas_actuales AS (
        SELECT (item->>'producto_id')::bigint AS producto_id, SUM((item->>'cantidad')::int) AS unidades, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric)) AS ventas_ars, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric) / NULLIF(tc.valor_venta, 0)) AS ventas_usd
        FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta AND (p.vendedor_id = p_vendedor_id OR p_vendedor_id IS NULL)
        GROUP BY 1
    ), ventas_pasadas AS (
        SELECT (item->>'producto_id')::bigint AS producto_id, SUM(COALESCE((item->>'subtotal')::numeric, (item->>'cantidad')::numeric * (item->>'precio_unitario')::numeric)) AS ventas_ars_anterior
        FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
        WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') AND (p.vendedor_id = p_vendedor_id OR p_vendedor_id IS NULL)
        GROUP BY 1
    )
    SELECT pr.nombre, pr.linea_marca AS linea, va.unidades, va.ventas_ars, va.ventas_usd, COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
    FROM productos pr JOIN ventas_actuales va ON pr.id = va.producto_id LEFT JOIN ventas_pasadas vp ON pr.id = vp.producto_id ORDER BY va.ventas_ars DESC;
END;
$$;


ALTER FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_vendedores"("p_fecha_inicio" "text", "p_fecha_fin" "text") RETURNS TABLE("vendedor_id" "uuid", "nombre_vendedor" "text", "ventas_ars" numeric, "ventas_usd" numeric, "pedidos" bigint, "ventas_ars_anterior" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH ventas_actuales AS (
        SELECT
            p.vendedor_id,
            COUNT(p.id)::bigint AS num_pedidos,
            SUM(p.valor) AS total_ventas_ars,
            SUM(p.valor / NULLIF(tc.valor_venta, 0)) AS total_ventas_usd
        FROM
            pedidos p
        LEFT JOIN
            tipos_de_cambio tc ON p.created_at::date = tc.fecha
        WHERE
            p.created_at::date BETWEEN p_fecha_inicio::date AND p_fecha_fin::date
            AND p.estado_id = 4
        GROUP BY
            p.vendedor_id
    ),
    ventas_pasadas AS (
        SELECT
            p.vendedor_id,
            SUM(p.valor) as total_ventas_ars_anterior
        FROM
            pedidos p
        WHERE
            p.created_at::date BETWEEN (p_fecha_inicio::date - INTERVAL '1 year') AND (p_fecha_fin::date - INTERVAL '1 year')
            AND p.estado_id = 4
        GROUP BY
            p.vendedor_id
    )
    SELECT
        pf.id AS vendedor_id,
        pf.nombre AS nombre_vendedor,
        COALESCE(va.total_ventas_ars, 0) AS ventas_ars,
        COALESCE(va.total_ventas_usd, 0) AS ventas_usd,
        COALESCE(va.num_pedidos, 0) AS pedidos,
        COALESCE(vp.total_ventas_ars_anterior, 0) as ventas_ars_anterior
    FROM
        perfiles pf
    LEFT JOIN
        ventas_actuales va ON pf.vendedor_id = va.vendedor_id
    LEFT JOIN
        ventas_pasadas vp ON pf.vendedor_id = vp.vendedor_id
    WHERE
        pf.vendedor_id IS NOT NULL
    ORDER BY
        ventas_ars DESC;
END;
$$;


ALTER FUNCTION "public"."get_analisis_vendedores"("p_fecha_inicio" "text", "p_fecha_fin" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_analisis_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    json_productos jsonb;
    json_vendedores jsonb;
    json_lineas jsonb;
    json_evolucion jsonb;
BEGIN
    SELECT jsonb_agg(data) INTO json_productos FROM (
        WITH ventas_actuales AS (
            SELECT (item->>'producto_id')::bigint AS producto_id, SUM((item->>'cantidad')::int) AS unidades, SUM((item->>'subtotal')::numeric) AS ventas_ars, SUM((item->>'subtotal')::numeric / NULLIF(tc.valor_venta, 0)) AS ventas_usd
            FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
            WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta GROUP BY 1
        ), ventas_pasadas AS (
            SELECT (item->>'producto_id')::bigint AS producto_id, SUM((item->>'subtotal')::numeric) AS ventas_ars_anterior
            FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item
            WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') GROUP BY 1
        )
        SELECT pr.nombre, pr.linea_marca AS linea, va.unidades, va.ventas_ars, va.ventas_usd, COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
        FROM productos pr JOIN ventas_actuales va ON pr.id = va.producto_id LEFT JOIN ventas_pasadas vp ON pr.id = vp.producto_id
        ORDER BY va.ventas_ars DESC
    ) AS data;
    SELECT jsonb_agg(data) INTO json_vendedores FROM (
        WITH ventas_actuales AS (
            SELECT p.vendedor_id, COUNT(DISTINCT p.id)::bigint AS pedidos, SUM(p.valor) AS ventas_ars, SUM(p.valor / NULLIF(tc.valor_venta, 0)) AS ventas_usd
            FROM pedidos p LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
            WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta GROUP BY 1
        ), ventas_pasadas AS (
            SELECT p.vendedor_id, SUM(p.valor) AS ventas_ars_anterior
            FROM pedidos p WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') GROUP BY 1
        )
        SELECT v.nombre, va.pedidos, va.ventas_ars, va.ventas_usd, COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
        FROM vendedores v JOIN ventas_actuales va ON v.id = va.vendedor_id LEFT JOIN ventas_pasadas vp ON v.id = vp.vendedor_id
        ORDER BY va.ventas_ars DESC
    ) AS data;
    SELECT jsonb_agg(data) INTO json_lineas FROM (
        WITH ventas_actuales AS (
             SELECT pr.linea_marca AS linea, SUM((item->>'cantidad')::int) AS unidades, SUM((item->>'subtotal')::numeric) AS ventas_ars, SUM((item->>'subtotal')::numeric / NULLIF(tc.valor_venta, 0)) AS ventas_usd
            FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item JOIN productos pr ON (item->>'producto_id')::bigint = pr.id LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
            WHERE p.estado_id = 4 AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta AND pr.linea_marca IS NOT NULL GROUP BY 1
        ), ventas_pasadas AS (
            SELECT pr.linea_marca AS linea, SUM((item->>'subtotal')::numeric) AS ventas_ars_anterior
            FROM pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) item JOIN productos pr ON (item->>'producto_id')::bigint = pr.id
            WHERE p.estado_id = 4 AND p.created_at::date BETWEEN (p_fecha_desde - INTERVAL '1 year') AND (p_fecha_hasta - INTERVAL '1 year') AND pr.linea_marca IS NOT NULL GROUP BY 1
        )
        SELECT va.linea, va.unidades, va.ventas_ars, va.ventas_usd, COALESCE(vp.ventas_ars_anterior, 0) AS ventas_ars_anterior
        FROM ventas_actuales va LEFT JOIN ventas_pasadas vp ON va.linea = vp.linea
        ORDER BY va.ventas_ars DESC
    ) AS data;
    SELECT jsonb_agg(data) INTO json_evolucion FROM (
        SELECT
            EXTRACT(YEAR FROM p.created_at)::int AS anio,
            SUM(p.valor) AS ventas_ars,
            SUM(p.valor / NULLIF(tc.valor_venta, 0)) AS ventas_usd,
            COUNT(DISTINCT p.id)::bigint AS pedidos,
            COALESCE(AVG(p.valor), 0) as ticket_promedio_ars
        FROM pedidos p LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE p.estado_id = 4
        GROUP BY 1 ORDER BY 1
    ) AS data;
    RETURN jsonb_build_object(
        'productos', COALESCE(json_productos, '[]'::jsonb),
        'vendedores', COALESCE(json_vendedores, '[]'::jsonb),
        'lineas', COALESCE(json_lineas, '[]'::jsonb),
        'evolucion', COALESCE(json_evolucion, '[]'::jsonb)
    );
END;
$$;


ALTER FUNCTION "public"."get_analisis_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_comisiones_pendientes_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("comision_id" bigint, "pedido_numero" "text", "cliente_nombre" "text", "monto_comision" numeric, "fecha_generacion" "date", "fecha_pedido" timestamp with time zone)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        c.id AS comision_id,
        p.numero_pedido,
        con.nombre AS cliente_nombre,
        c.monto_comision,
        c.fecha_generacion::date,
        p.created_at AS fecha_pedido
    FROM
        public.comisiones c
    JOIN 
        public.pedidos p ON c.pedido_id = p.id
    JOIN 
        public.contactos con ON p.contacto_id = con.id
    WHERE
        c.vendedor_id = p_vendedor_id AND c.estado = 'pendiente'
    ORDER BY
        p.created_at DESC;
END;
$$;


ALTER FUNCTION "public"."get_comisiones_pendientes_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_comisiones_vendedor_detalle"("p_vendedor_id" bigint) RETURNS TABLE("estado" "text", "pedido_numero" "text", "cliente_nombre" "text", "monto_comision" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        'A Pagar'::text as estado,
        p.numero_pedido,
        c.nombre as cliente_nombre,
        com.monto_comision
    FROM comisiones com
    JOIN pedidos p ON com.pedido_id = p.id
    JOIN contactos c ON p.contacto_id = c.id
    WHERE com.vendedor_id = p_vendedor_id AND com.estado = 'pendiente'
    UNION ALL
    SELECT
        'Potencial'::text as estado,
        p.numero_pedido,
        c.nombre as cliente_nombre,
        (p.valor - COALESCE(ap.total_aplicado, 0)) * (COALESCE(v.porcentaje_comision, 0) / 100.0) as monto_comision
    FROM pedidos p
    JOIN vendedores v ON p.vendedor_id = v.id
    JOIN contactos c ON p.contacto_id = c.id
    LEFT JOIN (
        SELECT documento_id, SUM(monto_aplicado) as total_aplicado
        FROM aplicacion_pagos WHERE tipo_documento = 'Pedido' GROUP BY documento_id
    ) ap ON p.id = ap.documento_id
    WHERE p.vendedor_id = p_vendedor_id
      AND p.estado_id = 4
      AND (p.valor - COALESCE(ap.total_aplicado, 0)) > 0.01;
END;
$$;


ALTER FUNCTION "public"."get_comisiones_vendedor_detalle"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_comprobante_for_pedido"("p_pedido_id" bigint) RETURNS "text"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    SELECT p.comprobante_url FROM public.pagos p JOIN public.aplicacion_pagos ap ON p.id = ap.pago_id WHERE ap.documento_id = p_pedido_id AND ap.tipo_documento = 'Pedido' AND p.comprobante_url IS NOT NULL ORDER BY p.fecha_pago DESC, p.id DESC LIMIT 1;
$$;


ALTER FUNCTION "public"."get_comprobante_for_pedido"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_comprobantes_for_pedido"("p_pedido_id" bigint) RETURNS TABLE("comprobante_url" "text")
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT p.comprobante_url FROM public.pagos p JOIN public.aplicacion_pagos ap ON p.id = ap.pago_id
  WHERE ap.documento_id = p_pedido_id AND ap.tipo_documento = 'Pedido' AND p.comprobante_url IS NOT NULL AND length(trim(p.comprobante_url)) > 5;
$$;


ALTER FUNCTION "public"."get_comprobantes_for_pedido"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_contact_timeline"("p_contact_id" bigint, "p_event_type" "text" DEFAULT NULL::"text") RETURNS TABLE("event_date" timestamp with time zone, "event_type" "text", "event_title" "text", "event_value" numeric, "entity_id" bigint)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
WITH all_events AS (
    -- 1. Interacciones (Llamadas, WhatsApp, Reuniones)
    SELECT
        created_at AS event_date,
        tipo AS event_type,
        resumen AS event_title,
        NULL::numeric AS event_value,
        id AS entity_id
    FROM public.interacciones
    WHERE contacto_id = p_contact_id

    UNION ALL

    -- 2. Oportunidades (Presupuestos)
    SELECT
        created_at AS event_date,
        'Oportunidad' AS event_type,
        'Presupuesto: ' || nombre AS event_title,
        valor AS event_value,
        id AS entity_id
    FROM public.oportunidades
    WHERE contacto_id = p_contact_id

    UNION ALL

    -- 3. Pedidos
    SELECT
        created_at AS event_date,
        'Pedido' AS event_type,
        'Pedido N° ' || numero_pedido AS event_title,
        valor AS event_value,
        id AS entity_id
    FROM public.pedidos
    WHERE contacto_id = p_contact_id

    UNION ALL

    -- 4. Pagos (Haber en Cta Cte)
    SELECT
        fecha::timestamp with time zone AS event_date,
        'Pago' AS event_type,
        concepto AS event_title,
        haber AS event_value,
        pago_id AS entity_id
    FROM public.movimientos_cuenta_corriente
    WHERE cliente_id = p_contact_id AND haber > 0

    UNION ALL

    -- 5. Deudas (Debe en Cta Cte)
    SELECT
        fecha::timestamp with time zone AS event_date,
        'Deuda' AS event_type,
        concepto AS event_title,
        debe AS event_value,
        pedido_id AS entity_id
    FROM public.movimientos_cuenta_corriente
    WHERE cliente_id = p_contact_id AND debe > 0
)
SELECT *
FROM all_events
WHERE (p_event_type IS NULL OR event_type ILIKE p_event_type)
ORDER BY event_date DESC;
$$;


ALTER FUNCTION "public"."get_contact_timeline"("p_contact_id" bigint, "p_event_type" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_contactos_con_deuda_calculada"() RETURNS TABLE("id" bigint, "nombre" "text", "deuda_actual" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY SELECT c.id, c.nombre, SUM(COALESCE(m.debe, 0)) - SUM(COALESCE(m.haber, 0)) AS deuda_actual
    FROM public.contactos c JOIN public.movimientos_cuenta_corriente m ON c.id = m.cliente_id
    GROUP BY c.id, c.nombre HAVING (SUM(COALESCE(m.debe, 0)) - SUM(COALESCE(m.haber, 0))) > 0.01 ORDER BY c.nombre;
END;
$$;


ALTER FUNCTION "public"."get_contactos_con_deuda_calculada"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_contactos_dashboard"("p_vendedor_id" bigint) RETURNS TABLE("id" bigint, "nombre" "text", "telefono" "text", "ultima_actividad" timestamp with time zone, "tipo_actividad" "text", "oportunidades_activas_conteo" bigint, "oportunidades_activas_valor" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH last_events AS (
        SELECT contacto_id, MAX(created_at) as last_date, 'Oportunidad' as type FROM oportunidades WHERE vendedor_id = p_vendedor_id GROUP BY contacto_id
        UNION ALL
        SELECT contacto_id, MAX(created_at) as last_date, 'Pedido' as type FROM pedidos WHERE vendedor_id = p_vendedor_id GROUP BY contacto_id
    ),
    most_recent_event AS (
        SELECT contacto_id, last_date, type, ROW_NUMBER() OVER(PARTITION BY contacto_id ORDER BY last_date DESC) as rn
        FROM last_events
    ),
    opps_activas AS (
        SELECT
            o.contacto_id,
            COUNT(o.id) as conteo,
            SUM(o.valor) as valor
        FROM
            public.oportunidades o
        JOIN
            public.etapas_venta ev ON o.etapa_id = ev.id
        WHERE
            o.vendedor_id = p_vendedor_id
            AND ev.nombre NOT IN ('Ganada', 'Perdida')
        GROUP BY o.contacto_id
    )
    SELECT
        c.id,
        c.nombre,
        c.telefono,
        mre.last_date AS ultima_actividad,
        mre.type AS tipo_actividad,
        COALESCE(oa.conteo, 0)::bigint AS oportunidades_activas_conteo,
        COALESCE(oa.valor, 0)::numeric AS oportunidades_activas_valor
    FROM public.contactos c
    LEFT JOIN most_recent_event mre ON c.id = mre.contacto_id AND mre.rn = 1
    LEFT JOIN opps_activas oa ON c.id = oa.contacto_id
    WHERE
        c.vendedor_id = p_vendedor_id
        AND c.estado_id != (SELECT est.id FROM public.estados est WHERE est.nombre = 'Inactivo' LIMIT 1)
        AND c.estado_id != (SELECT est.id FROM public.estados est WHERE est.nombre = 'Pendiente de Aprobación' LIMIT 1)
    ORDER BY mre.last_date DESC NULLS LAST, c.nombre ASC;
END;
$$;


ALTER FUNCTION "public"."get_contactos_dashboard"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_contactos_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("id" bigint, "nombre" "text", "telefono" "text", "ultima_actividad" timestamp with time zone, "tipo_actividad" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    WITH last_events AS (
        SELECT contacto_id, MAX(created_at) as last_date, 'Oportunidad' as type FROM oportunidades GROUP BY contacto_id
        UNION ALL
        SELECT contacto_id, MAX(created_at) as last_date, 'Pedido' as type FROM pedidos GROUP BY contacto_id
    ),
    most_recent_event AS (
        SELECT contacto_id, last_date, type, ROW_NUMBER() OVER(PARTITION BY contacto_id ORDER BY last_date DESC) as rn
        FROM last_events
    )
    SELECT c.id, c.nombre, c.telefono, mre.last_date AS ultima_actividad, mre.type AS tipo_actividad
    FROM public.contactos c
    LEFT JOIN most_recent_event mre ON c.id = mre.contacto_id AND mre.rn = 1
    WHERE c.vendedor_id = p_vendedor_id
    ORDER BY mre.last_date DESC NULLS LAST, c.nombre ASC;
$$;


ALTER FUNCTION "public"."get_contactos_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_costo_envio_por_coordenadas"("p_lat" double precision, "p_lon" double precision) RETURNS TABLE("id" bigint, "nombre" "text", "costo" numeric, "monto_minimo_bonificacion" numeric)
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        ze.id,
        ze.nombre,
        ze.costo,
        ze.monto_minimo_bonificacion
    FROM
        public.zonas_envio ze
    WHERE
        -- Usamos la función de PostGIS para ver si el punto (lat, lon) está dentro del polígono.
        extensions.ST_Covers(ze.geometria, extensions.ST_MakePoint(p_lon, p_lat)::extensions.geography)
    -- Si un punto cae en múltiples zonas (por superposición), priorizamos la más pequeña (más específica).
    ORDER BY
        extensions.ST_Area(ze.geometria) ASC
    LIMIT 1;
END;
$$;


ALTER FUNCTION "public"."get_costo_envio_por_coordenadas"("p_lat" double precision, "p_lon" double precision) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_costo_reposicion"("p_producto_id" bigint) RETURNS numeric
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_costo numeric;
BEGIN
    SELECT (prod->>'costo_unitario')::numeric INTO v_costo
    FROM public.compras, jsonb_array_elements(productos) AS prod
    WHERE (prod->>'producto_id')::bigint = p_producto_id AND estado = 'Recibida'
    ORDER BY fecha_emision DESC, id DESC LIMIT 1;
    RETURN COALESCE(v_costo, 0);
END;
$$;


ALTER FUNCTION "public"."get_costo_reposicion"("p_producto_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_costo_ultima_compra"("p_producto_id" bigint, "p_fecha_venta" "date") RETURNS numeric
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_costo numeric;
BEGIN
    SELECT (prod->>'costo_unitario')::numeric INTO v_costo
    FROM public.compras, jsonb_array_elements(productos) AS prod
    WHERE (prod->>'producto_id')::bigint = p_producto_id AND estado = 'Recibida' AND fecha_emision <= p_fecha_venta
    ORDER BY fecha_emision DESC, id DESC LIMIT 1;
    RETURN COALESCE(v_costo, 0);
END;
$$;


ALTER FUNCTION "public"."get_costo_ultima_compra"("p_producto_id" bigint, "p_fecha_venta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_current_user_vendedor_name"() RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE perfil_nombre TEXT; BEGIN SELECT nombre INTO perfil_nombre FROM public.perfiles WHERE id = auth.uid() LIMIT 1; RETURN COALESCE(perfil_nombre, 'Usuario Desconocido'); END; $$;


ALTER FUNCTION "public"."get_current_user_vendedor_name"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_dashboard_contacts"("p_vendedor_id" bigint) RETURNS TABLE("id" bigint, "nombre" "text", "ultima_actividad" timestamp with time zone, "tipo_actividad" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    WITH last_events AS (
        SELECT contacto_id, MAX(created_at) as last_date, 'Oportunidad' as type FROM oportunidades WHERE vendedor_id = p_vendedor_id GROUP BY contacto_id
        UNION ALL
        SELECT contacto_id, MAX(created_at) as last_date, 'Interacción' as type FROM interacciones WHERE contacto_id IN (SELECT id FROM contactos WHERE vendedor_id = p_vendedor_id) GROUP BY contacto_id
        UNION ALL
        SELECT contacto_id, MAX(created_at) as last_date, 'Pedido' as type FROM pedidos WHERE vendedor_id = p_vendedor_id GROUP BY contacto_id
    ),
    ranked_events AS (
        SELECT contacto_id, last_date, type, ROW_NUMBER() OVER(PARTITION BY contacto_id ORDER BY last_date DESC) as rn FROM last_events
    )
    SELECT c.id, c.nombre, re.last_date AS ultima_actividad, re.type AS tipo_actividad
    FROM ranked_events re JOIN contactos c ON re.contacto_id = c.id
    WHERE re.rn = 1 ORDER BY re.last_date DESC LIMIT 10;
$$;


ALTER FUNCTION "public"."get_dashboard_contacts"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_dashboard_gerencial"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_metodo_costo" "text") RETURNS TABLE("ventas_totales_ars" numeric, "costo_total_ars" numeric, "rentabilidad_bruta_ars" numeric, "margen_promedio" numeric, "meta_global_ars" numeric, "dinero_por_cobrar_ars" numeric, "ticket_promedio_ars" numeric, "ventas_totales_usd" numeric, "rentabilidad_bruta_usd" numeric, "ranking_vendedores" "jsonb", "top_productos_rentables" "jsonb")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH ventas_con_costo AS (
        SELECT
            p.created_at::date as fecha_venta,
            p.vendedor_id,
            pf.nombre as vendedor_nombre,
            (item->>'producto_id')::bigint as producto_id,
            (item->>'nombre')::text as producto_nombre,
            (item->>'cantidad')::integer as cantidad,
            (item->>'precio_unitario')::numeric as precio_venta,
            tc.valor_venta as tipo_cambio_dolar,
            CASE 
                WHEN p_metodo_costo = 'ultima_compra' THEN get_costo_ultima_compra((item->>'producto_id')::bigint, p.created_at::date)
                ELSE get_costo_reposicion((item->>'producto_id')::bigint)
            END as costo_unitario
        FROM 
            public.pedidos p
            JOIN public.vendedores v ON p.vendedor_id = v.id
            JOIN public.perfiles pf ON v.id = pf.vendedor_id
            CROSS JOIN LATERAL jsonb_array_elements(p.productos) as item
            LEFT JOIN public.tipos_de_cambio tc ON tc.fecha = p.created_at::date
        WHERE 
            p.estado_id = (SELECT id FROM public.estados_pedido WHERE nombre = 'Entregado')
            AND p.created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta
    )
    SELECT
        (SELECT COALESCE(SUM(v.cantidad * v.precio_venta), 0) FROM ventas_con_costo v) as ventas_totales_ars,
        (SELECT COALESCE(SUM(v.cantidad * v.costo_unitario), 0) FROM ventas_con_costo v) as costo_total_ars,
        (SELECT COALESCE(SUM(v.cantidad * (v.precio_venta - v.costo_unitario)), 0) FROM ventas_con_costo v) as rentabilidad_bruta_ars,
        CASE 
            WHEN (SELECT COALESCE(SUM(v.cantidad * v.precio_venta), 0) FROM ventas_con_costo v) > 0 THEN
                ((SELECT COALESCE(SUM(v.cantidad * (v.precio_venta - v.costo_unitario)), 0) FROM ventas_con_costo v) / 
                 (SELECT GREATEST(COALESCE(SUM(v.cantidad * v.precio_venta), 0), 1) FROM ventas_con_costo v)) * 100
            ELSE 0 
        END as margen_promedio,
        (SELECT COALESCE(SUM(meta_ventas), 0) FROM public.vendedores) as meta_global_ars,
        (SELECT COALESCE(SUM(deuda_actual), 0) FROM public.contactos WHERE deuda_actual > 0) as dinero_por_cobrar_ars,
        (SELECT COALESCE(AVG(valor), 0) FROM public.pedidos WHERE created_at::date BETWEEN p_fecha_desde AND p_fecha_hasta AND estado_id = (SELECT id FROM public.estados_pedido WHERE nombre = 'Entregado')) as ticket_promedio_ars,
        (SELECT COALESCE(SUM(v.cantidad * v.precio_venta / NULLIF(v.tipo_cambio_dolar, 0)), 0) FROM ventas_con_costo v) as ventas_totales_usd,
        (SELECT COALESCE(SUM(v.cantidad * (v.precio_venta - v.costo_unitario) / NULLIF(v.tipo_cambio_dolar, 0)), 0) FROM ventas_con_costo v) as rentabilidad_bruta_usd,
        (SELECT jsonb_agg(v_agg ORDER BY rentabilidad_vendedor DESC) FROM (SELECT vendedor_id, vendedor_nombre, SUM(cantidad * precio_venta) as total_vendido, SUM(cantidad * (precio_venta - costo_unitario)) as rentabilidad_vendedor, CASE WHEN SUM(cantidad * precio_venta) > 0 THEN (SUM(cantidad * (precio_venta - costo_unitario)) / SUM(cantidad * precio_venta)) * 100 ELSE 0 END as margen_vendedor FROM ventas_con_costo GROUP BY vendedor_id, vendedor_nombre) as v_agg) as ranking_vendedores,
        (SELECT jsonb_agg(p_agg) FROM (SELECT producto_id, producto_nombre, SUM(cantidad) as unidades, SUM(cantidad * (precio_venta - costo_unitario)) as rentabilidad_producto, CASE WHEN SUM(cantidad * precio_venta) > 0 THEN (SUM(cantidad * (precio_venta - costo_unitario)) / SUM(cantidad * precio_venta)) * 100 ELSE 0 END as margen_producto FROM ventas_con_costo GROUP BY producto_id, producto_nombre ORDER BY rentabilidad_producto DESC LIMIT 5) as p_agg) as top_productos_rentables;
END;
$$;


ALTER FUNCTION "public"."get_dashboard_gerencial"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_metodo_costo" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_datos_dashboard_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("total_por_cobrar_clientes" numeric, "comisiones_pendientes_pago" numeric, "cuentas_por_cobrar_detalle" "jsonb", "comisiones_pendientes_detalle" "jsonb")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_total_cobrar numeric; v_comisiones_pendientes numeric; v_cuentas_detalle jsonb; v_comisiones_detalle jsonb;
BEGIN
    SELECT COALESCE(SUM(deuda_actual), 0) INTO v_total_cobrar FROM (SELECT (COALESCE(SUM(mcc.debe), 0) - COALESCE(SUM(mcc.haber), 0)) as deuda_actual FROM contactos c LEFT JOIN movimientos_cuenta_corriente mcc ON c.id = mcc.cliente_id WHERE c.vendedor_id = p_vendedor_id GROUP BY c.id) AS deudas;
    SELECT COALESCE(SUM(monto_comision), 0) INTO v_comisiones_pendientes FROM comisiones WHERE vendedor_id = p_vendedor_id AND estado = 'pendiente';
    SELECT jsonb_agg(detalle) INTO v_cuentas_detalle FROM (SELECT c.nombre as cliente, (COALESCE(SUM(mcc.debe), 0) - COALESCE(SUM(mcc.haber), 0)) as saldo FROM contactos c JOIN movimientos_cuenta_corriente mcc ON c.id = mcc.cliente_id WHERE c.vendedor_id = p_vendedor_id GROUP BY c.id HAVING (COALESCE(SUM(mcc.debe), 0) - COALESCE(SUM(mcc.haber), 0)) > 0.01 ORDER BY saldo DESC) AS detalle;
    SELECT jsonb_agg(detalle) INTO v_comisiones_detalle FROM (SELECT p.numero_pedido, c.nombre as cliente, com.monto_comision, com.fecha_generacion FROM comisiones com JOIN pedidos p ON com.pedido_id = p.id JOIN contactos c ON p.contacto_id = c.id WHERE com.vendedor_id = p_vendedor_id AND com.estado = 'pendiente' ORDER BY com.fecha_generacion ASC) AS detalle;
    RETURN QUERY SELECT v_total_cobrar, v_comisiones_pendientes, COALESCE(v_cuentas_detalle, '[]'::jsonb), COALESCE(v_comisiones_detalle, '[]'::jsonb);
END;
$$;


ALTER FUNCTION "public"."get_datos_dashboard_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_datos_dashboard_vendedor_v2"("p_vendedor_id" bigint) RETURNS TABLE("meta_ventas" numeric, "ventas_mes_actual" numeric, "total_por_cobrar_clientes" numeric, "comisiones_a_pagar_total" numeric, "comisiones_potenciales_total" numeric, "pipeline" "jsonb", "comisiones_pagar_mes_actual" numeric, "comisiones_pagar_meses_anteriores" numeric, "comisiones_potenciales_mes_actual" numeric, "comisiones_potenciales_meses_anteriores" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    id_estado_entregado bigint;
    resumen_comisiones RECORD;
BEGIN
    -- Busca el ID del estado 'Entregado' para usarlo en los cálculos
    SELECT id INTO id_estado_entregado FROM public.estados_pedido WHERE nombre = 'Entregado' LIMIT 1;
    
    -- Obtiene el resumen de comisiones (a pagar y potenciales) para el vendedor
    -- La función get_resumen_liquidaciones ya calcula esto eficientemente.
    SELECT * INTO resumen_comisiones FROM public.get_resumen_liquidaciones(NULL, NULL) WHERE vendedor_id = p_vendedor_id;

    RETURN QUERY
    SELECT
        -- 1. Meta de ventas del vendedor
        v.meta_ventas,
        
        -- 2. Ventas del mes actual (solo de pedidos ya 'Entregados')
        (SELECT COALESCE(SUM(p.valor), 0) 
         FROM pedidos p 
         WHERE p.vendedor_id = p_vendedor_id 
           AND p.estado_id = id_estado_entregado 
           AND p.created_at >= date_trunc('month', CURRENT_DATE)) as ventas_mes_actual,
           
        -- 3. Deuda total de los clientes de este vendedor
        (SELECT COALESCE(SUM(m.debe) - SUM(m.haber), 0) 
         FROM public.movimientos_cuenta_corriente m 
         JOIN public.contactos c ON m.cliente_id = c.id 
         WHERE c.vendedor_id = p_vendedor_id) as total_por_cobrar_clientes,
        
        -- 4. Comisiones a pagar (del resumen)
        COALESCE(resumen_comisiones.comisiones_a_pagar, 0) AS comisiones_a_pagar_total,
        
        -- 5. Comisiones potenciales (del resumen)
        COALESCE(resumen_comisiones.comisiones_potenciales, 0) AS comisiones_potenciales_total,

        -- 6. Pipeline de oportunidades agrupado por etapa
        (SELECT jsonb_agg(etapas ORDER BY etapas.orden) 
         FROM (
            SELECT ev.nombre, COUNT(o.id) as cantidad, COALESCE(SUM(o.valor), 0) as monto, ev.orden 
            FROM etapas_venta ev 
            LEFT JOIN oportunidades o ON ev.id = o.etapa_id AND o.vendedor_id = p_vendedor_id 
            GROUP BY ev.nombre, ev.orden
        ) as etapas) as pipeline,

        -- 7. Comisiones a pagar generadas ESTE mes
        (SELECT COALESCE(SUM(c.monto_comision), 0) 
         FROM public.comisiones c 
         WHERE c.vendedor_id = p_vendedor_id 
           AND c.estado = 'pendiente' 
           AND c.fecha_generacion >= date_trunc('month', CURRENT_DATE)) AS comisiones_pagar_mes_actual,
           
        -- 8. Comisiones a pagar de MESES ANTERIORES
        (SELECT COALESCE(SUM(c.monto_comision), 0) 
         FROM public.comisiones c 
         WHERE c.vendedor_id = p_vendedor_id 
           AND c.estado = 'pendiente' 
           AND c.fecha_generacion < date_trunc('month', CURRENT_DATE)) AS comisiones_pagar_meses_anteriores,

        -- Campos adicionales que estaban en la firma original (no usados por el frontend actual)
        0.00 as comisiones_potenciales_mes_actual,
        0.00 as comisiones_potenciales_meses_anteriores
           
    FROM public.vendedores v
    WHERE v.id = p_vendedor_id;
END;
$$;


ALTER FUNCTION "public"."get_datos_dashboard_vendedor_v2"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_detalle_comisiones_pendientes"("p_vendedor_id" bigint) RETURNS TABLE("cliente_nombre" "text", "pedido_numero" "text", "monto_comision" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT con.nombre as cliente_nombre, p.numero_pedido, c.monto_comision
    FROM public.comisiones c JOIN public.pedidos p ON c.pedido_id = p.id JOIN public.contactos con ON p.contacto_id = con.id
    WHERE c.vendedor_id = p_vendedor_id AND c.estado = 'pendiente'
    ORDER BY p.created_at DESC;
END;
$$;


ALTER FUNCTION "public"."get_detalle_comisiones_pendientes"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_detalle_productos_agregado_cliente"("_p_contacto_id" bigint, "_p_fecha_desde" "date", "_p_fecha_hasta" "date") RETURNS TABLE("producto_nombre" "text", "unidades_totales" bigint, "valor_total" numeric, "precio_promedio" numeric, "con_promocion" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT (item.value ->> 'nombre')::text as producto_nombre, SUM((item.value ->> 'cantidad')::integer)::bigint as unidades_totales, SUM((item.value ->> 'subtotal')::numeric) as valor_total, AVG((item.value ->> 'precio_unitario')::numeric) as precio_promedio,
           SUM(CASE WHEN (item.value ->> 'promo_aplicada' IS NOT NULL) THEN 1 ELSE 0 END)::bigint as con_promocion
    FROM public.pedidos p CROSS JOIN jsonb_array_elements(p.productos) as item
    WHERE p.contacto_id = _p_contacto_id AND p.created_at::date BETWEEN _p_fecha_desde AND _p_fecha_hasta AND p.estado_id = 4
    GROUP BY producto_nombre ORDER BY valor_total DESC;
END;
$$;


ALTER FUNCTION "public"."get_detalle_productos_agregado_cliente"("_p_contacto_id" bigint, "_p_fecha_desde" "date", "_p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_detalle_productos_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("fecha" "date", "producto_nombre" "text", "cantidad" integer, "valor" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT p.created_at::date as fecha, (item.value ->> 'nombre')::text as producto_nombre, (item.value ->> 'cantidad')::integer as cantidad,
           ((item.value ->> 'cantidad')::numeric * (item.value ->> 'precio_unitario')::numeric) as valor
    FROM public.pedidos p, jsonb_array_elements(p.productos) as item
    WHERE p.contacto_id = p_contacto_id AND p.created_at::date >= p_fecha_desde AND p.created_at::date <= p_fecha_hasta
    ORDER BY p.created_at DESC;
END;
$$;


ALTER FUNCTION "public"."get_detalle_productos_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_documentos_pendientes_cliente"("p_contacto_id" bigint) RETURNS TABLE("documento_id" bigint, "tipo" "text", "numero" "text", "fecha" "date", "total" numeric, "saldo_pendiente" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE estado_anulado_id BIGINT; BEGIN SELECT id INTO estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1; RETURN QUERY WITH pagos_aplicados AS (SELECT ap.documento_id AS pedido_id, COALESCE(SUM(ap.monto_aplicado), 0) as total_pagado FROM public.aplicacion_pagos ap JOIN public.pedidos ped ON ap.documento_id = ped.id WHERE ap.tipo_documento = 'Pedido' AND ped.contacto_id = p_contacto_id GROUP BY ap.documento_id) SELECT p.id AS documento_id, 'Pedido'::text AS tipo, p.numero_pedido AS numero, p.created_at::DATE AS fecha, p.valor AS total, (p.valor - COALESCE(pa.total_pagado, 0)) AS saldo_pendiente FROM public.pedidos p LEFT JOIN pagos_aplicados pa ON p.id = pa.pedido_id WHERE p.contacto_id = p_contacto_id AND p.estado_id != estado_anulado_id AND (p.valor - COALESCE(pa.total_pagado, 0)) > 0.01 ORDER BY p.created_at ASC; END; $$;


ALTER FUNCTION "public"."get_documentos_pendientes_cliente"("p_contacto_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_documentos_pendientes_proveedor"("p_proveedor_id" "uuid") RETURNS TABLE("compra_id" bigint, "numero_oc" "text", "factura_nro" "text", "fecha" "date", "total" numeric, "saldo_pendiente" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        c.id AS compra_id,
        'OC-' || LPAD(c.id::text, 5, '0') AS numero_oc,
        c.factura_proveedor_nro AS factura_nro,
        c.fecha_emision AS fecha,
        c.total_compra AS total,
        (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) AS saldo_pendiente
    FROM
        compras c
    JOIN
        movimientos_cuenta_proveedor mcp ON c.id = mcp.compra_id
    WHERE
        c.proveedor_id = p_proveedor_id
    GROUP BY
        c.id, c.factura_proveedor_nro, c.fecha_emision, c.total_compra
    HAVING
        (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) > 0.01
    ORDER BY
        c.fecha_emision ASC;
END;
$$;


ALTER FUNCTION "public"."get_documentos_pendientes_proveedor"("p_proveedor_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_historial_aprobaciones"() RETURNS TABLE("fecha_decision" timestamp with time zone, "nombre_gerente" "text", "estado" "text", "nombre_vendedor" "text", "nombre_cliente" "text", "nombre_producto" "text", "precio_original" numeric, "precio_solicitado" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT sa.fecha_decision, g_perfil.nombre AS nombre_gerente, sa.estado, v_perfil.nombre AS nombre_vendedor, c.nombre AS nombre_cliente, p.nombre AS nombre_producto, sa.precio_original, sa.precio_solicitado
    FROM public.solicitudes_aprobacion sa
    LEFT JOIN public.perfiles g_perfil ON sa.gerente_id = g_perfil.id
    JOIN public.perfiles v_perfil ON sa.vendedor_id = v_perfil.vendedor_id
    JOIN public.oportunidades o ON sa.oportunidad_id = o.id
    JOIN public.contactos c ON o.contacto_id = c.id
    JOIN public.productos p ON sa.producto_id = p.id
    WHERE sa.estado IN ('Aprobado', 'Rechazado')
    ORDER BY sa.fecha_decision DESC;
END;
$$;


ALTER FUNCTION "public"."get_historial_aprobaciones"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_historial_pagos_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("id" bigint, "fecha_pago" "date", "monto_total" numeric, "concepto" "text", "comprobante_url" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT pc.id, pc.fecha_pago, pc.monto_total, pc.concepto, pc.comprobante_url
    FROM public.pagos_comisiones pc WHERE pc.vendedor_id = p_vendedor_id
    ORDER BY pc.fecha_pago DESC, pc.id DESC;
END;
$$;


ALTER FUNCTION "public"."get_historial_pagos_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_initial_crm_data"() RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    v_salespeople jsonb; v_contacts jsonb; v_statuses jsonb; v_opportunities jsonb; v_products jsonb; v_lotes jsonb; v_depositos jsonb; v_sales_stages jsonb; v_estados_pedido jsonb; v_condiciones_pago jsonb; v_cuentas_bancarias jsonb; v_providers jsonb; v_stock_vendedores jsonb; v_roles jsonb;
BEGIN
    SELECT jsonb_agg(json_build_object('id', v.id, 'nombre', p.nombre)) INTO v_salespeople FROM public.vendedores v JOIN public.perfiles p ON v.id = p.vendedor_id;
    
    -- --- INICIO DE LA CORRECCIÓN ---
    -- Se modifica esta consulta para que incluya explícitamente el campo 'razon_social'
    SELECT jsonb_agg(c_data) INTO v_contacts FROM (
        SELECT c.id, c.created_at, c.nombre, c.cuit, c.email, c.telefono, c.profesion, c.especialidades, c.ultima_compra, c.domicilio_fiscal, c.direccion_entrega, c.direccion_entrega_2, c.vendedor_id, c.estado_id, c.zona, c.clasificacion, c.pais, s.saldo as deuda_actual, c.condicion_pago_id, c.productos_habituales, c.entrega_en_sucursal, c.fecha_ultimo_contacto, c.historial_whatsapp, c.condicion_iva, c.requiere_factura, c.porcentaje_facturacion_preferido, c.limite_credito, c.intereses, c.codigo_confirmacion, c.confirmado_sorteo, c.participa_sorteo, c.razon_social, c.numero_iibb, c.iibb_jurisdiccion, c.regimen_percepcion_iibb, c.alicuota_percepcion_iibb, c.fecha_ultima_consulta_padron
        FROM public.contactos c 
        LEFT JOIN public.get_saldos_todos_los_clientes() s ON c.id = s.id
    ) c_data;
    -- --- FIN DE LA CORRECCIÓN ---

    SELECT jsonb_agg(s) INTO v_statuses FROM public.estados s;
    SELECT jsonb_agg(o) INTO v_opportunities FROM public.oportunidades o;
    SELECT jsonb_agg(p) INTO v_products FROM public.productos p;
    SELECT jsonb_agg(l) INTO v_lotes FROM public.lotes l;
    SELECT jsonb_agg(d) INTO v_depositos FROM public.depositos d;
    SELECT jsonb_agg(ss) INTO v_sales_stages FROM public.etapas_venta ss;
    SELECT jsonb_agg(ep) INTO v_estados_pedido FROM public.estados_pedido ep;
    SELECT jsonb_agg(cp) INTO v_condiciones_pago FROM public.condiciones_pago cp;
    SELECT jsonb_agg(cb) INTO v_cuentas_bancarias FROM public.cuentas_bancarias cb;
    SELECT jsonb_agg(p) INTO v_providers FROM public.proveedores p;
    SELECT jsonb_agg(sv) INTO v_stock_vendedores FROM public.stock_vendedores sv;
    SELECT jsonb_agg(r) INTO v_roles FROM public.roles r;
    RETURN jsonb_build_object('salespeople', COALESCE(v_salespeople, '[]'),'contacts', COALESCE(v_contacts, '[]'),'statuses', COALESCE(v_statuses, '[]'),'opportunities', COALESCE(v_opportunities, '[]'),'products', COALESCE(v_products, '[]'),'lotes', COALESCE(v_lotes, '[]'),'depositos', COALESCE(v_depositos, '[]'),'salesStages', COALESCE(v_sales_stages, '[]'),'estadosPedido', COALESCE(v_estados_pedido, '[]'),'condicionesPago', COALESCE(v_condiciones_pago, '[]'),'cuentasBancarias', COALESCE(v_cuentas_bancarias, '[]'),'providers', COALESCE(v_providers, '[]'),'stock_vendedores', COALESCE(v_stock_vendedores, '[]'),'roles', COALESCE(v_roles, '[]'));
END;
$$;


ALTER FUNCTION "public"."get_initial_crm_data"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_inventario_completo"() RETURNS TABLE("producto_id" bigint, "producto_nombre" "text", "lote_id" bigint, "numero_lote" "text", "cantidad_inicial" integer, "stock_teorico" bigint, "stock_actual_fisico" bigint, "stock_disponible" bigint, "stock_reservado" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH 
    movimientos_agrupados AS (
        SELECT 
            m.lote_id, 
            SUM(m.cantidad) as total_movimiento
        FROM (
            SELECT sa.lote_id, CASE WHEN sa.tipo_ajuste ILIKE 'Salida%' THEN -sa.cantidad ELSE sa.cantidad END AS cantidad FROM public.stock_ajustes sa
            UNION ALL
            SELECT (p_item->>'lote_seleccionado_id')::bigint, -(p_item->>'cantidad')::int
            FROM public.pedidos p, LATERAL jsonb_array_elements(p.productos) AS p_item
            WHERE p.estado_id != (SELECT id FROM public.estados_pedido WHERE nombre = 'Anulado') AND p_item->>'lote_seleccionado_id' IS NOT NULL
        ) AS m
        GROUP BY m.lote_id
    ),
    reservas_reales AS (
        SELECT
            (prod_item->>'lote_seleccionado_id')::bigint AS lote_id,
            COALESCE(SUM((prod_item->>'cantidad')::int), 0) AS total_reservado
        FROM public.pedidos p
        CROSS JOIN LATERAL jsonb_array_elements(p.productos) AS prod_item
        WHERE p.estado_id = (SELECT id FROM public.estados_pedido WHERE nombre = 'En Preparación') AND prod_item->>'lote_seleccionado_id' IS NOT NULL
        GROUP BY (prod_item->>'lote_seleccionado_id')::bigint
    )
    SELECT
        l.producto_id, p.nombre, l.id, l.numero_lote, l.cantidad_inicial,
        (l.cantidad_inicial + COALESCE(ma.total_movimiento, 0))::bigint AS stock_teorico,
        (l.stock_disponible + l.stock_reservado)::bigint AS stock_actual_fisico,
        l.stock_disponible::bigint,
        COALESCE(rr.total_reservado, 0)::bigint AS stock_reservado
    FROM public.lotes l
    JOIN public.productos p ON l.producto_id = p.id
    LEFT JOIN movimientos_agrupados ma ON l.id = ma.lote_id
    LEFT JOIN reservas_reales rr ON l.id = rr.lote_id;
END;
$$;


ALTER FUNCTION "public"."get_inventario_completo"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_kpis_cliente"("p_contacto_id" bigint) RETURNS TABLE("total_historico_comprado" numeric, "compras_mes_actual" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_estado_anulado_id bigint;
BEGIN
    SELECT id INTO v_estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1;
    RETURN QUERY
    SELECT COALESCE(SUM(p.valor) FILTER (WHERE p.estado_id <> v_estado_anulado_id), 0) as total_historico_comprado,
           COALESCE(SUM(p.valor) FILTER (WHERE p.created_at >= date_trunc('month', CURRENT_DATE) AND p.estado_id <> v_estado_anulado_id), 0) as compras_mes_actual
    FROM public.pedidos p WHERE p.contacto_id = p_contacto_id;
END;
$$;


ALTER FUNCTION "public"."get_kpis_cliente"("p_contacto_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_ajustes"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("fecha" timestamp with time zone, "tipo_movimiento" "text", "producto_nombre" "text", "numero_lote" "text", "cantidad" integer, "origen" "text", "destino" "text", "justificacion" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT sa.created_at, UPPER(sa.tipo_ajuste), COALESCE(p.nombre, 'Producto ID: ' || sa.producto_id), COALESCE(l.numero_lote, 'N/A'), sa.cantidad,
      CASE WHEN sa.tipo_ajuste ILIKE 'Devolución a Depósito' THEN sa.operador WHEN sa.tipo_ajuste ILIKE '%Asignación' THEN dep.nombre WHEN sa.tipo_ajuste ILIKE 'ENTRADA%' THEN sa.operador WHEN sa.tipo_ajuste ILIKE 'SALIDA%' THEN dep.nombre ELSE 'Indefinido' END AS origen,
      CASE WHEN sa.tipo_ajuste ILIKE 'Devolución a Depósito' THEN dep.nombre WHEN sa.tipo_ajuste ILIKE '%Asignación' THEN sa.justificacion WHEN sa.tipo_ajuste ILIKE 'ENTRADA%' THEN dep.nombre WHEN sa.tipo_ajuste ILIKE 'SALIDA%' THEN sa.operador ELSE 'Indefinido' END AS destino,
      sa.justificacion
  FROM public.stock_ajustes sa
  LEFT JOIN public.productos p ON sa.producto_id = p.id
  LEFT JOIN public.lotes l ON sa.lote_id = l.id
  LEFT JOIN public.compras c ON l.compra_id = c.id
  LEFT JOIN public.depositos dep ON c.deposito_id = dep.id
  WHERE (p_fecha_desde IS NULL OR sa.created_at::date >= p_fecha_desde) AND (p_fecha_hasta IS NULL OR sa.created_at::date <= p_fecha_hasta);
$$;


ALTER FUNCTION "public"."get_movimientos_ajustes"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_cliente"("p_contacto_id" bigint) RETURNS TABLE("id" bigint, "fecha" "date", "concepto" "text", "debe" numeric, "haber" numeric, "pedido_id" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT mcc.id, mcc.fecha, mcc.concepto, mcc.debe, mcc.haber, mcc.pedido_id FROM movimientos_cuenta_corriente mcc WHERE mcc.cliente_id = p_contacto_id ORDER BY mcc.id ASC; END; $$;


ALTER FUNCTION "public"."get_movimientos_cliente"("p_contacto_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_compras"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("fecha" timestamp with time zone, "tipo_movimiento" "text", "producto_nombre" "text", "numero_lote" "text", "cantidad" integer, "origen" "text", "destino" "text", "justificacion" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT c.fecha_emision::timestamp with time zone, 'ENTRADA POR COMPRA'::text, (prod->>'nombre')::text, (SELECT l.numero_lote FROM public.lotes l WHERE l.compra_id = c.id AND l.producto_id = (prod->>'producto_id')::bigint LIMIT 1), (prod->>'cantidad')::integer, prov.nombre AS origen, d.nombre AS destino, 'OC-' || c.id::text || COALESCE(' / Fact: ' || c.factura_proveedor_nro, '')
  FROM public.compras c
  CROSS JOIN LATERAL jsonb_array_elements(c.productos) AS prod
  JOIN public.proveedores prov ON c.proveedor_id = prov.id
  JOIN public.depositos d ON c.deposito_id = d.id
  WHERE c.estado = 'Recibida' AND (p_fecha_desde IS NULL OR c.fecha_emision::date >= p_fecha_desde) AND (p_fecha_hasta IS NULL OR c.fecha_emision::date <= p_fecha_hasta);
$$;


ALTER FUNCTION "public"."get_movimientos_compras"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_por_lote"("p_lote_id" bigint) RETURNS TABLE("fecha" timestamp with time zone, "tipo_movimiento" "text", "cantidad" integer, "referencia" "text", "detalle" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH movimientos AS (
        SELECT c.fecha_emision::timestamp with time zone, 'ENTRADA INICIAL'::text, l.cantidad_inicial, 'OC-' || l.compra_id::text AS referencia, 'Compra a proveedor ' || prov.nombre AS detalle
        FROM public.lotes l JOIN public.compras c ON l.compra_id = c.id JOIN public.proveedores prov ON c.proveedor_id = prov.id
        WHERE l.id = p_lote_id
        UNION ALL
        SELECT p.created_at, 'SALIDA POR VENTA'::text, - (p_item->>'cantidad')::int, 'Pedido N°' || p.numero_pedido, 'Venta a cliente ' || c.nombre
        FROM public.pedidos p CROSS JOIN LATERAL jsonb_array_elements(p.productos) p_item JOIN public.contactos c ON p.contacto_id = c.id
        WHERE (p_item->>'lote_seleccionado_id')::bigint = p_lote_id AND p.estado_id != (SELECT id FROM public.estados_pedido WHERE nombre = 'Anulado')
        UNION ALL
        SELECT sa.created_at, UPPER(sa.tipo_ajuste), CASE WHEN sa.tipo_ajuste ILIKE 'Salida%' THEN -sa.cantidad ELSE sa.cantidad END, 'Ajuste Manual'::text, sa.justificacion || ' (Operador: ' || sa.operador || ')'
        FROM public.stock_ajustes sa WHERE sa.lote_id = p_lote_id
    )
    SELECT * FROM movimientos ORDER BY fecha ASC;
END;
$$;


ALTER FUNCTION "public"."get_movimientos_por_lote"("p_lote_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_proveedor"("p_proveedor_id" "uuid") RETURNS TABLE("id" bigint, "fecha" "date", "concepto" "text", "debe" numeric, "haber" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY SELECT mcp.id, mcp.fecha, mcp.concepto, mcp.debe, mcp.haber FROM movimientos_cuenta_proveedor mcp WHERE mcp.proveedor_id = p_proveedor_id ORDER BY mcp.fecha ASC, mcp.created_at ASC;
END;
$$;


ALTER FUNCTION "public"."get_movimientos_proveedor"("p_proveedor_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_movimientos_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("fecha" timestamp with time zone, "tipo_movimiento" "text", "producto_nombre" "text", "numero_lote" "text", "cantidad" integer, "origen" "text", "destino" "text", "justificacion" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  SELECT ped.created_at, 'SALIDA POR VENTA'::text, (item->>'nombre')::text, l.numero_lote, (item->>'cantidad')::integer,
      CASE WHEN ped.origen_stock = 'stock_vendedor' THEN 'Stock Vendedor: ' || COALESCE(pf.nombre, 'Vendedor N/A') ELSE COALESCE(d.nombre, 'Depósito Principal') END AS origen,
      cli.nombre AS destino, 'Pedido N°' || ped.numero_pedido
  FROM public.pedidos ped
  CROSS JOIN LATERAL jsonb_array_elements(ped.productos) AS item
  LEFT JOIN public.lotes l ON (item->>'lote_seleccionado_id')::bigint = l.id
  JOIN public.contactos cli ON ped.contacto_id = cli.id
  LEFT JOIN public.depositos d ON ped.deposito_principal_id = d.id
  LEFT JOIN public.vendedores vend ON ped.vendedor_id = vend.id
  LEFT JOIN public.perfiles pf ON vend.id = pf.vendedor_id
  WHERE ped.estado_id != (SELECT id FROM estados_pedido WHERE nombre = 'Anulado')
    AND (p_fecha_desde IS NULL OR ped.created_at::date >= p_fecha_desde)
    AND (p_fecha_hasta IS NULL OR ped.created_at::date <= p_fecha_hasta);
$$;


ALTER FUNCTION "public"."get_movimientos_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_my_vendedor_id"() RETURNS bigint
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_vendedor_id BIGINT; BEGIN SELECT vendedor_id INTO v_vendedor_id FROM public.perfiles WHERE id = auth.uid(); RETURN v_vendedor_id; END; $$;


ALTER FUNCTION "public"."get_my_vendedor_id"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_oportunidades_sin_pedido"("p_vendedor_id" bigint) RETURNS TABLE("oportunidad_id" bigint, "oportunidad_nombre" "text", "contacto_nombre" "text", "valor" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT o.id AS oportunidad_id, o.nombre AS oportunidad_nombre, c.nombre AS contacto_nombre, o.valor
    FROM public.oportunidades o
    JOIN public.etapas_venta ev ON o.etapa_id = ev.id
    JOIN public.contactos c ON o.contacto_id = c.id
    LEFT JOIN public.pedidos p ON o.id = p.oportunidad_id
    WHERE o.vendedor_id = p_vendedor_id AND ev.nombre = 'Ganada' AND p.id IS NULL;
END;
$$;


ALTER FUNCTION "public"."get_oportunidades_sin_pedido"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_pedido_saldo"("p_pedido_id" bigint) RETURNS numeric
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    SELECT p.valor - COALESCE((SELECT SUM(ap.monto_aplicado) FROM public.aplicacion_pagos ap WHERE ap.documento_id = p.id AND ap.tipo_documento = 'Pedido'), 0)
    FROM public.pedidos p WHERE p.id = p_pedido_id;
$$;


ALTER FUNCTION "public"."get_pedido_saldo"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_pedidos_con_reserva"("p_producto_id" bigint) RETURNS TABLE("numero_pedido" "text", "cliente_nombre" "text")
    LANGUAGE "plpgsql"
    AS $$
DECLARE
    v_id_estado_preparacion bigint;
    v_nombre_producto text;
    v_producto_ids bigint[]; -- Array para guardar todos los IDs que coinciden con el nombre
BEGIN
    -- Obtener el ID del estado 'En Preparación'
    SELECT id INTO v_id_estado_preparacion FROM public.estados_pedido WHERE nombre = 'En Preparación' LIMIT 1;

    -- Obtener el nombre del producto basado en el ID representativo que se pasa
    SELECT nombre INTO v_nombre_producto FROM public.productos WHERE id = p_producto_id LIMIT 1;

    -- Si se encontró un nombre, buscar todos los IDs de productos que tengan ese mismo nombre
    IF v_nombre_producto IS NOT NULL THEN
        SELECT array_agg(id) INTO v_producto_ids FROM public.productos WHERE nombre = v_nombre_producto;
    ELSE
        -- Si por alguna razón no se encuentra, usar solo el ID original como fallback
        v_producto_ids := ARRAY[p_producto_id];
    END IF;

    -- Devolver los pedidos que están 'En Preparación' y contienen CUALQUIERA de los IDs de producto encontrados
    RETURN QUERY
    SELECT
        p.numero_pedido,
        c.nombre AS cliente_nombre
    FROM
        public.pedidos p
    JOIN
        public.contactos c ON p.contacto_id = c.id
    WHERE
        p.estado_id = v_id_estado_preparacion
        AND EXISTS (
            SELECT 1
            FROM jsonb_array_elements(p.productos) AS item
            -- La corrección clave está aquí: se usa `= ANY()` para comparar contra el array de IDs
            WHERE (item->>'producto_id')::bigint = ANY(v_producto_ids)
        );
END;
$$;


ALTER FUNCTION "public"."get_pedidos_con_reserva"("p_producto_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_pedidos_para_logistica_v2"() RETURNS TABLE("id" bigint, "numero_pedido" "text", "contacto_id" bigint, "valor" numeric, "condicion_pago_id" bigint, "estado_id" bigint, "created_at" timestamp with time zone, "contactos" json, "destino" "text", "condicion_pago_nombre" "text", "condicion_pago_dias" integer, "pagado" boolean)
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id,
        p.numero_pedido,
        p.contacto_id,
        p.valor,
        p.condicion_pago_id,
        p.estado_id,
        p.created_at,
        json_build_object('id', co.id, 'nombre', co.nombre) as "contactos",
        COALESCE(
            p.direccion_entrega->>'full_address',
            'Retira en Sucursal/Oficina'
        ) AS destino,
        cp.nombre as condicion_pago_nombre,
        cp.dias as condicion_pago_dias,
        -- Un pedido de contado se considera 'pagado' si su saldo es 0 o menor.
        -- Si no es de contado, no se evalúa el pago para la logística (siempre se despacha).
        CASE
            WHEN cp.dias = 0 THEN (public.get_pedido_saldo(p.id) <= 0)
            ELSE true
        END AS pagado
    FROM
        public.pedidos p
    JOIN
        public.contactos co ON p.contacto_id = co.id
    LEFT JOIN
        public.condiciones_pago cp ON p.condicion_pago_id = cp.id
    WHERE
        p.estado_id IN (
            SELECT ep.id FROM public.estados_pedido ep
            WHERE ep.nombre IN ('En Preparación', 'Preparado', 'Despachado', 'Entregado')
        );
END;
$$;


ALTER FUNCTION "public"."get_pedidos_para_logistica_v2"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_proveedor_cuentas"("p_proveedor_id" "uuid") RETURNS TABLE("banco" "text", "alias" "text", "cbu" "text", "numero_cuenta" "text")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    SELECT banco, alias, cbu, numero_cuenta FROM public.proveedor_cuentas_bancarias WHERE proveedor_id = p_proveedor_id;
$$;


ALTER FUNCTION "public"."get_proveedor_cuentas"("p_proveedor_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_proveedores_con_deuda"() RETURNS TABLE("id" "uuid", "nombre" "text", "deuda_total" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id,
        p.nombre,
        (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) as deuda_actual
    FROM
        proveedores p
    LEFT JOIN
        movimientos_cuenta_proveedor mcp ON p.id = mcp.proveedor_id
    GROUP BY
        p.id
    HAVING
        (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) > 0.01;
END;
$$;


ALTER FUNCTION "public"."get_proveedores_con_deuda"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_proveedores_con_deudas_agrupadas"() RETURNS TABLE("proveedor_id" "uuid", "proveedor_nombre" "text", "proveedor_deuda_total" numeric, "compra_id" bigint, "compra_fecha" "date", "compra_factura_nro" "text", "compra_total" numeric, "compra_saldo_pendiente" numeric)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    WITH pagos_por_compra AS (
        SELECT compra_id, COALESCE(SUM(haber), 0) as total_pagado
        FROM public.movimientos_cuenta_proveedor GROUP BY compra_id
    )
    SELECT p.id as proveedor_id, p.nombre as proveedor_nombre, p.deuda_actual as proveedor_deuda_total, c.id as compra_id,
           c.fecha_emision as compra_fecha, c.factura_proveedor_nro, c.total_compra as compra_total,
           (c.total_compra - COALESCE(pagos.total_pagado, 0)) as compra_saldo_pendiente
    FROM proveedores p JOIN compras c ON p.id = c.proveedor_id
    LEFT JOIN pagos_por_compra pagos ON c.id = pagos.compra_id
    WHERE (c.total_compra - COALESCE(pagos.total_pagado, 0)) > 0.01;
$$;


ALTER FUNCTION "public"."get_proveedores_con_deudas_agrupadas"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_proximas_acciones_dinamicas"("p_vendedor_id" bigint) RETURNS TABLE("regla_nombre" "text", "mensaje" "text", "entidad_id" bigint, "entidad_nombre" "text", "tipo_entidad" "text", "telefono_contacto" "text", "mensaje_whatsapp" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    regla record;
    consulta_dinamica text;
BEGIN
    FOR regla IN SELECT * FROM public.reglas_alertas WHERE activa = true LOOP
        -- CORRECCIÓN: Se añade un REPLACE adicional para 'productos_habituales' para resolver la ambigüedad.
        consulta_dinamica := format(
            'SELECT %L as regla_nombre, REPLACE(%L, ''{nombre_entidad}'', c.nombre) as mensaje, c.id::bigint as entidad_id, c.nombre as entidad_nombre, %L as tipo_entidad, c.telefono as telefono_contacto, REPLACE(%L, ''{nombre_entidad}'', c.nombre) as mensaje_whatsapp
             FROM public.%I e JOIN public.contactos c ON ' || (CASE WHEN regla.entidad = 'contactos' THEN 'e.id = c.id' ELSE 'e.contacto_id = c.id' END) ||
             ' WHERE c.vendedor_id = %s AND (%s)',
            regla.nombre_regla, regla.mensaje_alerta, regla.entidad, regla.mensaje_whatsapp, regla.entidad, p_vendedor_id,
            REPLACE(REPLACE(REPLACE(regla.condicion_sql, 'productos_habituales', 'c.productos_habituales'), 'fecha_ultimo_contacto', 'c.fecha_ultimo_contacto'), 'ultima_compra', 'c.ultima_compra')
        );

        -- Captura de errores para depuración
        BEGIN
            RETURN QUERY EXECUTE consulta_dinamica;
        EXCEPTION
            WHEN others THEN
                RAISE WARNING 'Error al ejecutar regla "%": %', regla.nombre_regla, SQLERRM;
                RAISE WARNING 'Consulta fallida: %', consulta_dinamica;
        END;
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."get_proximas_acciones_dinamicas"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_resumen_liquidaciones"("p_mes" integer DEFAULT NULL::integer, "p_anio" integer DEFAULT NULL::integer) RETURNS TABLE("vendedor_id" bigint, "nombre_vendedor" "text", "comisiones_a_pagar" numeric, "comisiones_potenciales" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
    id_estado_entregado bigint;
BEGIN
    SELECT id INTO id_estado_entregado FROM public.estados_pedido WHERE nombre = 'Entregado' LIMIT 1;

    RETURN QUERY
    SELECT
        v.id,
        p.nombre,
        -- Comisiones A PAGAR (directo de la tabla 'comisiones')
        (SELECT COALESCE(SUM(c.monto_comision), 0)
         FROM public.comisiones c
         WHERE c.vendedor_id = v.id
           AND c.estado = 'pendiente'
           AND (p_mes IS NULL OR EXTRACT(MONTH FROM c.fecha_generacion) = p_mes)
           AND (p_anio IS NULL OR EXTRACT(YEAR FROM c.fecha_generacion) = p_anio)
        ) AS comisiones_a_pagar,
        
        -- Comisiones POTENCIALES (calculado sobre pedidos entregados con deuda)
        (SELECT
            COALESCE(SUM(ped.valor - COALESCE(ap.total_aplicado, 0)), 0) * (COALESCE(v.porcentaje_comision, 0) / 100.0)
         FROM
            public.pedidos ped
         LEFT JOIN
            (SELECT documento_id, SUM(monto_aplicado) as total_aplicado
             FROM public.aplicacion_pagos
             WHERE tipo_documento = 'Pedido'
             GROUP BY documento_id) ap ON ped.id = ap.documento_id
         WHERE
            ped.vendedor_id = v.id
            AND ped.estado_id = id_estado_entregado
            AND (ped.valor - COALESCE(ap.total_aplicado, 0)) > 0.01
        ) AS comisiones_potenciales
        
    FROM
        public.vendedores v
    JOIN
        public.perfiles p ON v.id = p.vendedor_id
    ORDER BY
        p.nombre;
END;
$$;


ALTER FUNCTION "public"."get_resumen_liquidaciones"("p_mes" integer, "p_anio" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_resumen_mensual_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") RETURNS TABLE("mes_anio" "text", "pedidos_cantidad" bigint, "valor_total" numeric, "productos_destacados" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    WITH pedidos_del_periodo AS (
        SELECT TO_CHAR(p.created_at, 'YYYY-MM') as anio_mes, p.id, p.valor, prod.value ->> 'nombre' as nombre_producto
        FROM public.pedidos p, jsonb_array_elements(p.productos) prod
        WHERE p.contacto_id = p_contacto_id AND p.created_at::date >= p_fecha_desde AND p.created_at::date <= p_fecha_hasta
    )
    SELECT pp.anio_mes, COUNT(DISTINCT pp.id)::bigint as pedidos_cantidad, SUM(DISTINCT pp.valor) as valor_total, STRING_AGG(DISTINCT pp.nombre_producto, ', ' ORDER BY pp.nombre_producto) as productos_destacados
    FROM pedidos_del_periodo pp GROUP BY pp.anio_mes ORDER BY pp.anio_mes DESC;
END;
$$;


ALTER FUNCTION "public"."get_resumen_mensual_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_roles_con_permisos"() RETURNS TABLE("rol_id" integer, "nombre_rol" "text", "permisos" "text"[])
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NOT ('Superadministrador' = ANY(get_user_roles())) THEN RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador.'; END IF;
    RETURN QUERY SELECT r.id as rol_id, r.nombre_rol, COALESCE(ARRAY(SELECT p.nombre_permiso FROM public.rol_permisos rp JOIN public.permisos p ON rp.permiso_id = p.id WHERE rp.rol_id = r.id ORDER BY p.nombre_permiso), '{}'::text[]) as permisos FROM public.roles r ORDER BY r.id;
END;
$$;


ALTER FUNCTION "public"."get_roles_con_permisos"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_saldos_clientes_con_detalle_deuda"() RETURNS TABLE("id" bigint, "nombre" "text", "saldo" numeric, "fecha_deuda_mas_antigua" "date", "dias_condicion_pago" integer, "antiguedad_deuda" integer, "dias_vencida" integer)
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
WITH
    pagos_aplicados AS (
        SELECT ap.documento_id AS pedido_id, COALESCE(SUM(ap.monto_aplicado), 0) AS total_pagado
        FROM public.aplicacion_pagos ap WHERE ap.tipo_documento = 'Pedido' GROUP BY ap.documento_id
    ),
    deudas_abiertas AS (
        SELECT p.id AS pedido_id, p.contacto_id, p.created_at::date AS fecha_pedido, (p.valor - COALESCE(pa.total_pagado, 0)) AS saldo_pendiente
        FROM public.pedidos p LEFT JOIN pagos_aplicados pa ON p.id = pa.pedido_id
        WHERE p.estado_id != (SELECT id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1) AND (p.valor - COALESCE(pa.total_pagado, 0)) > 0.01
    ),
    saldos_finales AS (
        SELECT c.id, c.nombre, c.condicion_pago_id,
               (SELECT SUM(da.saldo_pendiente) FROM deudas_abiertas da WHERE da.contacto_id = c.id) AS saldo,
               (SELECT MIN(da.fecha_pedido) FROM deudas_abiertas da WHERE da.contacto_id = c.id) AS fecha_deuda_mas_antigua
        FROM public.contactos c WHERE EXISTS (SELECT 1 FROM deudas_abiertas da WHERE da.contacto_id = c.id)
    )
SELECT s.id, s.nombre, s.saldo, s.fecha_deuda_mas_antigua, COALESCE(cp.dias, 0) AS dias_condicion_pago,
       (CASE WHEN s.fecha_deuda_mas_antigua IS NOT NULL THEN (CURRENT_DATE - s.fecha_deuda_mas_antigua) ELSE 0 END)::integer AS antiguedad_deuda,
       (CASE WHEN s.fecha_deuda_mas_antigua IS NOT NULL THEN (CURRENT_DATE - (s.fecha_deuda_mas_antigua + COALESCE(cp.dias, 0))) ELSE 0 END)::integer AS dias_vencida
FROM saldos_finales s LEFT JOIN public.condiciones_pago cp ON s.condicion_pago_id = cp.id
WHERE s.saldo > 0.01;
$$;


ALTER FUNCTION "public"."get_saldos_clientes_con_detalle_deuda"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_saldos_todos_los_clientes"() RETURNS TABLE("id" bigint, "nombre" "text", "saldo" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT c.id, c.nombre, (COALESCE(SUM(mcc.debe), 0) - COALESCE(SUM(mcc.haber), 0)) AS saldo_calculado FROM public.contactos c LEFT JOIN public.movimientos_cuenta_corriente mcc ON c.id = mcc.cliente_id GROUP BY c.id, c.nombre ORDER BY c.nombre ASC; END; $$;


ALTER FUNCTION "public"."get_saldos_todos_los_clientes"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_saldos_todos_los_proveedores"() RETURNS TABLE("id" "uuid", "nombre" "text", "saldo" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT p.id, p.nombre, (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) AS saldo_actual FROM proveedores p LEFT JOIN movimientos_cuenta_proveedor mcp ON p.id = mcp.proveedor_id GROUP BY p.id, p.nombre HAVING (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) != 0 ORDER BY saldo_actual DESC; END; $$;


ALTER FUNCTION "public"."get_saldos_todos_los_proveedores"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_saldos_todos_proveedores"() RETURNS TABLE("id" "uuid", "nombre" "text", "saldo" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT p.id, p.nombre, (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) AS saldo_actual FROM proveedores p LEFT JOIN movimientos_cuenta_proveedor mcp ON p.id = mcp.proveedor_id GROUP BY p.id, p.nombre HAVING (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) != 0 ORDER BY saldo_actual DESC; END; $$;


ALTER FUNCTION "public"."get_saldos_todos_proveedores"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_solicitud_para_aprobar"("p_token" "text") RETURNS TABLE("oportunidad_id" bigint, "numero_propuesta" bigint, "vendedor_nombre" "text", "cliente_nombre" "text", "producto_id" bigint, "producto_nombre" "text", "cantidad" integer, "precio_original" numeric, "precio_solicitado" numeric, "justificacion" "text", "comision_original" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT opp.id, opp.numero_propuesta, p_vendedor.nombre, c.nombre, (prod_data->'datos_solicitud'->>'producto_id')::bigint, prod_data->>'nombre', (prod_data->>'cantidad')::int, (prod_data->'datos_solicitud'->>'precio_original')::numeric, (prod_data->'datos_solicitud'->>'precio_solicitado')::numeric, prod_data->'datos_solicitud'->>'justificacion', v.porcentaje_comision
    FROM public.oportunidades opp
    CROSS JOIN LATERAL jsonb_array_elements(opp.productos) AS prod_data
    LEFT JOIN public.vendedores v ON opp.vendedor_id = v.id
    LEFT JOIN public.perfiles p_vendedor ON v.id = p_vendedor.vendedor_id
    LEFT JOIN public.contactos c ON opp.contacto_id = c.id
    WHERE prod_data->'datos_solicitud'->>'token' = p_token;
END;
$$;


ALTER FUNCTION "public"."get_solicitud_para_aprobar"("p_token" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_solicitudes_pendientes"() RETURNS TABLE("solicitud_id" bigint, "oportunidad_id" bigint, "nombre_oportunidad" "text", "nombre_vendedor" "text", "nombre_cliente" "text", "nombre_producto" "text", "precio_original" numeric, "precio_solicitado" numeric, "justificacion" "text", "fecha_solicitud" timestamp with time zone, "numero_propuesta" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT sa.id AS solicitud_id, sa.oportunidad_id, o.nombre AS nombre_oportunidad, COALESCE(v_perfil.nombre, 'Vendedor ' || v.id::text) AS nombre_vendedor, c.nombre AS nombre_cliente, p.nombre AS nombre_producto, sa.precio_original, sa.precio_solicitado, sa.justificacion, sa.created_at AS fecha_solicitud, o.numero_propuesta
    FROM public.solicitudes_aprobacion sa
    JOIN public.oportunidades o ON sa.oportunidad_id = o.id
    JOIN public.contactos c ON o.contacto_id = c.id
    JOIN public.productos p ON sa.producto_id = p.id
    JOIN public.vendedores v ON sa.vendedor_id = v.id
    LEFT JOIN public.perfiles v_perfil ON v.id = v_perfil.vendedor_id
    WHERE sa.estado = 'Pendiente' ORDER BY sa.created_at ASC;
END;
$$;


ALTER FUNCTION "public"."get_solicitudes_pendientes"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_solicitudes_por_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("solicitud_id" bigint, "nombre_cliente" "text", "nombre_producto" "text", "precio_original" numeric, "precio_solicitado" numeric, "estado" "text", "justificacion" "text")
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT sa.id, c.nombre, p.nombre, sa.precio_original, sa.precio_solicitado, sa.estado, sa.justificacion
    FROM public.solicitudes_aprobacion sa
    JOIN public.oportunidades o ON sa.oportunidad_id = o.id
    JOIN public.contactos c ON o.contacto_id = c.id
    JOIN public.productos p ON sa.producto_id = p.id
    WHERE sa.vendedor_id = p_vendedor_id ORDER BY sa.created_at DESC;
END;
$$;


ALTER FUNCTION "public"."get_solicitudes_por_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_stock_general_completo_v2"() RETURNS TABLE("producto_id" integer, "nombre_producto" "text", "stock_deposito_disponible" numeric, "stock_deposito_reservado" numeric, "stock_asignado" numeric, "stock_total_fisico" numeric, "stock_por_vendedor" "jsonb")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
WITH 
    stock_agrupado_producto AS (
        SELECT inv.producto_id, SUM(inv.stock_disponible) AS total_disponible, SUM(inv.stock_reservado) AS total_reservado
        FROM public.get_inventario_completo() inv GROUP BY inv.producto_id
    ),
    stock_asignado_vendedores AS (
        SELECT l.producto_id, SUM(sv.cantidad_asignada) AS total_asignado, jsonb_agg(jsonb_build_object('vendedor_id', sv.vendedor_id, 'nombre', pf.nombre, 'cantidad', sv.cantidad_asignada)) AS detalle
        FROM stock_vendedores sv JOIN lotes l ON l.id = sv.lote_id JOIN perfiles pf ON sv.vendedor_id = pf.vendedor_id
        GROUP BY l.producto_id
    )
SELECT p.id::integer, p.nombre, COALESCE(sap.total_disponible, 0)::numeric, COALESCE(sap.total_reservado, 0)::numeric, COALESCE(sav.total_asignado, 0)::numeric,
       (COALESCE(sap.total_disponible, 0) + COALESCE(sap.total_reservado, 0) + COALESCE(sav.total_asignado, 0))::numeric, sav.detalle
FROM productos p
LEFT JOIN stock_agrupado_producto sap ON p.id = sap.producto_id
LEFT JOIN stock_asignado_vendedores sav ON p.id = sav.producto_id
ORDER BY p.nombre;
$$;


ALTER FUNCTION "public"."get_stock_general_completo_v2"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_stock_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("producto_nombre" "text", "lote_numero" "text", "fecha_vencimiento" "date", "cantidad_asignada" integer)
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
    SELECT p.nombre, l.numero_lote, l.fecha_vencimiento, sv.cantidad_asignada
    FROM stock_vendedores sv
    JOIN lotes l ON sv.lote_id = l.id
    JOIN productos p ON l.producto_id = p.id
    WHERE sv.vendedor_id = p_vendedor_id AND sv.cantidad_asignada > 0
    ORDER BY p.nombre, l.fecha_vencimiento;
$$;


ALTER FUNCTION "public"."get_stock_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_todos_los_usuarios_con_roles"() RETURNS TABLE("usuario_id" "uuid", "vendedor_id" bigint, "nombre_vendedor" "text", "roles" "text"[])
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NOT ('Superadministrador' = ANY(get_user_roles())) THEN
        RAISE EXCEPTION 'Acceso denegado';
    END IF;
    RETURN QUERY
    SELECT
        p.id as usuario_id,
        p.vendedor_id,
        p.nombre as nombre_vendedor,
        ARRAY(
            SELECT r.nombre_rol
            FROM public.usuario_roles ur
            JOIN public.roles r ON ur.rol_id = r.id
            WHERE ur.usuario_id = p.id
        ) as roles
    FROM public.perfiles p
    ORDER BY p.nombre;
END;
$$;


ALTER FUNCTION "public"."get_todos_los_usuarios_con_roles"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_top_clientes_por_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("nombre_cliente" "text", "total_comprado" numeric)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    c.nombre AS nombre_cliente,
    SUM(p.valor) AS total_comprado
  FROM public.pedidos p
  JOIN public.contactos c ON p.contacto_id = c.id
  WHERE p.vendedor_id = p_vendedor_id
    AND p.estado_id = 4
  GROUP BY c.nombre
  ORDER BY total_comprado DESC
  LIMIT 10;
END;
$$;


ALTER FUNCTION "public"."get_top_clientes_por_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_top_productos_por_vendedor"("p_vendedor_id" bigint) RETURNS TABLE("nombre_producto" "text", "unidades_vendidas" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    (prod_item->>'nombre')::TEXT AS nombre_producto,
    SUM((prod_item->>'cantidad')::INTEGER)::BIGINT AS unidades_vendidas
  FROM public.pedidos p,
       jsonb_array_elements(p.productos) AS prod_item
  WHERE p.vendedor_id = p_vendedor_id
    AND p.estado_id = 4
  GROUP BY nombre_producto
  ORDER BY unidades_vendidas DESC
  LIMIT 10;
END;
$$;


ALTER FUNCTION "public"."get_top_productos_por_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_roles"() RETURNS "text"[]
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE user_roles TEXT[]; BEGIN SELECT array_agg(r.nombre_rol) INTO user_roles FROM public.usuario_roles ur JOIN public.roles r ON ur.rol_id = r.id WHERE ur.usuario_id = auth.uid(); RETURN COALESCE(user_roles, '{}'); END; $$;


ALTER FUNCTION "public"."get_user_roles"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_valor_stock_vendedor"("p_vendedor_id" bigint) RETURNS numeric
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE total_valor numeric;
BEGIN
    SELECT COALESCE(SUM(sv.cantidad_asignada * p.precio_base), 0) INTO total_valor
    FROM stock_vendedores sv JOIN lotes l ON sv.lote_id = l.id JOIN productos p ON l.producto_id = p.id
    WHERE sv.vendedor_id = p_vendedor_id;
    RETURN total_valor;
END;
$$;


ALTER FUNCTION "public"."get_valor_stock_vendedor"("p_vendedor_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_vista_estacional_cliente"("_p_contacto_id" bigint, "_p_anio" integer) RETURNS TABLE("producto_nombre" "text", "ene" "jsonb", "feb" "jsonb", "mar" "jsonb", "abr" "jsonb", "may" "jsonb", "jun" "jsonb", "jul" "jsonb", "ago" "jsonb", "sep" "jsonb", "oct" "jsonb", "nov" "jsonb", "dic" "jsonb")
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
WITH ventas_desglosadas AS (
    SELECT EXTRACT(MONTH FROM p.created_at) as mes, (item.value->>'nombre')::text as nombre_prod, (item.value->>'cantidad')::integer as cantidad, (item.value->>'subtotal')::numeric as valor
    FROM public.pedidos p, LATERAL jsonb_array_elements(p.productos) as item
    WHERE p.contacto_id = _p_contacto_id AND EXTRACT(YEAR FROM p.created_at) = _p_anio AND p.estado_id = 4
)
SELECT nombre_prod,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 1 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 1 THEN valor ELSE 0 END)), '{}'::jsonb) as ene,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 2 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 2 THEN valor ELSE 0 END)), '{}'::jsonb) as feb,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 3 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 3 THEN valor ELSE 0 END)), '{}'::jsonb) as mar,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 4 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 4 THEN valor ELSE 0 END)), '{}'::jsonb) as abr,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 5 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 5 THEN valor ELSE 0 END)), '{}'::jsonb) as may,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 6 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 6 THEN valor ELSE 0 END)), '{}'::jsonb) as jun,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 7 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 7 THEN valor ELSE 0 END)), '{}'::jsonb) as jul,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 8 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 8 THEN valor ELSE 0 END)), '{}'::jsonb) as ago,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 9 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 9 THEN valor ELSE 0 END)), '{}'::jsonb) as sep,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 10 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 10 THEN valor ELSE 0 END)), '{}'::jsonb) as oct,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 11 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 11 THEN valor ELSE 0 END)), '{}'::jsonb) as nov,
    COALESCE(jsonb_build_object('unidades', SUM(CASE WHEN mes = 12 THEN cantidad ELSE 0 END), 'valor', SUM(CASE WHEN mes = 12 THEN valor ELSE 0 END)), '{}'::jsonb) as dic
FROM ventas_desglosadas GROUP BY nombre_prod ORDER BY nombre_prod;
$$;


ALTER FUNCTION "public"."get_vista_estacional_cliente"("_p_contacto_id" bigint, "_p_anio" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_zona_y_costo_por_coordenadas"("p_lat" double precision, "p_lng" double precision) RETURNS TABLE("id" integer, "nombre" "text", "costo" numeric, "monto_minimo_bonificacion" numeric)
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  RETURN QUERY
  SELECT
    z.id,
    z.nombre,
    z.costo,
    z.monto_minimo_bonificacion
  FROM
    public.zonas_envio z
  WHERE
    z.geometria IS NOT NULL AND
    ST_Contains(z.geometria, ST_SetSRID(ST_MakePoint(p_lng, p_lat), 4326))
  LIMIT 1;
END;
$$;


ALTER FUNCTION "public"."get_zona_y_costo_por_coordenadas"("p_lat" double precision, "p_lng" double precision) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_zonas_envio_con_geojson"() RETURNS TABLE("id" bigint, "created_at" timestamp with time zone, "nombre" "text", "costo" numeric, "monto_minimo_bonificacion" numeric, "organizacion_id" bigint, "geometria" "jsonb")
    LANGUAGE "sql"
    AS $$
  select
    ze.id,
    ze.created_at,
    ze.nombre,
    ze.costo,
    ze.monto_minimo_bonificacion,
    ze.organizacion_id,
    -- La magia: Convertimos el tipo 'geography' a un texto GeoJSON y luego a JSONB.
    ST_AsGeoJSON(ze.geometria)::jsonb
  from
    public.zonas_envio ze
  order by
    ze.nombre;
$$;


ALTER FUNCTION "public"."get_zonas_envio_con_geojson"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_event_registration"("contact_data" "jsonb") RETURNS bigint
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_estado_pendiente_id bigint; v_nombre_formateado text; v_intereses_array text[]; v_contacto_id bigint; v_email_a_buscar text; BEGIN SELECT id INTO v_estado_pendiente_id FROM public.estados WHERE nombre = 'Pendiente de Aprobación' LIMIT 1; IF v_estado_pendiente_id IS NULL THEN RAISE EXCEPTION 'Estado "Pendiente de Aprobación" no encontrado.'; END IF; v_email_a_buscar := lower(trim(contact_data->>'email')); v_nombre_formateado := INITCAP(contact_data->>'nombre'); v_intereses_array := ARRAY(SELECT jsonb_array_elements_text(contact_data->'productos_interes')); SELECT id INTO v_contacto_id FROM public.contactos WHERE lower(trim(email)) = v_email_a_buscar; IF v_contacto_id IS NOT NULL THEN UPDATE public.contactos SET nombre = v_nombre_formateado, intereses = v_intereses_array, participa_sorteo = true WHERE id = v_contacto_id; ELSE INSERT INTO public.contactos (nombre, email, intereses, estado_id, confirmado_sorteo, participa_sorteo) VALUES (v_nombre_formateado, v_email_a_buscar, v_intereses_array, v_estado_pendiente_id, false, true) RETURNING id INTO v_contacto_id; END IF; RETURN v_contacto_id; END; $$;


ALTER FUNCTION "public"."handle_event_registration"("contact_data" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE
  v_default_org_id bigint := 1; -- Se asume que 1 es la organización principal (ej: BiosPlus)
BEGIN
  INSERT INTO public.perfiles (id, email, nombre, organizacion_id)
  VALUES (
    NEW.id, 
    NEW.email, 
    -- FIX: Usa COALESCE. Si 'full_name' no viene de Google, usa el email como nombre.
    -- Esto evita que la inserción falle y permite que el usuario se cree correctamente.
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
    v_default_org_id
  )
  ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    -- También se actualiza el nombre en inicios de sesión posteriores por si cambia en el proveedor.
    nombre = EXCLUDED.nombre;
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_public_contact_insert"("contact_data" "jsonb") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
DECLARE
    v_estado_id bigint;
BEGIN
    -- Busca el ID del estado "Pendiente de Aprobación".
    SELECT id INTO v_estado_id FROM public.estados WHERE nombre = 'Pendiente de Aprobación' LIMIT 1;

    -- Si no existe, lo crea para evitar errores.
    IF v_estado_id IS NULL THEN
        INSERT INTO public.estados (nombre) VALUES ('Pendiente de Aprobación') ON CONFLICT (nombre) DO NOTHING;
        SELECT id INTO v_estado_id FROM public.estados WHERE nombre = 'Pendiente de Aprobación' LIMIT 1;
    END IF;

    -- Inserta el nuevo contacto, forzando el estado a "Pendiente de Aprobación".
    INSERT INTO public.contactos (
        nombre, cuit_dni, email, telefono, productos_habituales,
        direccion_facturacion, direccion_entrega, direccion_entrega_2,
        entrega_en_sucursal, estado_id
    ) VALUES (
        contact_data->> 'nombre',
        contact_data->> 'cuit_dni',
        contact_data->> 'email',
        contact_data->> 'telefono',
        contact_data->> 'productos_habituales',
        (contact_data-> 'direccion_facturacion')::jsonb,
        (contact_data-> 'direccion_entrega')::jsonb,
        (CASE WHEN contact_data ? 'direccion_entrega_2' THEN (contact_data-> 'direccion_entrega_2')::jsonb ELSE NULL END),
        CASE WHEN LOWER(COALESCE(contact_data->> 'entrega_en_sucursal', 'false')) IN ('true','t','1') THEN true ELSE false END,
        v_estado_id
    );
END;
$$;


ALTER FUNCTION "public"."handle_public_contact_insert"("contact_data" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_app_user"() RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN RETURN EXISTS (SELECT 1 FROM public.perfiles WHERE id = auth.uid()); END; $$;


ALTER FUNCTION "public"."is_app_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."liberar_reserva_pedido"("p_pedido_id" integer) RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare v_pedido public.pedidos%rowtype; r record;
begin
    select * into v_pedido from public.pedidos where id = p_pedido_id for update;
    if not found then return json_build_object('ok', false, 'error', 'Pedido no encontrado'); end if;
    if coalesce(v_pedido.origen_stock,'deposito_principal') <> 'deposito_principal' then return json_build_object('ok', true, 'msg', 'Sin reserva aplicable'); end if;
    if not v_pedido.reserva_creada then return json_build_object('ok', true, 'msg', 'No había reserva'); end if;
    if v_pedido.reserva_confirmada then return json_build_object('ok', false, 'error', 'Ya confirmada'); end if;
    for r in select * from public.reservas_pedido where pedido_id = p_pedido_id for update loop
        update public.lotes set stock_disponible = stock_disponible + r.cantidad, stock_reservado = stock_reservado - r.cantidad where id = r.lote_id;
    end loop;
    delete from public.reservas_pedido where pedido_id = p_pedido_id;
    update public.pedidos set reserva_creada = false where id = p_pedido_id;
    return json_build_object('ok', true, 'msg', 'Reserva liberada');
end;
$$;


ALTER FUNCTION "public"."liberar_reserva_pedido"("p_pedido_id" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."pagar_comisiones_vendedor"("p_vendedor_id" bigint, "p_comision_ids" bigint[], "p_fecha_pago" "date", "p_concepto" "text", "p_comprobante_url" "text") RETURNS bigint
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_monto_total numeric; v_pago_comision_id bigint; v_vendedor_id_real bigint;
BEGIN
    SELECT vendedor_id INTO v_vendedor_id_real FROM public.comisiones WHERE id = p_comision_ids[1] LIMIT 1;
    IF v_vendedor_id_real IS NULL THEN RETURN NULL; END IF;
    SELECT COALESCE(SUM(monto_comision), 0) INTO v_monto_total FROM comisiones WHERE id = ANY(p_comision_ids) AND estado = 'pendiente' AND vendedor_id = v_vendedor_id_real;
    IF v_monto_total > 0 THEN
        INSERT INTO pagos_comisiones (vendedor_id, fecha_pago, monto_total, concepto, comprobante_url)
        VALUES (v_vendedor_id_real, p_fecha_pago, v_monto_total, p_concepto, p_comprobante_url)
        RETURNING id INTO v_pago_comision_id;
        UPDATE comisiones SET estado = 'pagada', pago_comision_id = v_pago_comision_id WHERE id = ANY(p_comision_ids) AND estado = 'pendiente' AND vendedor_id = v_vendedor_id_real;
        RETURN v_pago_comision_id;
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION "public"."pagar_comisiones_vendedor"("p_vendedor_id" bigint, "p_comision_ids" bigint[], "p_fecha_pago" "date", "p_concepto" "text", "p_comprobante_url" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."ping"() RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
BEGIN
    RETURN 'pong';
END;
$$;


ALTER FUNCTION "public"."ping"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."procesar_confirmacion_pedido_v2"("p_pedido_id" bigint) RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_pedido RECORD;
    v_estado_borrador_id INT;
    v_estado_preparacion_id INT;
    v_estado_entregado_id INT;
    v_producto JSONB;
    v_cantidad_necesaria INT;
    v_lote RECORD;
    v_stock_vendedor RECORD;
    v_cantidad_a_tomar INT;
    v_productos_actualizados JSONB := '[]'::jsonb;
    v_producto_actualizado JSONB;
BEGIN
    -- Obtener IDs de estados clave
    SELECT id INTO v_estado_borrador_id FROM public.estados_pedido WHERE nombre = 'Borrador';
    SELECT id INTO v_estado_preparacion_id FROM public.estados_pedido WHERE nombre = 'En Preparación';
    SELECT id INTO v_estado_entregado_id FROM public.estados_pedido WHERE nombre = 'Entregado';

    -- Bloquear el pedido para evitar race conditions y obtener sus datos
    SELECT * INTO v_pedido FROM public.pedidos WHERE id = p_pedido_id FOR UPDATE;

    -- Idempotencia: Si el pedido no está en 'Borrador', no hacer nada.
    IF v_pedido.estado_id != v_estado_borrador_id THEN
        RETURN 'El pedido ya fue procesado anteriormente.';
    END IF;

    -- RUTA A: STOCK DE DEPÓSITO PRINCIPAL
    IF v_pedido.origen_stock = 'deposito_principal' THEN
        FOR v_producto IN SELECT * FROM jsonb_array_elements(v_pedido.productos)
        LOOP
            v_cantidad_necesaria := (v_producto->>'cantidad')::int;
            v_producto_actualizado := v_producto;

            FOR v_lote IN 
                SELECT id, stock_disponible FROM public.lotes 
                WHERE producto_id = (v_producto->>'producto_id')::bigint AND stock_disponible > 0
                ORDER BY fecha_vencimiento ASC
            LOOP
                v_cantidad_a_tomar := LEAST(v_cantidad_necesaria, v_lote.stock_disponible);
                
                UPDATE public.lotes 
                SET stock_disponible = stock_disponible - v_cantidad_a_tomar,
                    stock_reservado = stock_reservado + v_cantidad_a_tomar
                WHERE id = v_lote.id;

                -- Añadir el lote seleccionado al producto del pedido
                v_producto_actualizado := jsonb_set(v_producto_actualizado, '{lote_seleccionado_id}', to_jsonb(v_lote.id));
                v_productos_actualizados := v_productos_actualizados || v_producto_actualizado;

                v_cantidad_necesaria := v_cantidad_necesaria - v_cantidad_a_tomar;
                IF v_cantidad_necesaria <= 0 THEN EXIT; END IF;
            END LOOP;

            IF v_cantidad_necesaria > 0 THEN
                RAISE EXCEPTION 'Stock insuficiente en depósito para el producto %', v_producto->>'nombre';
            END IF;
        END LOOP;
        
        -- Cambiar estado a 'En Preparación' y actualizar productos con lotes
        UPDATE public.pedidos SET estado_id = v_estado_preparacion_id, productos = v_productos_actualizados WHERE id = p_pedido_id;

    -- RUTA B: STOCK DE VENDEDOR
    ELSIF v_pedido.origen_stock = 'stock_vendedor' THEN
        FOR v_producto IN SELECT * FROM jsonb_array_elements(v_pedido.productos)
        LOOP
            v_cantidad_necesaria := (v_producto->>'cantidad')::int;
            v_producto_actualizado := v_producto;

            FOR v_stock_vendedor IN
                SELECT sv.id, sv.cantidad_asignada, sv.lote_id FROM public.stock_vendedores sv
                JOIN public.lotes l ON sv.lote_id = l.id
                WHERE sv.vendedor_id = v_pedido.vendedor_id AND l.producto_id = (v_producto->>'producto_id')::bigint
                AND sv.cantidad_asignada > 0
                ORDER BY l.fecha_vencimiento ASC
            LOOP
                v_cantidad_a_tomar := LEAST(v_cantidad_necesaria, v_stock_vendedor.cantidad_asignada);

                UPDATE public.stock_vendedores
                SET cantidad_asignada = cantidad_asignada - v_cantidad_a_tomar
                WHERE id = v_stock_vendedor.id;
                
                -- Añadir el lote seleccionado al producto del pedido
                v_producto_actualizado := jsonb_set(v_producto_actualizado, '{lote_seleccionado_id}', to_jsonb(v_stock_vendedor.lote_id));
                v_productos_actualizados := v_productos_actualizados || v_producto_actualizado;

                v_cantidad_necesaria := v_cantidad_necesaria - v_cantidad_a_tomar;
                IF v_cantidad_necesaria <= 0 THEN EXIT; END IF;
            END LOOP;

            IF v_cantidad_necesaria > 0 THEN
                RAISE EXCEPTION 'Stock de vendedor insuficiente para el producto %', v_producto->>'nombre';
            END IF;
        END LOOP;

        -- Cambiar estado a 'Entregado' directamente y actualizar productos
        UPDATE public.pedidos SET estado_id = v_estado_entregado_id, productos = v_productos_actualizados WHERE id = p_pedido_id;
    END IF;

    -- Generar movimiento de deuda en cuenta corriente (si no existe)
    IF NOT EXISTS (SELECT 1 FROM public.movimientos_cuenta_corriente WHERE pedido_id = p_pedido_id AND debe > 0) THEN
        INSERT INTO public.movimientos_cuenta_corriente(cliente_id, pedido_id, concepto, debe, fecha)
        VALUES (v_pedido.contacto_id, p_pedido_id, 'Deuda por Pedido N°' || v_pedido.numero_pedido, v_pedido.valor, CURRENT_DATE);
    END IF;

    RETURN 'Pedido confirmado y procesado correctamente.';
END;
$$;


ALTER FUNCTION "public"."procesar_confirmacion_pedido_v2"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."procesar_pedido"("p_pedido_id" bigint, "p_origen_stock" "text") RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE pedido_rec RECORD; producto_rec RECORD; v_vendedor_id bigint;
BEGIN
    SELECT * INTO pedido_rec FROM pedidos WHERE id = p_pedido_id;
    v_vendedor_id := pedido_rec.vendedor_id;
    FOR producto_rec IN SELECT * FROM jsonb_to_recordset(pedido_rec.productos) AS x(producto_id bigint, cantidad int) LOOP
        IF p_origen_stock = 'vendedor' THEN PERFORM descontar_stock_vendedor(v_vendedor_id, producto_rec.producto_id, producto_rec.cantidad);
        ELSE PERFORM descontar_stock_principal(producto_rec.producto_id, producto_rec.cantidad); END IF;
    END LOOP;
    UPDATE pedidos SET estado_id = (SELECT id FROM estados_pedido WHERE nombre = 'En Preparación') WHERE id = p_pedido_id;
    RETURN 'Pedido procesado y enviado a logística.';
END;
$$;


ALTER FUNCTION "public"."procesar_pedido"("p_pedido_id" bigint, "p_origen_stock" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."procesar_pedido_y_stock_v2"("p_pedido_id" bigint) RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_pedido RECORD;
    v_estado_borrador_id INT;
    v_estado_preparacion_id INT;
    v_estado_entregado_id INT;
    v_producto JSONB;
    v_cantidad_necesaria INT;
    v_lote RECORD;
    v_stock_vendedor RECORD;
    v_cantidad_a_tomar INT;
    v_productos_actualizados JSONB := '[]'::jsonb;
    v_producto_actualizado JSONB;
BEGIN
    -- Obtener IDs de estados clave
    SELECT id INTO v_estado_borrador_id FROM public.estados_pedido WHERE nombre = 'Borrador';
    SELECT id INTO v_estado_preparacion_id FROM public.estados_pedido WHERE nombre = 'En Preparación';
    SELECT id INTO v_estado_entregado_id FROM public.estados_pedido WHERE nombre = 'Entregado';

    -- Bloquear el pedido para evitar race conditions y obtener sus datos
    SELECT * INTO v_pedido FROM public.pedidos WHERE id = p_pedido_id FOR UPDATE;

    -- Idempotencia: Si el pedido no está en 'Borrador', no hacer nada.
    IF v_pedido.estado_id != v_estado_borrador_id THEN
        RETURN 'El pedido ya fue procesado anteriormente.';
    END IF;

    -- RUTA A: STOCK DE DEPÓSITO PRINCIPAL
    IF v_pedido.origen_stock = 'deposito_principal' THEN
        
        UPDATE public.pedidos SET estado_id = v_estado_preparacion_id WHERE id = p_pedido_id;

    -- RUTA B: STOCK DE VENDEDOR
    ELSIF v_pedido.origen_stock = 'stock_vendedor' THEN
        FOR v_producto IN SELECT * FROM jsonb_array_elements(v_pedido.productos)
        LOOP
            v_cantidad_necesaria := (v_producto->>'cantidad')::int;
            
            FOR v_stock_vendedor IN
                SELECT sv.id, sv.cantidad_asignada, sv.lote_id FROM public.stock_vendedores sv
                JOIN public.lotes l ON sv.lote_id = l.id
                WHERE sv.vendedor_id = v_pedido.vendedor_id AND l.producto_id = (v_producto->>'producto_id')::bigint
                AND sv.cantidad_asignada > 0
                ORDER BY l.fecha_vencimiento ASC
            LOOP
                v_cantidad_a_tomar := LEAST(v_cantidad_necesaria, v_stock_vendedor.cantidad_asignada);

                UPDATE public.stock_vendedores
                SET cantidad_asignada = cantidad_asignada - v_cantidad_a_tomar
                WHERE id = v_stock_vendedor.id;
                
                v_cantidad_necesaria := v_cantidad_necesaria - v_cantidad_a_tomar;
                IF v_cantidad_necesaria <= 0 THEN EXIT; END IF;
            END LOOP;

            IF v_cantidad_necesaria > 0 THEN
                RAISE EXCEPTION 'Stock de vendedor insuficiente para el producto %', v_producto->>'nombre';
            END IF;
        END LOOP;

        UPDATE public.pedidos SET estado_id = v_estado_entregado_id WHERE id = p_pedido_id;
    END IF;

    -- Generar movimiento de deuda en cuenta corriente (si no existe)
    IF NOT EXISTS (SELECT 1 FROM public.movimientos_cuenta_corriente WHERE pedido_id = p_pedido_id AND debe > 0) THEN
        INSERT INTO public.movimientos_cuenta_corriente(cliente_id, pedido_id, concepto, debe, fecha)
        VALUES (v_pedido.contacto_id, p_pedido_id, 'Deuda por Pedido N°' || v_pedido.numero_pedido, v_pedido.valor, CURRENT_DATE);
    END IF;

    RETURN 'Pedido confirmado y procesado correctamente.';
END;
$$;


ALTER FUNCTION "public"."procesar_pedido_y_stock_v2"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reassign_and_delete_stage"("p_old_etapa_id" bigint, "p_new_etapa_id" bigint) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NOT public.check_user_permission('configuracion:editar:etapas') THEN
        RAISE EXCEPTION 'Acceso denegado: Permiso insuficiente para modificar etapas.';
    END IF;
    UPDATE public.oportunidades SET etapa_id = p_new_etapa_id WHERE etapa_id = p_old_etapa_id;
    DELETE FROM public.etapas_venta WHERE id = p_old_etapa_id;
END;
$$;


ALTER FUNCTION "public"."reassign_and_delete_stage"("p_old_etapa_id" bigint, "p_new_etapa_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."recalcular_saldo_contacto"("id_contacto" bigint) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE saldo_final NUMERIC;
BEGIN
    SELECT COALESCE(SUM(debe) - SUM(haber), 0) INTO saldo_final FROM public.movimientos_cuenta_corriente WHERE cliente_id = id_contacto;
    UPDATE public.contactos SET deuda_actual = saldo_final WHERE id = id_contacto;
END;
$$;


ALTER FUNCTION "public"."recalcular_saldo_contacto"("id_contacto" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."recalcular_saldos_todos_los_clientes"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE cliente_record RECORD; movimiento_record RECORD; saldo_corriente NUMERIC;
BEGIN
    FOR cliente_record IN SELECT DISTINCT cliente_id FROM movimientos_cuenta_corriente LOOP
        saldo_corriente := 0;
        FOR movimiento_record IN SELECT id, debe, haber FROM movimientos_cuenta_corriente WHERE cliente_id = cliente_record.cliente_id ORDER BY fecha, id LOOP
            saldo_corriente := saldo_corriente + movimiento_record.debe - movimiento_record.haber;
            UPDATE movimientos_cuenta_corriente SET saldo = saldo_corriente WHERE id = movimiento_record.id;
        END LOOP;
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."recalcular_saldos_todos_los_clientes"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."registrar_deuda_proveedor"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NEW.estado = 'Recibida' AND OLD.estado <> 'Recibida' THEN
        INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, compra_id, fecha, concepto, debe, haber)
        VALUES(NEW.proveedor_id, NEW.id, NEW.fecha_emision, 'Deuda por OC-' || LPAD(NEW.id::text, 5, '0') || COALESCE(' / Fact. ' || NEW.factura_proveedor_nro, ''), NEW.total_compra, 0);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."registrar_deuda_proveedor"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."registrar_pago_completo"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_user_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_pago_id bigint; doc_pendiente RECORD; v_concepto TEXT; v_monto_restante numeric := p_monto; v_monto_a_aplicar numeric;
BEGIN
    INSERT INTO pagos (contacto_id, monto, metodo_pago, referencia, fecha_pago, es_pago_cruzado, user_id)
    VALUES (p_contacto_id, p_monto, p_metodo_pago, p_referencia, p_fecha_pago, p_es_cruzado, p_user_id)
    RETURNING id INTO v_pago_id;
    v_concepto := 'Pago recibido (' || p_metodo_pago || COALESCE(' Ref: ' || p_referencia, '') || ')';
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, haber, fecha, pago_id)
    VALUES(p_contacto_id, v_concepto, p_monto, p_fecha_pago, v_pago_id);
    FOR doc_pendiente IN SELECT * FROM public.get_documentos_pendientes_cliente(p_contacto_id) ORDER BY fecha ASC LOOP
        IF v_monto_restante <= 0.01 THEN EXIT; END IF;
        v_monto_a_aplicar := LEAST(v_monto_restante, doc_pendiente.saldo_pendiente);
        INSERT INTO aplicacion_pagos(pago_id, monto_aplicado, documento_id, tipo_documento)
        VALUES(v_pago_id, v_monto_a_aplicar, doc_pendiente.documento_id, doc_pendiente.tipo);
        v_monto_restante := v_monto_restante - v_monto_a_aplicar;
    END LOOP;
    IF p_es_cruzado AND p_proveedor_id IS NOT NULL THEN
         PERFORM public.registrar_pago_proveedor_directo(p_proveedor_id, p_monto, 'Pago Cruzado', 'Cliente: ' || (SELECT nombre FROM contactos WHERE id = p_contacto_id), p_fecha_pago);
    END IF;
END;
$$;


ALTER FUNCTION "public"."registrar_pago_completo"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."registrar_pago_proveedor_directo"("p_proveedor_id" "uuid", "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_monto_restante numeric := p_monto; oc_a_pagar record; v_monto_a_aplicar numeric; v_concepto text;
BEGIN
    FOR oc_a_pagar IN
        SELECT c.id, c.factura_proveedor_nro, (c.total_compra - COALESCE((SELECT SUM(mcp.haber) FROM movimientos_cuenta_proveedor mcp WHERE mcp.compra_id = c.id), 0)) AS saldo_pendiente
        FROM compras c WHERE c.proveedor_id = p_proveedor_id AND c.estado = 'Recibida'
        GROUP BY c.id HAVING (c.total_compra - COALESCE((SELECT SUM(mcp.haber) FROM movimientos_cuenta_proveedor mcp WHERE mcp.compra_id = c.id), 0)) > 0.01
        ORDER BY c.fecha_emision ASC
    LOOP
        IF v_monto_restante <= 0.01 THEN EXIT; END IF;
        v_monto_a_aplicar := LEAST(v_monto_restante, oc_a_pagar.saldo_pendiente);
        v_concepto := 'Pago aplicado a OC-' || LPAD(oc_a_pagar.id::text, 5, '0');
        IF oc_a_pagar.factura_proveedor_nro IS NOT NULL AND oc_a_pagar.factura_proveedor_nro <> '' THEN
            v_concepto := v_concepto || ' / Fact. ' || oc_a_pagar.factura_proveedor_nro;
        END IF;
        INSERT INTO movimientos_cuenta_proveedor (proveedor_id, compra_id, fecha, concepto, debe, haber)
        VALUES (p_proveedor_id, oc_a_pagar.id, p_fecha_pago, v_concepto, 0, v_monto_a_aplicar);
        v_monto_restante := v_monto_restante - v_monto_a_aplicar;
    END LOOP;
    IF v_monto_restante > 0.01 THEN
        INSERT INTO movimientos_cuenta_proveedor (proveedor_id, fecha, concepto, debe, haber)
        VALUES (p_proveedor_id, p_fecha_pago, 'Pago (Saldo a favor) (' || p_metodo_pago || ')' || COALESCE(' Ref: ' || p_referencia, ''), 0, v_monto_restante);
    END IF;
END;
$$;


ALTER FUNCTION "public"."registrar_pago_proveedor_directo"("p_proveedor_id" "uuid", "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."registrar_pago_simple"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_user_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_pago_id bigint; doc_pendiente RECORD; v_concepto TEXT; v_monto_restante numeric := p_monto; v_monto_a_aplicar numeric;
BEGIN
    INSERT INTO pagos (contacto_id, monto, metodo_pago, referencia, fecha_pago, es_pago_cruzado, user_id)
    VALUES (p_contacto_id, p_monto, p_metodo_pago, p_referencia, p_fecha_pago, false, p_user_id)
    RETURNING id INTO v_pago_id;
    v_concepto := 'Pago recibido (' || p_metodo_pago || COALESCE(' Ref: ' || p_referencia, '') || ')';
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, haber, fecha, pago_id)
    VALUES(p_contacto_id, v_concepto, p_monto, p_fecha_pago, v_pago_id);
    FOR doc_pendiente IN SELECT * FROM public.get_documentos_pendientes_cliente(p_contacto_id) ORDER BY fecha ASC LOOP
        IF v_monto_restante <= 0.01 THEN EXIT; END IF;
        v_monto_a_aplicar := LEAST(v_monto_restante, doc_pendiente.saldo_pendiente);
        INSERT INTO aplicacion_pagos(pago_id, monto_aplicado, documento_id, tipo_documento)
        VALUES(v_pago_id, v_monto_a_aplicar, doc_pendiente.documento_id, doc_pendiente.tipo);
        v_monto_restante := v_monto_restante - v_monto_a_aplicar;
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."registrar_pago_simple"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."registrar_y_aplicar_pago_cliente"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_compra_id" bigint, "p_comprobante_url" "text", "p_user_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_pago_id bigint; v_movimiento_id bigint; v_monto_restante numeric := p_monto; doc_pendiente RECORD; v_monto_a_aplicar numeric; v_concepto_base TEXT; v_documentos_aplicados TEXT[]; v_concepto_final TEXT;
BEGIN
    INSERT INTO pagos (contacto_id, monto, metodo_pago, referencia, fecha_pago, es_pago_cruzado, comprobante_url, user_id)
    VALUES (p_contacto_id, p_monto, p_metodo_pago, p_referencia, p_fecha_pago, p_es_cruzado, p_comprobante_url, p_user_id)
    RETURNING id INTO v_pago_id;
    v_concepto_base := 'Pago recibido (' || p_metodo_pago || COALESCE(' Ref: ' || p_referencia, '') || ')';
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, haber, fecha, pago_id)
    VALUES(p_contacto_id, v_concepto_base, p_monto, p_fecha_pago, v_pago_id)
    RETURNING id INTO v_movimiento_id;
    FOR doc_pendiente IN SELECT * FROM public.get_documentos_pendientes_cliente(p_contacto_id) ORDER BY fecha ASC LOOP
        IF v_monto_restante <= 0.01 THEN EXIT; END IF;
        v_monto_a_aplicar := LEAST(v_monto_restante, doc_pendiente.saldo_pendiente);
        INSERT INTO aplicacion_pagos(pago_id, monto_aplicado, documento_id, tipo_documento)
        VALUES(v_pago_id, v_monto_a_aplicar, doc_pendiente.documento_id, doc_pendiente.tipo);
        v_documentos_aplicados := array_append(v_documentos_aplicados, doc_pendiente.numero);
        v_monto_restante := v_monto_restante - v_monto_a_aplicar;
    END LOOP;
    IF array_length(v_documentos_aplicados, 1) > 0 THEN
        IF array_length(v_documentos_aplicados, 1) = 1 THEN v_concepto_final := 'Pago aplicado al Doc: ' || v_documentos_aplicados[1];
        ELSE v_concepto_final := 'Pago aplicado a los Docs: ' || array_to_string(v_documentos_aplicados, ', '); END IF;
        UPDATE public.movimientos_cuenta_corriente SET concepto = v_concepto_final WHERE id = v_movimiento_id;
    END IF;
    IF p_es_cruzado AND p_proveedor_id IS NOT NULL AND p_compra_id IS NOT NULL THEN
        INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, compra_id, concepto, haber, fecha, pago_id)
        VALUES(p_proveedor_id, p_compra_id, 'Pago cruzado desde cliente ' || (SELECT nombre FROM contactos WHERE id = p_contacto_id) || ' a OC-' || p_compra_id, p_monto, p_fecha_pago, v_pago_id);
    END IF;
END;
$$;


ALTER FUNCTION "public"."registrar_y_aplicar_pago_cliente"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_compra_id" bigint, "p_comprobante_url" "text", "p_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reservar_stock_pedido"("p_pedido_id" integer) RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare v_pedido public.pedidos%rowtype; v_item jsonb; v_producto_id int; v_cant numeric; v_lote_id int; v_needed numeric; v_fail boolean := false; v_msg text := ''; r record;
begin
    select * into v_pedido from public.pedidos where id = p_pedido_id for update;
    if not found then return json_build_object('ok', false, 'error', 'Pedido no encontrado'); end if;
    if coalesce(v_pedido.origen_stock,'deposito_principal') <> 'deposito_principal' then return json_build_object('ok', true, 'msg', 'Pedido no requiere reserva'); end if;
    if v_pedido.reserva_creada then return json_build_object('ok', true, 'msg', 'Reserva ya existente'); end if;
    for v_item in select jsonb_array_elements(v_pedido.productos) as elem loop
        v_producto_id := (v_item->>'producto_id')::int; v_cant := (v_item->>'cantidad')::numeric; v_lote_id := nullif(v_item->>'lote_seleccionado_id','')::int;
        if coalesce(v_cant,0) <= 0 then continue; end if;
        if v_lote_id is not null then
            update public.lotes set stock_disponible = stock_disponible - v_cant, stock_reservado = stock_reservado + v_cant where id = v_lote_id and producto_id = v_producto_id and stock_disponible >= v_cant returning id into v_lote_id;
            if not found then v_fail := true; v_msg := v_msg || format('Sin stock en lote %s. ', v_lote_id); exit; end if;
            insert into public.reservas_pedido(pedido_id, producto_id, lote_id, cantidad) values (p_pedido_id, v_producto_id, v_lote_id, v_cant);
        else
            v_needed := v_cant;
            for r in select id, stock_disponible from public.lotes where producto_id = v_producto_id and stock_disponible > 0 order by fecha_vencimiento nulls last, id for update loop
                exit when v_needed <= 0;
                declare v_take numeric;
                begin
                    v_take := least(r.stock_disponible, v_needed);
                    update public.lotes set stock_disponible = stock_disponible - v_take, stock_reservado = stock_reservado + v_take where id = r.id;
                    insert into public.reservas_pedido(pedido_id, producto_id, lote_id, cantidad) values (p_pedido_id, v_producto_id, r.id, v_take);
                    v_needed := v_needed - v_take;
                end;
            end loop;
            if v_needed > 0 then v_fail := true; v_msg := v_msg || format('Falta stock producto %s. ', v_producto_id); exit; end if;
        end if;
    end loop;
    if v_fail then
        for r in select * from public.reservas_pedido where pedido_id = p_pedido_id loop
            update public.lotes set stock_disponible = stock_disponible + r.cantidad, stock_reservado = stock_reservado - r.cantidad where id = r.lote_id;
        end loop;
        delete from public.reservas_pedido where pedido_id = p_pedido_id;
        return json_build_object('ok', false, 'error', v_msg);
    end if;
    update public.pedidos set reserva_creada = true where id = p_pedido_id;
    return json_build_object('ok', true, 'msg', 'Reserva creada');
end;
$$;


ALTER FUNCTION "public"."reservar_stock_pedido"("p_pedido_id" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."resolver_solicitud_aprobacion"("p_token" "text", "p_aprobado" boolean, "p_comision_modificada" numeric DEFAULT NULL::numeric) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_solicitud_id bigint; v_oportunidad_id bigint; v_vendedor_id bigint; v_productos_originales jsonb; v_productos_actualizados jsonb; v_etapa_propuesta_id bigint;
BEGIN
    SELECT s.id, s.oportunidad_id, s.vendedor_id, o.productos INTO v_solicitud_id, v_oportunidad_id, v_vendedor_id, v_productos_originales
    FROM public.solicitudes_aprobacion s JOIN public.oportunidades o ON s.oportunidad_id = o.id
    WHERE s.token = p_token AND s.estado = 'Pendiente';
    IF NOT FOUND THEN RAISE EXCEPTION 'Solicitud no encontrada, ya procesada o token inválido.'; END IF;
    SELECT id INTO v_etapa_propuesta_id FROM public.etapas_venta WHERE nombre = 'Propuesta Enviada' LIMIT 1;
    IF v_etapa_propuesta_id IS NULL THEN RAISE EXCEPTION 'Error de configuración: La etapa "Propuesta Enviada" no existe.'; END IF;
    SELECT jsonb_agg(CASE WHEN (elem->'datos_solicitud'->>'token') = p_token THEN CASE WHEN p_aprobado THEN jsonb_set(elem - 'datos_solicitud', '{precio_unitario}', (elem->'datos_solicitud'->'precio_solicitado')) || jsonb_build_object('promo_aplicada', 'Precio Aprobado') ELSE jsonb_set(elem - 'datos_solicitud', '{promo_aplicada}', '"Precio Rechazado"') END ELSE elem END)
    INTO v_productos_actualizados FROM jsonb_array_elements(v_productos_originales) elem;
    UPDATE public.oportunidades SET productos = v_productos_actualizados, valor = (SELECT COALESCE(SUM(((p->>'cantidad')::numeric) * ((p->>'precio_unitario')::numeric)), 0) FROM jsonb_array_elements(v_productos_actualizados) p), etapa_id = v_etapa_propuesta_id WHERE id = v_oportunidad_id;
    IF p_comision_modificada IS NOT NULL THEN UPDATE public.vendedores SET porcentaje_comision = p_comision_modificada WHERE id = v_vendedor_id; END IF;
    UPDATE public.solicitudes_aprobacion SET estado = CASE WHEN p_aprobado THEN 'Aprobada' ELSE 'Rechazada' END, fecha_decision = now(), gerente_id = auth.uid() WHERE id = v_solicitud_id;
END;
$$;


ALTER FUNCTION "public"."resolver_solicitud_aprobacion"("p_token" "text", "p_aprobado" boolean, "p_comision_modificada" numeric) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."reversar_recepcion_compra"("p_compra_id" bigint) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    DELETE FROM movimientos_cuenta_proveedor
    WHERE compra_id = p_compra_id AND debe > 0;
    DELETE FROM lotes
    WHERE compra_id = p_compra_id;
    UPDATE compras
    SET estado = 'Borrador'
    WHERE id = p_compra_id;
END;
$$;


ALTER FUNCTION "public"."reversar_recepcion_compra"("p_compra_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_numero_propuesta"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    NEW.numero_propuesta := nextval('public.oportunidades_numero_propuesta_seq');
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."set_numero_propuesta"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_permisos_para_rol"("p_rol_id" integer, "p_permisos_nombres" "text"[]) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE permiso_rec RECORD;
BEGIN
    IF NOT ('Superadministrador' = ANY(get_user_roles())) THEN RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador.'; END IF;
    DELETE FROM public.rol_permisos WHERE rol_id = p_rol_id;
    FOR permiso_rec IN SELECT id FROM public.permisos WHERE nombre_permiso = ANY(p_permisos_nombres) LOOP
        INSERT INTO public.rol_permisos (rol_id, permiso_id) VALUES (p_rol_id, permiso_rec.id);
    END LOOP;
END;
$$;


ALTER FUNCTION "public"."set_permisos_para_rol"("p_rol_id" integer, "p_permisos_nombres" "text"[]) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_token_confirmacion_recepcion"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'extensions'
    AS $$
BEGIN
  NEW.token_confirmacion_recepcion = gen_random_uuid();
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."set_token_confirmacion_recepcion"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."set_usuario_roles"("p_usuario_id" "uuid", "p_roles_nombres" "text"[]) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF current_setting('request.jwt.claims', true)::jsonb->>'role' != 'service_role' THEN
        IF NOT ('Superadministrador' = ANY(get_user_roles())) THEN
            RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador.';
        END IF;
    END IF;
    DELETE FROM public.usuario_roles WHERE usuario_id = p_usuario_id;
    INSERT INTO public.usuario_roles (usuario_id, rol_id)
    SELECT p_usuario_id, r.id FROM public.roles r WHERE r.nombre_rol = ANY(p_roles_nombres);
END;
$$;


ALTER FUNCTION "public"."set_usuario_roles"("p_usuario_id" "uuid", "p_roles_nombres" "text"[]) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sincronizar_permisos"("p_permisos_nombres" "text"[]) RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF NOT ('Superadministrador' = ANY(public.get_user_roles())) THEN RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador para sincronizar permisos.'; END IF;
    WITH permisos_desde_app (nombre) AS (SELECT unnest(p_permisos_nombres))
    INSERT INTO public.permisos (nombre_permiso) SELECT nombre FROM permisos_desde_app ON CONFLICT (nombre_permiso) DO NOTHING;
END;
$$;


ALTER FUNCTION "public"."sincronizar_permisos"("p_permisos_nombres" "text"[]) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sincronizar_saldos_clientes"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    WITH saldos_reales AS (
        SELECT c.id as contacto_id, COALESCE(SUM(m.debe), 0) - COALESCE(SUM(m.haber), 0) as nuevo_saldo
        FROM public.contactos c LEFT JOIN public.movimientos_cuenta_corriente m ON c.id = m.cliente_id
        GROUP BY c.id
    )
    UPDATE public.contactos c SET deuda_actual = sr.nuevo_saldo FROM saldos_reales sr WHERE c.id = sr.contacto_id;
END;
$$;


ALTER FUNCTION "public"."sincronizar_saldos_clientes"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."solicitar_aprobacion_masiva"("p_oportunidad_id" bigint, "p_solicitudes" "jsonb", "p_justificacion" "text") RETURNS "jsonb"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'extensions'
    AS $_$
DECLARE
    v_etapa_pendiente_id bigint;
    v_productos_originales jsonb;
    v_productos_actualizados jsonb;
    solicitud record;
    v_token text;
    v_gerente_whatsapp text;
    v_vendedor_nombre text;
    v_cliente_nombre text;
    v_mensaje_whatsapp text;
    v_productos_texto text := '';
BEGIN
    SELECT id INTO v_etapa_pendiente_id FROM public.etapas_venta WHERE nombre = 'Pendiente de Aprobación' LIMIT 1;
    IF v_etapa_pendiente_id IS NULL THEN
        RAISE EXCEPTION 'Error de configuración: La etapa "Pendiente de Aprobación" no existe.';
    END IF;

    SELECT productos INTO v_productos_originales FROM public.oportunidades WHERE id = p_oportunidad_id;
    v_productos_actualizados := v_productos_originales;
    v_token := extensions.uuid_generate_v4()::text;

    FOR solicitud IN SELECT * FROM jsonb_to_recordset(p_solicitudes) AS x(producto_id bigint, precio_solicitado numeric)
    LOOP
        v_productos_actualizados := (
            SELECT jsonb_agg(
                CASE
                    WHEN (elem->>'producto_id')::bigint = solicitud.producto_id THEN
                        elem || jsonb_build_object('datos_solicitud', jsonb_build_object(
                            'token', v_token,
                            'producto_id', solicitud.producto_id,
                            'precio_original', (elem->>'precio_unitario')::numeric,
                            'precio_solicitado', solicitud.precio_solicitado,
                            'justificacion', p_justificacion,
                            'solicitado_por', (SELECT nombre FROM perfiles WHERE id = auth.uid())
                        ))
                    ELSE elem
                END
            )
            FROM jsonb_array_elements(v_productos_actualizados) elem
        );
    END LOOP;

    UPDATE public.oportunidades
    SET 
        productos = v_productos_actualizados,
        etapa_id = v_etapa_pendiente_id
    WHERE id = p_oportunidad_id;

    SELECT valor INTO v_gerente_whatsapp FROM public.configuracion WHERE clave = 'gerente_whatsapp';
    IF v_gerente_whatsapp IS NULL THEN
        RAISE EXCEPTION 'No se ha configurado un número de WhatsApp para el gerente.';
    END IF;

    SELECT p.nombre, c.nombre INTO v_vendedor_nombre, v_cliente_nombre
    FROM public.oportunidades opp
    JOIN public.perfiles p ON opp.vendedor_id = p.vendedor_id
    JOIN public.contactos c ON opp.contacto_id = c.id
    WHERE opp.id = p_oportunidad_id;

    FOR solicitud IN SELECT * FROM jsonb_to_recordset(p_solicitudes) AS x(producto_id bigint, precio_solicitado numeric)
    LOOP
        v_productos_texto := v_productos_texto || format('  - %s a $%s%%0A', (SELECT nombre FROM productos WHERE id = solicitud.producto_id), solicitud.precio_solicitado);
    END LOOP;

    v_mensaje_whatsapp := format(
        'Nueva solicitud de descuento:%%0A- *Vendedor:* %s%%0A- *Cliente:* %s%%0A- *Productos:*%%0A%s%%0APara revisar y decidir, haz clic aquí: ',
        v_vendedor_nombre,
        v_cliente_nombre,
        v_productos_texto
    );

    RETURN jsonb_build_object(
        'token', v_token,
        'whatsapp_base_link', 'https://wa.me/' || v_gerente_whatsapp || '?text=' || v_mensaje_whatsapp
    );
END;
$_$;


ALTER FUNCTION "public"."solicitar_aprobacion_masiva"("p_oportunidad_id" bigint, "p_solicitudes" "jsonb", "p_justificacion" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sugerir_embalaje_pedido"("p_pedido_id" bigint) RETURNS TABLE("embalaje_sugerido_id" integer, "peso_total_gr" integer)
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE v_total_volumen_cm3 INT; v_total_peso_gr INT;
BEGIN
  SELECT SUM(p.cantidad * (prod.dimensiones_cm->>'largo')::int * (prod.dimensiones_cm->>'ancho')::int * (prod.dimensiones_cm->>'alto')::int), SUM(p.cantidad * prod.peso_gr)
  INTO v_total_volumen_cm3, v_total_peso_gr
  FROM jsonb_to_recordset((SELECT productos FROM pedidos WHERE id = p_pedido_id)) AS p(producto_id BIGINT, cantidad INT)
  JOIN productos prod ON prod.id = p.producto_id;
  SELECT e.id INTO embalaje_sugerido_id FROM logistica_embalajes e WHERE e.volumen_cm3 >= v_total_volumen_cm3 ORDER BY e.volumen_cm3 ASC LIMIT 1;
  SELECT v_total_peso_gr + e.peso_gr INTO peso_total_gr FROM logistica_embalajes e WHERE e.id = embalaje_sugerido_id;
  IF peso_total_gr IS NULL THEN peso_total_gr := v_total_peso_gr; END IF;
  RETURN QUERY SELECT embalaje_sugerido_id, peso_total_gr;
END;
$$;


ALTER FUNCTION "public"."sugerir_embalaje_pedido"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."sync_contact_zone"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    -- On INSERT or UPDATE
    IF (TG_OP = 'UPDATE') THEN
        -- Caso 1: La app nueva actualiza el zona_id. Esto tiene prioridad.
        IF NEW.zona_id IS DISTINCT FROM OLD.zona_id THEN
            IF NEW.zona_id IS NULL THEN
                NEW.zona := NULL;
            ELSE
                NEW.zona := (SELECT nombre FROM public.zonas WHERE id = NEW.zona_id);
            END IF;
        -- Caso 2: La app vieja actualiza el campo de texto 'zona'.
        ELSIF NEW.zona IS DISTINCT FROM OLD.zona THEN
            IF NEW.zona IS NULL THEN
                NEW.zona_id := NULL;
            ELSE
                NEW.zona_id := (SELECT id FROM public.zonas WHERE nombre = NEW.zona);
            END IF;
        END IF;
    ELSIF (TG_OP = 'INSERT') THEN
        -- Caso 1: La app nueva inserta con zona_id.
        IF NEW.zona_id IS NOT NULL AND NEW.zona IS NULL THEN
            NEW.zona := (SELECT nombre FROM public.zonas WHERE id = NEW.zona_id);
        -- Caso 2: La app vieja inserta con 'zona' de texto.
        ELSIF NEW.zona IS NOT NULL AND NEW.zona_id IS NULL THEN
            NEW.zona_id := (SELECT id FROM public.zonas WHERE nombre = NEW.zona);
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."sync_contact_zone"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."test_conexion"() RETURNS "text"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
BEGIN
    RETURN 'Conexión y ejecución exitosa desde la base de datos';
END;
$$;


ALTER FUNCTION "public"."test_conexion"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."trigger_recalcular_saldo"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        PERFORM recalcular_saldo_contacto(OLD.cliente_id);
    ELSE
        PERFORM recalcular_saldo_contacto(NEW.cliente_id);
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION "public"."trigger_recalcular_saldo"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."trigger_set_timestamp"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."trigger_set_timestamp"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."zonas_envio" (
    "id" bigint NOT NULL,
    "nombre" "text" NOT NULL,
    "costo" numeric NOT NULL,
    "monto_minimo_bonificacion" numeric,
    "organizacion_id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "geometria" "extensions"."geography"(Polygon,4326)
);


ALTER TABLE "public"."zonas_envio" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."upsert_zona_envio"("p_zona_data" "jsonb") RETURNS SETOF "public"."zonas_envio"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
DECLARE
    v_zona_id bigint;
    v_geometria_geojson text;
    v_geometria_geography geography;
    v_org_id bigint;
    v_inserted_id bigint;
BEGIN
    -- Extraer el ID de la zona si existe.
    v_zona_id := (p_zona_data->>'id')::bigint;
    
    -- Extraer la geometría del JSON y convertirla a geography.
    v_geometria_geojson := p_zona_data->>'geometria';
    
    -- Validar que la geometría no sea nula o inválida
    IF v_geometria_geojson IS NOT NULL AND v_geometria_geojson != 'null' THEN
        -- PostGIS necesita el formato GeoJSON como TEXT para la conversión
        v_geometria_geography := ST_GeomFromGeoJSON(v_geometria_geojson);
    ELSE
        v_geometria_geography := NULL;
    END IF;

    -- Obtener la organización del usuario que hace la llamada.
    -- Esto es crucial para la seguridad multi-tenant.
    SELECT organizacion_id INTO v_org_id 
    FROM public.perfiles 
    WHERE id = auth.uid();

    IF v_org_id IS NULL THEN
        RAISE EXCEPTION 'No se pudo determinar la organización del usuario. Operación cancelada.';
    END IF;

    IF v_zona_id IS NOT NULL THEN
        -- Si hay ID, es una ACTUALIZACIÓN.
        UPDATE public.zonas_envio
        SET
            nombre = p_zona_data->>'nombre',
            costo = (p_zona_data->>'costo')::numeric,
            geometria = v_geometria_geography
        WHERE
            id = v_zona_id
            AND organizacion_id = v_org_id; -- Seguridad: solo puede editar las de su org.
            
        v_inserted_id := v_zona_id;
    ELSE
        -- Si no hay ID, es una INSERCIÓN.
        INSERT INTO public.zonas_envio(nombre, costo, geometria, organizacion_id)
        VALUES (
            p_zona_data->>'nombre',
            (p_zona_data->>'costo')::numeric,
            v_geometria_geography,
            v_org_id
        )
        RETURNING id INTO v_inserted_id;
    END IF;

    -- Devolver la fila actualizada o insertada para que el frontend la reciba.
    RETURN QUERY SELECT * FROM public.zonas_envio WHERE id = v_inserted_id;

END;
$$;


ALTER FUNCTION "public"."upsert_zona_envio"("p_zona_data" "jsonb") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."verificar_pedido_para_logistica"("p_pedido_id" bigint) RETURNS boolean
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
DECLARE pedido_actual RECORD; v_total_pagado NUMERIC; v_comprobante_encontrado BOOLEAN; v_condicion_pago_dias INT;
BEGIN
    SELECT * INTO pedido_actual FROM public.pedidos WHERE id = p_pedido_id;
    IF NOT FOUND THEN RETURN FALSE; END IF;
    SELECT dias INTO v_condicion_pago_dias FROM public.condiciones_pago WHERE id = pedido_actual.condicion_pago_id;
    IF COALESCE(v_condicion_pago_dias, 0) > 0 THEN RETURN TRUE; END IF;
    SELECT COALESCE(SUM(monto_aplicado), 0) INTO v_total_pagado FROM public.aplicacion_pagos WHERE documento_id = p_pedido_id AND tipo_documento = 'Pedido';
    SELECT EXISTS (SELECT 1 FROM public.pagos p JOIN public.aplicacion_pagos ap ON p.id = ap.pago_id WHERE ap.documento_id = p_pedido_id AND ap.tipo_documento = 'Pedido' AND p.comprobante_url IS NOT NULL AND length(trim(p.comprobante_url)) > 5) INTO v_comprobante_encontrado;
    RETURN (v_total_pagado >= pedido_actual.valor AND v_comprobante_encontrado);
END;
$$;


ALTER FUNCTION "public"."verificar_pedido_para_logistica"("p_pedido_id" bigint) OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."aplicacion_pagos" (
    "id" bigint NOT NULL,
    "pago_id" bigint NOT NULL,
    "monto_aplicado" numeric(12,2) NOT NULL,
    "documento_id" bigint NOT NULL,
    "tipo_documento" "text" NOT NULL
);


ALTER TABLE "public"."aplicacion_pagos" OWNER TO "postgres";


COMMENT ON TABLE "public"."aplicacion_pagos" IS 'Tabla flexible que conecta un pago con los documentos que salda (pedidos o facturas).';



ALTER TABLE "public"."aplicacion_pagos" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."aplicacion_pagos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."auditoria_pedidos" (
    "id" bigint NOT NULL,
    "pedido_id" bigint,
    "fecha_modificacion" timestamp with time zone DEFAULT "now"(),
    "usuario_modificacion" "text" DEFAULT 'sistema'::"text",
    "campo_modificado" "text" NOT NULL,
    "valor_anterior" "text",
    "valor_nuevo" "text",
    "descripcion" "text"
);


ALTER TABLE "public"."auditoria_pedidos" OWNER TO "postgres";


ALTER TABLE "public"."auditoria_pedidos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."auditoria_pedidos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."auditoria_precios" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "usuario_id" "uuid",
    "usuario_nombre" "text",
    "entidad_tipo" "text" NOT NULL,
    "entidad_id" bigint NOT NULL,
    "producto_id" bigint,
    "precio_anterior" numeric,
    "precio_nuevo" numeric NOT NULL,
    "justificacion" "text"
);


ALTER TABLE "public"."auditoria_precios" OWNER TO "postgres";


COMMENT ON TABLE "public"."auditoria_precios" IS 'Registra cada cambio de precio manual realizado por un gerente.';



ALTER TABLE "public"."auditoria_precios" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."auditoria_precios_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."comisiones" (
    "id" bigint NOT NULL,
    "pedido_id" bigint NOT NULL,
    "vendedor_id" bigint NOT NULL,
    "monto_comision" numeric NOT NULL,
    "porcentaje_aplicado" numeric NOT NULL,
    "estado" "text" DEFAULT 'pendiente'::"text" NOT NULL,
    "fecha_generacion" timestamp with time zone DEFAULT "now"(),
    "pago_comision_id" bigint
);


ALTER TABLE "public"."comisiones" OWNER TO "postgres";


ALTER TABLE "public"."comisiones" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."comisiones_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."compras" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "proveedor_id" "uuid" NOT NULL,
    "fecha_emision" "date",
    "fecha_recepcion_prevista" "date",
    "estado" "text",
    "total_compra" numeric,
    "productos" "jsonb",
    "deposito_id" bigint,
    "factura_proveedor_nro" "text",
    "organizacion_id" bigint NOT NULL
);


ALTER TABLE "public"."compras" OWNER TO "postgres";


ALTER TABLE "public"."compras" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."compras_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."condiciones_pago" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL,
    "dias" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."condiciones_pago" OWNER TO "postgres";


ALTER TABLE "public"."condiciones_pago" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."condiciones_pago_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."configuracion" (
    "id" bigint NOT NULL,
    "clave" "text" NOT NULL,
    "valor" "text"
);


ALTER TABLE "public"."configuracion" OWNER TO "postgres";


ALTER TABLE "public"."configuracion" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."configuracion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."confirmaciones_stock" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "vendedor_id" bigint NOT NULL,
    "asignacion_id" bigint NOT NULL,
    "token" "text" NOT NULL,
    "estado" "text" DEFAULT 'Pendiente'::"text",
    "fecha_confirmacion" timestamp with time zone
);


ALTER TABLE "public"."confirmaciones_stock" OWNER TO "postgres";


ALTER TABLE "public"."confirmaciones_stock" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."confirmaciones_stock_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."contactos" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL,
    "cuit" "text",
    "email" "text",
    "telefono" "text",
    "profesion" "text",
    "especialidades" "text"[],
    "ultima_compra" "date",
    "domicilio_fiscal" "jsonb",
    "direccion_entrega" "jsonb",
    "direccion_entrega_2" "jsonb",
    "vendedor_id" bigint,
    "estado_id" bigint,
    "zona" "text",
    "clasificacion" "text",
    "pais" "text",
    "deuda_actual" numeric DEFAULT 0,
    "condicion_pago_id" bigint,
    "productos_habituales" "text",
    "entrega_en_sucursal" boolean DEFAULT false,
    "fecha_ultimo_contacto" timestamp with time zone,
    "historial_whatsapp" "jsonb",
    "condicion_iva" "public"."condicion_iva_enum",
    "requiere_factura" boolean DEFAULT false,
    "porcentaje_facturacion_preferido" numeric,
    "limite_credito" numeric DEFAULT 1.00 NOT NULL,
    "intereses" "text"[],
    "codigo_confirmacion" "text",
    "confirmado_sorteo" boolean DEFAULT false,
    "participa_sorteo" boolean DEFAULT false,
    "razon_social" "text",
    "numero_iibb" "text",
    "iibb_jurisdiccion" "text",
    "regimen_percepcion_iibb" "text",
    "alicuota_percepcion_iibb" numeric,
    "fecha_ultima_consulta_padron" "date",
    "zona_id" bigint,
    "organizacion_id" bigint NOT NULL
);


ALTER TABLE "public"."contactos" OWNER TO "postgres";


COMMENT ON COLUMN "public"."contactos"."zona_id" IS 'FK a la tabla de zonas para el nuevo frontend. Sincronizado con la columna "zona" de texto mediante un trigger.';



ALTER TABLE "public"."contactos" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."contactos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."perfiles" (
    "id" "uuid" NOT NULL,
    "vendedor_id" bigint,
    "nombre" "text",
    "email" "text",
    "telefono" "text",
    "foto_url" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "organizacion_id" bigint NOT NULL
);


ALTER TABLE "public"."perfiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."vendedores" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "tipo" "text",
    "direccion" "jsonb",
    "porcentaje_comision" numeric DEFAULT 0,
    "meta_ventas" numeric DEFAULT 0
);


ALTER TABLE "public"."vendedores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."zonas" (
    "id" bigint NOT NULL,
    "nombre" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."zonas" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."contactos_vista_completa" AS
 SELECT "c"."id",
    "c"."created_at",
    "c"."nombre",
    "c"."cuit",
    "c"."email",
    "c"."telefono",
    "c"."profesion",
    "c"."especialidades",
    "c"."ultima_compra",
    "c"."domicilio_fiscal",
    "c"."direccion_entrega",
    "c"."direccion_entrega_2",
    "c"."vendedor_id",
    "c"."estado_id",
    "c"."zona",
    "c"."clasificacion",
    "c"."pais",
    "c"."deuda_actual",
    "c"."condicion_pago_id",
    "c"."productos_habituales",
    "c"."entrega_en_sucursal",
    "c"."fecha_ultimo_contacto",
    "c"."historial_whatsapp",
    "c"."condicion_iva",
    "c"."requiere_factura",
    "c"."porcentaje_facturacion_preferido",
    "c"."limite_credito",
    "c"."intereses",
    "c"."codigo_confirmacion",
    "c"."confirmado_sorteo",
    "c"."participa_sorteo",
    "c"."razon_social",
    "c"."numero_iibb",
    "c"."iibb_jurisdiccion",
    "c"."regimen_percepcion_iibb",
    "c"."alicuota_percepcion_iibb",
    "c"."fecha_ultima_consulta_padron",
    "c"."zona_id",
    "p"."nombre" AS "vendedor_nombre",
    "z"."nombre" AS "zona_nombre"
   FROM ((("public"."contactos" "c"
     LEFT JOIN "public"."vendedores" "v" ON (("c"."vendedor_id" = "v"."id")))
     LEFT JOIN "public"."perfiles" "p" ON (("p"."vendedor_id" = "v"."id")))
     LEFT JOIN "public"."zonas" "z" ON (("c"."zona_id" = "z"."id")));


ALTER VIEW "public"."contactos_vista_completa" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."cuentas_bancarias" (
    "id" bigint NOT NULL,
    "banco" "text" NOT NULL,
    "alias" "text",
    "cbu_cvu" "text" NOT NULL,
    "cuit" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "numero_cuenta" "text",
    "sucursal" "text",
    "organizacion_id" bigint NOT NULL
);


ALTER TABLE "public"."cuentas_bancarias" OWNER TO "postgres";


ALTER TABLE "public"."cuentas_bancarias" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."cuentas_bancarias_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."depositos" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL
);


ALTER TABLE "public"."depositos" OWNER TO "postgres";


ALTER TABLE "public"."depositos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."depositos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."estados" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text"
);


ALTER TABLE "public"."estados" OWNER TO "postgres";


ALTER TABLE "public"."estados" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."estados_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."estados_pedido" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL,
    "orden" smallint
);


ALTER TABLE "public"."estados_pedido" OWNER TO "postgres";


ALTER TABLE "public"."estados_pedido" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."estados_pedido_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."etapas_venta" (
    "id" bigint NOT NULL,
    "nombre" "text" NOT NULL,
    "orden" integer NOT NULL
);


ALTER TABLE "public"."etapas_venta" OWNER TO "postgres";


ALTER TABLE "public"."etapas_venta" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."etapas_venta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."facturas_venta" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "pedido_id" bigint,
    "contacto_id" bigint NOT NULL,
    "numero_factura" "text",
    "fecha_emision" "date" NOT NULL,
    "fecha_vencimiento" "date",
    "subtotal" numeric(12,2) DEFAULT 0,
    "monto_iva_21" numeric(12,2) DEFAULT 0,
    "monto_iva_10_5" numeric(12,2) DEFAULT 0,
    "monto_percepcion_iibb" numeric(12,2) DEFAULT 0,
    "monto_percepcion_iva" numeric(12,2) DEFAULT 0,
    "total_facturado" numeric(12,2) NOT NULL,
    "estado" "text" DEFAULT 'Pendiente de Pago'::"text" NOT NULL,
    "cae" "text",
    "cae_vencimiento" "date",
    "productos_facturados" "jsonb"
);


ALTER TABLE "public"."facturas_venta" OWNER TO "postgres";


COMMENT ON TABLE "public"."facturas_venta" IS 'Almacena las facturas de venta emitidas a los clientes.';



ALTER TABLE "public"."facturas_venta" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."facturas_venta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."interacciones" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "contacto_id" bigint NOT NULL,
    "tipo" "text" NOT NULL,
    "resumen" "text" NOT NULL,
    "user_id" "uuid",
    "fecha_proximo_seguimiento" "date"
);


ALTER TABLE "public"."interacciones" OWNER TO "postgres";


ALTER TABLE "public"."interacciones" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."interacciones_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."logistica_embalajes" (
    "id" integer NOT NULL,
    "nombre" "text" NOT NULL,
    "tipo" "text" NOT NULL,
    "dimensiones_cm" "jsonb" NOT NULL,
    "peso_gr" integer NOT NULL,
    "volumen_cm3" integer GENERATED ALWAYS AS ((((("dimensiones_cm" ->> 'largo'::"text"))::integer * (("dimensiones_cm" ->> 'ancho'::"text"))::integer) * (("dimensiones_cm" ->> 'alto'::"text"))::integer)) STORED,
    "created_at" timestamp with time zone DEFAULT "now"(),
    CONSTRAINT "logistica_embalajes_tipo_check" CHECK (("tipo" = ANY (ARRAY['Caja'::"text", 'Bolsa'::"text"])))
);


ALTER TABLE "public"."logistica_embalajes" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."logistica_embalajes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."logistica_embalajes_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."logistica_embalajes_id_seq" OWNED BY "public"."logistica_embalajes"."id";



CREATE TABLE IF NOT EXISTS "public"."logistica_envios" (
    "id" bigint NOT NULL,
    "pedido_id" bigint NOT NULL,
    "transportista_id" integer,
    "estado" "text" DEFAULT 'Por Preparar'::"text" NOT NULL,
    "tracking_number" "text",
    "costo_envio" numeric(10,2),
    "etiqueta_url" "text",
    "datos_api_respuesta" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "despachado_at" timestamp with time zone,
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "cliente_confirmado_recepcion" boolean DEFAULT false,
    "token_confirmacion_recepcion" "uuid"
);


ALTER TABLE "public"."logistica_envios" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."logistica_envios_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."logistica_envios_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."logistica_envios_id_seq" OWNED BY "public"."logistica_envios"."id";



CREATE TABLE IF NOT EXISTS "public"."logistica_transportistas" (
    "id" integer NOT NULL,
    "nombre" "text" NOT NULL,
    "tipo" "text" NOT NULL,
    "api_endpoint" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    CONSTRAINT "logistica_transportistas_tipo_check" CHECK (("tipo" = ANY (ARRAY['api_integrada'::"text", 'manual'::"text"])))
);


ALTER TABLE "public"."logistica_transportistas" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."logistica_transportistas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."logistica_transportistas_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."logistica_transportistas_id_seq" OWNED BY "public"."logistica_transportistas"."id";



CREATE TABLE IF NOT EXISTS "public"."lotes" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "producto_id" bigint NOT NULL,
    "numero_lote" "text" NOT NULL,
    "fecha_vencimiento" "date",
    "cantidad_inicial" integer NOT NULL,
    "stock_disponible" integer NOT NULL,
    "fecha_ingreso" timestamp with time zone DEFAULT "now"(),
    "compra_id" bigint,
    "stock_reservado" integer DEFAULT 0 NOT NULL,
    CONSTRAINT "lotes_stock_reservado_nn" CHECK (("stock_reservado" >= 0))
);


ALTER TABLE "public"."lotes" OWNER TO "postgres";


ALTER TABLE "public"."lotes" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."lotes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."movimientos_cuenta_corriente" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "cliente_id" bigint,
    "pedido_id" bigint,
    "pago_id" bigint,
    "fecha" "date",
    "concepto" "text",
    "debe" numeric(12,2) DEFAULT 0,
    "haber" numeric(12,2) DEFAULT 0
);


ALTER TABLE "public"."movimientos_cuenta_corriente" OWNER TO "postgres";


ALTER TABLE "public"."movimientos_cuenta_corriente" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."movimientos_cuenta_corriente_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."movimientos_cuenta_proveedor" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "proveedor_id" "uuid",
    "compra_id" bigint,
    "pago_id" bigint,
    "fecha" "date",
    "concepto" "text",
    "debe" numeric(12,2) DEFAULT 0,
    "haber" numeric(12,2) DEFAULT 0
);


ALTER TABLE "public"."movimientos_cuenta_proveedor" OWNER TO "postgres";


COMMENT ON TABLE "public"."movimientos_cuenta_proveedor" IS 'Registra el historial de deudas y pagos a proveedores.';



ALTER TABLE "public"."movimientos_cuenta_proveedor" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."movimientos_cuenta_proveedor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."oportunidades" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL,
    "valor" numeric,
    "contacto_id" bigint NOT NULL,
    "vendedor_id" bigint,
    "etapa_id" bigint,
    "fecha_cierre_prevista" "date",
    "numero_propuesta" bigint,
    "productos" "jsonb",
    "condicion_pago_id" bigint,
    "organizacion_id" bigint NOT NULL,
    "observaciones" "text"
);


ALTER TABLE "public"."oportunidades" OWNER TO "postgres";


ALTER TABLE "public"."oportunidades" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."oportunidades_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE SEQUENCE IF NOT EXISTS "public"."oportunidades_numero_propuesta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."oportunidades_numero_propuesta_seq" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."organizaciones" (
    "id" bigint NOT NULL,
    "nombre" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."organizaciones" OWNER TO "postgres";


ALTER TABLE "public"."organizaciones" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."organizaciones_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."pagos" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "contacto_id" bigint NOT NULL,
    "fecha_pago" "date" NOT NULL,
    "monto" numeric(12,2) NOT NULL,
    "metodo_pago" "text" NOT NULL,
    "referencia" "text",
    "cuenta_bancaria_id" bigint,
    "es_pago_cruzado" boolean DEFAULT false,
    "comprobante_url" "text",
    "user_id" "uuid" DEFAULT "auth"."uid"()
);


ALTER TABLE "public"."pagos" OWNER TO "postgres";


COMMENT ON TABLE "public"."pagos" IS 'Registra los pagos recibidos de los clientes.';



CREATE TABLE IF NOT EXISTS "public"."pagos_comisiones" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "fecha_pago" "date" NOT NULL,
    "vendedor_id" bigint NOT NULL,
    "monto_total" numeric NOT NULL,
    "concepto" "text",
    "comprobante_url" "text"
);


ALTER TABLE "public"."pagos_comisiones" OWNER TO "postgres";


ALTER TABLE "public"."pagos_comisiones" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."pagos_comisiones_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."pagos" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."pagos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE SEQUENCE IF NOT EXISTS "public"."pedido_numero_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."pedido_numero_seq" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."pedidos" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "numero_pedido" "text" NOT NULL,
    "oportunidad_id" bigint,
    "contacto_id" bigint NOT NULL,
    "vendedor_id" bigint,
    "deposito_principal_id" bigint NOT NULL,
    "estado_id" bigint NOT NULL,
    "productos" "jsonb",
    "valor" numeric,
    "direccion_entrega" "jsonb",
    "dia_hora_entrega" "text",
    "observaciones" "text",
    "pagos_efectuados" numeric,
    "cobrar_en_entrega" boolean DEFAULT false,
    "monto_a_cobrar" numeric DEFAULT 0,
    "condicion_pago_id" bigint,
    "estado_pago" "text" DEFAULT 'Pendiente'::"text",
    "origen_stock" "text",
    "fecha_entrega_prevista" "date",
    "reserva_creada" boolean DEFAULT false NOT NULL,
    "reserva_confirmada" boolean DEFAULT false NOT NULL,
    "modalidad_entrega" "text" DEFAULT 'DOMICILIO'::"text" NOT NULL,
    "organizacion_id" bigint NOT NULL,
    CONSTRAINT "pedidos_modalidad_entrega_check" CHECK (("modalidad_entrega" = ANY (ARRAY['DOMICILIO'::"text", 'SUCURSAL_CORREO'::"text", 'OFICINA_COMERCIAL'::"text"])))
);


ALTER TABLE "public"."pedidos" OWNER TO "postgres";


ALTER TABLE "public"."pedidos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."pedidos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."permisos" (
    "id" integer NOT NULL,
    "nombre_permiso" "text" NOT NULL,
    "descripcion" "text"
);


ALTER TABLE "public"."permisos" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."permisos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."permisos_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."permisos_id_seq" OWNED BY "public"."permisos"."id";



CREATE TABLE IF NOT EXISTS "public"."productos" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "nombre" "text" NOT NULL,
    "linea_marca" "text",
    "categoria" "text",
    "sku" "text",
    "origen" "text",
    "composicion" "text",
    "presentacion" "text",
    "especificaciones_adicionales" "jsonb",
    "precio_base" numeric,
    "precios_escalonados" "jsonb",
    "permite_combinacion" boolean DEFAULT false,
    "documentos" "jsonb",
    "deposito_default_id" bigint,
    "peso_gr" integer,
    "dimensiones_cm" "jsonb"
);


ALTER TABLE "public"."productos" OWNER TO "postgres";


COMMENT ON COLUMN "public"."productos"."deposito_default_id" IS 'Deposito por defecto';



COMMENT ON COLUMN "public"."productos"."peso_gr" IS 'Peso del producto en gramos';



COMMENT ON COLUMN "public"."productos"."dimensiones_cm" IS 'Dimensiones en cm. Formato: {"largo": 10, "ancho": 8, "alto": 5}';



CREATE TABLE IF NOT EXISTS "public"."stock_vendedores" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "vendedor_id" bigint NOT NULL,
    "lote_id" bigint NOT NULL,
    "cantidad_asignada" integer NOT NULL
);


ALTER TABLE "public"."stock_vendedores" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."productos_con_stock" WITH ("security_invoker"='true') AS
 SELECT "p"."id",
    "p"."created_at",
    "p"."nombre",
    "p"."linea_marca",
    "p"."categoria",
    "p"."sku",
    "p"."origen",
    "p"."composicion",
    "p"."presentacion",
    "p"."especificaciones_adicionales",
    "p"."precio_base",
    "p"."precios_escalonados",
    "p"."permite_combinacion",
    "p"."documentos",
    ((COALESCE("stock_deposito"."total_disponible", (0)::bigint) + COALESCE("stock_deposito"."total_reservado", (0)::bigint)) + COALESCE("stock_asignado"."total_asignado", (0)::bigint)) AS "stock_total",
    "stock_deposito"."proximo_vencimiento"
   FROM (("public"."productos" "p"
     LEFT JOIN ( SELECT "l"."producto_id",
            "sum"("l"."stock_disponible") AS "total_disponible",
            "sum"("l"."stock_reservado") AS "total_reservado",
            "min"(
                CASE
                    WHEN (("l"."stock_disponible" > 0) AND ("l"."fecha_vencimiento" >= CURRENT_DATE)) THEN "l"."fecha_vencimiento"
                    ELSE NULL::"date"
                END) AS "proximo_vencimiento"
           FROM "public"."lotes" "l"
          GROUP BY "l"."producto_id") "stock_deposito" ON (("p"."id" = "stock_deposito"."producto_id")))
     LEFT JOIN ( SELECT "l"."producto_id",
            "sum"("sv"."cantidad_asignada") AS "total_asignado"
           FROM ("public"."stock_vendedores" "sv"
             JOIN "public"."lotes" "l" ON (("sv"."lote_id" = "l"."id")))
          GROUP BY "l"."producto_id") "stock_asignado" ON (("p"."id" = "stock_asignado"."producto_id")));


ALTER VIEW "public"."productos_con_stock" OWNER TO "postgres";


ALTER TABLE "public"."productos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."productos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."proveedor_contactos" (
    "id" bigint NOT NULL,
    "proveedor_id" "uuid" NOT NULL,
    "tipo" "text" NOT NULL,
    "nombre" "text",
    "telefono" "text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."proveedor_contactos" OWNER TO "postgres";


ALTER TABLE "public"."proveedor_contactos" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."proveedor_contactos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."proveedor_cuentas_bancarias" (
    "id" bigint NOT NULL,
    "proveedor_id" "uuid" NOT NULL,
    "banco" "text",
    "alias" "text",
    "cbu" "text",
    "numero_cuenta" "text",
    "sucursal" "text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."proveedor_cuentas_bancarias" OWNER TO "postgres";


ALTER TABLE "public"."proveedor_cuentas_bancarias" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."proveedor_cuentas_bancarias_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."proveedores" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "nombre" "text" NOT NULL,
    "cuit" "text",
    "telefono" "text",
    "email" "text",
    "condicion_pago_id" bigint,
    "direccion" "jsonb",
    "deuda_actual" numeric(12,2) DEFAULT 0
);


ALTER TABLE "public"."proveedores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."reglas_alertas" (
    "id" bigint NOT NULL,
    "nombre_regla" "text" NOT NULL,
    "descripcion" "text",
    "entidad" "text" NOT NULL,
    "condicion_sql" "text" NOT NULL,
    "mensaje_alerta" "text" NOT NULL,
    "activa" boolean DEFAULT true NOT NULL,
    "mensaje_whatsapp" "text"
);


ALTER TABLE "public"."reglas_alertas" OWNER TO "postgres";


ALTER TABLE "public"."reglas_alertas" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."reglas_alertas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."reportes_usabilidad" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "area_crm" "text" NOT NULL,
    "descripcion" "text" NOT NULL,
    "estado" "text" DEFAULT 'Pendiente'::"text" NOT NULL,
    "reportado_por" "text",
    "prioridad" "text" DEFAULT 'Media'::"text",
    "prompt_generado" "text"
);


ALTER TABLE "public"."reportes_usabilidad" OWNER TO "postgres";


ALTER TABLE "public"."reportes_usabilidad" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."reportes_usabilidad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."reservas_pedido" (
    "id" bigint NOT NULL,
    "pedido_id" integer NOT NULL,
    "producto_id" integer NOT NULL,
    "lote_id" integer NOT NULL,
    "cantidad" numeric NOT NULL,
    "confirmado" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "reservas_pedido_cantidad_check" CHECK (("cantidad" > (0)::numeric))
);


ALTER TABLE "public"."reservas_pedido" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."reservas_pedido_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."reservas_pedido_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."reservas_pedido_id_seq" OWNED BY "public"."reservas_pedido"."id";



CREATE TABLE IF NOT EXISTS "public"."reservas_stock" (
    "id" bigint NOT NULL,
    "pedido_id" bigint NOT NULL,
    "lote_id" bigint NOT NULL,
    "cantidad_reservada" integer NOT NULL,
    "fecha_expiracion" timestamp with time zone NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."reservas_stock" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."reservas_stock_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."reservas_stock_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."reservas_stock_id_seq" OWNED BY "public"."reservas_stock"."id";



CREATE TABLE IF NOT EXISTS "public"."rol_permisos" (
    "rol_id" integer NOT NULL,
    "permiso_id" integer NOT NULL
);


ALTER TABLE "public"."rol_permisos" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."roles" (
    "id" integer NOT NULL,
    "nombre_rol" "text" NOT NULL
);


ALTER TABLE "public"."roles" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."roles_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "public"."roles"."id";



CREATE TABLE IF NOT EXISTS "public"."stock_ajustes" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "producto_id" bigint NOT NULL,
    "lote_id" bigint,
    "tipo_ajuste" "text" NOT NULL,
    "cantidad" integer NOT NULL,
    "justificacion" "text" NOT NULL,
    "operador" "text"
);


ALTER TABLE "public"."stock_ajustes" OWNER TO "postgres";


ALTER TABLE "public"."stock_ajustes" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."stock_ajustes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."stock_vendedores" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."stock_vendedores_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



CREATE TABLE IF NOT EXISTS "public"."tipos_de_cambio" (
    "fecha" "date" NOT NULL,
    "moneda" "text" DEFAULT 'USD'::"text" NOT NULL,
    "valor_venta" numeric(10,2) NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."tipos_de_cambio" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."tipos_documento_pago" (
    "id" integer NOT NULL,
    "nombre" "text" NOT NULL
);


ALTER TABLE "public"."tipos_documento_pago" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."tipos_documento_pago_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."tipos_documento_pago_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."tipos_documento_pago_id_seq" OWNED BY "public"."tipos_documento_pago"."id";



CREATE TABLE IF NOT EXISTS "public"."usuario_roles" (
    "usuario_id" "uuid" NOT NULL,
    "rol_id" integer NOT NULL
);


ALTER TABLE "public"."usuario_roles" OWNER TO "postgres";


ALTER TABLE "public"."vendedores" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vendedores_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."zonas_envio" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."zonas_envio_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."zonas" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."zonas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY "public"."logistica_embalajes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."logistica_embalajes_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."logistica_envios" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."logistica_envios_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."logistica_transportistas" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."logistica_transportistas_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."permisos" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."permisos_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."reservas_pedido" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."reservas_pedido_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."reservas_stock" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."reservas_stock_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."roles" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."roles_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."tipos_documento_pago" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."tipos_documento_pago_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."aplicacion_pagos"
    ADD CONSTRAINT "aplicacion_pagos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."auditoria_pedidos"
    ADD CONSTRAINT "auditoria_pedidos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."auditoria_precios"
    ADD CONSTRAINT "auditoria_precios_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."comisiones"
    ADD CONSTRAINT "comisiones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."compras"
    ADD CONSTRAINT "compras_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."condiciones_pago"
    ADD CONSTRAINT "condiciones_pago_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."configuracion"
    ADD CONSTRAINT "configuracion_clave_key" UNIQUE ("clave");



ALTER TABLE ONLY "public"."configuracion"
    ADD CONSTRAINT "configuracion_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."confirmaciones_stock"
    ADD CONSTRAINT "confirmaciones_stock_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."confirmaciones_stock"
    ADD CONSTRAINT "confirmaciones_stock_token_key" UNIQUE ("token");



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."cuentas_bancarias"
    ADD CONSTRAINT "cuentas_bancarias_cbu_cvu_key" UNIQUE ("cbu_cvu");



ALTER TABLE ONLY "public"."cuentas_bancarias"
    ADD CONSTRAINT "cuentas_bancarias_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."depositos"
    ADD CONSTRAINT "depositos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."estados_pedido"
    ADD CONSTRAINT "estados_pedido_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."estados"
    ADD CONSTRAINT "estados_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."etapas_venta"
    ADD CONSTRAINT "etapas_venta_nombre_unique" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."etapas_venta"
    ADD CONSTRAINT "etapas_venta_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."facturas_venta"
    ADD CONSTRAINT "facturas_venta_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."interacciones"
    ADD CONSTRAINT "interacciones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."logistica_embalajes"
    ADD CONSTRAINT "logistica_embalajes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."logistica_envios"
    ADD CONSTRAINT "logistica_envios_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."logistica_transportistas"
    ADD CONSTRAINT "logistica_transportistas_nombre_key" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."logistica_transportistas"
    ADD CONSTRAINT "logistica_transportistas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."lotes"
    ADD CONSTRAINT "lotes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."movimientos_cuenta_corriente"
    ADD CONSTRAINT "movimientos_cuenta_corriente_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."movimientos_cuenta_proveedor"
    ADD CONSTRAINT "movimientos_cuenta_proveedor_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."organizaciones"
    ADD CONSTRAINT "organizaciones_nombre_key" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."organizaciones"
    ADD CONSTRAINT "organizaciones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."pagos_comisiones"
    ADD CONSTRAINT "pagos_comisiones_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."pagos"
    ADD CONSTRAINT "pagos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_vendedor_id_key" UNIQUE ("vendedor_id");



ALTER TABLE ONLY "public"."permisos"
    ADD CONSTRAINT "permisos_nombre_permiso_key" UNIQUE ("nombre_permiso");



ALTER TABLE ONLY "public"."permisos"
    ADD CONSTRAINT "permisos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_sku_key" UNIQUE ("sku");



ALTER TABLE ONLY "public"."proveedor_contactos"
    ADD CONSTRAINT "proveedor_contactos_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."proveedor_cuentas_bancarias"
    ADD CONSTRAINT "proveedor_cuentas_bancarias_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reglas_alertas"
    ADD CONSTRAINT "reglas_alertas_nombre_regla_key" UNIQUE ("nombre_regla");



ALTER TABLE ONLY "public"."reglas_alertas"
    ADD CONSTRAINT "reglas_alertas_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reportes_usabilidad"
    ADD CONSTRAINT "reportes_usabilidad_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reservas_pedido"
    ADD CONSTRAINT "reservas_pedido_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reservas_stock"
    ADD CONSTRAINT "reservas_stock_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."rol_permisos"
    ADD CONSTRAINT "rol_permisos_pkey" PRIMARY KEY ("rol_id", "permiso_id");



ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_nombre_rol_key" UNIQUE ("nombre_rol");



ALTER TABLE ONLY "public"."roles"
    ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."stock_ajustes"
    ADD CONSTRAINT "stock_ajustes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."stock_vendedores"
    ADD CONSTRAINT "stock_vendedores_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."stock_vendedores"
    ADD CONSTRAINT "stock_vendedores_vendedor_id_lote_id_key" UNIQUE ("vendedor_id", "lote_id");



ALTER TABLE ONLY "public"."tipos_de_cambio"
    ADD CONSTRAINT "tipos_de_cambio_pkey" PRIMARY KEY ("fecha");



ALTER TABLE ONLY "public"."tipos_documento_pago"
    ADD CONSTRAINT "tipos_documento_pago_nombre_key" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."tipos_documento_pago"
    ADD CONSTRAINT "tipos_documento_pago_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "unique_pedido_por_oportunidad" UNIQUE ("oportunidad_id");



ALTER TABLE ONLY "public"."usuario_roles"
    ADD CONSTRAINT "usuario_roles_pkey" PRIMARY KEY ("usuario_id", "rol_id");



ALTER TABLE ONLY "public"."vendedores"
    ADD CONSTRAINT "vendedores_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."zonas_envio"
    ADD CONSTRAINT "zonas_envio_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_nombre_key" UNIQUE ("nombre");



ALTER TABLE ONLY "public"."zonas"
    ADD CONSTRAINT "zonas_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_aplicacion_pagos_pago_id" ON "public"."aplicacion_pagos" USING "btree" ("pago_id");



CREATE INDEX "idx_auditoria_pedidos_pedido_id" ON "public"."auditoria_pedidos" USING "btree" ("pedido_id");



CREATE INDEX "idx_auditoria_precios_producto_id" ON "public"."auditoria_precios" USING "btree" ("producto_id");



CREATE INDEX "idx_auditoria_precios_usuario_id" ON "public"."auditoria_precios" USING "btree" ("usuario_id");



CREATE INDEX "idx_comisiones_pedido_id" ON "public"."comisiones" USING "btree" ("pedido_id");



CREATE INDEX "idx_compras_deposito_id" ON "public"."compras" USING "btree" ("deposito_id");



CREATE INDEX "idx_compras_proveedor_id" ON "public"."compras" USING "btree" ("proveedor_id");



CREATE INDEX "idx_confirmaciones_stock_asignacion_id" ON "public"."confirmaciones_stock" USING "btree" ("asignacion_id");



CREATE INDEX "idx_confirmaciones_stock_vendedor_id" ON "public"."confirmaciones_stock" USING "btree" ("vendedor_id");



CREATE INDEX "idx_contactos_condicion_pago_id" ON "public"."contactos" USING "btree" ("condicion_pago_id");



CREATE INDEX "idx_contactos_estado_id" ON "public"."contactos" USING "btree" ("estado_id");



CREATE INDEX "idx_contactos_vendedor_id" ON "public"."contactos" USING "btree" ("vendedor_id");



CREATE INDEX "idx_facturas_venta_contacto_id" ON "public"."facturas_venta" USING "btree" ("contacto_id");



CREATE INDEX "idx_facturas_venta_pedido_id" ON "public"."facturas_venta" USING "btree" ("pedido_id");



CREATE INDEX "idx_interacciones_contacto_id" ON "public"."interacciones" USING "btree" ("contacto_id");



CREATE INDEX "idx_logistica_envios_pedido_id" ON "public"."logistica_envios" USING "btree" ("pedido_id");



CREATE INDEX "idx_logistica_envios_transportista_id" ON "public"."logistica_envios" USING "btree" ("transportista_id");



CREATE INDEX "idx_lotes_compra_id" ON "public"."lotes" USING "btree" ("compra_id");



CREATE INDEX "idx_lotes_producto_id" ON "public"."lotes" USING "btree" ("producto_id");



CREATE INDEX "idx_movimientos_cuenta_corriente_cliente_id" ON "public"."movimientos_cuenta_corriente" USING "btree" ("cliente_id");



CREATE INDEX "idx_movimientos_cuenta_corriente_pedido_id" ON "public"."movimientos_cuenta_corriente" USING "btree" ("pedido_id");



CREATE INDEX "idx_movimientos_cuenta_proveedor_compra_id" ON "public"."movimientos_cuenta_proveedor" USING "btree" ("compra_id");



CREATE INDEX "idx_movimientos_cuenta_proveedor_proveedor_id" ON "public"."movimientos_cuenta_proveedor" USING "btree" ("proveedor_id");



CREATE INDEX "idx_oportunidades_condicion_pago_id" ON "public"."oportunidades" USING "btree" ("condicion_pago_id");



CREATE INDEX "idx_oportunidades_contacto_id" ON "public"."oportunidades" USING "btree" ("contacto_id");



CREATE INDEX "idx_oportunidades_etapa_id" ON "public"."oportunidades" USING "btree" ("etapa_id");



CREATE INDEX "idx_oportunidades_vendedor_id" ON "public"."oportunidades" USING "btree" ("vendedor_id");



CREATE INDEX "idx_pagos_comisiones_vendedor_id" ON "public"."pagos_comisiones" USING "btree" ("vendedor_id");



CREATE INDEX "idx_pagos_contacto_id" ON "public"."pagos" USING "btree" ("contacto_id");



CREATE INDEX "idx_pagos_cuenta_bancaria_id" ON "public"."pagos" USING "btree" ("cuenta_bancaria_id");



CREATE INDEX "idx_pedidos_condicion_pago_id" ON "public"."pedidos" USING "btree" ("condicion_pago_id");



CREATE INDEX "idx_pedidos_contacto_id" ON "public"."pedidos" USING "btree" ("contacto_id");



CREATE INDEX "idx_pedidos_deposito_principal_id" ON "public"."pedidos" USING "btree" ("deposito_principal_id");



CREATE INDEX "idx_pedidos_estado_id" ON "public"."pedidos" USING "btree" ("estado_id");



CREATE INDEX "idx_pedidos_vendedor_id" ON "public"."pedidos" USING "btree" ("vendedor_id");



CREATE INDEX "idx_productos_deposito_default_id" ON "public"."productos" USING "btree" ("deposito_default_id");



CREATE INDEX "idx_proveedor_contactos_proveedor_id" ON "public"."proveedor_contactos" USING "btree" ("proveedor_id");



CREATE INDEX "idx_proveedor_cuentas_bancarias_proveedor_id" ON "public"."proveedor_cuentas_bancarias" USING "btree" ("proveedor_id");



CREATE INDEX "idx_proveedores_condicion_pago_id" ON "public"."proveedores" USING "btree" ("condicion_pago_id");



CREATE INDEX "idx_reservas_pedido_lote_id" ON "public"."reservas_pedido" USING "btree" ("lote_id");



CREATE INDEX "idx_reservas_pedido_producto_id" ON "public"."reservas_pedido" USING "btree" ("producto_id");



CREATE INDEX "idx_reservas_stock_lote_id" ON "public"."reservas_stock" USING "btree" ("lote_id");



CREATE INDEX "idx_reservas_stock_pedido_id" ON "public"."reservas_stock" USING "btree" ("pedido_id");



CREATE INDEX "idx_rol_permisos_permiso_id" ON "public"."rol_permisos" USING "btree" ("permiso_id");



CREATE INDEX "idx_stock_ajustes_lote_id" ON "public"."stock_ajustes" USING "btree" ("lote_id");



CREATE INDEX "idx_stock_ajustes_producto_id" ON "public"."stock_ajustes" USING "btree" ("producto_id");



CREATE INDEX "idx_stock_vendedores_lote_id" ON "public"."stock_vendedores" USING "btree" ("lote_id");



CREATE INDEX "idx_usuario_roles_rol_id" ON "public"."usuario_roles" USING "btree" ("rol_id");



CREATE INDEX "idx_zonas_envio_geometria" ON "public"."zonas_envio" USING "gist" ("geometria");



CREATE UNIQUE INDEX "reservas_pedido_pedido_lote_producto_uq" ON "public"."reservas_pedido" USING "btree" ("pedido_id", "lote_id", "producto_id");



CREATE OR REPLACE TRIGGER "on_compra_recibida" AFTER UPDATE ON "public"."compras" FOR EACH ROW EXECUTE FUNCTION "public"."registrar_deuda_proveedor"();



CREATE OR REPLACE TRIGGER "on_payment_applied_generate_commission" AFTER INSERT ON "public"."aplicacion_pagos" FOR EACH ROW EXECUTE FUNCTION "public"."generar_comision_si_pedido_esta_saldado"();



CREATE OR REPLACE TRIGGER "set_logistica_envios_updated_at" BEFORE UPDATE ON "public"."logistica_envios" FOR EACH ROW EXECUTE FUNCTION "public"."trigger_set_timestamp"();



CREATE OR REPLACE TRIGGER "trg_actualizar_pedido_al_entregar_envio" AFTER UPDATE OF "estado" ON "public"."logistica_envios" FOR EACH ROW EXECUTE FUNCTION "public"."actualizar_estado_pedido_desde_logistica"();



CREATE OR REPLACE TRIGGER "trg_auditar_precio_producto" AFTER UPDATE OF "precio_base" ON "public"."productos" FOR EACH ROW EXECUTE FUNCTION "public"."auditar_cambio_precio_producto"();



CREATE OR REPLACE TRIGGER "trg_set_numero_propuesta" BEFORE INSERT ON "public"."oportunidades" FOR EACH ROW EXECUTE FUNCTION "public"."set_numero_propuesta"();



COMMENT ON TRIGGER "trg_set_numero_propuesta" ON "public"."oportunidades" IS 'Asegura que cada nueva oportunidad tenga un numero_propuesta único generado por una secuencia.';



CREATE OR REPLACE TRIGGER "trg_set_token_on_envio_insert" BEFORE INSERT ON "public"."logistica_envios" FOR EACH ROW EXECUTE FUNCTION "public"."set_token_confirmacion_recepcion"();



CREATE OR REPLACE TRIGGER "trigger_actualizar_deuda_proveedor" AFTER INSERT OR DELETE OR UPDATE ON "public"."movimientos_cuenta_proveedor" FOR EACH ROW EXECUTE FUNCTION "public"."actualizar_deuda_total_proveedor"();



CREATE OR REPLACE TRIGGER "trigger_auditoria_pedidos" AFTER INSERT OR UPDATE ON "public"."pedidos" FOR EACH ROW EXECUTE FUNCTION "public"."funcion_auditoria_pedidos"();



CREATE OR REPLACE TRIGGER "trigger_sync_contact_zone" BEFORE INSERT OR UPDATE ON "public"."contactos" FOR EACH ROW EXECUTE FUNCTION "public"."sync_contact_zone"();



CREATE OR REPLACE TRIGGER "trigger_update_ultima_compra" AFTER INSERT ON "public"."pedidos" FOR EACH ROW EXECUTE FUNCTION "public"."actualizar_fecha_ultima_compra"();



ALTER TABLE ONLY "public"."aplicacion_pagos"
    ADD CONSTRAINT "aplicacion_pagos_pago_id_fkey" FOREIGN KEY ("pago_id") REFERENCES "public"."pagos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."auditoria_pedidos"
    ADD CONSTRAINT "auditoria_pedidos_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."auditoria_precios"
    ADD CONSTRAINT "auditoria_precios_producto_id_fkey" FOREIGN KEY ("producto_id") REFERENCES "public"."productos"("id");



ALTER TABLE ONLY "public"."auditoria_precios"
    ADD CONSTRAINT "auditoria_precios_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."comisiones"
    ADD CONSTRAINT "comisiones_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id");



ALTER TABLE ONLY "public"."compras"
    ADD CONSTRAINT "compras_deposito_id_fkey" FOREIGN KEY ("deposito_id") REFERENCES "public"."depositos"("id");



ALTER TABLE ONLY "public"."compras"
    ADD CONSTRAINT "compras_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."compras"
    ADD CONSTRAINT "compras_proveedor_id_fkey" FOREIGN KEY ("proveedor_id") REFERENCES "public"."proveedores"("id");



ALTER TABLE ONLY "public"."confirmaciones_stock"
    ADD CONSTRAINT "confirmaciones_stock_asignacion_id_fkey" FOREIGN KEY ("asignacion_id") REFERENCES "public"."stock_vendedores"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."confirmaciones_stock"
    ADD CONSTRAINT "confirmaciones_stock_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_condicion_pago_id_fkey" FOREIGN KEY ("condicion_pago_id") REFERENCES "public"."condiciones_pago"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_estado_id_fkey" FOREIGN KEY ("estado_id") REFERENCES "public"."estados"("id");



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."contactos"
    ADD CONSTRAINT "contactos_zona_id_fkey" FOREIGN KEY ("zona_id") REFERENCES "public"."zonas"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."cuentas_bancarias"
    ADD CONSTRAINT "cuentas_bancarias_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."facturas_venta"
    ADD CONSTRAINT "facturas_venta_contacto_id_fkey" FOREIGN KEY ("contacto_id") REFERENCES "public"."contactos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."facturas_venta"
    ADD CONSTRAINT "facturas_venta_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."interacciones"
    ADD CONSTRAINT "interacciones_contacto_id_fkey" FOREIGN KEY ("contacto_id") REFERENCES "public"."contactos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."logistica_envios"
    ADD CONSTRAINT "logistica_envios_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."logistica_envios"
    ADD CONSTRAINT "logistica_envios_transportista_id_fkey" FOREIGN KEY ("transportista_id") REFERENCES "public"."logistica_transportistas"("id");



ALTER TABLE ONLY "public"."lotes"
    ADD CONSTRAINT "lotes_compra_id_fkey" FOREIGN KEY ("compra_id") REFERENCES "public"."compras"("id");



ALTER TABLE ONLY "public"."lotes"
    ADD CONSTRAINT "lotes_producto_id_fkey" FOREIGN KEY ("producto_id") REFERENCES "public"."productos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."movimientos_cuenta_corriente"
    ADD CONSTRAINT "movimientos_cuenta_corriente_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "public"."contactos"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."movimientos_cuenta_corriente"
    ADD CONSTRAINT "movimientos_cuenta_corriente_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."movimientos_cuenta_proveedor"
    ADD CONSTRAINT "movimientos_cuenta_proveedor_compra_id_fkey" FOREIGN KEY ("compra_id") REFERENCES "public"."compras"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."movimientos_cuenta_proveedor"
    ADD CONSTRAINT "movimientos_cuenta_proveedor_proveedor_id_fkey" FOREIGN KEY ("proveedor_id") REFERENCES "public"."proveedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_condicion_pago_id_fkey" FOREIGN KEY ("condicion_pago_id") REFERENCES "public"."condiciones_pago"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_contacto_id_fkey" FOREIGN KEY ("contacto_id") REFERENCES "public"."contactos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_etapa_id_fkey" FOREIGN KEY ("etapa_id") REFERENCES "public"."etapas_venta"("id");



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."oportunidades"
    ADD CONSTRAINT "oportunidades_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."pagos_comisiones"
    ADD CONSTRAINT "pagos_comisiones_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id");



ALTER TABLE ONLY "public"."pagos"
    ADD CONSTRAINT "pagos_contacto_id_fkey" FOREIGN KEY ("contacto_id") REFERENCES "public"."contactos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."pagos"
    ADD CONSTRAINT "pagos_cuenta_bancaria_id_fkey" FOREIGN KEY ("cuenta_bancaria_id") REFERENCES "public"."cuentas_bancarias"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_condicion_pago_id_fkey" FOREIGN KEY ("condicion_pago_id") REFERENCES "public"."condiciones_pago"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_contacto_id_fkey" FOREIGN KEY ("contacto_id") REFERENCES "public"."contactos"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_deposito_principal_id_fkey" FOREIGN KEY ("deposito_principal_id") REFERENCES "public"."depositos"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_estado_id_fkey" FOREIGN KEY ("estado_id") REFERENCES "public"."estados_pedido"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_oportunidad_id_fkey" FOREIGN KEY ("oportunidad_id") REFERENCES "public"."oportunidades"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."pedidos"
    ADD CONSTRAINT "pedidos_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "perfiles_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."productos"
    ADD CONSTRAINT "productos_deposito_default_id_fkey" FOREIGN KEY ("deposito_default_id") REFERENCES "public"."depositos"("id");



ALTER TABLE ONLY "public"."proveedor_contactos"
    ADD CONSTRAINT "proveedor_contactos_proveedor_id_fkey" FOREIGN KEY ("proveedor_id") REFERENCES "public"."proveedores"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."proveedor_cuentas_bancarias"
    ADD CONSTRAINT "proveedor_cuentas_bancarias_proveedor_id_fkey" FOREIGN KEY ("proveedor_id") REFERENCES "public"."proveedores"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."proveedores"
    ADD CONSTRAINT "proveedores_condicion_pago_id_fkey" FOREIGN KEY ("condicion_pago_id") REFERENCES "public"."condiciones_pago"("id");



ALTER TABLE ONLY "public"."reservas_pedido"
    ADD CONSTRAINT "reservas_pedido_lote_id_fkey" FOREIGN KEY ("lote_id") REFERENCES "public"."lotes"("id");



ALTER TABLE ONLY "public"."reservas_pedido"
    ADD CONSTRAINT "reservas_pedido_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."reservas_pedido"
    ADD CONSTRAINT "reservas_pedido_producto_id_fkey" FOREIGN KEY ("producto_id") REFERENCES "public"."productos"("id");



ALTER TABLE ONLY "public"."reservas_stock"
    ADD CONSTRAINT "reservas_stock_lote_id_fkey" FOREIGN KEY ("lote_id") REFERENCES "public"."lotes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."reservas_stock"
    ADD CONSTRAINT "reservas_stock_pedido_id_fkey" FOREIGN KEY ("pedido_id") REFERENCES "public"."pedidos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."rol_permisos"
    ADD CONSTRAINT "rol_permisos_permiso_id_fkey" FOREIGN KEY ("permiso_id") REFERENCES "public"."permisos"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."rol_permisos"
    ADD CONSTRAINT "rol_permisos_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "public"."roles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."stock_ajustes"
    ADD CONSTRAINT "stock_ajustes_lote_id_fkey" FOREIGN KEY ("lote_id") REFERENCES "public"."lotes"("id");



ALTER TABLE ONLY "public"."stock_ajustes"
    ADD CONSTRAINT "stock_ajustes_producto_id_fkey" FOREIGN KEY ("producto_id") REFERENCES "public"."productos"("id");



ALTER TABLE ONLY "public"."stock_vendedores"
    ADD CONSTRAINT "stock_vendedores_lote_id_fkey" FOREIGN KEY ("lote_id") REFERENCES "public"."lotes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."stock_vendedores"
    ADD CONSTRAINT "stock_vendedores_vendedor_id_fkey" FOREIGN KEY ("vendedor_id") REFERENCES "public"."vendedores"("id");



ALTER TABLE ONLY "public"."usuario_roles"
    ADD CONSTRAINT "usuario_roles_rol_id_fkey" FOREIGN KEY ("rol_id") REFERENCES "public"."roles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."usuario_roles"
    ADD CONSTRAINT "usuario_roles_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "public"."perfiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."perfiles"
    ADD CONSTRAINT "usuarios_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."zonas_envio"
    ADD CONSTRAINT "zonas_envio_organizacion_id_fkey" FOREIGN KEY ("organizacion_id") REFERENCES "public"."organizaciones"("id");



CREATE POLICY "Acceso a zonas de envio" ON "public"."zonas_envio" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso basado en propiedad" ON "public"."interacciones" USING (("public"."check_user_permission"('contactos:ver:todos'::"text") OR ("contacto_id" IN ( SELECT "contactos"."id"
   FROM "public"."contactos"
  WHERE ("contactos"."vendedor_id" = "public"."get_my_vendedor_id"())))));



CREATE POLICY "Acceso basado en propiedad" ON "public"."logistica_envios" USING (("public"."check_user_permission"('pedidos:ver:todos'::"text") OR ("pedido_id" IN ( SELECT "pedidos"."id"
   FROM "public"."pedidos"
  WHERE ("pedidos"."vendedor_id" = "public"."get_my_vendedor_id"())))));



CREATE POLICY "Acceso de lectura a organizaciones" ON "public"."organizaciones" FOR SELECT USING (true);



CREATE POLICY "Acceso de lectura de cond. de pago para usuarios autenticados" ON "public"."condiciones_pago" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura de depósitos para usuarios autenticados" ON "public"."depositos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura de etapas para usuarios autenticados" ON "public"."etapas_venta" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura de productos para usuarios autenticados" ON "public"."productos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura de proveedores para usuarios autenticados" ON "public"."proveedores" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura para usuarios autenticados" ON "public"."estados_pedido" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura para usuarios autenticados" ON "public"."logistica_embalajes" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso de lectura para usuarios autenticados" ON "public"."logistica_transportistas" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Acceso para usuarios autenticados" ON "public"."facturas_venta" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso solo para Superadministradores" ON "public"."configuracion" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."auditoria_pedidos" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."auditoria_precios" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."confirmaciones_stock" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."pagos_comisiones" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."reservas_pedido" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."reservas_stock" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Acceso total para usuarios autenticados" ON "public"."tipos_documento_pago" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Admins pueden gestionar reglas" ON "public"."reglas_alertas" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text")) WITH CHECK ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Cuentas prove" ON "public"."proveedor_cuentas_bancarias" TO "authenticated", "anon" USING (true) WITH CHECK (true);



CREATE POLICY "Enable insert access for anon users on condiciones_pago" ON "public"."condiciones_pago" FOR INSERT TO "anon" WITH CHECK (true);



CREATE POLICY "Los usuarios de la app pueden gestionar stock de vendedores" ON "public"."stock_vendedores" USING ("public"."is_app_user"());



CREATE POLICY "Los usuarios pueden crear sus propios pagos" ON "public"."pagos" FOR INSERT TO "authenticated" WITH CHECK ((( SELECT "auth"."uid"() AS "uid") = "user_id"));



CREATE POLICY "Permitir a usuarios autenticados LEER las aplicaciones de pago" ON "public"."aplicacion_pagos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir a usuarios autenticados LEER los registros de pago" ON "public"."pagos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir a usuarios de la app LEER todos los ajustes de stock" ON "public"."stock_ajustes" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir a usuarios del app registrar ajustes" ON "public"."stock_ajustes" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Permitir actualizacion de roles a Superadministradores" ON "public"."roles" FOR UPDATE TO "authenticated" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Permitir actualización de contactos" ON "public"."contactos" FOR UPDATE TO "authenticated" USING (("public"."check_user_permission"('contactos:ver:todos'::"text") OR ("vendedor_id" = "public"."get_my_vendedor_id"()))) WITH CHECK ("public"."check_user_permission"('contactos:editar'::"text"));



CREATE POLICY "Permitir eliminacion de roles a Superadministradores" ON "public"."roles" FOR DELETE TO "authenticated" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Permitir eliminación de contactos" ON "public"."contactos" FOR DELETE TO "authenticated" USING ("public"."check_user_permission"('contactos:eliminar'::"text"));



CREATE POLICY "Permitir gestion de permisos a Superadministradores" ON "public"."permisos" TO "authenticated" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text")) WITH CHECK ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Permitir gestion de permisos de rol a Superadministradores" ON "public"."rol_permisos" TO "authenticated" USING ("public"."check_user_permission"('configuracion:editar:roles'::"text")) WITH CHECK ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Permitir insercion de roles a Superadministradores" ON "public"."roles" FOR INSERT TO "authenticated" WITH CHECK ("public"."check_user_permission"('configuracion:editar:roles'::"text"));



CREATE POLICY "Permitir inserciones al rol postgres para la creación de perfi" ON "public"."perfiles" FOR INSERT TO "postgres" WITH CHECK (true);



CREATE POLICY "Permitir inserción de contactos" ON "public"."contactos" FOR INSERT TO "authenticated" WITH CHECK ("public"."check_user_permission"('contactos:crear'::"text"));



CREATE POLICY "Permitir inserción de movimientos al crear/anular pedidos" ON "public"."movimientos_cuenta_corriente" FOR INSERT TO "authenticated" WITH CHECK (("public"."check_user_permission"('pedidos:crear'::"text") OR "public"."check_user_permission"('pedidos:anular:propios'::"text") OR "public"."check_user_permission"('pedidos:anular'::"text")));



CREATE POLICY "Permitir inserción desde formulario público" ON "public"."contactos" FOR INSERT TO "anon" WITH CHECK (("estado_id" = ( SELECT "estados"."id"
   FROM "public"."estados"
  WHERE ("estados"."nombre" = 'Pendiente de Aprobación'::"text")
 LIMIT 1)));



CREATE POLICY "Permitir la actualización de perfiles a admins o al propio usu" ON "public"."perfiles" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (((( SELECT "auth"."uid"() AS "uid") = "id") OR ( SELECT "public"."check_user_permission"('configuracion:editar:roles'::"text") AS "check_user_permission")));



CREATE POLICY "Permitir lectura de contactos" ON "public"."contactos" FOR SELECT TO "authenticated" USING (("public"."check_user_permission"('contactos:ver:todos'::"text") OR ("vendedor_id" = "public"."get_my_vendedor_id"())));



CREATE POLICY "Permitir lectura de perfiles a admins o al propio usuario" ON "public"."perfiles" FOR SELECT TO "authenticated" USING (((( SELECT "auth"."uid"() AS "uid") = "id") OR ( SELECT "public"."check_user_permission"('configuracion:editar:roles'::"text") AS "check_user_permission")));



CREATE POLICY "Permitir lectura de permisos a usuarios autenticados" ON "public"."permisos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir lectura de permisos de rol a usuarios autenticados" ON "public"."rol_permisos" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Permitir lectura de roles a usuarios autenticados" ON "public"."roles" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Politica Unificada de Compras" ON "public"."compras" USING ("public"."is_app_user"()) WITH CHECK ("public"."is_app_user"());



CREATE POLICY "Politica Unificada de Cta Cte Proveedores" ON "public"."movimientos_cuenta_proveedor" USING ("public"."is_app_user"()) WITH CHECK ("public"."is_app_user"());



CREATE POLICY "Politica Unificada de Cuentas Bancarias" ON "public"."cuentas_bancarias" USING (true) WITH CHECK (true);



CREATE POLICY "Politica Unificada de Estados" ON "public"."estados" FOR SELECT USING (true);



CREATE POLICY "Politica Unificada de Gestion de Roles" ON "public"."usuario_roles" USING (((( SELECT "auth"."uid"() AS "uid") = "usuario_id") OR ( SELECT ('Superadministrador'::"text" = ANY ("public"."get_user_roles"()))) OR ( SELECT ('Administracion'::"text" = ANY ("public"."get_user_roles"()))))) WITH CHECK ((( SELECT ('Superadministrador'::"text" = ANY ("public"."get_user_roles"()))) OR ( SELECT ('Administracion'::"text" = ANY ("public"."get_user_roles"())))));



CREATE POLICY "Politica Unificada de Lotes" ON "public"."lotes" USING (true) WITH CHECK (true);



CREATE POLICY "Politica Unificada de Oportunidades" ON "public"."oportunidades" TO "authenticated" USING (("public"."check_user_permission"('oportunidades:ver:todos'::"text") OR ("vendedor_id" = ( SELECT "public"."get_my_vendedor_id"() AS "get_my_vendedor_id")))) WITH CHECK ("public"."check_user_permission"('oportunidades:crear'::"text"));



CREATE POLICY "Politica Unificada de Pedidos" ON "public"."pedidos" TO "authenticated" USING (("public"."check_user_permission"('pedidos:ver:todos'::"text") OR ("vendedor_id" = ( SELECT "public"."get_my_vendedor_id"() AS "get_my_vendedor_id")))) WITH CHECK ("public"."check_user_permission"('pedidos:crear'::"text"));



CREATE POLICY "Politica Unificada de Vendedores" ON "public"."vendedores" TO "authenticated" USING ("public"."is_app_user"()) WITH CHECK ("public"."is_app_user"());



CREATE POLICY "Política de Acceso a Comisiones" ON "public"."comisiones" FOR SELECT USING (("public"."check_user_permission"('comisiones:ver:todas'::"text") OR ("vendedor_id" = "public"."get_my_vendedor_id"())));



CREATE POLICY "Política de gestión de reportes" ON "public"."reportes_usabilidad" USING (true) WITH CHECK ((((( SELECT "auth"."uid"() AS "uid"))::"text" = "reportado_por") OR ( SELECT "public"."check_user_permission"('configuracion:editar:roles'::"text") AS "check_user_permission")));



CREATE POLICY "Prov contactos" ON "public"."proveedor_contactos" TO "authenticated", "anon" USING (true) WITH CHECK (true);



CREATE POLICY "Public read access" ON "public"."tipos_de_cambio" FOR SELECT USING (true);



ALTER TABLE "public"."aplicacion_pagos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."auditoria_pedidos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."auditoria_precios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."comisiones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."compras" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."condiciones_pago" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."configuracion" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."confirmaciones_stock" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."contactos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."cuentas_bancarias" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."depositos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."estados" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."estados_pedido" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."etapas_venta" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."facturas_venta" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."interacciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."logistica_embalajes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."logistica_envios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."logistica_transportistas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."lotes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."movimientos_cuenta_corriente" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."movimientos_cuenta_proveedor" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."oportunidades" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."organizaciones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."pagos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."pagos_comisiones" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."pedidos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."perfiles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."permisos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."productos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."proveedor_contactos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."proveedor_cuentas_bancarias" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."proveedores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reglas_alertas" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reportes_usabilidad" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reservas_pedido" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reservas_stock" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."rol_permisos" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."roles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."stock_ajustes" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."stock_vendedores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tipos_de_cambio" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."tipos_documento_pago" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."usuario_roles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."vendedores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."zonas_envio" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";









GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";
GRANT USAGE ON SCHEMA "public" TO "supabase_auth_admin";




































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































GRANT ALL ON FUNCTION "public"."actualizar_deuda_total_proveedor"() TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_deuda_total_proveedor"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_deuda_total_proveedor"() TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_estado_envio"("p_envio_id" bigint, "p_nuevo_estado" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_estado_envio"("p_envio_id" bigint, "p_nuevo_estado" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_estado_envio"("p_envio_id" bigint, "p_nuevo_estado" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_estado_logistica_v2"("p_pedido_id" bigint, "p_nuevo_estado_nombre" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_estado_logistica_v2"("p_pedido_id" bigint, "p_nuevo_estado_nombre" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_estado_logistica_v2"("p_pedido_id" bigint, "p_nuevo_estado_nombre" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_estado_pedido_desde_logistica"() TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_estado_pedido_desde_logistica"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_estado_pedido_desde_logistica"() TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_fecha_ultima_compra"() TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_fecha_ultima_compra"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_fecha_ultima_compra"() TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_precio_producto_pedido"("p_pedido_id" bigint, "p_producto_id" bigint, "p_nuevo_precio" numeric, "p_usuario_id" "uuid", "p_usuario_nombre" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_precio_producto_pedido"("p_pedido_id" bigint, "p_producto_id" bigint, "p_nuevo_precio" numeric, "p_usuario_id" "uuid", "p_usuario_nombre" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_precio_producto_pedido"("p_pedido_id" bigint, "p_producto_id" bigint, "p_nuevo_precio" numeric, "p_usuario_id" "uuid", "p_usuario_nombre" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."actualizar_saldo_cuenta_corriente"() TO "anon";
GRANT ALL ON FUNCTION "public"."actualizar_saldo_cuenta_corriente"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."actualizar_saldo_cuenta_corriente"() TO "service_role";



GRANT ALL ON FUNCTION "public"."ajustar_stock_lote"("p_lote_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."ajustar_stock_lote"("p_lote_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ajustar_stock_lote"("p_lote_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."ajustar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."ajustar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."ajustar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad_ajuste" integer, "p_justificacion" "text", "p_operador" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente"("p_movimiento_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente"("p_movimiento_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente"("p_movimiento_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente_desde_pago"("p_pago_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente_desde_pago"("p_pago_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_movimiento_cliente_desde_pago"("p_pago_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor"("p_movimiento_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor"("p_movimiento_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor"("p_movimiento_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor_desde_pago"("p_pago_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor_desde_pago"("p_pago_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_movimiento_proveedor_desde_pago"("p_pago_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_pedido_v2"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."anular_pedido_v2"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_pedido_v2"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_pedidos_borrador_antiguos"() TO "anon";
GRANT ALL ON FUNCTION "public"."anular_pedidos_borrador_antiguos"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_pedidos_borrador_antiguos"() TO "service_role";



GRANT ALL ON FUNCTION "public"."anular_pedidos_reserva_expirada"() TO "anon";
GRANT ALL ON FUNCTION "public"."anular_pedidos_reserva_expirada"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."anular_pedidos_reserva_expirada"() TO "service_role";



GRANT ALL ON FUNCTION "public"."asignar_stock_masivo"("p_vendedor_id" integer, "p_asignaciones" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."asignar_stock_masivo"("p_vendedor_id" integer, "p_asignaciones" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."asignar_stock_masivo"("p_vendedor_id" integer, "p_asignaciones" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."asignar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."asignar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."asignar_stock_vendedor"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."auditar_cambio_precio_producto"() TO "anon";
GRANT ALL ON FUNCTION "public"."auditar_cambio_precio_producto"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."auditar_cambio_precio_producto"() TO "service_role";



GRANT ALL ON FUNCTION "public"."auditar_stock_completo"() TO "anon";
GRANT ALL ON FUNCTION "public"."auditar_stock_completo"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."auditar_stock_completo"() TO "service_role";



GRANT ALL ON FUNCTION "public"."calcular_costo_envio"("p_zona_destino" "text", "p_valor_productos" numeric) TO "anon";
GRANT ALL ON FUNCTION "public"."calcular_costo_envio"("p_zona_destino" "text", "p_valor_productos" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."calcular_costo_envio"("p_zona_destino" "text", "p_valor_productos" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."check_contact_relations"("p_contact_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."check_contact_relations"("p_contact_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_contact_relations"("p_contact_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."check_stage_relations"("p_etapa_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."check_stage_relations"("p_etapa_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_stage_relations"("p_etapa_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."check_user_permission"("p_permiso_nombre" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."check_user_permission"("p_permiso_nombre" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_user_permission"("p_permiso_nombre" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."confirmar_reserva_pedido"("p_pedido_id" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."confirmar_reserva_pedido"("p_pedido_id" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."confirmar_reserva_pedido"("p_pedido_id" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."crear_deuda_proveedor_por_compra_v2"() TO "anon";
GRANT ALL ON FUNCTION "public"."crear_deuda_proveedor_por_compra_v2"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."crear_deuda_proveedor_por_compra_v2"() TO "service_role";



GRANT ALL ON FUNCTION "public"."crear_registro_envio"("p_pedido_id" bigint, "p_transportista_id" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."crear_registro_envio"("p_pedido_id" bigint, "p_transportista_id" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."crear_registro_envio"("p_pedido_id" bigint, "p_transportista_id" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."devolver_stock_vendedor_a_deposito"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer, "p_justificacion" "text", "p_operador" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."devolver_stock_vendedor_a_deposito"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer, "p_justificacion" "text", "p_operador" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."devolver_stock_vendedor_a_deposito"("p_lote_id" bigint, "p_vendedor_id" bigint, "p_cantidad" integer, "p_justificacion" "text", "p_operador" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."finalizar_resolucion_aprobacion"("p_solicitud_id" bigint, "p_es_aprobado" boolean, "p_gerente_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."finalizar_resolucion_aprobacion"("p_solicitud_id" bigint, "p_es_aprobado" boolean, "p_gerente_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."finalizar_resolucion_aprobacion"("p_solicitud_id" bigint, "p_es_aprobado" boolean, "p_gerente_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."finish_user_setup"("p_user_id" "uuid", "p_nombre" "text", "p_roles_nombres" "text"[], "p_es_vendedor" boolean, "p_comision" numeric, "p_meta" numeric) TO "anon";
GRANT ALL ON FUNCTION "public"."finish_user_setup"("p_user_id" "uuid", "p_nombre" "text", "p_roles_nombres" "text"[], "p_es_vendedor" boolean, "p_comision" numeric, "p_meta" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."finish_user_setup"("p_user_id" "uuid", "p_nombre" "text", "p_roles_nombres" "text"[], "p_es_vendedor" boolean, "p_comision" numeric, "p_meta" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."funcion_auditoria_pedidos"() TO "anon";
GRANT ALL ON FUNCTION "public"."funcion_auditoria_pedidos"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."funcion_auditoria_pedidos"() TO "service_role";



GRANT ALL ON FUNCTION "public"."generar_codigo_aleatorio"() TO "anon";
GRANT ALL ON FUNCTION "public"."generar_codigo_aleatorio"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."generar_codigo_aleatorio"() TO "service_role";



GRANT ALL ON FUNCTION "public"."generar_comision_si_pedido_esta_saldado"() TO "anon";
GRANT ALL ON FUNCTION "public"."generar_comision_si_pedido_esta_saldado"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."generar_comision_si_pedido_esta_saldado"() TO "service_role";



GRANT ALL ON FUNCTION "public"."generar_nuevo_numero_pedido"("id_deposito_param" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."generar_nuevo_numero_pedido"("id_deposito_param" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."generar_nuevo_numero_pedido"("id_deposito_param" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_evolucion"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_evolucion"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_evolucion"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_lineas"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_productos"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_vendedores"("p_fecha_inicio" "text", "p_fecha_fin" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_vendedores"("p_fecha_inicio" "text", "p_fecha_fin" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_vendedores"("p_fecha_inicio" "text", "p_fecha_fin" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_analisis_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_analisis_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_analisis_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_comisiones_pendientes_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_comisiones_pendientes_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_comisiones_pendientes_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_comisiones_vendedor_detalle"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_comisiones_vendedor_detalle"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_comisiones_vendedor_detalle"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_comprobante_for_pedido"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_comprobante_for_pedido"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_comprobante_for_pedido"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_comprobantes_for_pedido"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_comprobantes_for_pedido"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_comprobantes_for_pedido"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_contact_timeline"("p_contact_id" bigint, "p_event_type" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_contact_timeline"("p_contact_id" bigint, "p_event_type" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_contact_timeline"("p_contact_id" bigint, "p_event_type" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_contactos_con_deuda_calculada"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_contactos_con_deuda_calculada"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_contactos_con_deuda_calculada"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_contactos_dashboard"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_contactos_dashboard"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_contactos_dashboard"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_contactos_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_contactos_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_contactos_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_costo_envio_por_coordenadas"("p_lat" double precision, "p_lon" double precision) TO "anon";
GRANT ALL ON FUNCTION "public"."get_costo_envio_por_coordenadas"("p_lat" double precision, "p_lon" double precision) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_costo_envio_por_coordenadas"("p_lat" double precision, "p_lon" double precision) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_costo_reposicion"("p_producto_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_costo_reposicion"("p_producto_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_costo_reposicion"("p_producto_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_costo_ultima_compra"("p_producto_id" bigint, "p_fecha_venta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_costo_ultima_compra"("p_producto_id" bigint, "p_fecha_venta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_costo_ultima_compra"("p_producto_id" bigint, "p_fecha_venta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_current_user_vendedor_name"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_current_user_vendedor_name"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_current_user_vendedor_name"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_dashboard_contacts"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_dashboard_contacts"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_dashboard_contacts"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_dashboard_gerencial"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_metodo_costo" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_dashboard_gerencial"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_metodo_costo" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_dashboard_gerencial"("p_fecha_desde" "date", "p_fecha_hasta" "date", "p_metodo_costo" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor_v2"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor_v2"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_datos_dashboard_vendedor_v2"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_detalle_comisiones_pendientes"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_detalle_comisiones_pendientes"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_detalle_comisiones_pendientes"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_detalle_productos_agregado_cliente"("_p_contacto_id" bigint, "_p_fecha_desde" "date", "_p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_detalle_productos_agregado_cliente"("_p_contacto_id" bigint, "_p_fecha_desde" "date", "_p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_detalle_productos_agregado_cliente"("_p_contacto_id" bigint, "_p_fecha_desde" "date", "_p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_detalle_productos_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_detalle_productos_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_detalle_productos_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_cliente"("p_contacto_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_cliente"("p_contacto_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_cliente"("p_contacto_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_proveedor"("p_proveedor_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_proveedor"("p_proveedor_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_documentos_pendientes_proveedor"("p_proveedor_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_historial_aprobaciones"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_historial_aprobaciones"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_historial_aprobaciones"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_historial_pagos_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_historial_pagos_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_historial_pagos_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_initial_crm_data"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_initial_crm_data"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_initial_crm_data"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_inventario_completo"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_inventario_completo"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_inventario_completo"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_kpis_cliente"("p_contacto_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_kpis_cliente"("p_contacto_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_kpis_cliente"("p_contacto_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_ajustes"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_ajustes"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_ajustes"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_cliente"("p_contacto_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_cliente"("p_contacto_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_cliente"("p_contacto_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_compras"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_compras"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_compras"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_por_lote"("p_lote_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_por_lote"("p_lote_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_por_lote"("p_lote_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_proveedor"("p_proveedor_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_proveedor"("p_proveedor_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_proveedor"("p_proveedor_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_movimientos_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_movimientos_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_movimientos_ventas"("p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_my_vendedor_id"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_my_vendedor_id"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_my_vendedor_id"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_oportunidades_sin_pedido"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_oportunidades_sin_pedido"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_oportunidades_sin_pedido"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_pedido_saldo"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_pedido_saldo"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_pedido_saldo"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_pedidos_con_reserva"("p_producto_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_pedidos_con_reserva"("p_producto_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_pedidos_con_reserva"("p_producto_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_pedidos_para_logistica_v2"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_pedidos_para_logistica_v2"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_pedidos_para_logistica_v2"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_proveedor_cuentas"("p_proveedor_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_proveedor_cuentas"("p_proveedor_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_proveedor_cuentas"("p_proveedor_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_proveedores_con_deuda"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_proveedores_con_deuda"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_proveedores_con_deuda"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_proveedores_con_deudas_agrupadas"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_proveedores_con_deudas_agrupadas"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_proveedores_con_deudas_agrupadas"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_proximas_acciones_dinamicas"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_proximas_acciones_dinamicas"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_proximas_acciones_dinamicas"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_resumen_liquidaciones"("p_mes" integer, "p_anio" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_resumen_liquidaciones"("p_mes" integer, "p_anio" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_resumen_liquidaciones"("p_mes" integer, "p_anio" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_resumen_mensual_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."get_resumen_mensual_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_resumen_mensual_cliente"("p_contacto_id" bigint, "p_fecha_desde" "date", "p_fecha_hasta" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_roles_con_permisos"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_roles_con_permisos"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_roles_con_permisos"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_saldos_clientes_con_detalle_deuda"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_saldos_clientes_con_detalle_deuda"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_saldos_clientes_con_detalle_deuda"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_clientes"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_clientes"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_clientes"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_proveedores"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_proveedores"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_los_proveedores"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_saldos_todos_proveedores"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_proveedores"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_saldos_todos_proveedores"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_solicitud_para_aprobar"("p_token" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_solicitud_para_aprobar"("p_token" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_solicitud_para_aprobar"("p_token" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_solicitudes_pendientes"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_solicitudes_pendientes"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_solicitudes_pendientes"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_solicitudes_por_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_solicitudes_por_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_solicitudes_por_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_stock_general_completo_v2"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_stock_general_completo_v2"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_stock_general_completo_v2"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_stock_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_stock_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_stock_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_todos_los_usuarios_con_roles"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_todos_los_usuarios_con_roles"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_todos_los_usuarios_con_roles"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_top_clientes_por_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_top_clientes_por_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_top_clientes_por_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_top_productos_por_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_top_productos_por_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_top_productos_por_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_user_roles"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_roles"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_roles"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_valor_stock_vendedor"("p_vendedor_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."get_valor_stock_vendedor"("p_vendedor_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_valor_stock_vendedor"("p_vendedor_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_vista_estacional_cliente"("_p_contacto_id" bigint, "_p_anio" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_vista_estacional_cliente"("_p_contacto_id" bigint, "_p_anio" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_vista_estacional_cliente"("_p_contacto_id" bigint, "_p_anio" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_zona_y_costo_por_coordenadas"("p_lat" double precision, "p_lng" double precision) TO "anon";
GRANT ALL ON FUNCTION "public"."get_zona_y_costo_por_coordenadas"("p_lat" double precision, "p_lng" double precision) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_zona_y_costo_por_coordenadas"("p_lat" double precision, "p_lng" double precision) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_zonas_envio_con_geojson"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_zonas_envio_con_geojson"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_zonas_envio_con_geojson"() TO "service_role";



GRANT ALL ON FUNCTION "public"."handle_event_registration"("contact_data" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."handle_event_registration"("contact_data" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_event_registration"("contact_data" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."handle_public_contact_insert"("contact_data" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."handle_public_contact_insert"("contact_data" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_public_contact_insert"("contact_data" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."is_app_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."is_app_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_app_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."liberar_reserva_pedido"("p_pedido_id" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."liberar_reserva_pedido"("p_pedido_id" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."liberar_reserva_pedido"("p_pedido_id" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."pagar_comisiones_vendedor"("p_vendedor_id" bigint, "p_comision_ids" bigint[], "p_fecha_pago" "date", "p_concepto" "text", "p_comprobante_url" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."pagar_comisiones_vendedor"("p_vendedor_id" bigint, "p_comision_ids" bigint[], "p_fecha_pago" "date", "p_concepto" "text", "p_comprobante_url" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."pagar_comisiones_vendedor"("p_vendedor_id" bigint, "p_comision_ids" bigint[], "p_fecha_pago" "date", "p_concepto" "text", "p_comprobante_url" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."ping"() TO "anon";
GRANT ALL ON FUNCTION "public"."ping"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."ping"() TO "service_role";



GRANT ALL ON FUNCTION "public"."procesar_confirmacion_pedido_v2"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."procesar_confirmacion_pedido_v2"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."procesar_confirmacion_pedido_v2"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."procesar_pedido"("p_pedido_id" bigint, "p_origen_stock" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."procesar_pedido"("p_pedido_id" bigint, "p_origen_stock" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."procesar_pedido"("p_pedido_id" bigint, "p_origen_stock" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."procesar_pedido_y_stock_v2"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."procesar_pedido_y_stock_v2"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."procesar_pedido_y_stock_v2"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."reassign_and_delete_stage"("p_old_etapa_id" bigint, "p_new_etapa_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."reassign_and_delete_stage"("p_old_etapa_id" bigint, "p_new_etapa_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."reassign_and_delete_stage"("p_old_etapa_id" bigint, "p_new_etapa_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."recalcular_saldo_contacto"("id_contacto" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."recalcular_saldo_contacto"("id_contacto" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."recalcular_saldo_contacto"("id_contacto" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."recalcular_saldos_todos_los_clientes"() TO "anon";
GRANT ALL ON FUNCTION "public"."recalcular_saldos_todos_los_clientes"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."recalcular_saldos_todos_los_clientes"() TO "service_role";



GRANT ALL ON FUNCTION "public"."registrar_deuda_proveedor"() TO "anon";
GRANT ALL ON FUNCTION "public"."registrar_deuda_proveedor"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."registrar_deuda_proveedor"() TO "service_role";



GRANT ALL ON FUNCTION "public"."registrar_pago_completo"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."registrar_pago_completo"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."registrar_pago_completo"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."registrar_pago_proveedor_directo"("p_proveedor_id" "uuid", "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date") TO "anon";
GRANT ALL ON FUNCTION "public"."registrar_pago_proveedor_directo"("p_proveedor_id" "uuid", "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date") TO "authenticated";
GRANT ALL ON FUNCTION "public"."registrar_pago_proveedor_directo"("p_proveedor_id" "uuid", "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date") TO "service_role";



GRANT ALL ON FUNCTION "public"."registrar_pago_simple"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."registrar_pago_simple"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."registrar_pago_simple"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."registrar_y_aplicar_pago_cliente"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_compra_id" bigint, "p_comprobante_url" "text", "p_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."registrar_y_aplicar_pago_cliente"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_compra_id" bigint, "p_comprobante_url" "text", "p_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."registrar_y_aplicar_pago_cliente"("p_contacto_id" bigint, "p_monto" numeric, "p_metodo_pago" "text", "p_referencia" "text", "p_fecha_pago" "date", "p_es_cruzado" boolean, "p_proveedor_id" "uuid", "p_compra_id" bigint, "p_comprobante_url" "text", "p_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."reservar_stock_pedido"("p_pedido_id" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."reservar_stock_pedido"("p_pedido_id" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."reservar_stock_pedido"("p_pedido_id" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."resolver_solicitud_aprobacion"("p_token" "text", "p_aprobado" boolean, "p_comision_modificada" numeric) TO "anon";
GRANT ALL ON FUNCTION "public"."resolver_solicitud_aprobacion"("p_token" "text", "p_aprobado" boolean, "p_comision_modificada" numeric) TO "authenticated";
GRANT ALL ON FUNCTION "public"."resolver_solicitud_aprobacion"("p_token" "text", "p_aprobado" boolean, "p_comision_modificada" numeric) TO "service_role";



GRANT ALL ON FUNCTION "public"."reversar_recepcion_compra"("p_compra_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."reversar_recepcion_compra"("p_compra_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."reversar_recepcion_compra"("p_compra_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."set_numero_propuesta"() TO "anon";
GRANT ALL ON FUNCTION "public"."set_numero_propuesta"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_numero_propuesta"() TO "service_role";



GRANT ALL ON FUNCTION "public"."set_permisos_para_rol"("p_rol_id" integer, "p_permisos_nombres" "text"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."set_permisos_para_rol"("p_rol_id" integer, "p_permisos_nombres" "text"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_permisos_para_rol"("p_rol_id" integer, "p_permisos_nombres" "text"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."set_token_confirmacion_recepcion"() TO "anon";
GRANT ALL ON FUNCTION "public"."set_token_confirmacion_recepcion"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_token_confirmacion_recepcion"() TO "service_role";



GRANT ALL ON FUNCTION "public"."set_usuario_roles"("p_usuario_id" "uuid", "p_roles_nombres" "text"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."set_usuario_roles"("p_usuario_id" "uuid", "p_roles_nombres" "text"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_usuario_roles"("p_usuario_id" "uuid", "p_roles_nombres" "text"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."sincronizar_permisos"("p_permisos_nombres" "text"[]) TO "anon";
GRANT ALL ON FUNCTION "public"."sincronizar_permisos"("p_permisos_nombres" "text"[]) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sincronizar_permisos"("p_permisos_nombres" "text"[]) TO "service_role";



GRANT ALL ON FUNCTION "public"."sincronizar_saldos_clientes"() TO "anon";
GRANT ALL ON FUNCTION "public"."sincronizar_saldos_clientes"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."sincronizar_saldos_clientes"() TO "service_role";



GRANT ALL ON FUNCTION "public"."solicitar_aprobacion_masiva"("p_oportunidad_id" bigint, "p_solicitudes" "jsonb", "p_justificacion" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."solicitar_aprobacion_masiva"("p_oportunidad_id" bigint, "p_solicitudes" "jsonb", "p_justificacion" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."solicitar_aprobacion_masiva"("p_oportunidad_id" bigint, "p_solicitudes" "jsonb", "p_justificacion" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."sugerir_embalaje_pedido"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."sugerir_embalaje_pedido"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."sugerir_embalaje_pedido"("p_pedido_id" bigint) TO "service_role";



GRANT ALL ON FUNCTION "public"."sync_contact_zone"() TO "anon";
GRANT ALL ON FUNCTION "public"."sync_contact_zone"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."sync_contact_zone"() TO "service_role";



GRANT ALL ON FUNCTION "public"."test_conexion"() TO "anon";
GRANT ALL ON FUNCTION "public"."test_conexion"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."test_conexion"() TO "service_role";



GRANT ALL ON FUNCTION "public"."trigger_recalcular_saldo"() TO "anon";
GRANT ALL ON FUNCTION "public"."trigger_recalcular_saldo"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."trigger_recalcular_saldo"() TO "service_role";



GRANT ALL ON FUNCTION "public"."trigger_set_timestamp"() TO "anon";
GRANT ALL ON FUNCTION "public"."trigger_set_timestamp"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."trigger_set_timestamp"() TO "service_role";



GRANT ALL ON TABLE "public"."zonas_envio" TO "anon";
GRANT ALL ON TABLE "public"."zonas_envio" TO "authenticated";
GRANT ALL ON TABLE "public"."zonas_envio" TO "service_role";



GRANT ALL ON FUNCTION "public"."upsert_zona_envio"("p_zona_data" "jsonb") TO "anon";
GRANT ALL ON FUNCTION "public"."upsert_zona_envio"("p_zona_data" "jsonb") TO "authenticated";
GRANT ALL ON FUNCTION "public"."upsert_zona_envio"("p_zona_data" "jsonb") TO "service_role";



GRANT ALL ON FUNCTION "public"."verificar_pedido_para_logistica"("p_pedido_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."verificar_pedido_para_logistica"("p_pedido_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."verificar_pedido_para_logistica"("p_pedido_id" bigint) TO "service_role";

















































































GRANT ALL ON TABLE "public"."aplicacion_pagos" TO "anon";
GRANT ALL ON TABLE "public"."aplicacion_pagos" TO "authenticated";
GRANT ALL ON TABLE "public"."aplicacion_pagos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."aplicacion_pagos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."aplicacion_pagos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."aplicacion_pagos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."auditoria_pedidos" TO "anon";
GRANT ALL ON TABLE "public"."auditoria_pedidos" TO "authenticated";
GRANT ALL ON TABLE "public"."auditoria_pedidos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."auditoria_pedidos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."auditoria_pedidos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."auditoria_pedidos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."auditoria_precios" TO "anon";
GRANT ALL ON TABLE "public"."auditoria_precios" TO "authenticated";
GRANT ALL ON TABLE "public"."auditoria_precios" TO "service_role";



GRANT ALL ON SEQUENCE "public"."auditoria_precios_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."auditoria_precios_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."auditoria_precios_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."comisiones" TO "anon";
GRANT ALL ON TABLE "public"."comisiones" TO "authenticated";
GRANT ALL ON TABLE "public"."comisiones" TO "service_role";



GRANT ALL ON SEQUENCE "public"."comisiones_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."comisiones_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."comisiones_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."compras" TO "anon";
GRANT ALL ON TABLE "public"."compras" TO "authenticated";
GRANT ALL ON TABLE "public"."compras" TO "service_role";



GRANT ALL ON SEQUENCE "public"."compras_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."compras_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."compras_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."condiciones_pago" TO "anon";
GRANT ALL ON TABLE "public"."condiciones_pago" TO "authenticated";
GRANT ALL ON TABLE "public"."condiciones_pago" TO "service_role";



GRANT ALL ON SEQUENCE "public"."condiciones_pago_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."condiciones_pago_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."condiciones_pago_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."configuracion" TO "anon";
GRANT ALL ON TABLE "public"."configuracion" TO "authenticated";
GRANT ALL ON TABLE "public"."configuracion" TO "service_role";



GRANT ALL ON SEQUENCE "public"."configuracion_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."configuracion_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."configuracion_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."confirmaciones_stock" TO "anon";
GRANT ALL ON TABLE "public"."confirmaciones_stock" TO "authenticated";
GRANT ALL ON TABLE "public"."confirmaciones_stock" TO "service_role";



GRANT ALL ON SEQUENCE "public"."confirmaciones_stock_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."confirmaciones_stock_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."confirmaciones_stock_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."contactos" TO "anon";
GRANT ALL ON TABLE "public"."contactos" TO "authenticated";
GRANT ALL ON TABLE "public"."contactos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."contactos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."contactos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."contactos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."perfiles" TO "anon";
GRANT ALL ON TABLE "public"."perfiles" TO "authenticated";
GRANT ALL ON TABLE "public"."perfiles" TO "service_role";
GRANT SELECT,INSERT,UPDATE ON TABLE "public"."perfiles" TO "supabase_auth_admin";



GRANT ALL ON TABLE "public"."vendedores" TO "anon";
GRANT ALL ON TABLE "public"."vendedores" TO "authenticated";
GRANT ALL ON TABLE "public"."vendedores" TO "service_role";



GRANT ALL ON TABLE "public"."zonas" TO "anon";
GRANT ALL ON TABLE "public"."zonas" TO "authenticated";
GRANT ALL ON TABLE "public"."zonas" TO "service_role";



GRANT ALL ON TABLE "public"."contactos_vista_completa" TO "anon";
GRANT ALL ON TABLE "public"."contactos_vista_completa" TO "authenticated";
GRANT ALL ON TABLE "public"."contactos_vista_completa" TO "service_role";



GRANT ALL ON TABLE "public"."cuentas_bancarias" TO "anon";
GRANT ALL ON TABLE "public"."cuentas_bancarias" TO "authenticated";
GRANT ALL ON TABLE "public"."cuentas_bancarias" TO "service_role";



GRANT ALL ON SEQUENCE "public"."cuentas_bancarias_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."cuentas_bancarias_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."cuentas_bancarias_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."depositos" TO "anon";
GRANT ALL ON TABLE "public"."depositos" TO "authenticated";
GRANT ALL ON TABLE "public"."depositos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."depositos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."depositos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."depositos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."estados" TO "anon";
GRANT ALL ON TABLE "public"."estados" TO "authenticated";
GRANT ALL ON TABLE "public"."estados" TO "service_role";



GRANT ALL ON SEQUENCE "public"."estados_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."estados_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."estados_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."estados_pedido" TO "anon";
GRANT ALL ON TABLE "public"."estados_pedido" TO "authenticated";
GRANT ALL ON TABLE "public"."estados_pedido" TO "service_role";



GRANT ALL ON SEQUENCE "public"."estados_pedido_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."estados_pedido_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."estados_pedido_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."etapas_venta" TO "anon";
GRANT ALL ON TABLE "public"."etapas_venta" TO "authenticated";
GRANT ALL ON TABLE "public"."etapas_venta" TO "service_role";



GRANT ALL ON SEQUENCE "public"."etapas_venta_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."etapas_venta_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."etapas_venta_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."facturas_venta" TO "anon";
GRANT ALL ON TABLE "public"."facturas_venta" TO "authenticated";
GRANT ALL ON TABLE "public"."facturas_venta" TO "service_role";



GRANT ALL ON SEQUENCE "public"."facturas_venta_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."facturas_venta_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."facturas_venta_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."interacciones" TO "anon";
GRANT ALL ON TABLE "public"."interacciones" TO "authenticated";
GRANT ALL ON TABLE "public"."interacciones" TO "service_role";



GRANT ALL ON SEQUENCE "public"."interacciones_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."interacciones_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."interacciones_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."logistica_embalajes" TO "anon";
GRANT ALL ON TABLE "public"."logistica_embalajes" TO "authenticated";
GRANT ALL ON TABLE "public"."logistica_embalajes" TO "service_role";



GRANT ALL ON SEQUENCE "public"."logistica_embalajes_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."logistica_embalajes_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."logistica_embalajes_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."logistica_envios" TO "anon";
GRANT ALL ON TABLE "public"."logistica_envios" TO "authenticated";
GRANT ALL ON TABLE "public"."logistica_envios" TO "service_role";



GRANT ALL ON SEQUENCE "public"."logistica_envios_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."logistica_envios_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."logistica_envios_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."logistica_transportistas" TO "anon";
GRANT ALL ON TABLE "public"."logistica_transportistas" TO "authenticated";
GRANT ALL ON TABLE "public"."logistica_transportistas" TO "service_role";



GRANT ALL ON SEQUENCE "public"."logistica_transportistas_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."logistica_transportistas_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."logistica_transportistas_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."lotes" TO "anon";
GRANT ALL ON TABLE "public"."lotes" TO "authenticated";
GRANT ALL ON TABLE "public"."lotes" TO "service_role";



GRANT ALL ON SEQUENCE "public"."lotes_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."lotes_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."lotes_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."movimientos_cuenta_corriente" TO "anon";
GRANT ALL ON TABLE "public"."movimientos_cuenta_corriente" TO "authenticated";
GRANT ALL ON TABLE "public"."movimientos_cuenta_corriente" TO "service_role";



GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_corriente_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_corriente_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_corriente_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."movimientos_cuenta_proveedor" TO "anon";
GRANT ALL ON TABLE "public"."movimientos_cuenta_proveedor" TO "authenticated";
GRANT ALL ON TABLE "public"."movimientos_cuenta_proveedor" TO "service_role";



GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_proveedor_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_proveedor_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."movimientos_cuenta_proveedor_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."oportunidades" TO "anon";
GRANT ALL ON TABLE "public"."oportunidades" TO "authenticated";
GRANT ALL ON TABLE "public"."oportunidades" TO "service_role";



GRANT ALL ON SEQUENCE "public"."oportunidades_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."oportunidades_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."oportunidades_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."oportunidades_numero_propuesta_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."oportunidades_numero_propuesta_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."oportunidades_numero_propuesta_seq" TO "service_role";



GRANT ALL ON TABLE "public"."organizaciones" TO "anon";
GRANT ALL ON TABLE "public"."organizaciones" TO "authenticated";
GRANT ALL ON TABLE "public"."organizaciones" TO "service_role";



GRANT ALL ON SEQUENCE "public"."organizaciones_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."organizaciones_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."organizaciones_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."pagos" TO "anon";
GRANT ALL ON TABLE "public"."pagos" TO "authenticated";
GRANT ALL ON TABLE "public"."pagos" TO "service_role";



GRANT ALL ON TABLE "public"."pagos_comisiones" TO "anon";
GRANT ALL ON TABLE "public"."pagos_comisiones" TO "authenticated";
GRANT ALL ON TABLE "public"."pagos_comisiones" TO "service_role";



GRANT ALL ON SEQUENCE "public"."pagos_comisiones_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."pagos_comisiones_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."pagos_comisiones_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."pagos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."pagos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."pagos_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."pedido_numero_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."pedido_numero_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."pedido_numero_seq" TO "service_role";



GRANT ALL ON TABLE "public"."pedidos" TO "anon";
GRANT ALL ON TABLE "public"."pedidos" TO "authenticated";
GRANT ALL ON TABLE "public"."pedidos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."pedidos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."pedidos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."pedidos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."permisos" TO "anon";
GRANT ALL ON TABLE "public"."permisos" TO "authenticated";
GRANT ALL ON TABLE "public"."permisos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."permisos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."permisos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."permisos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."productos" TO "anon";
GRANT ALL ON TABLE "public"."productos" TO "authenticated";
GRANT ALL ON TABLE "public"."productos" TO "service_role";



GRANT ALL ON TABLE "public"."stock_vendedores" TO "anon";
GRANT ALL ON TABLE "public"."stock_vendedores" TO "authenticated";
GRANT ALL ON TABLE "public"."stock_vendedores" TO "service_role";



GRANT ALL ON TABLE "public"."productos_con_stock" TO "anon";
GRANT ALL ON TABLE "public"."productos_con_stock" TO "authenticated";
GRANT ALL ON TABLE "public"."productos_con_stock" TO "service_role";



GRANT ALL ON SEQUENCE "public"."productos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."productos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."productos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."proveedor_contactos" TO "anon";
GRANT ALL ON TABLE "public"."proveedor_contactos" TO "authenticated";
GRANT ALL ON TABLE "public"."proveedor_contactos" TO "service_role";



GRANT ALL ON SEQUENCE "public"."proveedor_contactos_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."proveedor_contactos_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."proveedor_contactos_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."proveedor_cuentas_bancarias" TO "anon";
GRANT ALL ON TABLE "public"."proveedor_cuentas_bancarias" TO "authenticated";
GRANT ALL ON TABLE "public"."proveedor_cuentas_bancarias" TO "service_role";



GRANT ALL ON SEQUENCE "public"."proveedor_cuentas_bancarias_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."proveedor_cuentas_bancarias_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."proveedor_cuentas_bancarias_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."proveedores" TO "anon";
GRANT ALL ON TABLE "public"."proveedores" TO "authenticated";
GRANT ALL ON TABLE "public"."proveedores" TO "service_role";



GRANT ALL ON TABLE "public"."reglas_alertas" TO "anon";
GRANT ALL ON TABLE "public"."reglas_alertas" TO "authenticated";
GRANT ALL ON TABLE "public"."reglas_alertas" TO "service_role";



GRANT ALL ON SEQUENCE "public"."reglas_alertas_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reglas_alertas_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reglas_alertas_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."reportes_usabilidad" TO "anon";
GRANT ALL ON TABLE "public"."reportes_usabilidad" TO "authenticated";
GRANT ALL ON TABLE "public"."reportes_usabilidad" TO "service_role";



GRANT ALL ON SEQUENCE "public"."reportes_usabilidad_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reportes_usabilidad_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reportes_usabilidad_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."reservas_pedido" TO "anon";
GRANT ALL ON TABLE "public"."reservas_pedido" TO "authenticated";
GRANT ALL ON TABLE "public"."reservas_pedido" TO "service_role";



GRANT ALL ON SEQUENCE "public"."reservas_pedido_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reservas_pedido_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reservas_pedido_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."reservas_stock" TO "anon";
GRANT ALL ON TABLE "public"."reservas_stock" TO "authenticated";
GRANT ALL ON TABLE "public"."reservas_stock" TO "service_role";



GRANT ALL ON SEQUENCE "public"."reservas_stock_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reservas_stock_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reservas_stock_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."rol_permisos" TO "anon";
GRANT ALL ON TABLE "public"."rol_permisos" TO "authenticated";
GRANT ALL ON TABLE "public"."rol_permisos" TO "service_role";



GRANT ALL ON TABLE "public"."roles" TO "anon";
GRANT ALL ON TABLE "public"."roles" TO "authenticated";
GRANT ALL ON TABLE "public"."roles" TO "service_role";



GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."roles_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."stock_ajustes" TO "anon";
GRANT ALL ON TABLE "public"."stock_ajustes" TO "authenticated";
GRANT ALL ON TABLE "public"."stock_ajustes" TO "service_role";



GRANT ALL ON SEQUENCE "public"."stock_ajustes_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."stock_ajustes_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."stock_ajustes_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."stock_vendedores_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."stock_vendedores_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."stock_vendedores_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."tipos_de_cambio" TO "anon";
GRANT ALL ON TABLE "public"."tipos_de_cambio" TO "authenticated";
GRANT ALL ON TABLE "public"."tipos_de_cambio" TO "service_role";



GRANT ALL ON TABLE "public"."tipos_documento_pago" TO "anon";
GRANT ALL ON TABLE "public"."tipos_documento_pago" TO "authenticated";
GRANT ALL ON TABLE "public"."tipos_documento_pago" TO "service_role";



GRANT ALL ON SEQUENCE "public"."tipos_documento_pago_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."tipos_documento_pago_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."tipos_documento_pago_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."usuario_roles" TO "anon";
GRANT ALL ON TABLE "public"."usuario_roles" TO "authenticated";
GRANT ALL ON TABLE "public"."usuario_roles" TO "service_role";



GRANT ALL ON SEQUENCE "public"."vendedores_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."vendedores_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."vendedores_id_seq" TO "service_role";
GRANT SELECT,USAGE ON SEQUENCE "public"."vendedores_id_seq" TO "supabase_auth_admin";



GRANT ALL ON SEQUENCE "public"."zonas_envio_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."zonas_envio_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."zonas_envio_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."zonas_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."zonas_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."zonas_id_seq" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";






























