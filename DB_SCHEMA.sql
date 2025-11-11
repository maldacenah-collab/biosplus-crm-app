--
-- PostgreSQL database dump
--

\restrict VNObvRQQxyuvDeHVkPwWQfhOSOgIRKXdJQrV03XTnjPjhBypQ0u0lONJNRLcdJ1

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP EVENT TRIGGER pgrst_drop_watch;
DROP EVENT TRIGGER pgrst_ddl_watch;
DROP EVENT TRIGGER issue_pg_net_access;
DROP EVENT TRIGGER issue_pg_graphql_access;
DROP EVENT TRIGGER issue_pg_cron_access;
DROP EVENT TRIGGER issue_graphql_placeholder;
DROP PUBLICATION supabase_realtime_messages_publication;
DROP PUBLICATION supabase_realtime;
DROP POLICY "Public Access for Proposals" ON storage.objects;
DROP POLICY "Permitir subidas publicas a propuestas" ON storage.objects;
DROP POLICY "Permitir subidas de comprobantes de pago" ON storage.objects;
DROP POLICY "Permitir subidas anónimas a recibos" ON storage.objects;
DROP POLICY "Permitir subidas a comprobantes_pago_clientes" ON storage.objects;
DROP POLICY "Permitir subida de archivos a recibos" ON storage.objects;
DROP POLICY "Permitir lecturas de comprobantes_pago_clientes" ON storage.objects;
DROP POLICY "Permitir lecturas anónimas de recibos" ON storage.objects;
DROP POLICY "Permitir lectura pública de recibos" ON storage.objects;
DROP POLICY "Permitir lectura de comprobantes de pago" ON storage.objects;
DROP POLICY "Permitir actualizaciones en propuestas" ON storage.objects;
DROP POLICY "Permitir acceso público de subida a assets" ON storage.objects;
DROP POLICY "Permitir acceso público de lectura a assets" ON storage.objects;
DROP POLICY "Permitir acceso público de actualización a assets" ON storage.objects;
DROP POLICY "Permitir a usuarios autenticados ver las fotos de perfil" ON storage.objects;
DROP POLICY "Permitir a usuarios autenticados subir fotos de perfil" ON storage.objects;
DROP POLICY "Permitir a usuarios autenticados gestionar remitos" ON storage.objects;
DROP POLICY "Los usuarios autenticados pueden subir comprobantes de pago" ON storage.objects;
DROP POLICY "Give anon users full access to remitos bucket" ON storage.objects;
DROP POLICY "Dar acceso publico de lectura a propuestas" ON storage.objects;
DROP POLICY "Authenticated Upload for Proposals" ON storage.objects;
DROP POLICY "Public read access" ON public.tipos_de_cambio;
DROP POLICY "Prov contactos" ON public.proveedor_contactos;
DROP POLICY "Política de gestión de reportes" ON public.reportes_usabilidad;
DROP POLICY "Política de Acceso a Comisiones" ON public.comisiones;
DROP POLICY "Politica Unificada de Vendedores" ON public.vendedores;
DROP POLICY "Politica Unificada de Pedidos" ON public.pedidos;
DROP POLICY "Politica Unificada de Oportunidades" ON public.oportunidades;
DROP POLICY "Politica Unificada de Lotes" ON public.lotes;
DROP POLICY "Politica Unificada de Gestion de Roles" ON public.usuario_roles;
DROP POLICY "Politica Unificada de Estados" ON public.estados;
DROP POLICY "Politica Unificada de Cuentas Bancarias" ON public.cuentas_bancarias;
DROP POLICY "Politica Unificada de Cta Cte Proveedores" ON public.movimientos_cuenta_proveedor;
DROP POLICY "Politica Unificada de Compras" ON public.compras;
DROP POLICY "Permitir lectura de roles a usuarios autenticados" ON public.roles;
DROP POLICY "Permitir lectura de permisos de rol a usuarios autenticados" ON public.rol_permisos;
DROP POLICY "Permitir lectura de permisos a usuarios autenticados" ON public.permisos;
DROP POLICY "Permitir lectura de perfiles a admins o al propio usuario" ON public.perfiles;
DROP POLICY "Permitir lectura de contactos" ON public.contactos;
DROP POLICY "Permitir la actualización de perfiles a admins o al propio usu" ON public.perfiles;
DROP POLICY "Permitir inserción desde formulario público" ON public.contactos;
DROP POLICY "Permitir inserción de movimientos al crear/anular pedidos" ON public.movimientos_cuenta_corriente;
DROP POLICY "Permitir inserción de contactos" ON public.contactos;
DROP POLICY "Permitir inserciones al rol postgres para la creación de perfi" ON public.perfiles;
DROP POLICY "Permitir insercion de roles a Superadministradores" ON public.roles;
DROP POLICY "Permitir gestion de permisos de rol a Superadministradores" ON public.rol_permisos;
DROP POLICY "Permitir gestion de permisos a Superadministradores" ON public.permisos;
DROP POLICY "Permitir eliminación de contactos" ON public.contactos;
DROP POLICY "Permitir eliminacion de roles a Superadministradores" ON public.roles;
DROP POLICY "Permitir actualización de contactos" ON public.contactos;
DROP POLICY "Permitir actualizacion de roles a Superadministradores" ON public.roles;
DROP POLICY "Permitir a usuarios del app registrar ajustes" ON public.stock_ajustes;
DROP POLICY "Permitir a usuarios de la app LEER todos los ajustes de stock" ON public.stock_ajustes;
DROP POLICY "Permitir a usuarios autenticados LEER los registros de pago" ON public.pagos;
DROP POLICY "Permitir a usuarios autenticados LEER las aplicaciones de pago" ON public.aplicacion_pagos;
DROP POLICY "Los usuarios pueden crear sus propios pagos" ON public.pagos;
DROP POLICY "Los usuarios de la app pueden gestionar stock de vendedores" ON public.stock_vendedores;
DROP POLICY "Enable insert access for anon users on condiciones_pago" ON public.condiciones_pago;
DROP POLICY "Cuentas prove" ON public.proveedor_cuentas_bancarias;
DROP POLICY "Admins pueden gestionar reglas" ON public.reglas_alertas;
DROP POLICY "Acceso total para usuarios autenticados" ON public.tipos_documento_pago;
DROP POLICY "Acceso total para usuarios autenticados" ON public.reservas_stock;
DROP POLICY "Acceso total para usuarios autenticados" ON public.reservas_pedido;
DROP POLICY "Acceso total para usuarios autenticados" ON public.pagos_comisiones;
DROP POLICY "Acceso total para usuarios autenticados" ON public.confirmaciones_stock;
DROP POLICY "Acceso total para usuarios autenticados" ON public.auditoria_precios;
DROP POLICY "Acceso total para usuarios autenticados" ON public.auditoria_pedidos;
DROP POLICY "Acceso solo para Superadministradores" ON public.configuracion;
DROP POLICY "Acceso para usuarios autenticados" ON public.facturas_venta;
DROP POLICY "Acceso de lectura para usuarios autenticados" ON public.logistica_transportistas;
DROP POLICY "Acceso de lectura para usuarios autenticados" ON public.logistica_embalajes;
DROP POLICY "Acceso de lectura para usuarios autenticados" ON public.estados_pedido;
DROP POLICY "Acceso de lectura de proveedores para usuarios autenticados" ON public.proveedores;
DROP POLICY "Acceso de lectura de productos para usuarios autenticados" ON public.productos;
DROP POLICY "Acceso de lectura de etapas para usuarios autenticados" ON public.etapas_venta;
DROP POLICY "Acceso de lectura de depósitos para usuarios autenticados" ON public.depositos;
DROP POLICY "Acceso de lectura de cond. de pago para usuarios autenticados" ON public.condiciones_pago;
DROP POLICY "Acceso de lectura a organizaciones" ON public.organizaciones;
DROP POLICY "Acceso basado en propiedad" ON public.logistica_envios;
DROP POLICY "Acceso basado en propiedad" ON public.interacciones;
DROP POLICY "Acceso a zonas de envio" ON public.zonas_envio;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey;
ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_bucket_id_fkey;
ALTER TABLE ONLY storage.prefixes DROP CONSTRAINT "prefixes_bucketId_fkey";
ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
ALTER TABLE ONLY public.zonas_envio DROP CONSTRAINT zonas_envio_organizacion_id_fkey;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT usuarios_id_fkey;
ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_usuario_id_fkey;
ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_rol_id_fkey;
ALTER TABLE ONLY public.stock_vendedores DROP CONSTRAINT stock_vendedores_vendedor_id_fkey;
ALTER TABLE ONLY public.stock_vendedores DROP CONSTRAINT stock_vendedores_lote_id_fkey;
ALTER TABLE ONLY public.stock_ajustes DROP CONSTRAINT stock_ajustes_producto_id_fkey;
ALTER TABLE ONLY public.stock_ajustes DROP CONSTRAINT stock_ajustes_lote_id_fkey;
ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_rol_id_fkey;
ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_permiso_id_fkey;
ALTER TABLE ONLY public.reservas_stock DROP CONSTRAINT reservas_stock_pedido_id_fkey;
ALTER TABLE ONLY public.reservas_stock DROP CONSTRAINT reservas_stock_lote_id_fkey;
ALTER TABLE ONLY public.reservas_pedido DROP CONSTRAINT reservas_pedido_producto_id_fkey;
ALTER TABLE ONLY public.reservas_pedido DROP CONSTRAINT reservas_pedido_pedido_id_fkey;
ALTER TABLE ONLY public.reservas_pedido DROP CONSTRAINT reservas_pedido_lote_id_fkey;
ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_condicion_pago_id_fkey;
ALTER TABLE ONLY public.proveedor_cuentas_bancarias DROP CONSTRAINT proveedor_cuentas_bancarias_proveedor_id_fkey;
ALTER TABLE ONLY public.proveedor_contactos DROP CONSTRAINT proveedor_contactos_proveedor_id_fkey;
ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_deposito_default_id_fkey;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_vendedor_id_fkey;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_organizacion_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_vendedor_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_organizacion_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_oportunidad_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_estado_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_deposito_principal_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_contacto_id_fkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_condicion_pago_id_fkey;
ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_cuenta_bancaria_id_fkey;
ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_contacto_id_fkey;
ALTER TABLE ONLY public.pagos_comisiones DROP CONSTRAINT pagos_comisiones_vendedor_id_fkey;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_vendedor_id_fkey;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_organizacion_id_fkey;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_etapa_id_fkey;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_contacto_id_fkey;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_condicion_pago_id_fkey;
ALTER TABLE ONLY public.movimientos_cuenta_proveedor DROP CONSTRAINT movimientos_cuenta_proveedor_proveedor_id_fkey;
ALTER TABLE ONLY public.movimientos_cuenta_proveedor DROP CONSTRAINT movimientos_cuenta_proveedor_compra_id_fkey;
ALTER TABLE ONLY public.movimientos_cuenta_corriente DROP CONSTRAINT movimientos_cuenta_corriente_pedido_id_fkey;
ALTER TABLE ONLY public.movimientos_cuenta_corriente DROP CONSTRAINT movimientos_cuenta_corriente_cliente_id_fkey;
ALTER TABLE ONLY public.lotes DROP CONSTRAINT lotes_producto_id_fkey;
ALTER TABLE ONLY public.lotes DROP CONSTRAINT lotes_compra_id_fkey;
ALTER TABLE ONLY public.logistica_envios DROP CONSTRAINT logistica_envios_transportista_id_fkey;
ALTER TABLE ONLY public.logistica_envios DROP CONSTRAINT logistica_envios_pedido_id_fkey;
ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_contacto_id_fkey;
ALTER TABLE ONLY public.facturas_venta DROP CONSTRAINT facturas_venta_pedido_id_fkey;
ALTER TABLE ONLY public.facturas_venta DROP CONSTRAINT facturas_venta_contacto_id_fkey;
ALTER TABLE ONLY public.cuentas_bancarias DROP CONSTRAINT cuentas_bancarias_organizacion_id_fkey;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_zona_id_fkey;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_vendedor_id_fkey;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_organizacion_id_fkey;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_estado_id_fkey;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_condicion_pago_id_fkey;
ALTER TABLE ONLY public.confirmaciones_stock DROP CONSTRAINT confirmaciones_stock_vendedor_id_fkey;
ALTER TABLE ONLY public.confirmaciones_stock DROP CONSTRAINT confirmaciones_stock_asignacion_id_fkey;
ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_proveedor_id_fkey;
ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_organizacion_id_fkey;
ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_deposito_id_fkey;
ALTER TABLE ONLY public.comisiones DROP CONSTRAINT comisiones_pedido_id_fkey;
ALTER TABLE ONLY public.auditoria_precios DROP CONSTRAINT auditoria_precios_usuario_id_fkey;
ALTER TABLE ONLY public.auditoria_precios DROP CONSTRAINT auditoria_precios_producto_id_fkey;
ALTER TABLE ONLY public.auditoria_pedidos DROP CONSTRAINT auditoria_pedidos_pedido_id_fkey;
ALTER TABLE ONLY public.aplicacion_pagos DROP CONSTRAINT aplicacion_pagos_pago_id_fkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_oauth_client_id_fkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_user_id_fkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_user_id_fkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_client_id_fkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_user_id_fkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_client_id_fkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
DROP TRIGGER update_objects_updated_at ON storage.objects;
DROP TRIGGER prefixes_delete_hierarchy ON storage.prefixes;
DROP TRIGGER prefixes_create_hierarchy ON storage.prefixes;
DROP TRIGGER objects_update_create_prefix ON storage.objects;
DROP TRIGGER objects_insert_create_prefix ON storage.objects;
DROP TRIGGER objects_delete_delete_prefix ON storage.objects;
DROP TRIGGER enforce_bucket_name_length_trigger ON storage.buckets;
DROP TRIGGER tr_check_filters ON realtime.subscription;
DROP TRIGGER trigger_update_ultima_compra ON public.pedidos;
DROP TRIGGER trigger_sync_contact_zone ON public.contactos;
DROP TRIGGER trigger_auditoria_pedidos ON public.pedidos;
DROP TRIGGER trigger_actualizar_deuda_proveedor ON public.movimientos_cuenta_proveedor;
DROP TRIGGER trg_set_token_on_envio_insert ON public.logistica_envios;
DROP TRIGGER trg_set_numero_propuesta ON public.oportunidades;
DROP TRIGGER trg_auditar_precio_producto ON public.productos;
DROP TRIGGER trg_actualizar_pedido_al_entregar_envio ON public.logistica_envios;
DROP TRIGGER set_logistica_envios_updated_at ON public.logistica_envios;
DROP TRIGGER on_payment_applied_generate_commission ON public.aplicacion_pagos;
DROP TRIGGER on_compra_recibida ON public.compras;
DROP TRIGGER on_auth_user_created ON auth.users;
DROP INDEX storage.objects_bucket_id_level_idx;
DROP INDEX storage.name_prefix_search;
DROP INDEX storage.idx_prefixes_lower_name;
DROP INDEX storage.idx_objects_lower_name;
DROP INDEX storage.idx_objects_bucket_id_name;
DROP INDEX storage.idx_name_bucket_level_unique;
DROP INDEX storage.idx_multipart_uploads_list;
DROP INDEX storage.bucketid_objname;
DROP INDEX storage.bname;
DROP INDEX realtime.subscription_subscription_id_entity_filters_key;
DROP INDEX realtime.messages_inserted_at_topic_index;
DROP INDEX realtime.ix_realtime_subscription_entity;
DROP INDEX public.reservas_pedido_pedido_lote_producto_uq;
DROP INDEX public.idx_zonas_envio_geometria;
DROP INDEX public.idx_usuario_roles_rol_id;
DROP INDEX public.idx_stock_vendedores_lote_id;
DROP INDEX public.idx_stock_ajustes_producto_id;
DROP INDEX public.idx_stock_ajustes_lote_id;
DROP INDEX public.idx_rol_permisos_permiso_id;
DROP INDEX public.idx_reservas_stock_pedido_id;
DROP INDEX public.idx_reservas_stock_lote_id;
DROP INDEX public.idx_reservas_pedido_producto_id;
DROP INDEX public.idx_reservas_pedido_lote_id;
DROP INDEX public.idx_proveedores_condicion_pago_id;
DROP INDEX public.idx_proveedor_cuentas_bancarias_proveedor_id;
DROP INDEX public.idx_proveedor_contactos_proveedor_id;
DROP INDEX public.idx_productos_deposito_default_id;
DROP INDEX public.idx_pedidos_vendedor_id;
DROP INDEX public.idx_pedidos_estado_id;
DROP INDEX public.idx_pedidos_deposito_principal_id;
DROP INDEX public.idx_pedidos_contacto_id;
DROP INDEX public.idx_pedidos_condicion_pago_id;
DROP INDEX public.idx_pagos_cuenta_bancaria_id;
DROP INDEX public.idx_pagos_contacto_id;
DROP INDEX public.idx_pagos_comisiones_vendedor_id;
DROP INDEX public.idx_oportunidades_vendedor_id;
DROP INDEX public.idx_oportunidades_etapa_id;
DROP INDEX public.idx_oportunidades_contacto_id;
DROP INDEX public.idx_oportunidades_condicion_pago_id;
DROP INDEX public.idx_movimientos_cuenta_proveedor_proveedor_id;
DROP INDEX public.idx_movimientos_cuenta_proveedor_compra_id;
DROP INDEX public.idx_movimientos_cuenta_corriente_pedido_id;
DROP INDEX public.idx_movimientos_cuenta_corriente_cliente_id;
DROP INDEX public.idx_lotes_producto_id;
DROP INDEX public.idx_lotes_compra_id;
DROP INDEX public.idx_logistica_envios_transportista_id;
DROP INDEX public.idx_logistica_envios_pedido_id;
DROP INDEX public.idx_interacciones_contacto_id;
DROP INDEX public.idx_facturas_venta_pedido_id;
DROP INDEX public.idx_facturas_venta_contacto_id;
DROP INDEX public.idx_contactos_vendedor_id;
DROP INDEX public.idx_contactos_estado_id;
DROP INDEX public.idx_contactos_condicion_pago_id;
DROP INDEX public.idx_confirmaciones_stock_vendedor_id;
DROP INDEX public.idx_confirmaciones_stock_asignacion_id;
DROP INDEX public.idx_compras_proveedor_id;
DROP INDEX public.idx_compras_deposito_id;
DROP INDEX public.idx_comisiones_pedido_id;
DROP INDEX public.idx_auditoria_precios_usuario_id;
DROP INDEX public.idx_auditoria_precios_producto_id;
DROP INDEX public.idx_auditoria_pedidos_pedido_id;
DROP INDEX public.idx_aplicacion_pagos_pago_id;
DROP INDEX auth.users_is_anonymous_idx;
DROP INDEX auth.users_instance_id_idx;
DROP INDEX auth.users_instance_id_email_idx;
DROP INDEX auth.users_email_partial_key;
DROP INDEX auth.user_id_created_at_idx;
DROP INDEX auth.unique_phone_factor_per_user;
DROP INDEX auth.sso_providers_resource_id_pattern_idx;
DROP INDEX auth.sso_providers_resource_id_idx;
DROP INDEX auth.sso_domains_sso_provider_id_idx;
DROP INDEX auth.sso_domains_domain_idx;
DROP INDEX auth.sessions_user_id_idx;
DROP INDEX auth.sessions_oauth_client_id_idx;
DROP INDEX auth.sessions_not_after_idx;
DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX auth.saml_relay_states_for_email_idx;
DROP INDEX auth.saml_relay_states_created_at_idx;
DROP INDEX auth.saml_providers_sso_provider_id_idx;
DROP INDEX auth.refresh_tokens_updated_at_idx;
DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX auth.refresh_tokens_parent_idx;
DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX auth.refresh_tokens_instance_id_idx;
DROP INDEX auth.recovery_token_idx;
DROP INDEX auth.reauthentication_token_idx;
DROP INDEX auth.one_time_tokens_user_id_token_type_key;
DROP INDEX auth.one_time_tokens_token_hash_hash_idx;
DROP INDEX auth.one_time_tokens_relates_to_hash_idx;
DROP INDEX auth.oauth_consents_user_order_idx;
DROP INDEX auth.oauth_consents_active_user_client_idx;
DROP INDEX auth.oauth_consents_active_client_idx;
DROP INDEX auth.oauth_clients_deleted_at_idx;
DROP INDEX auth.oauth_auth_pending_exp_idx;
DROP INDEX auth.mfa_factors_user_id_idx;
DROP INDEX auth.mfa_factors_user_friendly_name_unique;
DROP INDEX auth.mfa_challenge_created_at_idx;
DROP INDEX auth.idx_user_id_auth_method;
DROP INDEX auth.idx_auth_code;
DROP INDEX auth.identities_user_id_idx;
DROP INDEX auth.identities_email_idx;
DROP INDEX auth.flow_state_created_at_idx;
DROP INDEX auth.factor_id_created_at_idx;
DROP INDEX auth.email_change_token_new_idx;
DROP INDEX auth.email_change_token_current_idx;
DROP INDEX auth.confirmation_token_idx;
DROP INDEX auth.audit_logs_instance_id_idx;
ALTER TABLE ONLY supabase_migrations.seed_files DROP CONSTRAINT seed_files_pkey;
ALTER TABLE ONLY supabase_migrations.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_pkey;
ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_pkey;
ALTER TABLE ONLY storage.prefixes DROP CONSTRAINT prefixes_pkey;
ALTER TABLE ONLY storage.objects DROP CONSTRAINT objects_pkey;
ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_name_key;
ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_pkey;
ALTER TABLE ONLY storage.buckets_analytics DROP CONSTRAINT buckets_analytics_pkey;
ALTER TABLE ONLY realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
ALTER TABLE ONLY realtime.messages_2025_08_31 DROP CONSTRAINT messages_2025_08_31_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_30 DROP CONSTRAINT messages_2025_08_30_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_29 DROP CONSTRAINT messages_2025_08_29_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_28 DROP CONSTRAINT messages_2025_08_28_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_27 DROP CONSTRAINT messages_2025_08_27_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_26 DROP CONSTRAINT messages_2025_08_26_pkey;
ALTER TABLE ONLY realtime.messages_2025_08_25 DROP CONSTRAINT messages_2025_08_25_pkey;
ALTER TABLE ONLY realtime.messages DROP CONSTRAINT messages_pkey;
ALTER TABLE ONLY public.zonas DROP CONSTRAINT zonas_pkey;
ALTER TABLE ONLY public.zonas DROP CONSTRAINT zonas_nombre_key;
ALTER TABLE ONLY public.zonas_envio DROP CONSTRAINT zonas_envio_pkey;
ALTER TABLE ONLY public.vendedores DROP CONSTRAINT vendedores_pkey;
ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_pkey;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT unique_pedido_por_oportunidad;
ALTER TABLE ONLY public.tipos_documento_pago DROP CONSTRAINT tipos_documento_pago_pkey;
ALTER TABLE ONLY public.tipos_documento_pago DROP CONSTRAINT tipos_documento_pago_nombre_key;
ALTER TABLE ONLY public.tipos_de_cambio DROP CONSTRAINT tipos_de_cambio_pkey;
ALTER TABLE ONLY public.stock_vendedores DROP CONSTRAINT stock_vendedores_vendedor_id_lote_id_key;
ALTER TABLE ONLY public.stock_vendedores DROP CONSTRAINT stock_vendedores_pkey;
ALTER TABLE ONLY public.stock_ajustes DROP CONSTRAINT stock_ajustes_pkey;
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_nombre_rol_key;
ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_pkey;
ALTER TABLE ONLY public.reservas_stock DROP CONSTRAINT reservas_stock_pkey;
ALTER TABLE ONLY public.reservas_pedido DROP CONSTRAINT reservas_pedido_pkey;
ALTER TABLE ONLY public.reportes_usabilidad DROP CONSTRAINT reportes_usabilidad_pkey;
ALTER TABLE ONLY public.reglas_alertas DROP CONSTRAINT reglas_alertas_pkey;
ALTER TABLE ONLY public.reglas_alertas DROP CONSTRAINT reglas_alertas_nombre_regla_key;
ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
ALTER TABLE ONLY public.proveedor_cuentas_bancarias DROP CONSTRAINT proveedor_cuentas_bancarias_pkey;
ALTER TABLE ONLY public.proveedor_contactos DROP CONSTRAINT proveedor_contactos_pkey;
ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_sku_key;
ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_pkey;
ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_nombre_permiso_key;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_vendedor_id_key;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_pkey;
ALTER TABLE ONLY public.perfiles DROP CONSTRAINT perfiles_email_key;
ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_pkey;
ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_pkey;
ALTER TABLE ONLY public.pagos_comisiones DROP CONSTRAINT pagos_comisiones_pkey;
ALTER TABLE ONLY public.organizaciones DROP CONSTRAINT organizaciones_pkey;
ALTER TABLE ONLY public.organizaciones DROP CONSTRAINT organizaciones_nombre_key;
ALTER TABLE ONLY public.oportunidades DROP CONSTRAINT oportunidades_pkey;
ALTER TABLE ONLY public.movimientos_cuenta_proveedor DROP CONSTRAINT movimientos_cuenta_proveedor_pkey;
ALTER TABLE ONLY public.movimientos_cuenta_corriente DROP CONSTRAINT movimientos_cuenta_corriente_pkey;
ALTER TABLE ONLY public.lotes DROP CONSTRAINT lotes_pkey;
ALTER TABLE ONLY public.logistica_transportistas DROP CONSTRAINT logistica_transportistas_pkey;
ALTER TABLE ONLY public.logistica_transportistas DROP CONSTRAINT logistica_transportistas_nombre_key;
ALTER TABLE ONLY public.logistica_envios DROP CONSTRAINT logistica_envios_pkey;
ALTER TABLE ONLY public.logistica_embalajes DROP CONSTRAINT logistica_embalajes_pkey;
ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_pkey;
ALTER TABLE ONLY public.facturas_venta DROP CONSTRAINT facturas_venta_pkey;
ALTER TABLE ONLY public.etapas_venta DROP CONSTRAINT etapas_venta_pkey;
ALTER TABLE ONLY public.etapas_venta DROP CONSTRAINT etapas_venta_nombre_unique;
ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_pkey;
ALTER TABLE ONLY public.estados_pedido DROP CONSTRAINT estados_pedido_pkey;
ALTER TABLE ONLY public.depositos DROP CONSTRAINT depositos_pkey;
ALTER TABLE ONLY public.cuentas_bancarias DROP CONSTRAINT cuentas_bancarias_pkey;
ALTER TABLE ONLY public.cuentas_bancarias DROP CONSTRAINT cuentas_bancarias_cbu_cvu_key;
ALTER TABLE ONLY public.contactos DROP CONSTRAINT contactos_pkey;
ALTER TABLE ONLY public.confirmaciones_stock DROP CONSTRAINT confirmaciones_stock_token_key;
ALTER TABLE ONLY public.confirmaciones_stock DROP CONSTRAINT confirmaciones_stock_pkey;
ALTER TABLE ONLY public.configuracion DROP CONSTRAINT configuracion_pkey;
ALTER TABLE ONLY public.configuracion DROP CONSTRAINT configuracion_clave_key;
ALTER TABLE ONLY public.condiciones_pago DROP CONSTRAINT condiciones_pago_pkey;
ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_pkey;
ALTER TABLE ONLY public.comisiones DROP CONSTRAINT comisiones_pkey;
ALTER TABLE ONLY public.auditoria_precios DROP CONSTRAINT auditoria_precios_pkey;
ALTER TABLE ONLY public.auditoria_pedidos DROP CONSTRAINT auditoria_pedidos_pkey;
ALTER TABLE ONLY public.aplicacion_pagos DROP CONSTRAINT aplicacion_pagos_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_pkey;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_user_client_unique;
ALTER TABLE ONLY auth.oauth_consents DROP CONSTRAINT oauth_consents_pkey;
ALTER TABLE ONLY auth.oauth_clients DROP CONSTRAINT oauth_clients_pkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_pkey;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_authorization_id_key;
ALTER TABLE ONLY auth.oauth_authorizations DROP CONSTRAINT oauth_authorizations_authorization_code_key;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_last_challenged_at_key;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_provider_id_provider_unique;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
ALTER TABLE public.tipos_documento_pago ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reservas_stock ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reservas_pedido ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permisos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.logistica_transportistas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.logistica_envios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.logistica_embalajes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP TABLE supabase_migrations.seed_files;
DROP TABLE supabase_migrations.schema_migrations;
DROP TABLE storage.s3_multipart_uploads_parts;
DROP TABLE storage.s3_multipart_uploads;
DROP TABLE storage.prefixes;
DROP TABLE storage.objects;
DROP TABLE storage.migrations;
DROP TABLE storage.buckets_analytics;
DROP TABLE storage.buckets;
DROP TABLE realtime.subscription;
DROP TABLE realtime.schema_migrations;
DROP TABLE realtime.messages_2025_08_31;
DROP TABLE realtime.messages_2025_08_30;
DROP TABLE realtime.messages_2025_08_29;
DROP TABLE realtime.messages_2025_08_28;
DROP TABLE realtime.messages_2025_08_27;
DROP TABLE realtime.messages_2025_08_26;
DROP TABLE realtime.messages_2025_08_25;
DROP TABLE realtime.messages;
DROP TABLE public.usuario_roles;
DROP SEQUENCE public.tipos_documento_pago_id_seq;
DROP TABLE public.tipos_documento_pago;
DROP TABLE public.tipos_de_cambio;
DROP TABLE public.stock_ajustes;
DROP SEQUENCE public.roles_id_seq;
DROP TABLE public.roles;
DROP TABLE public.rol_permisos;
DROP SEQUENCE public.reservas_stock_id_seq;
DROP TABLE public.reservas_stock;
DROP SEQUENCE public.reservas_pedido_id_seq;
DROP TABLE public.reservas_pedido;
DROP TABLE public.reportes_usabilidad;
DROP TABLE public.reglas_alertas;
DROP TABLE public.proveedores;
DROP TABLE public.proveedor_cuentas_bancarias;
DROP TABLE public.proveedor_contactos;
DROP VIEW public.productos_con_stock;
DROP TABLE public.stock_vendedores;
DROP TABLE public.productos;
DROP SEQUENCE public.permisos_id_seq;
DROP TABLE public.permisos;
DROP TABLE public.pedidos;
DROP SEQUENCE public.pedido_numero_seq;
DROP TABLE public.pagos_comisiones;
DROP TABLE public.pagos;
DROP TABLE public.organizaciones;
DROP SEQUENCE public.oportunidades_numero_propuesta_seq;
DROP TABLE public.oportunidades;
DROP TABLE public.movimientos_cuenta_proveedor;
DROP TABLE public.movimientos_cuenta_corriente;
DROP TABLE public.lotes;
DROP SEQUENCE public.logistica_transportistas_id_seq;
DROP TABLE public.logistica_transportistas;
DROP SEQUENCE public.logistica_envios_id_seq;
DROP TABLE public.logistica_envios;
DROP SEQUENCE public.logistica_embalajes_id_seq;
DROP TABLE public.logistica_embalajes;
DROP TABLE public.interacciones;
DROP TABLE public.facturas_venta;
DROP TABLE public.etapas_venta;
DROP TABLE public.estados_pedido;
DROP TABLE public.estados;
DROP TABLE public.depositos;
DROP TABLE public.cuentas_bancarias;
DROP VIEW public.contactos_vista_completa;
DROP TABLE public.zonas;
DROP TABLE public.vendedores;
DROP TABLE public.perfiles;
DROP TABLE public.contactos;
DROP TABLE public.confirmaciones_stock;
DROP TABLE public.configuracion;
DROP TABLE public.condiciones_pago;
DROP TABLE public.compras;
DROP TABLE public.comisiones;
DROP TABLE public.auditoria_precios;
DROP TABLE public.auditoria_pedidos;
DROP TABLE public.aplicacion_pagos;
DROP TABLE auth.users;
DROP TABLE auth.sso_providers;
DROP TABLE auth.sso_domains;
DROP TABLE auth.sessions;
DROP TABLE auth.schema_migrations;
DROP TABLE auth.saml_relay_states;
DROP TABLE auth.saml_providers;
DROP SEQUENCE auth.refresh_tokens_id_seq;
DROP TABLE auth.refresh_tokens;
DROP TABLE auth.one_time_tokens;
DROP TABLE auth.oauth_consents;
DROP TABLE auth.oauth_clients;
DROP TABLE auth.oauth_authorizations;
DROP TABLE auth.mfa_factors;
DROP TABLE auth.mfa_challenges;
DROP TABLE auth.mfa_amr_claims;
DROP TABLE auth.instances;
DROP TABLE auth.identities;
DROP TABLE auth.flow_state;
DROP TABLE auth.audit_log_entries;
DROP FUNCTION storage.update_updated_at_column();
DROP FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text);
DROP FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION storage.prefixes_insert_trigger();
DROP FUNCTION storage.prefixes_delete_cleanup();
DROP FUNCTION storage.operation();
DROP FUNCTION storage.objects_update_prefix_trigger();
DROP FUNCTION storage.objects_update_level_trigger();
DROP FUNCTION storage.objects_update_cleanup();
DROP FUNCTION storage.objects_insert_prefix_trigger();
DROP FUNCTION storage.objects_delete_cleanup();
DROP FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]);
DROP FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text);
DROP FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
DROP FUNCTION storage.get_size_by_bucket();
DROP FUNCTION storage.get_prefixes(name text);
DROP FUNCTION storage.get_prefix(name text);
DROP FUNCTION storage.get_level(name text);
DROP FUNCTION storage.foldername(name text);
DROP FUNCTION storage.filename(name text);
DROP FUNCTION storage.extension(name text);
DROP FUNCTION storage.enforce_bucket_name_length();
DROP FUNCTION storage.delete_prefix_hierarchy_trigger();
DROP FUNCTION storage.delete_prefix(_bucket_id text, _name text);
DROP FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]);
DROP FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
DROP FUNCTION storage.add_prefixes(_bucket_id text, _name text);
DROP FUNCTION realtime.topic();
DROP FUNCTION realtime.to_regrole(role_name text);
DROP FUNCTION realtime.subscription_check_filters();
DROP FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean);
DROP FUNCTION realtime.quote_wal2json(entity regclass);
DROP FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
DROP FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
DROP FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
DROP FUNCTION realtime."cast"(val text, type_ regtype);
DROP FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
DROP FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
DROP FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer);
DROP FUNCTION public.verificar_pedido_para_logistica(p_pedido_id bigint);
DROP FUNCTION public.upsert_zona_envio(p_zona_data jsonb);
DROP TABLE public.zonas_envio;
DROP FUNCTION public.trigger_set_timestamp();
DROP FUNCTION public.trigger_recalcular_saldo();
DROP FUNCTION public.test_conexion();
DROP FUNCTION public.sync_contact_zone();
DROP FUNCTION public.sugerir_embalaje_pedido(p_pedido_id bigint);
DROP FUNCTION public.solicitar_aprobacion_masiva(p_oportunidad_id bigint, p_solicitudes jsonb, p_justificacion text);
DROP FUNCTION public.sincronizar_saldos_clientes();
DROP FUNCTION public.sincronizar_permisos(p_permisos_nombres text[]);
DROP FUNCTION public.set_usuario_roles(p_usuario_id uuid, p_roles_nombres text[]);
DROP FUNCTION public.set_token_confirmacion_recepcion();
DROP FUNCTION public.set_permisos_para_rol(p_rol_id integer, p_permisos_nombres text[]);
DROP FUNCTION public.set_numero_propuesta();
DROP FUNCTION public.reversar_recepcion_compra(p_compra_id bigint);
DROP FUNCTION public.resolver_solicitud_aprobacion(p_token text, p_aprobado boolean, p_comision_modificada numeric);
DROP FUNCTION public.reservar_stock_pedido(p_pedido_id integer);
DROP FUNCTION public.registrar_y_aplicar_pago_cliente(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_es_cruzado boolean, p_proveedor_id uuid, p_compra_id bigint, p_comprobante_url text, p_user_id uuid);
DROP FUNCTION public.registrar_pago_simple(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_user_id uuid);
DROP FUNCTION public.registrar_pago_proveedor_directo(p_proveedor_id uuid, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date);
DROP FUNCTION public.registrar_pago_completo(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_es_cruzado boolean, p_proveedor_id uuid, p_user_id uuid);
DROP FUNCTION public.registrar_deuda_proveedor();
DROP FUNCTION public.recalcular_saldos_todos_los_clientes();
DROP FUNCTION public.recalcular_saldo_contacto(id_contacto bigint);
DROP FUNCTION public.reassign_and_delete_stage(p_old_etapa_id bigint, p_new_etapa_id bigint);
DROP FUNCTION public.procesar_pedido_y_stock_v2(p_pedido_id bigint);
DROP FUNCTION public.procesar_pedido(p_pedido_id bigint, p_origen_stock text);
DROP FUNCTION public.procesar_confirmacion_pedido_v2(p_pedido_id bigint);
DROP FUNCTION public.ping();
DROP FUNCTION public.pagar_comisiones_vendedor(p_vendedor_id bigint, p_comision_ids bigint[], p_fecha_pago date, p_concepto text, p_comprobante_url text);
DROP FUNCTION public.liberar_reserva_pedido(p_pedido_id integer);
DROP FUNCTION public.is_app_user();
DROP FUNCTION public.handle_public_contact_insert(contact_data jsonb);
DROP FUNCTION public.handle_new_user();
DROP FUNCTION public.handle_event_registration(contact_data jsonb);
DROP FUNCTION public.get_zonas_envio_con_geojson();
DROP FUNCTION public.get_zona_y_costo_por_coordenadas(p_lat double precision, p_lng double precision);
DROP FUNCTION public.get_vista_estacional_cliente(_p_contacto_id bigint, _p_anio integer);
DROP FUNCTION public.get_valor_stock_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_user_roles();
DROP FUNCTION public.get_top_productos_por_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_top_clientes_por_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_todos_los_usuarios_con_roles();
DROP FUNCTION public.get_stock_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_stock_general_completo_v2();
DROP FUNCTION public.get_solicitudes_por_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_solicitudes_pendientes();
DROP FUNCTION public.get_solicitud_para_aprobar(p_token text);
DROP FUNCTION public.get_saldos_todos_proveedores();
DROP FUNCTION public.get_saldos_todos_los_proveedores();
DROP FUNCTION public.get_saldos_todos_los_clientes();
DROP FUNCTION public.get_saldos_clientes_con_detalle_deuda();
DROP FUNCTION public.get_roles_con_permisos();
DROP FUNCTION public.get_resumen_mensual_cliente(p_contacto_id bigint, p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_resumen_liquidaciones(p_mes integer, p_anio integer);
DROP FUNCTION public.get_proximas_acciones_dinamicas(p_vendedor_id bigint);
DROP FUNCTION public.get_proveedores_con_deudas_agrupadas();
DROP FUNCTION public.get_proveedores_con_deuda();
DROP FUNCTION public.get_proveedor_cuentas(p_proveedor_id uuid);
DROP FUNCTION public.get_pedidos_para_logistica_v2();
DROP FUNCTION public.get_pedidos_con_reserva(p_producto_id bigint);
DROP FUNCTION public.get_pedido_saldo(p_pedido_id bigint);
DROP FUNCTION public.get_oportunidades_sin_pedido(p_vendedor_id bigint);
DROP FUNCTION public.get_my_vendedor_id();
DROP FUNCTION public.get_movimientos_ventas(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_movimientos_proveedor(p_proveedor_id uuid);
DROP FUNCTION public.get_movimientos_por_lote(p_lote_id bigint);
DROP FUNCTION public.get_movimientos_compras(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_movimientos_cliente(p_contacto_id bigint);
DROP FUNCTION public.get_movimientos_ajustes(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_kpis_cliente(p_contacto_id bigint);
DROP FUNCTION public.get_inventario_completo();
DROP FUNCTION public.get_initial_crm_data();
DROP FUNCTION public.get_historial_pagos_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_historial_aprobaciones();
DROP FUNCTION public.get_documentos_pendientes_proveedor(p_proveedor_id uuid);
DROP FUNCTION public.get_documentos_pendientes_cliente(p_contacto_id bigint);
DROP FUNCTION public.get_detalle_productos_cliente(p_contacto_id bigint, p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_detalle_productos_agregado_cliente(_p_contacto_id bigint, _p_fecha_desde date, _p_fecha_hasta date);
DROP FUNCTION public.get_detalle_comisiones_pendientes(p_vendedor_id bigint);
DROP FUNCTION public.get_datos_dashboard_vendedor_v2(p_vendedor_id bigint);
DROP FUNCTION public.get_datos_dashboard_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_dashboard_gerencial(p_fecha_desde date, p_fecha_hasta date, p_metodo_costo text);
DROP FUNCTION public.get_dashboard_contacts(p_vendedor_id bigint);
DROP FUNCTION public.get_current_user_vendedor_name();
DROP FUNCTION public.get_costo_ultima_compra(p_producto_id bigint, p_fecha_venta date);
DROP FUNCTION public.get_costo_reposicion(p_producto_id bigint);
DROP FUNCTION public.get_costo_envio_por_coordenadas(p_lat double precision, p_lon double precision);
DROP FUNCTION public.get_contactos_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_contactos_dashboard(p_vendedor_id bigint);
DROP FUNCTION public.get_contactos_con_deuda_calculada();
DROP FUNCTION public.get_contact_timeline(p_contact_id bigint, p_event_type text);
DROP FUNCTION public.get_comprobantes_for_pedido(p_pedido_id bigint);
DROP FUNCTION public.get_comprobante_for_pedido(p_pedido_id bigint);
DROP FUNCTION public.get_comisiones_vendedor_detalle(p_vendedor_id bigint);
DROP FUNCTION public.get_comisiones_pendientes_vendedor(p_vendedor_id bigint);
DROP FUNCTION public.get_analisis_ventas(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_analisis_vendedores(p_fecha_inicio text, p_fecha_fin text);
DROP FUNCTION public.get_analisis_productos(p_fecha_desde date, p_fecha_hasta date, p_vendedor_id bigint);
DROP FUNCTION public.get_analisis_productos(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_analisis_lineas(p_fecha_desde date, p_fecha_hasta date, p_vendedor_id bigint);
DROP FUNCTION public.get_analisis_lineas(p_fecha_desde date, p_fecha_hasta date);
DROP FUNCTION public.get_analisis_evolucion();
DROP FUNCTION public.generar_nuevo_numero_pedido(id_deposito_param integer);
DROP FUNCTION public.generar_comision_si_pedido_esta_saldado();
DROP FUNCTION public.generar_codigo_aleatorio();
DROP FUNCTION public.funcion_auditoria_pedidos();
DROP FUNCTION public.finish_user_setup(p_user_id uuid, p_nombre text, p_roles_nombres text[], p_es_vendedor boolean, p_comision numeric, p_meta numeric);
DROP FUNCTION public.finalizar_resolucion_aprobacion(p_solicitud_id bigint, p_es_aprobado boolean, p_gerente_id uuid);
DROP FUNCTION public.devolver_stock_vendedor_a_deposito(p_lote_id bigint, p_vendedor_id bigint, p_cantidad integer, p_justificacion text, p_operador text);
DROP FUNCTION public.crear_registro_envio(p_pedido_id bigint, p_transportista_id integer);
DROP FUNCTION public.crear_deuda_proveedor_por_compra_v2();
DROP FUNCTION public.confirmar_reserva_pedido(p_pedido_id integer);
DROP FUNCTION public.check_user_permission(p_permiso_nombre text);
DROP FUNCTION public.check_stage_relations(p_etapa_id bigint);
DROP FUNCTION public.check_contact_relations(p_contact_id bigint);
DROP FUNCTION public.calcular_costo_envio(p_zona_destino text, p_valor_productos numeric);
DROP FUNCTION public.auditar_stock_completo();
DROP FUNCTION public.auditar_cambio_precio_producto();
DROP FUNCTION public.asignar_stock_vendedor(p_lote_id bigint, p_vendedor_id bigint, p_cantidad integer);
DROP FUNCTION public.asignar_stock_masivo(p_vendedor_id integer, p_asignaciones jsonb);
DROP FUNCTION public.anular_pedidos_reserva_expirada();
DROP FUNCTION public.anular_pedidos_borrador_antiguos();
DROP FUNCTION public.anular_pedido_v2(p_pedido_id bigint);
DROP FUNCTION public.anular_movimiento_proveedor_desde_pago(p_pago_id bigint);
DROP FUNCTION public.anular_movimiento_proveedor(p_movimiento_id bigint);
DROP FUNCTION public.anular_movimiento_cliente_desde_pago(p_pago_id bigint);
DROP FUNCTION public.anular_movimiento_cliente(p_movimiento_id bigint);
DROP FUNCTION public.ajustar_stock_vendedor(p_lote_id bigint, p_vendedor_id bigint, p_cantidad_ajuste integer, p_justificacion text, p_operador text);
DROP FUNCTION public.ajustar_stock_lote(p_lote_id bigint, p_cantidad_ajuste integer, p_justificacion text, p_operador text);
DROP FUNCTION public.actualizar_saldo_cuenta_corriente();
DROP FUNCTION public.actualizar_precio_producto_pedido(p_pedido_id bigint, p_producto_id bigint, p_nuevo_precio numeric, p_usuario_id uuid, p_usuario_nombre text);
DROP FUNCTION public.actualizar_fecha_ultima_compra();
DROP FUNCTION public.actualizar_estado_pedido_desde_logistica();
DROP FUNCTION public.actualizar_estado_logistica_v2(p_pedido_id bigint, p_nuevo_estado_nombre text);
DROP FUNCTION public.actualizar_estado_envio(p_envio_id bigint, p_nuevo_estado text);
DROP FUNCTION public.actualizar_deuda_total_proveedor();
DROP FUNCTION pgbouncer.get_auth(p_usename text);
DROP FUNCTION extensions.set_graphql_placeholder();
DROP FUNCTION extensions.pgrst_drop_watch();
DROP FUNCTION extensions.pgrst_ddl_watch();
DROP FUNCTION extensions.grant_pg_net_access();
DROP FUNCTION extensions.grant_pg_graphql_access();
DROP FUNCTION extensions.grant_pg_cron_access();
DROP FUNCTION auth.uid();
DROP FUNCTION auth.role();
DROP FUNCTION auth.jwt();
DROP FUNCTION auth.email();
DROP TYPE storage.buckettype;
DROP TYPE realtime.wal_rls;
DROP TYPE realtime.wal_column;
DROP TYPE realtime.user_defined_filter;
DROP TYPE realtime.equality_op;
DROP TYPE realtime.action;
DROP TYPE public.condicion_iva_enum;
DROP TYPE auth.one_time_token_type;
DROP TYPE auth.oauth_response_type;
DROP TYPE auth.oauth_registration_type;
DROP TYPE auth.oauth_client_type;
DROP TYPE auth.oauth_authorization_status;
DROP TYPE auth.factor_type;
DROP TYPE auth.factor_status;
DROP TYPE auth.code_challenge_method;
DROP TYPE auth.aal_level;
DROP EXTENSION "uuid-ossp";
DROP EXTENSION supabase_vault;
DROP EXTENSION postgis;
DROP EXTENSION pgcrypto;
DROP EXTENSION pg_stat_statements;
DROP EXTENSION pg_graphql;
DROP SCHEMA vault;
DROP SCHEMA supabase_migrations;
DROP SCHEMA storage;
DROP SCHEMA realtime;
DROP SCHEMA pgbouncer;
DROP SCHEMA graphql_public;
DROP SCHEMA graphql;
DROP SCHEMA extensions;
DROP EXTENSION pg_cron;
DROP SCHEMA auth;
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: pg_cron; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pg_cron; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA supabase_migrations;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA extensions;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: condicion_iva_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.condicion_iva_enum AS ENUM (
    'Responsable Inscripto',
    'Monotributista',
    'Consumidor Final',
    'Exento',
    'No Responsable'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


--
-- Name: actualizar_deuda_total_proveedor(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_deuda_total_proveedor() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: actualizar_estado_envio(bigint, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_estado_envio(p_envio_id bigint, p_nuevo_estado text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  UPDATE logistica_envios SET estado = p_nuevo_estado WHERE id = p_envio_id;
END;
$$;


--
-- Name: actualizar_estado_logistica_v2(bigint, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_estado_logistica_v2(p_pedido_id bigint, p_nuevo_estado_nombre text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: actualizar_estado_pedido_desde_logistica(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_estado_pedido_desde_logistica() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: actualizar_fecha_ultima_compra(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_fecha_ultima_compra() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    UPDATE public.contactos SET ultima_compra = NEW.created_at::date WHERE id = NEW.contacto_id;
    RETURN NEW;
END;
$$;


--
-- Name: actualizar_precio_producto_pedido(bigint, bigint, numeric, uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_precio_producto_pedido(p_pedido_id bigint, p_producto_id bigint, p_nuevo_precio numeric, p_usuario_id uuid, p_usuario_nombre text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: actualizar_saldo_cuenta_corriente(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.actualizar_saldo_cuenta_corriente() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: ajustar_stock_lote(bigint, integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajustar_stock_lote(p_lote_id bigint, p_cantidad_ajuste integer, p_justificacion text, p_operador text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: ajustar_stock_vendedor(bigint, bigint, integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajustar_stock_vendedor(p_lote_id bigint, p_vendedor_id bigint, p_cantidad_ajuste integer, p_justificacion text, p_operador text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: anular_movimiento_cliente(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_movimiento_cliente(p_movimiento_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: anular_movimiento_cliente_desde_pago(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_movimiento_cliente_desde_pago(p_pago_id bigint) RETURNS void
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    INSERT INTO public.movimientos_cuenta_corriente(cliente_id, concepto, debe, fecha, pago_id) SELECT cliente_id, 'ANULACIÓN de: ' || concepto, haber, CURRENT_DATE, pago_id FROM public.movimientos_cuenta_corriente WHERE pago_id = p_pago_id AND haber > 0 AND NOT EXISTS (SELECT 1 FROM movimientos_cuenta_corriente WHERE pago_id = p_pago_id AND debe > 0);
$$;


--
-- Name: anular_movimiento_proveedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_movimiento_proveedor(p_movimiento_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: anular_movimiento_proveedor_desde_pago(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_movimiento_proveedor_desde_pago(p_pago_id bigint) RETURNS void
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, concepto, debe, fecha, pago_id) SELECT proveedor_id, 'ANULACIÓN de: ' || concepto, haber, CURRENT_DATE, pago_id FROM public.movimientos_cuenta_proveedor WHERE pago_id = p_pago_id AND haber > 0 AND NOT EXISTS (SELECT 1 FROM movimientos_cuenta_proveedor WHERE pago_id = p_pago_id AND debe > 0);
$$;


--
-- Name: anular_pedido_v2(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_pedido_v2(p_pedido_id bigint) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: anular_pedidos_borrador_antiguos(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_pedidos_borrador_antiguos() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: anular_pedidos_reserva_expirada(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.anular_pedidos_reserva_expirada() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: asignar_stock_masivo(integer, jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.asignar_stock_masivo(p_vendedor_id integer, p_asignaciones jsonb) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: asignar_stock_vendedor(bigint, bigint, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.asignar_stock_vendedor(p_lote_id bigint, p_vendedor_id bigint, p_cantidad integer) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: auditar_cambio_precio_producto(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.auditar_cambio_precio_producto() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: auditar_stock_completo(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.auditar_stock_completo() RETURNS TABLE(producto_id bigint, producto_nombre text, lote_id bigint, numero_lote text, cantidad_inicial integer, total_entradas integer, total_salidas integer, stock_fisico_teorico integer, stock_fisico_actual integer, diferencia integer)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: calcular_costo_envio(text, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.calcular_costo_envio(p_zona_destino text, p_valor_productos numeric) RETURNS numeric
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: check_contact_relations(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.check_contact_relations(p_contact_id bigint) RETURNS TABLE(has_opportunities boolean, has_pedidos boolean)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT EXISTS(SELECT 1 FROM oportunidades WHERE contacto_id = p_contact_id) AS has_opportunities,
           EXISTS(SELECT 1 FROM pedidos WHERE contacto_id = p_contact_id) AS has_pedidos;
END;
$$;


--
-- Name: check_stage_relations(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.check_stage_relations(p_etapa_id bigint) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE relations_data jsonb;
BEGIN
    SELECT jsonb_build_object('count', COUNT(*), 'opportunity_names', COALESCE(jsonb_agg(nombre), '[]'::jsonb))
    INTO relations_data FROM public.oportunidades WHERE etapa_id = p_etapa_id;
    RETURN relations_data;
END;
$$;


--
-- Name: check_user_permission(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.check_user_permission(p_permiso_nombre text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE tiene_permiso BOOLEAN; BEGIN SELECT EXISTS (SELECT 1 FROM public.usuario_roles ur JOIN public.rol_permisos rp ON ur.rol_id = rp.rol_id JOIN public.permisos p ON rp.permiso_id = p.id WHERE ur.usuario_id = auth.uid() AND p.nombre_permiso = p_permiso_nombre) INTO tiene_permiso; RETURN tiene_permiso; END; $$;


--
-- Name: confirmar_reserva_pedido(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.confirmar_reserva_pedido(p_pedido_id integer) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: crear_deuda_proveedor_por_compra_v2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.crear_deuda_proveedor_por_compra_v2() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: crear_registro_envio(bigint, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.crear_registro_envio(p_pedido_id bigint, p_transportista_id integer) RETURNS TABLE(id bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
  RETURN QUERY INSERT INTO logistica_envios (pedido_id, transportista_id) VALUES (p_pedido_id, p_transportista_id) RETURNING logistica_envios.id;
END;
$$;


--
-- Name: devolver_stock_vendedor_a_deposito(bigint, bigint, integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.devolver_stock_vendedor_a_deposito(p_lote_id bigint, p_vendedor_id bigint, p_cantidad integer, p_justificacion text, p_operador text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: finalizar_resolucion_aprobacion(bigint, boolean, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.finalizar_resolucion_aprobacion(p_solicitud_id bigint, p_es_aprobado boolean, p_gerente_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: finish_user_setup(uuid, text, text[], boolean, numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.finish_user_setup(p_user_id uuid, p_nombre text, p_roles_nombres text[], p_es_vendedor boolean, p_comision numeric, p_meta numeric) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: funcion_auditoria_pedidos(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.funcion_auditoria_pedidos() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: generar_codigo_aleatorio(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generar_codigo_aleatorio() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $$
BEGIN
    RETURN (SELECT string_agg(substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', floor(random() * 36 + 1)::int, 1), '') FROM generate_series(1, 6));
END;
$$;


--
-- Name: generar_comision_si_pedido_esta_saldado(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generar_comision_si_pedido_esta_saldado() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: generar_nuevo_numero_pedido(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generar_nuevo_numero_pedido(id_deposito_param integer) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_evolucion(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_evolucion() RETURNS TABLE(anio integer, ventas_ars numeric, ventas_usd numeric, pedidos bigint, ticket_promedio_ars numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT EXTRACT(YEAR FROM p.created_at)::int AS anio, SUM(p.valor) AS ventas_ars, SUM(p.valor / NULLIF(tc.valor_venta, 0)) AS ventas_usd, COUNT(DISTINCT p.id)::bigint AS pedidos, COALESCE(AVG(p.valor), 0) as ticket_promedio_ars
    FROM pedidos p LEFT JOIN tipos_de_cambio tc ON tc.fecha = p.created_at::date
    WHERE p.estado_id = 4 GROUP BY 1 ORDER BY 1;
END;
$$;


--
-- Name: get_analisis_lineas(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_lineas(p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(linea text, unidades bigint, ventas_ars numeric, ventas_usd numeric, ventas_ars_anterior numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_lineas(date, date, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_lineas(p_fecha_desde date, p_fecha_hasta date, p_vendedor_id bigint DEFAULT NULL::bigint) RETURNS TABLE(linea text, unidades bigint, ventas_ars numeric, ventas_usd numeric, ventas_ars_anterior numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_productos(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_productos(p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(nombre text, linea text, unidades bigint, ventas_ars numeric, ventas_usd numeric, ventas_ars_anterior numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_productos(date, date, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_productos(p_fecha_desde date, p_fecha_hasta date, p_vendedor_id bigint DEFAULT NULL::bigint) RETURNS TABLE(nombre text, linea text, unidades bigint, ventas_ars numeric, ventas_usd numeric, ventas_ars_anterior numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_vendedores(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_vendedores(p_fecha_inicio text, p_fecha_fin text) RETURNS TABLE(vendedor_id uuid, nombre_vendedor text, ventas_ars numeric, ventas_usd numeric, pedidos bigint, ventas_ars_anterior numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_analisis_ventas(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_analisis_ventas(p_fecha_desde date, p_fecha_hasta date) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_comisiones_pendientes_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_comisiones_pendientes_vendedor(p_vendedor_id bigint) RETURNS TABLE(comision_id bigint, pedido_numero text, cliente_nombre text, monto_comision numeric, fecha_generacion date, fecha_pedido timestamp with time zone)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_comisiones_vendedor_detalle(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_comisiones_vendedor_detalle(p_vendedor_id bigint) RETURNS TABLE(estado text, pedido_numero text, cliente_nombre text, monto_comision numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_comprobante_for_pedido(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_comprobante_for_pedido(p_pedido_id bigint) RETURNS text
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    SELECT p.comprobante_url FROM public.pagos p JOIN public.aplicacion_pagos ap ON p.id = ap.pago_id WHERE ap.documento_id = p_pedido_id AND ap.tipo_documento = 'Pedido' AND p.comprobante_url IS NOT NULL ORDER BY p.fecha_pago DESC, p.id DESC LIMIT 1;
$$;


--
-- Name: get_comprobantes_for_pedido(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_comprobantes_for_pedido(p_pedido_id bigint) RETURNS TABLE(comprobante_url text)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT p.comprobante_url FROM public.pagos p JOIN public.aplicacion_pagos ap ON p.id = ap.pago_id
  WHERE ap.documento_id = p_pedido_id AND ap.tipo_documento = 'Pedido' AND p.comprobante_url IS NOT NULL AND length(trim(p.comprobante_url)) > 5;
$$;


--
-- Name: get_contact_timeline(bigint, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_contact_timeline(p_contact_id bigint, p_event_type text DEFAULT NULL::text) RETURNS TABLE(event_date timestamp with time zone, event_type text, event_title text, event_value numeric, entity_id bigint)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_contactos_con_deuda_calculada(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_contactos_con_deuda_calculada() RETURNS TABLE(id bigint, nombre text, deuda_actual numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY SELECT c.id, c.nombre, SUM(COALESCE(m.debe, 0)) - SUM(COALESCE(m.haber, 0)) AS deuda_actual
    FROM public.contactos c JOIN public.movimientos_cuenta_corriente m ON c.id = m.cliente_id
    GROUP BY c.id, c.nombre HAVING (SUM(COALESCE(m.debe, 0)) - SUM(COALESCE(m.haber, 0))) > 0.01 ORDER BY c.nombre;
END;
$$;


--
-- Name: get_contactos_dashboard(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_contactos_dashboard(p_vendedor_id bigint) RETURNS TABLE(id bigint, nombre text, telefono text, ultima_actividad timestamp with time zone, tipo_actividad text, oportunidades_activas_conteo bigint, oportunidades_activas_valor numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_contactos_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_contactos_vendedor(p_vendedor_id bigint) RETURNS TABLE(id bigint, nombre text, telefono text, ultima_actividad timestamp with time zone, tipo_actividad text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_costo_envio_por_coordenadas(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_costo_envio_por_coordenadas(p_lat double precision, p_lon double precision) RETURNS TABLE(id bigint, nombre text, costo numeric, monto_minimo_bonificacion numeric)
    LANGUAGE plpgsql
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


--
-- Name: get_costo_reposicion(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_costo_reposicion(p_producto_id bigint) RETURNS numeric
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_costo_ultima_compra(bigint, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_costo_ultima_compra(p_producto_id bigint, p_fecha_venta date) RETURNS numeric
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_current_user_vendedor_name(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_current_user_vendedor_name() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE perfil_nombre TEXT; BEGIN SELECT nombre INTO perfil_nombre FROM public.perfiles WHERE id = auth.uid() LIMIT 1; RETURN COALESCE(perfil_nombre, 'Usuario Desconocido'); END; $$;


--
-- Name: get_dashboard_contacts(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_dashboard_contacts(p_vendedor_id bigint) RETURNS TABLE(id bigint, nombre text, ultima_actividad timestamp with time zone, tipo_actividad text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_dashboard_gerencial(date, date, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_dashboard_gerencial(p_fecha_desde date, p_fecha_hasta date, p_metodo_costo text) RETURNS TABLE(ventas_totales_ars numeric, costo_total_ars numeric, rentabilidad_bruta_ars numeric, margen_promedio numeric, meta_global_ars numeric, dinero_por_cobrar_ars numeric, ticket_promedio_ars numeric, ventas_totales_usd numeric, rentabilidad_bruta_usd numeric, ranking_vendedores jsonb, top_productos_rentables jsonb)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_datos_dashboard_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_datos_dashboard_vendedor(p_vendedor_id bigint) RETURNS TABLE(total_por_cobrar_clientes numeric, comisiones_pendientes_pago numeric, cuentas_por_cobrar_detalle jsonb, comisiones_pendientes_detalle jsonb)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_datos_dashboard_vendedor_v2(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_datos_dashboard_vendedor_v2(p_vendedor_id bigint) RETURNS TABLE(meta_ventas numeric, ventas_mes_actual numeric, total_por_cobrar_clientes numeric, comisiones_a_pagar_total numeric, comisiones_potenciales_total numeric, pipeline jsonb, comisiones_pagar_mes_actual numeric, comisiones_pagar_meses_anteriores numeric, comisiones_potenciales_mes_actual numeric, comisiones_potenciales_meses_anteriores numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_detalle_comisiones_pendientes(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_detalle_comisiones_pendientes(p_vendedor_id bigint) RETURNS TABLE(cliente_nombre text, pedido_numero text, monto_comision numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT con.nombre as cliente_nombre, p.numero_pedido, c.monto_comision
    FROM public.comisiones c JOIN public.pedidos p ON c.pedido_id = p.id JOIN public.contactos con ON p.contacto_id = con.id
    WHERE c.vendedor_id = p_vendedor_id AND c.estado = 'pendiente'
    ORDER BY p.created_at DESC;
END;
$$;


--
-- Name: get_detalle_productos_agregado_cliente(bigint, date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_detalle_productos_agregado_cliente(_p_contacto_id bigint, _p_fecha_desde date, _p_fecha_hasta date) RETURNS TABLE(producto_nombre text, unidades_totales bigint, valor_total numeric, precio_promedio numeric, con_promocion bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_detalle_productos_cliente(bigint, date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_detalle_productos_cliente(p_contacto_id bigint, p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(fecha date, producto_nombre text, cantidad integer, valor numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_documentos_pendientes_cliente(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_documentos_pendientes_cliente(p_contacto_id bigint) RETURNS TABLE(documento_id bigint, tipo text, numero text, fecha date, total numeric, saldo_pendiente numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE estado_anulado_id BIGINT; BEGIN SELECT id INTO estado_anulado_id FROM public.estados_pedido WHERE nombre = 'Anulado' LIMIT 1; RETURN QUERY WITH pagos_aplicados AS (SELECT ap.documento_id AS pedido_id, COALESCE(SUM(ap.monto_aplicado), 0) as total_pagado FROM public.aplicacion_pagos ap JOIN public.pedidos ped ON ap.documento_id = ped.id WHERE ap.tipo_documento = 'Pedido' AND ped.contacto_id = p_contacto_id GROUP BY ap.documento_id) SELECT p.id AS documento_id, 'Pedido'::text AS tipo, p.numero_pedido AS numero, p.created_at::DATE AS fecha, p.valor AS total, (p.valor - COALESCE(pa.total_pagado, 0)) AS saldo_pendiente FROM public.pedidos p LEFT JOIN pagos_aplicados pa ON p.id = pa.pedido_id WHERE p.contacto_id = p_contacto_id AND p.estado_id != estado_anulado_id AND (p.valor - COALESCE(pa.total_pagado, 0)) > 0.01 ORDER BY p.created_at ASC; END; $$;


--
-- Name: get_documentos_pendientes_proveedor(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_documentos_pendientes_proveedor(p_proveedor_id uuid) RETURNS TABLE(compra_id bigint, numero_oc text, factura_nro text, fecha date, total numeric, saldo_pendiente numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_historial_aprobaciones(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_historial_aprobaciones() RETURNS TABLE(fecha_decision timestamp with time zone, nombre_gerente text, estado text, nombre_vendedor text, nombre_cliente text, nombre_producto text, precio_original numeric, precio_solicitado numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_historial_pagos_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_historial_pagos_vendedor(p_vendedor_id bigint) RETURNS TABLE(id bigint, fecha_pago date, monto_total numeric, concepto text, comprobante_url text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY
    SELECT pc.id, pc.fecha_pago, pc.monto_total, pc.concepto, pc.comprobante_url
    FROM public.pagos_comisiones pc WHERE pc.vendedor_id = p_vendedor_id
    ORDER BY pc.fecha_pago DESC, pc.id DESC;
END;
$$;


--
-- Name: get_initial_crm_data(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_initial_crm_data() RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_inventario_completo(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_inventario_completo() RETURNS TABLE(producto_id bigint, producto_nombre text, lote_id bigint, numero_lote text, cantidad_inicial integer, stock_teorico bigint, stock_actual_fisico bigint, stock_disponible bigint, stock_reservado bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_kpis_cliente(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_kpis_cliente(p_contacto_id bigint) RETURNS TABLE(total_historico_comprado numeric, compras_mes_actual numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_movimientos_ajustes(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_ajustes(p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(fecha timestamp with time zone, tipo_movimiento text, producto_nombre text, numero_lote text, cantidad integer, origen text, destino text, justificacion text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_movimientos_cliente(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_cliente(p_contacto_id bigint) RETURNS TABLE(id bigint, fecha date, concepto text, debe numeric, haber numeric, pedido_id bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT mcc.id, mcc.fecha, mcc.concepto, mcc.debe, mcc.haber, mcc.pedido_id FROM movimientos_cuenta_corriente mcc WHERE mcc.cliente_id = p_contacto_id ORDER BY mcc.id ASC; END; $$;


--
-- Name: get_movimientos_compras(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_compras(p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(fecha timestamp with time zone, tipo_movimiento text, producto_nombre text, numero_lote text, cantidad integer, origen text, destino text, justificacion text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT c.fecha_emision::timestamp with time zone, 'ENTRADA POR COMPRA'::text, (prod->>'nombre')::text, (SELECT l.numero_lote FROM public.lotes l WHERE l.compra_id = c.id AND l.producto_id = (prod->>'producto_id')::bigint LIMIT 1), (prod->>'cantidad')::integer, prov.nombre AS origen, d.nombre AS destino, 'OC-' || c.id::text || COALESCE(' / Fact: ' || c.factura_proveedor_nro, '')
  FROM public.compras c
  CROSS JOIN LATERAL jsonb_array_elements(c.productos) AS prod
  JOIN public.proveedores prov ON c.proveedor_id = prov.id
  JOIN public.depositos d ON c.deposito_id = d.id
  WHERE c.estado = 'Recibida' AND (p_fecha_desde IS NULL OR c.fecha_emision::date >= p_fecha_desde) AND (p_fecha_hasta IS NULL OR c.fecha_emision::date <= p_fecha_hasta);
$$;


--
-- Name: get_movimientos_por_lote(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_por_lote(p_lote_id bigint) RETURNS TABLE(fecha timestamp with time zone, tipo_movimiento text, cantidad integer, referencia text, detalle text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_movimientos_proveedor(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_proveedor(p_proveedor_id uuid) RETURNS TABLE(id bigint, fecha date, concepto text, debe numeric, haber numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY SELECT mcp.id, mcp.fecha, mcp.concepto, mcp.debe, mcp.haber FROM movimientos_cuenta_proveedor mcp WHERE mcp.proveedor_id = p_proveedor_id ORDER BY mcp.fecha ASC, mcp.created_at ASC;
END;
$$;


--
-- Name: get_movimientos_ventas(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_movimientos_ventas(p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(fecha timestamp with time zone, tipo_movimiento text, producto_nombre text, numero_lote text, cantidad integer, origen text, destino text, justificacion text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_my_vendedor_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_my_vendedor_id() RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE v_vendedor_id BIGINT; BEGIN SELECT vendedor_id INTO v_vendedor_id FROM public.perfiles WHERE id = auth.uid(); RETURN v_vendedor_id; END; $$;


--
-- Name: get_oportunidades_sin_pedido(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_oportunidades_sin_pedido(p_vendedor_id bigint) RETURNS TABLE(oportunidad_id bigint, oportunidad_nombre text, contacto_nombre text, valor numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_pedido_saldo(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_pedido_saldo(p_pedido_id bigint) RETURNS numeric
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    SELECT p.valor - COALESCE((SELECT SUM(ap.monto_aplicado) FROM public.aplicacion_pagos ap WHERE ap.documento_id = p.id AND ap.tipo_documento = 'Pedido'), 0)
    FROM public.pedidos p WHERE p.id = p_pedido_id;
$$;


--
-- Name: get_pedidos_con_reserva(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_pedidos_con_reserva(p_producto_id bigint) RETURNS TABLE(numero_pedido text, cliente_nombre text)
    LANGUAGE plpgsql
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


--
-- Name: get_pedidos_para_logistica_v2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_pedidos_para_logistica_v2() RETURNS TABLE(id bigint, numero_pedido text, contacto_id bigint, valor numeric, condicion_pago_id bigint, estado_id bigint, created_at timestamp with time zone, contactos json, destino text, condicion_pago_nombre text, condicion_pago_dias integer, pagado boolean)
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: get_proveedor_cuentas(uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_proveedor_cuentas(p_proveedor_id uuid) RETURNS TABLE(banco text, alias text, cbu text, numero_cuenta text)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    SELECT banco, alias, cbu, numero_cuenta FROM public.proveedor_cuentas_bancarias WHERE proveedor_id = p_proveedor_id;
$$;


--
-- Name: get_proveedores_con_deuda(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_proveedores_con_deuda() RETURNS TABLE(id uuid, nombre text, deuda_total numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_proveedores_con_deudas_agrupadas(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_proveedores_con_deudas_agrupadas() RETURNS TABLE(proveedor_id uuid, proveedor_nombre text, proveedor_deuda_total numeric, compra_id bigint, compra_fecha date, compra_factura_nro text, compra_total numeric, compra_saldo_pendiente numeric)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_proximas_acciones_dinamicas(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_proximas_acciones_dinamicas(p_vendedor_id bigint) RETURNS TABLE(regla_nombre text, mensaje text, entidad_id bigint, entidad_nombre text, tipo_entidad text, telefono_contacto text, mensaje_whatsapp text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_resumen_liquidaciones(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_resumen_liquidaciones(p_mes integer DEFAULT NULL::integer, p_anio integer DEFAULT NULL::integer) RETURNS TABLE(vendedor_id bigint, nombre_vendedor text, comisiones_a_pagar numeric, comisiones_potenciales numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_resumen_mensual_cliente(bigint, date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_resumen_mensual_cliente(p_contacto_id bigint, p_fecha_desde date, p_fecha_hasta date) RETURNS TABLE(mes_anio text, pedidos_cantidad bigint, valor_total numeric, productos_destacados text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_roles_con_permisos(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_roles_con_permisos() RETURNS TABLE(rol_id integer, nombre_rol text, permisos text[])
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT ('Superadministrador' = ANY(get_user_roles())) THEN RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador.'; END IF;
    RETURN QUERY SELECT r.id as rol_id, r.nombre_rol, COALESCE(ARRAY(SELECT p.nombre_permiso FROM public.rol_permisos rp JOIN public.permisos p ON rp.permiso_id = p.id WHERE rp.rol_id = r.id ORDER BY p.nombre_permiso), '{}'::text[]) as permisos FROM public.roles r ORDER BY r.id;
END;
$$;


--
-- Name: get_saldos_clientes_con_detalle_deuda(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_saldos_clientes_con_detalle_deuda() RETURNS TABLE(id bigint, nombre text, saldo numeric, fecha_deuda_mas_antigua date, dias_condicion_pago integer, antiguedad_deuda integer, dias_vencida integer)
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_saldos_todos_los_clientes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_saldos_todos_los_clientes() RETURNS TABLE(id bigint, nombre text, saldo numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT c.id, c.nombre, (COALESCE(SUM(mcc.debe), 0) - COALESCE(SUM(mcc.haber), 0)) AS saldo_calculado FROM public.contactos c LEFT JOIN public.movimientos_cuenta_corriente mcc ON c.id = mcc.cliente_id GROUP BY c.id, c.nombre ORDER BY c.nombre ASC; END; $$;


--
-- Name: get_saldos_todos_los_proveedores(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_saldos_todos_los_proveedores() RETURNS TABLE(id uuid, nombre text, saldo numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT p.id, p.nombre, (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) AS saldo_actual FROM proveedores p LEFT JOIN movimientos_cuenta_proveedor mcp ON p.id = mcp.proveedor_id GROUP BY p.id, p.nombre HAVING (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) != 0 ORDER BY saldo_actual DESC; END; $$;


--
-- Name: get_saldos_todos_proveedores(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_saldos_todos_proveedores() RETURNS TABLE(id uuid, nombre text, saldo numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN RETURN QUERY SELECT p.id, p.nombre, (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) AS saldo_actual FROM proveedores p LEFT JOIN movimientos_cuenta_proveedor mcp ON p.id = mcp.proveedor_id GROUP BY p.id, p.nombre HAVING (COALESCE(SUM(mcp.debe), 0) - COALESCE(SUM(mcp.haber), 0)) != 0 ORDER BY saldo_actual DESC; END; $$;


--
-- Name: get_solicitud_para_aprobar(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_solicitud_para_aprobar(p_token text) RETURNS TABLE(oportunidad_id bigint, numero_propuesta bigint, vendedor_nombre text, cliente_nombre text, producto_id bigint, producto_nombre text, cantidad integer, precio_original numeric, precio_solicitado numeric, justificacion text, comision_original numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_solicitudes_pendientes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_solicitudes_pendientes() RETURNS TABLE(solicitud_id bigint, oportunidad_id bigint, nombre_oportunidad text, nombre_vendedor text, nombre_cliente text, nombre_producto text, precio_original numeric, precio_solicitado numeric, justificacion text, fecha_solicitud timestamp with time zone, numero_propuesta bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_solicitudes_por_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_solicitudes_por_vendedor(p_vendedor_id bigint) RETURNS TABLE(solicitud_id bigint, nombre_cliente text, nombre_producto text, precio_original numeric, precio_solicitado numeric, estado text, justificacion text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_stock_general_completo_v2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stock_general_completo_v2() RETURNS TABLE(producto_id integer, nombre_producto text, stock_deposito_disponible numeric, stock_deposito_reservado numeric, stock_asignado numeric, stock_total_fisico numeric, stock_por_vendedor jsonb)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_stock_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_stock_vendedor(p_vendedor_id bigint) RETURNS TABLE(producto_nombre text, lote_numero text, fecha_vencimiento date, cantidad_asignada integer)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
    SELECT p.nombre, l.numero_lote, l.fecha_vencimiento, sv.cantidad_asignada
    FROM stock_vendedores sv
    JOIN lotes l ON sv.lote_id = l.id
    JOIN productos p ON l.producto_id = p.id
    WHERE sv.vendedor_id = p_vendedor_id AND sv.cantidad_asignada > 0
    ORDER BY p.nombre, l.fecha_vencimiento;
$$;


--
-- Name: get_todos_los_usuarios_con_roles(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_todos_los_usuarios_con_roles() RETURNS TABLE(usuario_id uuid, vendedor_id bigint, nombre_vendedor text, roles text[])
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_top_clientes_por_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_top_clientes_por_vendedor(p_vendedor_id bigint) RETURNS TABLE(nombre_cliente text, total_comprado numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_top_productos_por_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_top_productos_por_vendedor(p_vendedor_id bigint) RETURNS TABLE(nombre_producto text, unidades_vendidas bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_user_roles(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_user_roles() RETURNS text[]
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE user_roles TEXT[]; BEGIN SELECT array_agg(r.nombre_rol) INTO user_roles FROM public.usuario_roles ur JOIN public.roles r ON ur.rol_id = r.id WHERE ur.usuario_id = auth.uid(); RETURN COALESCE(user_roles, '{}'); END; $$;


--
-- Name: get_valor_stock_vendedor(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_valor_stock_vendedor(p_vendedor_id bigint) RETURNS numeric
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE total_valor numeric;
BEGIN
    SELECT COALESCE(SUM(sv.cantidad_asignada * p.precio_base), 0) INTO total_valor
    FROM stock_vendedores sv JOIN lotes l ON sv.lote_id = l.id JOIN productos p ON l.producto_id = p.id
    WHERE sv.vendedor_id = p_vendedor_id;
    RETURN total_valor;
END;
$$;


--
-- Name: get_vista_estacional_cliente(bigint, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_vista_estacional_cliente(_p_contacto_id bigint, _p_anio integer) RETURNS TABLE(producto_nombre text, ene jsonb, feb jsonb, mar jsonb, abr jsonb, may jsonb, jun jsonb, jul jsonb, ago jsonb, sep jsonb, oct jsonb, nov jsonb, dic jsonb)
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: get_zona_y_costo_por_coordenadas(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_zona_y_costo_por_coordenadas(p_lat double precision, p_lng double precision) RETURNS TABLE(id integer, nombre text, costo numeric, monto_minimo_bonificacion numeric)
    LANGUAGE plpgsql
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


--
-- Name: get_zonas_envio_con_geojson(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_zonas_envio_con_geojson() RETURNS TABLE(id bigint, created_at timestamp with time zone, nombre text, costo numeric, monto_minimo_bonificacion numeric, organizacion_id bigint, geometria jsonb)
    LANGUAGE sql
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


--
-- Name: handle_event_registration(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_event_registration(contact_data jsonb) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE v_estado_pendiente_id bigint; v_nombre_formateado text; v_intereses_array text[]; v_contacto_id bigint; v_email_a_buscar text; BEGIN SELECT id INTO v_estado_pendiente_id FROM public.estados WHERE nombre = 'Pendiente de Aprobación' LIMIT 1; IF v_estado_pendiente_id IS NULL THEN RAISE EXCEPTION 'Estado "Pendiente de Aprobación" no encontrado.'; END IF; v_email_a_buscar := lower(trim(contact_data->>'email')); v_nombre_formateado := INITCAP(contact_data->>'nombre'); v_intereses_array := ARRAY(SELECT jsonb_array_elements_text(contact_data->'productos_interes')); SELECT id INTO v_contacto_id FROM public.contactos WHERE lower(trim(email)) = v_email_a_buscar; IF v_contacto_id IS NOT NULL THEN UPDATE public.contactos SET nombre = v_nombre_formateado, intereses = v_intereses_array, participa_sorteo = true WHERE id = v_contacto_id; ELSE INSERT INTO public.contactos (nombre, email, intereses, estado_id, confirmado_sorteo, participa_sorteo) VALUES (v_nombre_formateado, v_email_a_buscar, v_intereses_array, v_estado_pendiente_id, false, true) RETURNING id INTO v_contacto_id; END IF; RETURN v_contacto_id; END; $$;


--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: handle_public_contact_insert(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_public_contact_insert(contact_data jsonb) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
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


--
-- Name: is_app_user(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_app_user() RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN RETURN EXISTS (SELECT 1 FROM public.perfiles WHERE id = auth.uid()); END; $$;


--
-- Name: liberar_reserva_pedido(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.liberar_reserva_pedido(p_pedido_id integer) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: pagar_comisiones_vendedor(bigint, bigint[], date, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.pagar_comisiones_vendedor(p_vendedor_id bigint, p_comision_ids bigint[], p_fecha_pago date, p_concepto text, p_comprobante_url text) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: ping(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ping() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $$
BEGIN
    RETURN 'pong';
END;
$$;


--
-- Name: procesar_confirmacion_pedido_v2(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.procesar_confirmacion_pedido_v2(p_pedido_id bigint) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: procesar_pedido(bigint, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.procesar_pedido(p_pedido_id bigint, p_origen_stock text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: procesar_pedido_y_stock_v2(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.procesar_pedido_y_stock_v2(p_pedido_id bigint) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: reassign_and_delete_stage(bigint, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reassign_and_delete_stage(p_old_etapa_id bigint, p_new_etapa_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT public.check_user_permission('configuracion:editar:etapas') THEN
        RAISE EXCEPTION 'Acceso denegado: Permiso insuficiente para modificar etapas.';
    END IF;
    UPDATE public.oportunidades SET etapa_id = p_new_etapa_id WHERE etapa_id = p_old_etapa_id;
    DELETE FROM public.etapas_venta WHERE id = p_old_etapa_id;
END;
$$;


--
-- Name: recalcular_saldo_contacto(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.recalcular_saldo_contacto(id_contacto bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE saldo_final NUMERIC;
BEGIN
    SELECT COALESCE(SUM(debe) - SUM(haber), 0) INTO saldo_final FROM public.movimientos_cuenta_corriente WHERE cliente_id = id_contacto;
    UPDATE public.contactos SET deuda_actual = saldo_final WHERE id = id_contacto;
END;
$$;


--
-- Name: recalcular_saldos_todos_los_clientes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.recalcular_saldos_todos_los_clientes() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: registrar_deuda_proveedor(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registrar_deuda_proveedor() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NEW.estado = 'Recibida' AND OLD.estado <> 'Recibida' THEN
        INSERT INTO public.movimientos_cuenta_proveedor(proveedor_id, compra_id, fecha, concepto, debe, haber)
        VALUES(NEW.proveedor_id, NEW.id, NEW.fecha_emision, 'Deuda por OC-' || LPAD(NEW.id::text, 5, '0') || COALESCE(' / Fact. ' || NEW.factura_proveedor_nro, ''), NEW.total_compra, 0);
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: registrar_pago_completo(bigint, numeric, text, text, date, boolean, uuid, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registrar_pago_completo(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_es_cruzado boolean, p_proveedor_id uuid, p_user_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: registrar_pago_proveedor_directo(uuid, numeric, text, text, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registrar_pago_proveedor_directo(p_proveedor_id uuid, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: registrar_pago_simple(bigint, numeric, text, text, date, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registrar_pago_simple(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_user_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: registrar_y_aplicar_pago_cliente(bigint, numeric, text, text, date, boolean, uuid, bigint, text, uuid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.registrar_y_aplicar_pago_cliente(p_contacto_id bigint, p_monto numeric, p_metodo_pago text, p_referencia text, p_fecha_pago date, p_es_cruzado boolean, p_proveedor_id uuid, p_compra_id bigint, p_comprobante_url text, p_user_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: reservar_stock_pedido(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reservar_stock_pedido(p_pedido_id integer) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: resolver_solicitud_aprobacion(text, boolean, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.resolver_solicitud_aprobacion(p_token text, p_aprobado boolean, p_comision_modificada numeric DEFAULT NULL::numeric) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: reversar_recepcion_compra(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.reversar_recepcion_compra(p_compra_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: set_numero_propuesta(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_numero_propuesta() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    NEW.numero_propuesta := nextval('public.oportunidades_numero_propuesta_seq');
    RETURN NEW;
END;
$$;


--
-- Name: set_permisos_para_rol(integer, text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_permisos_para_rol(p_rol_id integer, p_permisos_nombres text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: set_token_confirmacion_recepcion(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_token_confirmacion_recepcion() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'extensions'
    AS $$
BEGIN
  NEW.token_confirmacion_recepcion = gen_random_uuid();
  RETURN NEW;
END;
$$;


--
-- Name: set_usuario_roles(uuid, text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_usuario_roles(p_usuario_id uuid, p_roles_nombres text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: sincronizar_permisos(text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sincronizar_permisos(p_permisos_nombres text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    IF NOT ('Superadministrador' = ANY(public.get_user_roles())) THEN RAISE EXCEPTION 'Acceso denegado: Se requiere rol de Superadministrador para sincronizar permisos.'; END IF;
    WITH permisos_desde_app (nombre) AS (SELECT unnest(p_permisos_nombres))
    INSERT INTO public.permisos (nombre_permiso) SELECT nombre FROM permisos_desde_app ON CONFLICT (nombre_permiso) DO NOTHING;
END;
$$;


--
-- Name: sincronizar_saldos_clientes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sincronizar_saldos_clientes() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: solicitar_aprobacion_masiva(bigint, jsonb, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.solicitar_aprobacion_masiva(p_oportunidad_id bigint, p_solicitudes jsonb, p_justificacion text) RETURNS jsonb
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public', 'extensions'
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


--
-- Name: sugerir_embalaje_pedido(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sugerir_embalaje_pedido(p_pedido_id bigint) RETURNS TABLE(embalaje_sugerido_id integer, peso_total_gr integer)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: sync_contact_zone(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.sync_contact_zone() RETURNS trigger
    LANGUAGE plpgsql
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


--
-- Name: test_conexion(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.test_conexion() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $$
BEGIN
    RETURN 'Conexión y ejecución exitosa desde la base de datos';
END;
$$;


--
-- Name: trigger_recalcular_saldo(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_recalcular_saldo() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: zonas_envio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zonas_envio (
    id bigint NOT NULL,
    nombre text NOT NULL,
    costo numeric NOT NULL,
    monto_minimo_bonificacion numeric,
    organizacion_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    geometria extensions.geography(Polygon,4326)
);


--
-- Name: upsert_zona_envio(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.upsert_zona_envio(p_zona_data jsonb) RETURNS SETOF public.zonas_envio
    LANGUAGE plpgsql SECURITY DEFINER
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


--
-- Name: verificar_pedido_para_logistica(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verificar_pedido_para_logistica(p_pedido_id bigint) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
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


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: aplicacion_pagos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aplicacion_pagos (
    id bigint NOT NULL,
    pago_id bigint NOT NULL,
    monto_aplicado numeric(12,2) NOT NULL,
    documento_id bigint NOT NULL,
    tipo_documento text NOT NULL
);


--
-- Name: TABLE aplicacion_pagos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.aplicacion_pagos IS 'Tabla flexible que conecta un pago con los documentos que salda (pedidos o facturas).';


--
-- Name: aplicacion_pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.aplicacion_pagos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.aplicacion_pagos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auditoria_pedidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditoria_pedidos (
    id bigint NOT NULL,
    pedido_id bigint,
    fecha_modificacion timestamp with time zone DEFAULT now(),
    usuario_modificacion text DEFAULT 'sistema'::text,
    campo_modificado text NOT NULL,
    valor_anterior text,
    valor_nuevo text,
    descripcion text
);


--
-- Name: auditoria_pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auditoria_pedidos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auditoria_pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auditoria_precios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditoria_precios (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    usuario_id uuid,
    usuario_nombre text,
    entidad_tipo text NOT NULL,
    entidad_id bigint NOT NULL,
    producto_id bigint,
    precio_anterior numeric,
    precio_nuevo numeric NOT NULL,
    justificacion text
);


--
-- Name: TABLE auditoria_precios; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.auditoria_precios IS 'Registra cada cambio de precio manual realizado por un gerente.';


--
-- Name: auditoria_precios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auditoria_precios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auditoria_precios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comisiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comisiones (
    id bigint NOT NULL,
    pedido_id bigint NOT NULL,
    vendedor_id bigint NOT NULL,
    monto_comision numeric NOT NULL,
    porcentaje_aplicado numeric NOT NULL,
    estado text DEFAULT 'pendiente'::text NOT NULL,
    fecha_generacion timestamp with time zone DEFAULT now(),
    pago_comision_id bigint
);


--
-- Name: comisiones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.comisiones ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.comisiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: compras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.compras (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    proveedor_id uuid NOT NULL,
    fecha_emision date,
    fecha_recepcion_prevista date,
    estado text,
    total_compra numeric,
    productos jsonb,
    deposito_id bigint,
    factura_proveedor_nro text,
    organizacion_id bigint NOT NULL
);


--
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.compras ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.compras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: condiciones_pago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.condiciones_pago (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL,
    dias integer DEFAULT 0 NOT NULL
);


--
-- Name: condiciones_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.condiciones_pago ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.condiciones_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: configuracion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.configuracion (
    id bigint NOT NULL,
    clave text NOT NULL,
    valor text
);


--
-- Name: configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.configuracion ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.configuracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: confirmaciones_stock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.confirmaciones_stock (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    vendedor_id bigint NOT NULL,
    asignacion_id bigint NOT NULL,
    token text NOT NULL,
    estado text DEFAULT 'Pendiente'::text,
    fecha_confirmacion timestamp with time zone
);


--
-- Name: confirmaciones_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.confirmaciones_stock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.confirmaciones_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contactos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contactos (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL,
    cuit text,
    email text,
    telefono text,
    profesion text,
    especialidades text[],
    ultima_compra date,
    domicilio_fiscal jsonb,
    direccion_entrega jsonb,
    direccion_entrega_2 jsonb,
    vendedor_id bigint,
    estado_id bigint,
    zona text,
    clasificacion text,
    pais text,
    deuda_actual numeric DEFAULT 0,
    condicion_pago_id bigint,
    productos_habituales text,
    entrega_en_sucursal boolean DEFAULT false,
    fecha_ultimo_contacto timestamp with time zone,
    historial_whatsapp jsonb,
    condicion_iva public.condicion_iva_enum,
    requiere_factura boolean DEFAULT false,
    porcentaje_facturacion_preferido numeric,
    limite_credito numeric DEFAULT 1.00 NOT NULL,
    intereses text[],
    codigo_confirmacion text,
    confirmado_sorteo boolean DEFAULT false,
    participa_sorteo boolean DEFAULT false,
    razon_social text,
    numero_iibb text,
    iibb_jurisdiccion text,
    regimen_percepcion_iibb text,
    alicuota_percepcion_iibb numeric,
    fecha_ultima_consulta_padron date,
    zona_id bigint,
    organizacion_id bigint NOT NULL
);


--
-- Name: COLUMN contactos.zona_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contactos.zona_id IS 'FK a la tabla de zonas para el nuevo frontend. Sincronizado con la columna "zona" de texto mediante un trigger.';


--
-- Name: contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.contactos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: perfiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.perfiles (
    id uuid NOT NULL,
    vendedor_id bigint,
    nombre text,
    email text,
    telefono text,
    foto_url text,
    created_at timestamp with time zone DEFAULT now(),
    organizacion_id bigint NOT NULL
);


--
-- Name: vendedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendedores (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tipo text,
    direccion jsonb,
    porcentaje_comision numeric DEFAULT 0,
    meta_ventas numeric DEFAULT 0
);


--
-- Name: zonas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zonas (
    id bigint NOT NULL,
    nombre text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: contactos_vista_completa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.contactos_vista_completa AS
 SELECT c.id,
    c.created_at,
    c.nombre,
    c.cuit,
    c.email,
    c.telefono,
    c.profesion,
    c.especialidades,
    c.ultima_compra,
    c.domicilio_fiscal,
    c.direccion_entrega,
    c.direccion_entrega_2,
    c.vendedor_id,
    c.estado_id,
    c.zona,
    c.clasificacion,
    c.pais,
    c.deuda_actual,
    c.condicion_pago_id,
    c.productos_habituales,
    c.entrega_en_sucursal,
    c.fecha_ultimo_contacto,
    c.historial_whatsapp,
    c.condicion_iva,
    c.requiere_factura,
    c.porcentaje_facturacion_preferido,
    c.limite_credito,
    c.intereses,
    c.codigo_confirmacion,
    c.confirmado_sorteo,
    c.participa_sorteo,
    c.razon_social,
    c.numero_iibb,
    c.iibb_jurisdiccion,
    c.regimen_percepcion_iibb,
    c.alicuota_percepcion_iibb,
    c.fecha_ultima_consulta_padron,
    c.zona_id,
    p.nombre AS vendedor_nombre,
    z.nombre AS zona_nombre
   FROM (((public.contactos c
     LEFT JOIN public.vendedores v ON ((c.vendedor_id = v.id)))
     LEFT JOIN public.perfiles p ON ((p.vendedor_id = v.id)))
     LEFT JOIN public.zonas z ON ((c.zona_id = z.id)));


--
-- Name: cuentas_bancarias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuentas_bancarias (
    id bigint NOT NULL,
    banco text NOT NULL,
    alias text,
    cbu_cvu text NOT NULL,
    cuit text,
    created_at timestamp with time zone DEFAULT now(),
    numero_cuenta text,
    sucursal text,
    organizacion_id bigint NOT NULL
);


--
-- Name: cuentas_bancarias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.cuentas_bancarias ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cuentas_bancarias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: depositos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.depositos (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL
);


--
-- Name: depositos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.depositos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.depositos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: estados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estados (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text
);


--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.estados ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: estados_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estados_pedido (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL,
    orden smallint
);


--
-- Name: estados_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.estados_pedido ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.estados_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: etapas_venta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.etapas_venta (
    id bigint NOT NULL,
    nombre text NOT NULL,
    orden integer NOT NULL
);


--
-- Name: etapas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.etapas_venta ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.etapas_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: facturas_venta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.facturas_venta (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    pedido_id bigint,
    contacto_id bigint NOT NULL,
    numero_factura text,
    fecha_emision date NOT NULL,
    fecha_vencimiento date,
    subtotal numeric(12,2) DEFAULT 0,
    monto_iva_21 numeric(12,2) DEFAULT 0,
    monto_iva_10_5 numeric(12,2) DEFAULT 0,
    monto_percepcion_iibb numeric(12,2) DEFAULT 0,
    monto_percepcion_iva numeric(12,2) DEFAULT 0,
    total_facturado numeric(12,2) NOT NULL,
    estado text DEFAULT 'Pendiente de Pago'::text NOT NULL,
    cae text,
    cae_vencimiento date,
    productos_facturados jsonb
);


--
-- Name: TABLE facturas_venta; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.facturas_venta IS 'Almacena las facturas de venta emitidas a los clientes.';


--
-- Name: facturas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.facturas_venta ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facturas_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: interacciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interacciones (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    contacto_id bigint NOT NULL,
    tipo text NOT NULL,
    resumen text NOT NULL,
    user_id uuid,
    fecha_proximo_seguimiento date
);


--
-- Name: interacciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.interacciones ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.interacciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: logistica_embalajes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logistica_embalajes (
    id integer NOT NULL,
    nombre text NOT NULL,
    tipo text NOT NULL,
    dimensiones_cm jsonb NOT NULL,
    peso_gr integer NOT NULL,
    volumen_cm3 integer GENERATED ALWAYS AS (((((dimensiones_cm ->> 'largo'::text))::integer * ((dimensiones_cm ->> 'ancho'::text))::integer) * ((dimensiones_cm ->> 'alto'::text))::integer)) STORED,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT logistica_embalajes_tipo_check CHECK ((tipo = ANY (ARRAY['Caja'::text, 'Bolsa'::text])))
);


--
-- Name: logistica_embalajes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logistica_embalajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistica_embalajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logistica_embalajes_id_seq OWNED BY public.logistica_embalajes.id;


--
-- Name: logistica_envios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logistica_envios (
    id bigint NOT NULL,
    pedido_id bigint NOT NULL,
    transportista_id integer,
    estado text DEFAULT 'Por Preparar'::text NOT NULL,
    tracking_number text,
    costo_envio numeric(10,2),
    etiqueta_url text,
    datos_api_respuesta jsonb,
    created_at timestamp with time zone DEFAULT now(),
    despachado_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now(),
    cliente_confirmado_recepcion boolean DEFAULT false,
    token_confirmacion_recepcion uuid
);


--
-- Name: logistica_envios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logistica_envios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistica_envios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logistica_envios_id_seq OWNED BY public.logistica_envios.id;


--
-- Name: logistica_transportistas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logistica_transportistas (
    id integer NOT NULL,
    nombre text NOT NULL,
    tipo text NOT NULL,
    api_endpoint text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT logistica_transportistas_tipo_check CHECK ((tipo = ANY (ARRAY['api_integrada'::text, 'manual'::text])))
);


--
-- Name: logistica_transportistas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logistica_transportistas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logistica_transportistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logistica_transportistas_id_seq OWNED BY public.logistica_transportistas.id;


--
-- Name: lotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lotes (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    producto_id bigint NOT NULL,
    numero_lote text NOT NULL,
    fecha_vencimiento date,
    cantidad_inicial integer NOT NULL,
    stock_disponible integer NOT NULL,
    fecha_ingreso timestamp with time zone DEFAULT now(),
    compra_id bigint,
    stock_reservado integer DEFAULT 0 NOT NULL,
    CONSTRAINT lotes_stock_reservado_nn CHECK ((stock_reservado >= 0))
);


--
-- Name: lotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.lotes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movimientos_cuenta_corriente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimientos_cuenta_corriente (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    cliente_id bigint,
    pedido_id bigint,
    pago_id bigint,
    fecha date,
    concepto text,
    debe numeric(12,2) DEFAULT 0,
    haber numeric(12,2) DEFAULT 0
);


--
-- Name: movimientos_cuenta_corriente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.movimientos_cuenta_corriente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movimientos_cuenta_corriente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movimientos_cuenta_proveedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movimientos_cuenta_proveedor (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    proveedor_id uuid,
    compra_id bigint,
    pago_id bigint,
    fecha date,
    concepto text,
    debe numeric(12,2) DEFAULT 0,
    haber numeric(12,2) DEFAULT 0
);


--
-- Name: TABLE movimientos_cuenta_proveedor; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.movimientos_cuenta_proveedor IS 'Registra el historial de deudas y pagos a proveedores.';


--
-- Name: movimientos_cuenta_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.movimientos_cuenta_proveedor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movimientos_cuenta_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: oportunidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oportunidades (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL,
    valor numeric,
    contacto_id bigint NOT NULL,
    vendedor_id bigint,
    etapa_id bigint,
    fecha_cierre_prevista date,
    numero_propuesta bigint,
    productos jsonb,
    condicion_pago_id bigint,
    organizacion_id bigint NOT NULL,
    observaciones text
);


--
-- Name: oportunidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.oportunidades ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.oportunidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: oportunidades_numero_propuesta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oportunidades_numero_propuesta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizaciones (
    id bigint NOT NULL,
    nombre text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: organizaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.organizaciones ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.organizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pagos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagos (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    contacto_id bigint NOT NULL,
    fecha_pago date NOT NULL,
    monto numeric(12,2) NOT NULL,
    metodo_pago text NOT NULL,
    referencia text,
    cuenta_bancaria_id bigint,
    es_pago_cruzado boolean DEFAULT false,
    comprobante_url text,
    user_id uuid DEFAULT auth.uid()
);


--
-- Name: TABLE pagos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.pagos IS 'Registra los pagos recibidos de los clientes.';


--
-- Name: pagos_comisiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagos_comisiones (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    fecha_pago date NOT NULL,
    vendedor_id bigint NOT NULL,
    monto_total numeric NOT NULL,
    concepto text,
    comprobante_url text
);


--
-- Name: pagos_comisiones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pagos_comisiones ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pagos_comisiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pagos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pagos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pedido_numero_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pedido_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pedidos (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    numero_pedido text NOT NULL,
    oportunidad_id bigint,
    contacto_id bigint NOT NULL,
    vendedor_id bigint,
    deposito_principal_id bigint NOT NULL,
    estado_id bigint NOT NULL,
    productos jsonb,
    valor numeric,
    direccion_entrega jsonb,
    dia_hora_entrega text,
    observaciones text,
    pagos_efectuados numeric,
    cobrar_en_entrega boolean DEFAULT false,
    monto_a_cobrar numeric DEFAULT 0,
    condicion_pago_id bigint,
    estado_pago text DEFAULT 'Pendiente'::text,
    origen_stock text,
    fecha_entrega_prevista date,
    reserva_creada boolean DEFAULT false NOT NULL,
    reserva_confirmada boolean DEFAULT false NOT NULL,
    modalidad_entrega text DEFAULT 'DOMICILIO'::text NOT NULL,
    organizacion_id bigint NOT NULL,
    CONSTRAINT pedidos_modalidad_entrega_check CHECK ((modalidad_entrega = ANY (ARRAY['DOMICILIO'::text, 'SUCURSAL_CORREO'::text, 'OFICINA_COMERCIAL'::text])))
);


--
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pedidos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pedidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: permisos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permisos (
    id integer NOT NULL,
    nombre_permiso text NOT NULL,
    descripcion text
);


--
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permisos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permisos_id_seq OWNED BY public.permisos.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.productos (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    nombre text NOT NULL,
    linea_marca text,
    categoria text,
    sku text,
    origen text,
    composicion text,
    presentacion text,
    especificaciones_adicionales jsonb,
    precio_base numeric,
    precios_escalonados jsonb,
    permite_combinacion boolean DEFAULT false,
    documentos jsonb,
    deposito_default_id bigint,
    peso_gr integer,
    dimensiones_cm jsonb
);


--
-- Name: COLUMN productos.deposito_default_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.productos.deposito_default_id IS 'Deposito por defecto';


--
-- Name: COLUMN productos.peso_gr; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.productos.peso_gr IS 'Peso del producto en gramos';


--
-- Name: COLUMN productos.dimensiones_cm; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.productos.dimensiones_cm IS 'Dimensiones en cm. Formato: {"largo": 10, "ancho": 8, "alto": 5}';


--
-- Name: stock_vendedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_vendedores (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    vendedor_id bigint NOT NULL,
    lote_id bigint NOT NULL,
    cantidad_asignada integer NOT NULL
);


--
-- Name: productos_con_stock; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.productos_con_stock WITH (security_invoker='true') AS
 SELECT p.id,
    p.created_at,
    p.nombre,
    p.linea_marca,
    p.categoria,
    p.sku,
    p.origen,
    p.composicion,
    p.presentacion,
    p.especificaciones_adicionales,
    p.precio_base,
    p.precios_escalonados,
    p.permite_combinacion,
    p.documentos,
    ((COALESCE(stock_deposito.total_disponible, (0)::bigint) + COALESCE(stock_deposito.total_reservado, (0)::bigint)) + COALESCE(stock_asignado.total_asignado, (0)::bigint)) AS stock_total,
    stock_deposito.proximo_vencimiento
   FROM ((public.productos p
     LEFT JOIN ( SELECT l.producto_id,
            sum(l.stock_disponible) AS total_disponible,
            sum(l.stock_reservado) AS total_reservado,
            min(
                CASE
                    WHEN ((l.stock_disponible > 0) AND (l.fecha_vencimiento >= CURRENT_DATE)) THEN l.fecha_vencimiento
                    ELSE NULL::date
                END) AS proximo_vencimiento
           FROM public.lotes l
          GROUP BY l.producto_id) stock_deposito ON ((p.id = stock_deposito.producto_id)))
     LEFT JOIN ( SELECT l.producto_id,
            sum(sv.cantidad_asignada) AS total_asignado
           FROM (public.stock_vendedores sv
             JOIN public.lotes l ON ((sv.lote_id = l.id)))
          GROUP BY l.producto_id) stock_asignado ON ((p.id = stock_asignado.producto_id)));


--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.productos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: proveedor_contactos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedor_contactos (
    id bigint NOT NULL,
    proveedor_id uuid NOT NULL,
    tipo text NOT NULL,
    nombre text,
    telefono text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: proveedor_contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.proveedor_contactos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.proveedor_contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: proveedor_cuentas_bancarias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedor_cuentas_bancarias (
    id bigint NOT NULL,
    proveedor_id uuid NOT NULL,
    banco text,
    alias text,
    cbu text,
    numero_cuenta text,
    sucursal text,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: proveedor_cuentas_bancarias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.proveedor_cuentas_bancarias ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.proveedor_cuentas_bancarias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedores (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    nombre text NOT NULL,
    cuit text,
    telefono text,
    email text,
    condicion_pago_id bigint,
    direccion jsonb,
    deuda_actual numeric(12,2) DEFAULT 0
);


--
-- Name: reglas_alertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reglas_alertas (
    id bigint NOT NULL,
    nombre_regla text NOT NULL,
    descripcion text,
    entidad text NOT NULL,
    condicion_sql text NOT NULL,
    mensaje_alerta text NOT NULL,
    activa boolean DEFAULT true NOT NULL,
    mensaje_whatsapp text
);


--
-- Name: reglas_alertas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reglas_alertas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reglas_alertas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reportes_usabilidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reportes_usabilidad (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    area_crm text NOT NULL,
    descripcion text NOT NULL,
    estado text DEFAULT 'Pendiente'::text NOT NULL,
    reportado_por text,
    prioridad text DEFAULT 'Media'::text,
    prompt_generado text
);


--
-- Name: reportes_usabilidad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.reportes_usabilidad ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reportes_usabilidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reservas_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservas_pedido (
    id bigint NOT NULL,
    pedido_id integer NOT NULL,
    producto_id integer NOT NULL,
    lote_id integer NOT NULL,
    cantidad numeric NOT NULL,
    confirmado boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT reservas_pedido_cantidad_check CHECK ((cantidad > (0)::numeric))
);


--
-- Name: reservas_pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservas_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservas_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservas_pedido_id_seq OWNED BY public.reservas_pedido.id;


--
-- Name: reservas_stock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservas_stock (
    id bigint NOT NULL,
    pedido_id bigint NOT NULL,
    lote_id bigint NOT NULL,
    cantidad_reservada integer NOT NULL,
    fecha_expiracion timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: reservas_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservas_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservas_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservas_stock_id_seq OWNED BY public.reservas_stock.id;


--
-- Name: rol_permisos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rol_permisos (
    rol_id integer NOT NULL,
    permiso_id integer NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre_rol text NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: stock_ajustes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_ajustes (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    producto_id bigint NOT NULL,
    lote_id bigint,
    tipo_ajuste text NOT NULL,
    cantidad integer NOT NULL,
    justificacion text NOT NULL,
    operador text
);


--
-- Name: stock_ajustes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stock_ajustes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stock_ajustes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stock_vendedores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stock_vendedores ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stock_vendedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tipos_de_cambio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipos_de_cambio (
    fecha date NOT NULL,
    moneda text DEFAULT 'USD'::text NOT NULL,
    valor_venta numeric(10,2) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: tipos_documento_pago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipos_documento_pago (
    id integer NOT NULL,
    nombre text NOT NULL
);


--
-- Name: tipos_documento_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipos_documento_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipos_documento_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipos_documento_pago_id_seq OWNED BY public.tipos_documento_pago.id;


--
-- Name: usuario_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario_roles (
    usuario_id uuid NOT NULL,
    rol_id integer NOT NULL
);


--
-- Name: vendedores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.vendedores ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: zonas_envio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.zonas_envio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.zonas_envio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: zonas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.zonas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.zonas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


--
-- Name: messages_2025_08_25; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_25 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_26; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_26 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_27; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_27 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_28; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_28 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_29; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_29 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_30; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_30 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: messages_2025_08_31; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2025_08_31 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: -
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


--
-- Name: seed_files; Type: TABLE; Schema: supabase_migrations; Owner: -
--

CREATE TABLE supabase_migrations.seed_files (
    path text NOT NULL,
    hash text NOT NULL
);


--
-- Name: messages_2025_08_25; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_25 FOR VALUES FROM ('2025-08-25 00:00:00') TO ('2025-08-26 00:00:00');


--
-- Name: messages_2025_08_26; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_26 FOR VALUES FROM ('2025-08-26 00:00:00') TO ('2025-08-27 00:00:00');


--
-- Name: messages_2025_08_27; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_27 FOR VALUES FROM ('2025-08-27 00:00:00') TO ('2025-08-28 00:00:00');


--
-- Name: messages_2025_08_28; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_28 FOR VALUES FROM ('2025-08-28 00:00:00') TO ('2025-08-29 00:00:00');


--
-- Name: messages_2025_08_29; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_29 FOR VALUES FROM ('2025-08-29 00:00:00') TO ('2025-08-30 00:00:00');


--
-- Name: messages_2025_08_30; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_30 FOR VALUES FROM ('2025-08-30 00:00:00') TO ('2025-08-31 00:00:00');


--
-- Name: messages_2025_08_31; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_08_31 FOR VALUES FROM ('2025-08-31 00:00:00') TO ('2025-09-01 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: logistica_embalajes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_embalajes ALTER COLUMN id SET DEFAULT nextval('public.logistica_embalajes_id_seq'::regclass);


--
-- Name: logistica_envios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_envios ALTER COLUMN id SET DEFAULT nextval('public.logistica_envios_id_seq'::regclass);


--
-- Name: logistica_transportistas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_transportistas ALTER COLUMN id SET DEFAULT nextval('public.logistica_transportistas_id_seq'::regclass);


--
-- Name: permisos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permisos ALTER COLUMN id SET DEFAULT nextval('public.permisos_id_seq'::regclass);


--
-- Name: reservas_pedido id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_pedido ALTER COLUMN id SET DEFAULT nextval('public.reservas_pedido_id_seq'::regclass);


--
-- Name: reservas_stock id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_stock ALTER COLUMN id SET DEFAULT nextval('public.reservas_stock_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: tipos_documento_pago id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_documento_pago ALTER COLUMN id SET DEFAULT nextval('public.tipos_documento_pago_id_seq'::regclass);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: aplicacion_pagos aplicacion_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aplicacion_pagos
    ADD CONSTRAINT aplicacion_pagos_pkey PRIMARY KEY (id);


--
-- Name: auditoria_pedidos auditoria_pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_pedidos
    ADD CONSTRAINT auditoria_pedidos_pkey PRIMARY KEY (id);


--
-- Name: auditoria_precios auditoria_precios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_precios
    ADD CONSTRAINT auditoria_precios_pkey PRIMARY KEY (id);


--
-- Name: comisiones comisiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comisiones
    ADD CONSTRAINT comisiones_pkey PRIMARY KEY (id);


--
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- Name: condiciones_pago condiciones_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condiciones_pago
    ADD CONSTRAINT condiciones_pago_pkey PRIMARY KEY (id);


--
-- Name: configuracion configuracion_clave_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_clave_key UNIQUE (clave);


--
-- Name: configuracion configuracion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (id);


--
-- Name: confirmaciones_stock confirmaciones_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.confirmaciones_stock
    ADD CONSTRAINT confirmaciones_stock_pkey PRIMARY KEY (id);


--
-- Name: confirmaciones_stock confirmaciones_stock_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.confirmaciones_stock
    ADD CONSTRAINT confirmaciones_stock_token_key UNIQUE (token);


--
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- Name: cuentas_bancarias cuentas_bancarias_cbu_cvu_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_cbu_cvu_key UNIQUE (cbu_cvu);


--
-- Name: cuentas_bancarias cuentas_bancarias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_pkey PRIMARY KEY (id);


--
-- Name: depositos depositos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.depositos
    ADD CONSTRAINT depositos_pkey PRIMARY KEY (id);


--
-- Name: estados_pedido estados_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estados_pedido
    ADD CONSTRAINT estados_pedido_pkey PRIMARY KEY (id);


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: etapas_venta etapas_venta_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.etapas_venta
    ADD CONSTRAINT etapas_venta_nombre_unique UNIQUE (nombre);


--
-- Name: etapas_venta etapas_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.etapas_venta
    ADD CONSTRAINT etapas_venta_pkey PRIMARY KEY (id);


--
-- Name: facturas_venta facturas_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facturas_venta
    ADD CONSTRAINT facturas_venta_pkey PRIMARY KEY (id);


--
-- Name: interacciones interacciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_pkey PRIMARY KEY (id);


--
-- Name: logistica_embalajes logistica_embalajes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_embalajes
    ADD CONSTRAINT logistica_embalajes_pkey PRIMARY KEY (id);


--
-- Name: logistica_envios logistica_envios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_envios
    ADD CONSTRAINT logistica_envios_pkey PRIMARY KEY (id);


--
-- Name: logistica_transportistas logistica_transportistas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_transportistas
    ADD CONSTRAINT logistica_transportistas_nombre_key UNIQUE (nombre);


--
-- Name: logistica_transportistas logistica_transportistas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_transportistas
    ADD CONSTRAINT logistica_transportistas_pkey PRIMARY KEY (id);


--
-- Name: lotes lotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lotes
    ADD CONSTRAINT lotes_pkey PRIMARY KEY (id);


--
-- Name: movimientos_cuenta_corriente movimientos_cuenta_corriente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_corriente
    ADD CONSTRAINT movimientos_cuenta_corriente_pkey PRIMARY KEY (id);


--
-- Name: movimientos_cuenta_proveedor movimientos_cuenta_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_proveedor
    ADD CONSTRAINT movimientos_cuenta_proveedor_pkey PRIMARY KEY (id);


--
-- Name: oportunidades oportunidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_pkey PRIMARY KEY (id);


--
-- Name: organizaciones organizaciones_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizaciones
    ADD CONSTRAINT organizaciones_nombre_key UNIQUE (nombre);


--
-- Name: organizaciones organizaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizaciones
    ADD CONSTRAINT organizaciones_pkey PRIMARY KEY (id);


--
-- Name: pagos_comisiones pagos_comisiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagos_comisiones
    ADD CONSTRAINT pagos_comisiones_pkey PRIMARY KEY (id);


--
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


--
-- Name: perfiles perfiles_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_email_key UNIQUE (email);


--
-- Name: perfiles perfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_pkey PRIMARY KEY (id);


--
-- Name: perfiles perfiles_vendedor_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_vendedor_id_key UNIQUE (vendedor_id);


--
-- Name: permisos permisos_nombre_permiso_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_nombre_permiso_key UNIQUE (nombre_permiso);


--
-- Name: permisos permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: productos productos_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_sku_key UNIQUE (sku);


--
-- Name: proveedor_contactos proveedor_contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor_contactos
    ADD CONSTRAINT proveedor_contactos_pkey PRIMARY KEY (id);


--
-- Name: proveedor_cuentas_bancarias proveedor_cuentas_bancarias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor_cuentas_bancarias
    ADD CONSTRAINT proveedor_cuentas_bancarias_pkey PRIMARY KEY (id);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: reglas_alertas reglas_alertas_nombre_regla_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reglas_alertas
    ADD CONSTRAINT reglas_alertas_nombre_regla_key UNIQUE (nombre_regla);


--
-- Name: reglas_alertas reglas_alertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reglas_alertas
    ADD CONSTRAINT reglas_alertas_pkey PRIMARY KEY (id);


--
-- Name: reportes_usabilidad reportes_usabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reportes_usabilidad
    ADD CONSTRAINT reportes_usabilidad_pkey PRIMARY KEY (id);


--
-- Name: reservas_pedido reservas_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_pedido
    ADD CONSTRAINT reservas_pedido_pkey PRIMARY KEY (id);


--
-- Name: reservas_stock reservas_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_stock
    ADD CONSTRAINT reservas_stock_pkey PRIMARY KEY (id);


--
-- Name: rol_permisos rol_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_pkey PRIMARY KEY (rol_id, permiso_id);


--
-- Name: roles roles_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: stock_ajustes stock_ajustes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_ajustes
    ADD CONSTRAINT stock_ajustes_pkey PRIMARY KEY (id);


--
-- Name: stock_vendedores stock_vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_vendedores
    ADD CONSTRAINT stock_vendedores_pkey PRIMARY KEY (id);


--
-- Name: stock_vendedores stock_vendedores_vendedor_id_lote_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_vendedores
    ADD CONSTRAINT stock_vendedores_vendedor_id_lote_id_key UNIQUE (vendedor_id, lote_id);


--
-- Name: tipos_de_cambio tipos_de_cambio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_de_cambio
    ADD CONSTRAINT tipos_de_cambio_pkey PRIMARY KEY (fecha);


--
-- Name: tipos_documento_pago tipos_documento_pago_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_documento_pago
    ADD CONSTRAINT tipos_documento_pago_nombre_key UNIQUE (nombre);


--
-- Name: tipos_documento_pago tipos_documento_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_documento_pago
    ADD CONSTRAINT tipos_documento_pago_pkey PRIMARY KEY (id);


--
-- Name: pedidos unique_pedido_por_oportunidad; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT unique_pedido_por_oportunidad UNIQUE (oportunidad_id);


--
-- Name: usuario_roles usuario_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_pkey PRIMARY KEY (usuario_id, rol_id);


--
-- Name: vendedores vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (id);


--
-- Name: zonas_envio zonas_envio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zonas_envio
    ADD CONSTRAINT zonas_envio_pkey PRIMARY KEY (id);


--
-- Name: zonas zonas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zonas
    ADD CONSTRAINT zonas_nombre_key UNIQUE (nombre);


--
-- Name: zonas zonas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zonas
    ADD CONSTRAINT zonas_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_25 messages_2025_08_25_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_25
    ADD CONSTRAINT messages_2025_08_25_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_26 messages_2025_08_26_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_26
    ADD CONSTRAINT messages_2025_08_26_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_27 messages_2025_08_27_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_27
    ADD CONSTRAINT messages_2025_08_27_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_28 messages_2025_08_28_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_28
    ADD CONSTRAINT messages_2025_08_28_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_29 messages_2025_08_29_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_29
    ADD CONSTRAINT messages_2025_08_29_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_30 messages_2025_08_30_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_30
    ADD CONSTRAINT messages_2025_08_30_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_08_31 messages_2025_08_31_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2025_08_31
    ADD CONSTRAINT messages_2025_08_31_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: -
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seed_files seed_files_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: -
--

ALTER TABLE ONLY supabase_migrations.seed_files
    ADD CONSTRAINT seed_files_pkey PRIMARY KEY (path);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_aplicacion_pagos_pago_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aplicacion_pagos_pago_id ON public.aplicacion_pagos USING btree (pago_id);


--
-- Name: idx_auditoria_pedidos_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_auditoria_pedidos_pedido_id ON public.auditoria_pedidos USING btree (pedido_id);


--
-- Name: idx_auditoria_precios_producto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_auditoria_precios_producto_id ON public.auditoria_precios USING btree (producto_id);


--
-- Name: idx_auditoria_precios_usuario_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_auditoria_precios_usuario_id ON public.auditoria_precios USING btree (usuario_id);


--
-- Name: idx_comisiones_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comisiones_pedido_id ON public.comisiones USING btree (pedido_id);


--
-- Name: idx_compras_deposito_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_compras_deposito_id ON public.compras USING btree (deposito_id);


--
-- Name: idx_compras_proveedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_compras_proveedor_id ON public.compras USING btree (proveedor_id);


--
-- Name: idx_confirmaciones_stock_asignacion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_confirmaciones_stock_asignacion_id ON public.confirmaciones_stock USING btree (asignacion_id);


--
-- Name: idx_confirmaciones_stock_vendedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_confirmaciones_stock_vendedor_id ON public.confirmaciones_stock USING btree (vendedor_id);


--
-- Name: idx_contactos_condicion_pago_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_contactos_condicion_pago_id ON public.contactos USING btree (condicion_pago_id);


--
-- Name: idx_contactos_estado_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_contactos_estado_id ON public.contactos USING btree (estado_id);


--
-- Name: idx_contactos_vendedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_contactos_vendedor_id ON public.contactos USING btree (vendedor_id);


--
-- Name: idx_facturas_venta_contacto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_facturas_venta_contacto_id ON public.facturas_venta USING btree (contacto_id);


--
-- Name: idx_facturas_venta_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_facturas_venta_pedido_id ON public.facturas_venta USING btree (pedido_id);


--
-- Name: idx_interacciones_contacto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_interacciones_contacto_id ON public.interacciones USING btree (contacto_id);


--
-- Name: idx_logistica_envios_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_logistica_envios_pedido_id ON public.logistica_envios USING btree (pedido_id);


--
-- Name: idx_logistica_envios_transportista_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_logistica_envios_transportista_id ON public.logistica_envios USING btree (transportista_id);


--
-- Name: idx_lotes_compra_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lotes_compra_id ON public.lotes USING btree (compra_id);


--
-- Name: idx_lotes_producto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lotes_producto_id ON public.lotes USING btree (producto_id);


--
-- Name: idx_movimientos_cuenta_corriente_cliente_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_movimientos_cuenta_corriente_cliente_id ON public.movimientos_cuenta_corriente USING btree (cliente_id);


--
-- Name: idx_movimientos_cuenta_corriente_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_movimientos_cuenta_corriente_pedido_id ON public.movimientos_cuenta_corriente USING btree (pedido_id);


--
-- Name: idx_movimientos_cuenta_proveedor_compra_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_movimientos_cuenta_proveedor_compra_id ON public.movimientos_cuenta_proveedor USING btree (compra_id);


--
-- Name: idx_movimientos_cuenta_proveedor_proveedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_movimientos_cuenta_proveedor_proveedor_id ON public.movimientos_cuenta_proveedor USING btree (proveedor_id);


--
-- Name: idx_oportunidades_condicion_pago_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oportunidades_condicion_pago_id ON public.oportunidades USING btree (condicion_pago_id);


--
-- Name: idx_oportunidades_contacto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oportunidades_contacto_id ON public.oportunidades USING btree (contacto_id);


--
-- Name: idx_oportunidades_etapa_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oportunidades_etapa_id ON public.oportunidades USING btree (etapa_id);


--
-- Name: idx_oportunidades_vendedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oportunidades_vendedor_id ON public.oportunidades USING btree (vendedor_id);


--
-- Name: idx_pagos_comisiones_vendedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pagos_comisiones_vendedor_id ON public.pagos_comisiones USING btree (vendedor_id);


--
-- Name: idx_pagos_contacto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pagos_contacto_id ON public.pagos USING btree (contacto_id);


--
-- Name: idx_pagos_cuenta_bancaria_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pagos_cuenta_bancaria_id ON public.pagos USING btree (cuenta_bancaria_id);


--
-- Name: idx_pedidos_condicion_pago_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pedidos_condicion_pago_id ON public.pedidos USING btree (condicion_pago_id);


--
-- Name: idx_pedidos_contacto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pedidos_contacto_id ON public.pedidos USING btree (contacto_id);


--
-- Name: idx_pedidos_deposito_principal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pedidos_deposito_principal_id ON public.pedidos USING btree (deposito_principal_id);


--
-- Name: idx_pedidos_estado_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pedidos_estado_id ON public.pedidos USING btree (estado_id);


--
-- Name: idx_pedidos_vendedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pedidos_vendedor_id ON public.pedidos USING btree (vendedor_id);


--
-- Name: idx_productos_deposito_default_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_productos_deposito_default_id ON public.productos USING btree (deposito_default_id);


--
-- Name: idx_proveedor_contactos_proveedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_proveedor_contactos_proveedor_id ON public.proveedor_contactos USING btree (proveedor_id);


--
-- Name: idx_proveedor_cuentas_bancarias_proveedor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_proveedor_cuentas_bancarias_proveedor_id ON public.proveedor_cuentas_bancarias USING btree (proveedor_id);


--
-- Name: idx_proveedores_condicion_pago_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_proveedores_condicion_pago_id ON public.proveedores USING btree (condicion_pago_id);


--
-- Name: idx_reservas_pedido_lote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_reservas_pedido_lote_id ON public.reservas_pedido USING btree (lote_id);


--
-- Name: idx_reservas_pedido_producto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_reservas_pedido_producto_id ON public.reservas_pedido USING btree (producto_id);


--
-- Name: idx_reservas_stock_lote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_reservas_stock_lote_id ON public.reservas_stock USING btree (lote_id);


--
-- Name: idx_reservas_stock_pedido_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_reservas_stock_pedido_id ON public.reservas_stock USING btree (pedido_id);


--
-- Name: idx_rol_permisos_permiso_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rol_permisos_permiso_id ON public.rol_permisos USING btree (permiso_id);


--
-- Name: idx_stock_ajustes_lote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stock_ajustes_lote_id ON public.stock_ajustes USING btree (lote_id);


--
-- Name: idx_stock_ajustes_producto_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stock_ajustes_producto_id ON public.stock_ajustes USING btree (producto_id);


--
-- Name: idx_stock_vendedores_lote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_stock_vendedores_lote_id ON public.stock_vendedores USING btree (lote_id);


--
-- Name: idx_usuario_roles_rol_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_usuario_roles_rol_id ON public.usuario_roles USING btree (rol_id);


--
-- Name: idx_zonas_envio_geometria; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_zonas_envio_geometria ON public.zonas_envio USING gist (geometria);


--
-- Name: reservas_pedido_pedido_lote_producto_uq; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX reservas_pedido_pedido_lote_producto_uq ON public.reservas_pedido USING btree (pedido_id, lote_id, producto_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_25_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_25_inserted_at_topic_idx ON realtime.messages_2025_08_25 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_26_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_26_inserted_at_topic_idx ON realtime.messages_2025_08_26 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_27_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_27_inserted_at_topic_idx ON realtime.messages_2025_08_27 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_28_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_28_inserted_at_topic_idx ON realtime.messages_2025_08_28 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_29_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_29_inserted_at_topic_idx ON realtime.messages_2025_08_29 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_30_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_30_inserted_at_topic_idx ON realtime.messages_2025_08_30 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_08_31_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2025_08_31_inserted_at_topic_idx ON realtime.messages_2025_08_31 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: messages_2025_08_25_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_25_inserted_at_topic_idx;


--
-- Name: messages_2025_08_25_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_25_pkey;


--
-- Name: messages_2025_08_26_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_26_inserted_at_topic_idx;


--
-- Name: messages_2025_08_26_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_26_pkey;


--
-- Name: messages_2025_08_27_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_27_inserted_at_topic_idx;


--
-- Name: messages_2025_08_27_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_27_pkey;


--
-- Name: messages_2025_08_28_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_28_inserted_at_topic_idx;


--
-- Name: messages_2025_08_28_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_28_pkey;


--
-- Name: messages_2025_08_29_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_29_inserted_at_topic_idx;


--
-- Name: messages_2025_08_29_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_29_pkey;


--
-- Name: messages_2025_08_30_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_30_inserted_at_topic_idx;


--
-- Name: messages_2025_08_30_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_30_pkey;


--
-- Name: messages_2025_08_31_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_08_31_inserted_at_topic_idx;


--
-- Name: messages_2025_08_31_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_08_31_pkey;


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: -
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: compras on_compra_recibida; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER on_compra_recibida AFTER UPDATE ON public.compras FOR EACH ROW EXECUTE FUNCTION public.registrar_deuda_proveedor();


--
-- Name: aplicacion_pagos on_payment_applied_generate_commission; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER on_payment_applied_generate_commission AFTER INSERT ON public.aplicacion_pagos FOR EACH ROW EXECUTE FUNCTION public.generar_comision_si_pedido_esta_saldado();


--
-- Name: logistica_envios set_logistica_envios_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_logistica_envios_updated_at BEFORE UPDATE ON public.logistica_envios FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: logistica_envios trg_actualizar_pedido_al_entregar_envio; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_actualizar_pedido_al_entregar_envio AFTER UPDATE OF estado ON public.logistica_envios FOR EACH ROW EXECUTE FUNCTION public.actualizar_estado_pedido_desde_logistica();


--
-- Name: productos trg_auditar_precio_producto; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_auditar_precio_producto AFTER UPDATE OF precio_base ON public.productos FOR EACH ROW EXECUTE FUNCTION public.auditar_cambio_precio_producto();


--
-- Name: oportunidades trg_set_numero_propuesta; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_set_numero_propuesta BEFORE INSERT ON public.oportunidades FOR EACH ROW EXECUTE FUNCTION public.set_numero_propuesta();


--
-- Name: TRIGGER trg_set_numero_propuesta ON oportunidades; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TRIGGER trg_set_numero_propuesta ON public.oportunidades IS 'Asegura que cada nueva oportunidad tenga un numero_propuesta único generado por una secuencia.';


--
-- Name: logistica_envios trg_set_token_on_envio_insert; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_set_token_on_envio_insert BEFORE INSERT ON public.logistica_envios FOR EACH ROW EXECUTE FUNCTION public.set_token_confirmacion_recepcion();


--
-- Name: movimientos_cuenta_proveedor trigger_actualizar_deuda_proveedor; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_actualizar_deuda_proveedor AFTER INSERT OR DELETE OR UPDATE ON public.movimientos_cuenta_proveedor FOR EACH ROW EXECUTE FUNCTION public.actualizar_deuda_total_proveedor();


--
-- Name: pedidos trigger_auditoria_pedidos; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_auditoria_pedidos AFTER INSERT OR UPDATE ON public.pedidos FOR EACH ROW EXECUTE FUNCTION public.funcion_auditoria_pedidos();


--
-- Name: contactos trigger_sync_contact_zone; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_sync_contact_zone BEFORE INSERT OR UPDATE ON public.contactos FOR EACH ROW EXECUTE FUNCTION public.sync_contact_zone();


--
-- Name: pedidos trigger_update_ultima_compra; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_update_ultima_compra AFTER INSERT ON public.pedidos FOR EACH ROW EXECUTE FUNCTION public.actualizar_fecha_ultima_compra();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: aplicacion_pagos aplicacion_pagos_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aplicacion_pagos
    ADD CONSTRAINT aplicacion_pagos_pago_id_fkey FOREIGN KEY (pago_id) REFERENCES public.pagos(id) ON DELETE CASCADE;


--
-- Name: auditoria_pedidos auditoria_pedidos_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_pedidos
    ADD CONSTRAINT auditoria_pedidos_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- Name: auditoria_precios auditoria_precios_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_precios
    ADD CONSTRAINT auditoria_precios_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: auditoria_precios auditoria_precios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_precios
    ADD CONSTRAINT auditoria_precios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES auth.users(id);


--
-- Name: comisiones comisiones_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comisiones
    ADD CONSTRAINT comisiones_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id);


--
-- Name: compras compras_deposito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_deposito_id_fkey FOREIGN KEY (deposito_id) REFERENCES public.depositos(id);


--
-- Name: compras compras_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: compras compras_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- Name: confirmaciones_stock confirmaciones_stock_asignacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.confirmaciones_stock
    ADD CONSTRAINT confirmaciones_stock_asignacion_id_fkey FOREIGN KEY (asignacion_id) REFERENCES public.stock_vendedores(id) ON DELETE CASCADE;


--
-- Name: confirmaciones_stock confirmaciones_stock_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.confirmaciones_stock
    ADD CONSTRAINT confirmaciones_stock_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;


--
-- Name: contactos contactos_condicion_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_condicion_pago_id_fkey FOREIGN KEY (condicion_pago_id) REFERENCES public.condiciones_pago(id) ON DELETE SET NULL;


--
-- Name: contactos contactos_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados(id);


--
-- Name: contactos contactos_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: contactos contactos_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;


--
-- Name: contactos contactos_zona_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_zona_id_fkey FOREIGN KEY (zona_id) REFERENCES public.zonas(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cuentas_bancarias cuentas_bancarias_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: facturas_venta facturas_venta_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facturas_venta
    ADD CONSTRAINT facturas_venta_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES public.contactos(id) ON DELETE CASCADE;


--
-- Name: facturas_venta facturas_venta_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facturas_venta
    ADD CONSTRAINT facturas_venta_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE SET NULL;


--
-- Name: interacciones interacciones_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES public.contactos(id) ON DELETE CASCADE;


--
-- Name: logistica_envios logistica_envios_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_envios
    ADD CONSTRAINT logistica_envios_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- Name: logistica_envios logistica_envios_transportista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logistica_envios
    ADD CONSTRAINT logistica_envios_transportista_id_fkey FOREIGN KEY (transportista_id) REFERENCES public.logistica_transportistas(id);


--
-- Name: lotes lotes_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lotes
    ADD CONSTRAINT lotes_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- Name: lotes lotes_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lotes
    ADD CONSTRAINT lotes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;


--
-- Name: movimientos_cuenta_corriente movimientos_cuenta_corriente_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_corriente
    ADD CONSTRAINT movimientos_cuenta_corriente_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.contactos(id) ON DELETE SET NULL;


--
-- Name: movimientos_cuenta_corriente movimientos_cuenta_corriente_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_corriente
    ADD CONSTRAINT movimientos_cuenta_corriente_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE SET NULL;


--
-- Name: movimientos_cuenta_proveedor movimientos_cuenta_proveedor_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_proveedor
    ADD CONSTRAINT movimientos_cuenta_proveedor_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id) ON DELETE SET NULL;


--
-- Name: movimientos_cuenta_proveedor movimientos_cuenta_proveedor_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movimientos_cuenta_proveedor
    ADD CONSTRAINT movimientos_cuenta_proveedor_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON DELETE SET NULL;


--
-- Name: oportunidades oportunidades_condicion_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_condicion_pago_id_fkey FOREIGN KEY (condicion_pago_id) REFERENCES public.condiciones_pago(id) ON DELETE SET NULL;


--
-- Name: oportunidades oportunidades_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES public.contactos(id) ON DELETE CASCADE;


--
-- Name: oportunidades oportunidades_etapa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_etapa_id_fkey FOREIGN KEY (etapa_id) REFERENCES public.etapas_venta(id);


--
-- Name: oportunidades oportunidades_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: oportunidades oportunidades_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oportunidades
    ADD CONSTRAINT oportunidades_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;


--
-- Name: pagos_comisiones pagos_comisiones_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagos_comisiones
    ADD CONSTRAINT pagos_comisiones_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id);


--
-- Name: pagos pagos_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES public.contactos(id) ON DELETE CASCADE;


--
-- Name: pagos pagos_cuenta_bancaria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_cuenta_bancaria_id_fkey FOREIGN KEY (cuenta_bancaria_id) REFERENCES public.cuentas_bancarias(id);


--
-- Name: pedidos pedidos_condicion_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_condicion_pago_id_fkey FOREIGN KEY (condicion_pago_id) REFERENCES public.condiciones_pago(id);


--
-- Name: pedidos pedidos_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES public.contactos(id);


--
-- Name: pedidos pedidos_deposito_principal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_deposito_principal_id_fkey FOREIGN KEY (deposito_principal_id) REFERENCES public.depositos(id);


--
-- Name: pedidos pedidos_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados_pedido(id);


--
-- Name: pedidos pedidos_oportunidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_oportunidad_id_fkey FOREIGN KEY (oportunidad_id) REFERENCES public.oportunidades(id);


--
-- Name: pedidos pedidos_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: pedidos pedidos_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;


--
-- Name: perfiles perfiles_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: perfiles perfiles_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT perfiles_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id) ON DELETE SET NULL;


--
-- Name: productos productos_deposito_default_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_deposito_default_id_fkey FOREIGN KEY (deposito_default_id) REFERENCES public.depositos(id);


--
-- Name: proveedor_contactos proveedor_contactos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor_contactos
    ADD CONSTRAINT proveedor_contactos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON DELETE CASCADE;


--
-- Name: proveedor_cuentas_bancarias proveedor_cuentas_bancarias_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor_cuentas_bancarias
    ADD CONSTRAINT proveedor_cuentas_bancarias_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON DELETE CASCADE;


--
-- Name: proveedores proveedores_condicion_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_condicion_pago_id_fkey FOREIGN KEY (condicion_pago_id) REFERENCES public.condiciones_pago(id);


--
-- Name: reservas_pedido reservas_pedido_lote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_pedido
    ADD CONSTRAINT reservas_pedido_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES public.lotes(id);


--
-- Name: reservas_pedido reservas_pedido_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_pedido
    ADD CONSTRAINT reservas_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- Name: reservas_pedido reservas_pedido_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_pedido
    ADD CONSTRAINT reservas_pedido_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: reservas_stock reservas_stock_lote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_stock
    ADD CONSTRAINT reservas_stock_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES public.lotes(id) ON DELETE CASCADE;


--
-- Name: reservas_stock reservas_stock_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservas_stock
    ADD CONSTRAINT reservas_stock_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- Name: rol_permisos rol_permisos_permiso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_permiso_id_fkey FOREIGN KEY (permiso_id) REFERENCES public.permisos(id) ON DELETE CASCADE;


--
-- Name: rol_permisos rol_permisos_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: stock_ajustes stock_ajustes_lote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_ajustes
    ADD CONSTRAINT stock_ajustes_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES public.lotes(id);


--
-- Name: stock_ajustes stock_ajustes_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_ajustes
    ADD CONSTRAINT stock_ajustes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- Name: stock_vendedores stock_vendedores_lote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_vendedores
    ADD CONSTRAINT stock_vendedores_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES public.lotes(id) ON DELETE CASCADE;


--
-- Name: stock_vendedores stock_vendedores_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_vendedores
    ADD CONSTRAINT stock_vendedores_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedores(id);


--
-- Name: usuario_roles usuario_roles_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: usuario_roles usuario_roles_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.perfiles(id) ON DELETE CASCADE;


--
-- Name: perfiles usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfiles
    ADD CONSTRAINT usuarios_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: zonas_envio zonas_envio_organizacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zonas_envio
    ADD CONSTRAINT zonas_envio_organizacion_id_fkey FOREIGN KEY (organizacion_id) REFERENCES public.organizaciones(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: zonas_envio Acceso a zonas de envio; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso a zonas de envio" ON public.zonas_envio USING (true) WITH CHECK (true);


--
-- Name: interacciones Acceso basado en propiedad; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso basado en propiedad" ON public.interacciones USING ((public.check_user_permission('contactos:ver:todos'::text) OR (contacto_id IN ( SELECT contactos.id
   FROM public.contactos
  WHERE (contactos.vendedor_id = public.get_my_vendedor_id())))));


--
-- Name: logistica_envios Acceso basado en propiedad; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso basado en propiedad" ON public.logistica_envios USING ((public.check_user_permission('pedidos:ver:todos'::text) OR (pedido_id IN ( SELECT pedidos.id
   FROM public.pedidos
  WHERE (pedidos.vendedor_id = public.get_my_vendedor_id())))));


--
-- Name: organizaciones Acceso de lectura a organizaciones; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura a organizaciones" ON public.organizaciones FOR SELECT USING (true);


--
-- Name: condiciones_pago Acceso de lectura de cond. de pago para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura de cond. de pago para usuarios autenticados" ON public.condiciones_pago FOR SELECT TO authenticated USING (true);


--
-- Name: depositos Acceso de lectura de depósitos para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura de depósitos para usuarios autenticados" ON public.depositos FOR SELECT TO authenticated USING (true);


--
-- Name: etapas_venta Acceso de lectura de etapas para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura de etapas para usuarios autenticados" ON public.etapas_venta FOR SELECT TO authenticated USING (true);


--
-- Name: productos Acceso de lectura de productos para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura de productos para usuarios autenticados" ON public.productos FOR SELECT TO authenticated USING (true);


--
-- Name: proveedores Acceso de lectura de proveedores para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura de proveedores para usuarios autenticados" ON public.proveedores FOR SELECT TO authenticated USING (true);


--
-- Name: estados_pedido Acceso de lectura para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura para usuarios autenticados" ON public.estados_pedido FOR SELECT TO authenticated USING (true);


--
-- Name: logistica_embalajes Acceso de lectura para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura para usuarios autenticados" ON public.logistica_embalajes FOR SELECT TO authenticated USING (true);


--
-- Name: logistica_transportistas Acceso de lectura para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso de lectura para usuarios autenticados" ON public.logistica_transportistas FOR SELECT TO authenticated USING (true);


--
-- Name: facturas_venta Acceso para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso para usuarios autenticados" ON public.facturas_venta TO authenticated USING (true) WITH CHECK (true);


--
-- Name: configuracion Acceso solo para Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso solo para Superadministradores" ON public.configuracion USING (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: auditoria_pedidos Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.auditoria_pedidos TO authenticated USING (true) WITH CHECK (true);


--
-- Name: auditoria_precios Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.auditoria_precios TO authenticated USING (true) WITH CHECK (true);


--
-- Name: confirmaciones_stock Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.confirmaciones_stock TO authenticated USING (true) WITH CHECK (true);


--
-- Name: pagos_comisiones Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.pagos_comisiones TO authenticated USING (true) WITH CHECK (true);


--
-- Name: reservas_pedido Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.reservas_pedido TO authenticated USING (true) WITH CHECK (true);


--
-- Name: reservas_stock Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.reservas_stock TO authenticated USING (true) WITH CHECK (true);


--
-- Name: tipos_documento_pago Acceso total para usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Acceso total para usuarios autenticados" ON public.tipos_documento_pago TO authenticated USING (true) WITH CHECK (true);


--
-- Name: reglas_alertas Admins pueden gestionar reglas; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Admins pueden gestionar reglas" ON public.reglas_alertas USING (public.check_user_permission('configuracion:editar:roles'::text)) WITH CHECK (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: proveedor_cuentas_bancarias Cuentas prove; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Cuentas prove" ON public.proveedor_cuentas_bancarias TO authenticated, anon USING (true) WITH CHECK (true);


--
-- Name: condiciones_pago Enable insert access for anon users on condiciones_pago; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable insert access for anon users on condiciones_pago" ON public.condiciones_pago FOR INSERT TO anon WITH CHECK (true);


--
-- Name: stock_vendedores Los usuarios de la app pueden gestionar stock de vendedores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Los usuarios de la app pueden gestionar stock de vendedores" ON public.stock_vendedores USING (public.is_app_user());


--
-- Name: pagos Los usuarios pueden crear sus propios pagos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Los usuarios pueden crear sus propios pagos" ON public.pagos FOR INSERT TO authenticated WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));


--
-- Name: aplicacion_pagos Permitir a usuarios autenticados LEER las aplicaciones de pago; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir a usuarios autenticados LEER las aplicaciones de pago" ON public.aplicacion_pagos FOR SELECT TO authenticated USING (true);


--
-- Name: pagos Permitir a usuarios autenticados LEER los registros de pago; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir a usuarios autenticados LEER los registros de pago" ON public.pagos FOR SELECT TO authenticated USING (true);


--
-- Name: stock_ajustes Permitir a usuarios de la app LEER todos los ajustes de stock; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir a usuarios de la app LEER todos los ajustes de stock" ON public.stock_ajustes FOR SELECT TO authenticated USING (true);


--
-- Name: stock_ajustes Permitir a usuarios del app registrar ajustes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir a usuarios del app registrar ajustes" ON public.stock_ajustes FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: roles Permitir actualizacion de roles a Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir actualizacion de roles a Superadministradores" ON public.roles FOR UPDATE TO authenticated USING (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: contactos Permitir actualización de contactos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir actualización de contactos" ON public.contactos FOR UPDATE TO authenticated USING ((public.check_user_permission('contactos:ver:todos'::text) OR (vendedor_id = public.get_my_vendedor_id()))) WITH CHECK (public.check_user_permission('contactos:editar'::text));


--
-- Name: roles Permitir eliminacion de roles a Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir eliminacion de roles a Superadministradores" ON public.roles FOR DELETE TO authenticated USING (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: contactos Permitir eliminación de contactos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir eliminación de contactos" ON public.contactos FOR DELETE TO authenticated USING (public.check_user_permission('contactos:eliminar'::text));


--
-- Name: permisos Permitir gestion de permisos a Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir gestion de permisos a Superadministradores" ON public.permisos TO authenticated USING (public.check_user_permission('configuracion:editar:roles'::text)) WITH CHECK (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: rol_permisos Permitir gestion de permisos de rol a Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir gestion de permisos de rol a Superadministradores" ON public.rol_permisos TO authenticated USING (public.check_user_permission('configuracion:editar:roles'::text)) WITH CHECK (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: roles Permitir insercion de roles a Superadministradores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir insercion de roles a Superadministradores" ON public.roles FOR INSERT TO authenticated WITH CHECK (public.check_user_permission('configuracion:editar:roles'::text));


--
-- Name: perfiles Permitir inserciones al rol postgres para la creación de perfi; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir inserciones al rol postgres para la creación de perfi" ON public.perfiles FOR INSERT TO postgres WITH CHECK (true);


--
-- Name: contactos Permitir inserción de contactos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir inserción de contactos" ON public.contactos FOR INSERT TO authenticated WITH CHECK (public.check_user_permission('contactos:crear'::text));


--
-- Name: movimientos_cuenta_corriente Permitir inserción de movimientos al crear/anular pedidos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir inserción de movimientos al crear/anular pedidos" ON public.movimientos_cuenta_corriente FOR INSERT TO authenticated WITH CHECK ((public.check_user_permission('pedidos:crear'::text) OR public.check_user_permission('pedidos:anular:propios'::text) OR public.check_user_permission('pedidos:anular'::text)));


--
-- Name: contactos Permitir inserción desde formulario público; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir inserción desde formulario público" ON public.contactos FOR INSERT TO anon WITH CHECK ((estado_id = ( SELECT estados.id
   FROM public.estados
  WHERE (estados.nombre = 'Pendiente de Aprobación'::text)
 LIMIT 1)));


--
-- Name: perfiles Permitir la actualización de perfiles a admins o al propio usu; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir la actualización de perfiles a admins o al propio usu" ON public.perfiles FOR UPDATE TO authenticated USING (true) WITH CHECK (((( SELECT auth.uid() AS uid) = id) OR ( SELECT public.check_user_permission('configuracion:editar:roles'::text) AS check_user_permission)));


--
-- Name: contactos Permitir lectura de contactos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir lectura de contactos" ON public.contactos FOR SELECT TO authenticated USING ((public.check_user_permission('contactos:ver:todos'::text) OR (vendedor_id = public.get_my_vendedor_id())));


--
-- Name: perfiles Permitir lectura de perfiles a admins o al propio usuario; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir lectura de perfiles a admins o al propio usuario" ON public.perfiles FOR SELECT TO authenticated USING (((( SELECT auth.uid() AS uid) = id) OR ( SELECT public.check_user_permission('configuracion:editar:roles'::text) AS check_user_permission)));


--
-- Name: permisos Permitir lectura de permisos a usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir lectura de permisos a usuarios autenticados" ON public.permisos FOR SELECT TO authenticated USING (true);


--
-- Name: rol_permisos Permitir lectura de permisos de rol a usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir lectura de permisos de rol a usuarios autenticados" ON public.rol_permisos FOR SELECT TO authenticated USING (true);


--
-- Name: roles Permitir lectura de roles a usuarios autenticados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Permitir lectura de roles a usuarios autenticados" ON public.roles FOR SELECT TO authenticated USING (true);


--
-- Name: compras Politica Unificada de Compras; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Compras" ON public.compras USING (public.is_app_user()) WITH CHECK (public.is_app_user());


--
-- Name: movimientos_cuenta_proveedor Politica Unificada de Cta Cte Proveedores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Cta Cte Proveedores" ON public.movimientos_cuenta_proveedor USING (public.is_app_user()) WITH CHECK (public.is_app_user());


--
-- Name: cuentas_bancarias Politica Unificada de Cuentas Bancarias; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Cuentas Bancarias" ON public.cuentas_bancarias USING (true) WITH CHECK (true);


--
-- Name: estados Politica Unificada de Estados; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Estados" ON public.estados FOR SELECT USING (true);


--
-- Name: usuario_roles Politica Unificada de Gestion de Roles; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Gestion de Roles" ON public.usuario_roles USING (((( SELECT auth.uid() AS uid) = usuario_id) OR ( SELECT ('Superadministrador'::text = ANY (public.get_user_roles()))) OR ( SELECT ('Administracion'::text = ANY (public.get_user_roles()))))) WITH CHECK ((( SELECT ('Superadministrador'::text = ANY (public.get_user_roles()))) OR ( SELECT ('Administracion'::text = ANY (public.get_user_roles())))));


--
-- Name: lotes Politica Unificada de Lotes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Lotes" ON public.lotes USING (true) WITH CHECK (true);


--
-- Name: oportunidades Politica Unificada de Oportunidades; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Oportunidades" ON public.oportunidades TO authenticated USING ((public.check_user_permission('oportunidades:ver:todos'::text) OR (vendedor_id = ( SELECT public.get_my_vendedor_id() AS get_my_vendedor_id)))) WITH CHECK (public.check_user_permission('oportunidades:crear'::text));


--
-- Name: pedidos Politica Unificada de Pedidos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Pedidos" ON public.pedidos TO authenticated USING ((public.check_user_permission('pedidos:ver:todos'::text) OR (vendedor_id = ( SELECT public.get_my_vendedor_id() AS get_my_vendedor_id)))) WITH CHECK (public.check_user_permission('pedidos:crear'::text));


--
-- Name: vendedores Politica Unificada de Vendedores; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Politica Unificada de Vendedores" ON public.vendedores TO authenticated USING (public.is_app_user()) WITH CHECK (public.is_app_user());


--
-- Name: comisiones Política de Acceso a Comisiones; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Política de Acceso a Comisiones" ON public.comisiones FOR SELECT USING ((public.check_user_permission('comisiones:ver:todas'::text) OR (vendedor_id = public.get_my_vendedor_id())));


--
-- Name: reportes_usabilidad Política de gestión de reportes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Política de gestión de reportes" ON public.reportes_usabilidad USING (true) WITH CHECK ((((( SELECT auth.uid() AS uid))::text = reportado_por) OR ( SELECT public.check_user_permission('configuracion:editar:roles'::text) AS check_user_permission)));


--
-- Name: proveedor_contactos Prov contactos; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Prov contactos" ON public.proveedor_contactos TO authenticated, anon USING (true) WITH CHECK (true);


--
-- Name: tipos_de_cambio Public read access; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Public read access" ON public.tipos_de_cambio FOR SELECT USING (true);


--
-- Name: aplicacion_pagos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.aplicacion_pagos ENABLE ROW LEVEL SECURITY;

--
-- Name: auditoria_pedidos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.auditoria_pedidos ENABLE ROW LEVEL SECURITY;

--
-- Name: auditoria_precios; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.auditoria_precios ENABLE ROW LEVEL SECURITY;

--
-- Name: comisiones; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.comisiones ENABLE ROW LEVEL SECURITY;

--
-- Name: compras; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.compras ENABLE ROW LEVEL SECURITY;

--
-- Name: condiciones_pago; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.condiciones_pago ENABLE ROW LEVEL SECURITY;

--
-- Name: configuracion; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.configuracion ENABLE ROW LEVEL SECURITY;

--
-- Name: confirmaciones_stock; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.confirmaciones_stock ENABLE ROW LEVEL SECURITY;

--
-- Name: contactos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.contactos ENABLE ROW LEVEL SECURITY;

--
-- Name: cuentas_bancarias; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.cuentas_bancarias ENABLE ROW LEVEL SECURITY;

--
-- Name: depositos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.depositos ENABLE ROW LEVEL SECURITY;

--
-- Name: estados; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.estados ENABLE ROW LEVEL SECURITY;

--
-- Name: estados_pedido; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.estados_pedido ENABLE ROW LEVEL SECURITY;

--
-- Name: etapas_venta; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.etapas_venta ENABLE ROW LEVEL SECURITY;

--
-- Name: facturas_venta; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.facturas_venta ENABLE ROW LEVEL SECURITY;

--
-- Name: interacciones; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.interacciones ENABLE ROW LEVEL SECURITY;

--
-- Name: logistica_embalajes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.logistica_embalajes ENABLE ROW LEVEL SECURITY;

--
-- Name: logistica_envios; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.logistica_envios ENABLE ROW LEVEL SECURITY;

--
-- Name: logistica_transportistas; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.logistica_transportistas ENABLE ROW LEVEL SECURITY;

--
-- Name: lotes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.lotes ENABLE ROW LEVEL SECURITY;

--
-- Name: movimientos_cuenta_corriente; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.movimientos_cuenta_corriente ENABLE ROW LEVEL SECURITY;

--
-- Name: movimientos_cuenta_proveedor; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.movimientos_cuenta_proveedor ENABLE ROW LEVEL SECURITY;

--
-- Name: oportunidades; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.oportunidades ENABLE ROW LEVEL SECURITY;

--
-- Name: organizaciones; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.organizaciones ENABLE ROW LEVEL SECURITY;

--
-- Name: pagos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.pagos ENABLE ROW LEVEL SECURITY;

--
-- Name: pagos_comisiones; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.pagos_comisiones ENABLE ROW LEVEL SECURITY;

--
-- Name: pedidos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.pedidos ENABLE ROW LEVEL SECURITY;

--
-- Name: perfiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.perfiles ENABLE ROW LEVEL SECURITY;

--
-- Name: permisos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.permisos ENABLE ROW LEVEL SECURITY;

--
-- Name: productos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.productos ENABLE ROW LEVEL SECURITY;

--
-- Name: proveedor_contactos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.proveedor_contactos ENABLE ROW LEVEL SECURITY;

--
-- Name: proveedor_cuentas_bancarias; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.proveedor_cuentas_bancarias ENABLE ROW LEVEL SECURITY;

--
-- Name: proveedores; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.proveedores ENABLE ROW LEVEL SECURITY;

--
-- Name: reglas_alertas; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.reglas_alertas ENABLE ROW LEVEL SECURITY;

--
-- Name: reportes_usabilidad; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.reportes_usabilidad ENABLE ROW LEVEL SECURITY;

--
-- Name: reservas_pedido; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.reservas_pedido ENABLE ROW LEVEL SECURITY;

--
-- Name: reservas_stock; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.reservas_stock ENABLE ROW LEVEL SECURITY;

--
-- Name: rol_permisos; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.rol_permisos ENABLE ROW LEVEL SECURITY;

--
-- Name: roles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.roles ENABLE ROW LEVEL SECURITY;

--
-- Name: stock_ajustes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.stock_ajustes ENABLE ROW LEVEL SECURITY;

--
-- Name: stock_vendedores; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.stock_vendedores ENABLE ROW LEVEL SECURITY;

--
-- Name: tipos_de_cambio; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tipos_de_cambio ENABLE ROW LEVEL SECURITY;

--
-- Name: tipos_documento_pago; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.tipos_documento_pago ENABLE ROW LEVEL SECURITY;

--
-- Name: usuario_roles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.usuario_roles ENABLE ROW LEVEL SECURITY;

--
-- Name: vendedores; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.vendedores ENABLE ROW LEVEL SECURITY;

--
-- Name: zonas_envio; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.zonas_envio ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Authenticated Upload for Proposals; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Authenticated Upload for Proposals" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'propuestas'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Dar acceso publico de lectura a propuestas; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Dar acceso publico de lectura a propuestas" ON storage.objects FOR SELECT USING ((bucket_id = 'propuestas'::text));


--
-- Name: objects Give anon users full access to remitos bucket; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Give anon users full access to remitos bucket" ON storage.objects TO anon USING ((bucket_id = 'remitos'::text)) WITH CHECK ((bucket_id = 'remitos'::text));


--
-- Name: objects Los usuarios autenticados pueden subir comprobantes de pago; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Los usuarios autenticados pueden subir comprobantes de pago" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'comprobantes_pago_clientes'::text) AND public.is_app_user()));


--
-- Name: objects Permitir a usuarios autenticados gestionar remitos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir a usuarios autenticados gestionar remitos" ON storage.objects TO authenticated USING ((bucket_id = 'remitos'::text)) WITH CHECK ((bucket_id = 'remitos'::text));


--
-- Name: objects Permitir a usuarios autenticados subir fotos de perfil; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir a usuarios autenticados subir fotos de perfil" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'perfiles'::text));


--
-- Name: objects Permitir a usuarios autenticados ver las fotos de perfil; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir a usuarios autenticados ver las fotos de perfil" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'perfiles'::text));


--
-- Name: objects Permitir acceso público de actualización a assets; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir acceso público de actualización a assets" ON storage.objects FOR UPDATE USING ((bucket_id = 'assets'::text));


--
-- Name: objects Permitir acceso público de lectura a assets; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir acceso público de lectura a assets" ON storage.objects FOR SELECT USING ((bucket_id = 'assets'::text));


--
-- Name: objects Permitir acceso público de subida a assets; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir acceso público de subida a assets" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'assets'::text));


--
-- Name: objects Permitir actualizaciones en propuestas; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir actualizaciones en propuestas" ON storage.objects FOR UPDATE USING ((bucket_id = 'propuestas'::text));


--
-- Name: objects Permitir lectura de comprobantes de pago; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir lectura de comprobantes de pago" ON storage.objects FOR SELECT TO anon USING ((bucket_id = 'comprobantes_pago_vendedores'::text));


--
-- Name: objects Permitir lectura pública de recibos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir lectura pública de recibos" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'recibos_comisiones'::text));


--
-- Name: objects Permitir lecturas anónimas de recibos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir lecturas anónimas de recibos" ON storage.objects FOR SELECT TO anon USING ((bucket_id = 'recibos_comisiones'::text));


--
-- Name: objects Permitir lecturas de comprobantes_pago_clientes; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir lecturas de comprobantes_pago_clientes" ON storage.objects FOR SELECT TO anon USING ((bucket_id = 'comprobantes_pago_clientes'::text));


--
-- Name: objects Permitir subida de archivos a recibos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir subida de archivos a recibos" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'recibos_comisiones'::text));


--
-- Name: objects Permitir subidas a comprobantes_pago_clientes; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir subidas a comprobantes_pago_clientes" ON storage.objects FOR INSERT TO anon WITH CHECK ((bucket_id = 'comprobantes_pago_clientes'::text));


--
-- Name: objects Permitir subidas anónimas a recibos; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir subidas anónimas a recibos" ON storage.objects FOR INSERT TO anon WITH CHECK ((bucket_id = 'recibos_comisiones'::text));


--
-- Name: objects Permitir subidas de comprobantes de pago; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir subidas de comprobantes de pago" ON storage.objects FOR INSERT TO anon WITH CHECK ((bucket_id = 'comprobantes_pago_vendedores'::text));


--
-- Name: objects Permitir subidas publicas a propuestas; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Permitir subidas publicas a propuestas" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'propuestas'::text));


--
-- Name: objects Public Access for Proposals; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public Access for Proposals" ON storage.objects FOR SELECT USING ((bucket_id = 'propuestas'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: -
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

\unrestrict VNObvRQQxyuvDeHVkPwWQfhOSOgIRKXdJQrV03XTnjPjhBypQ0u0lONJNRLcdJ1

