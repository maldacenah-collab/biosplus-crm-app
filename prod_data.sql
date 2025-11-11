--
-- PostgreSQL database dump
--

\restrict BmU9AhIiF7hj6O4GdBXPH8nMhWjJWuafb4WUNnnDEK7crC9rsGlDPIBPoL22N2e

-- Dumped from database version 17.4
-- Dumped by pg_dump version 18.0

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	e6abc864-39e1-4d73-af51-aca76f94a41e	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"maldacenah@gmail.com","user_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","user_phone":""}}	2025-08-20 16:09:04.273968+00	
00000000-0000-0000-0000-000000000000	28463a2d-3569-40fb-ab60-eec1c37c9531	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-03 17:01:17.426735+00	
00000000-0000-0000-0000-000000000000	8f3bea8b-2bb5-423c-9410-9e6740d0955b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-03 17:06:46.523031+00	
00000000-0000-0000-0000-000000000000	fdbb089e-22a1-4864-803e-10d2ddeb6e46	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-03 17:12:50.349924+00	
00000000-0000-0000-0000-000000000000	2c062a5e-bfe8-4d57-8a53-a8b7e665edd9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 18:33:10.097844+00	
00000000-0000-0000-0000-000000000000	416b6c6e-2dd3-4ecc-8147-f2f6fc1778ef	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 18:33:10.10613+00	
00000000-0000-0000-0000-000000000000	806a0915-6c84-412a-8839-796fa37c1bed	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 19:57:52.004833+00	
00000000-0000-0000-0000-000000000000	90adc032-6683-4e5e-88c6-f8eb113ee25f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 19:57:52.024752+00	
00000000-0000-0000-0000-000000000000	80d62954-64ce-4e08-be48-1f29975d962c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 20:56:22.06575+00	
00000000-0000-0000-0000-000000000000	d86b0939-715f-45e6-8bca-eb32cb66d914	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-03 20:56:22.085109+00	
00000000-0000-0000-0000-000000000000	ec04f368-589f-4f10-8862-18220aa876ae	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-04 11:56:43.050069+00	
00000000-0000-0000-0000-000000000000	3931bfa0-5ef0-474d-8078-689ec4f34f7a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-04 15:05:39.580982+00	
00000000-0000-0000-0000-000000000000	27a50143-2090-4c48-8f10-084b6996b80f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 16:12:43.251514+00	
00000000-0000-0000-0000-000000000000	6d7d47e2-eac4-4753-a6a6-0bf095ee65a9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 16:12:43.279122+00	
00000000-0000-0000-0000-000000000000	3871460a-54a6-48fe-84f9-b106296e5b2d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 17:10:43.032054+00	
00000000-0000-0000-0000-000000000000	4f040a7d-75b8-4f49-9067-8ab4456a60bd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 17:10:43.048028+00	
00000000-0000-0000-0000-000000000000	e4fb85be-6fe4-46ad-ac0c-eb6fe2e0195a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 18:09:09.716085+00	
00000000-0000-0000-0000-000000000000	c37a9653-a96e-40b9-a694-40e834318bbf	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 18:09:09.724665+00	
00000000-0000-0000-0000-000000000000	ea5fa61b-b62c-469d-9c72-2feafe435eed	{"action":"user_signedup","actor_id":"0661649e-45d2-4f54-bc2e-58e0dcd38a9d","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-04 18:16:56.039169+00	
00000000-0000-0000-0000-000000000000	019b3ec6-bbb2-42c4-917a-c5aaa2dea793	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-04 18:18:17.564892+00	
00000000-0000-0000-0000-000000000000	b17e8d8a-d4ac-4774-966d-cd48892d0f80	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 19:07:28.607577+00	
00000000-0000-0000-0000-000000000000	7bfcef4a-920a-4d0b-ae7d-25a2249443c1	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 19:07:28.617586+00	
00000000-0000-0000-0000-000000000000	f60f9390-599f-4469-9b8a-0638b78420d0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 19:22:28.157837+00	
00000000-0000-0000-0000-000000000000	a5dd39b1-2f02-4928-86e8-8f5c71d052dd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 19:22:28.168096+00	
00000000-0000-0000-0000-000000000000	a95a5744-76a9-43cc-aefa-418b36a4f195	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 21:30:05.485911+00	
00000000-0000-0000-0000-000000000000	b31a2907-6cdd-40bb-95cc-7f283b600e6c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-04 21:30:05.507352+00	
00000000-0000-0000-0000-000000000000	17518f52-c705-4622-95e1-6890ec21ff6b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-04 22:08:50.977295+00	
00000000-0000-0000-0000-000000000000	d2144756-3f07-4adc-ab1e-741cf51422a4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 00:14:43.819727+00	
00000000-0000-0000-0000-000000000000	7bdb6c95-0437-4530-b6e8-5b67fbdbf4aa	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 11:46:55.453952+00	
00000000-0000-0000-0000-000000000000	56fcd035-0f12-44cb-a112-a313c4466a14	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 11:46:55.490354+00	
00000000-0000-0000-0000-000000000000	686a27e3-736f-4cf7-9292-07430d73efd1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 11:47:52.576094+00	
00000000-0000-0000-0000-000000000000	7c5b6f88-01eb-47d0-ab82-3ea78103675e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 11:47:52.582143+00	
00000000-0000-0000-0000-000000000000	11e79428-46b3-4846-8b88-3b690dcaee6c	{"action":"user_signedup","actor_id":"35b7c4b2-dfb3-4fa2-a67b-3ae1d3343658","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-05 11:49:28.424985+00	
00000000-0000-0000-0000-000000000000	3dea90a6-72e3-4456-9515-cf2b7db5506d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"isilvamontaner02@gmail.com","user_id":"35b7c4b2-dfb3-4fa2-a67b-3ae1d3343658","user_phone":""}}	2025-09-05 12:11:38.866389+00	
00000000-0000-0000-0000-000000000000	ed2e8a12-c9af-4f67-9d58-640515ffc90f	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"conra.iturria@gmail.com","user_id":"0661649e-45d2-4f54-bc2e-58e0dcd38a9d","user_phone":""}}	2025-09-05 12:12:00.310779+00	
00000000-0000-0000-0000-000000000000	9caaf750-b8b9-4b63-98c1-792f066e0f50	{"action":"user_signedup","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-05 12:21:43.464477+00	
00000000-0000-0000-0000-000000000000	090216bc-92a3-46c5-b4c6-92c5adee9a5a	{"action":"user_signedup","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-05 12:23:59.054069+00	
00000000-0000-0000-0000-000000000000	fa208d87-173c-4856-b2cb-e33a6e1b7ba4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 12:44:56.520816+00	
00000000-0000-0000-0000-000000000000	7bfd25ec-1072-443d-8fbd-480978662503	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 12:44:56.528044+00	
00000000-0000-0000-0000-000000000000	e0f65920-6a2c-40b8-92cd-f01a248f8966	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 12:53:18.294703+00	
00000000-0000-0000-0000-000000000000	4d64dac8-0de8-484a-9fc1-3625d3d86673	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 12:53:18.301746+00	
00000000-0000-0000-0000-000000000000	94b34270-37d2-432f-8d84-43f97ed58f7f	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 13:00:54.10765+00	
00000000-0000-0000-0000-000000000000	1b056e44-8a79-4094-a18d-475779d85dda	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 13:01:04.908184+00	
00000000-0000-0000-0000-000000000000	01c6f052-f04c-4e30-ad83-49761e81a061	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 13:09:09.720465+00	
00000000-0000-0000-0000-000000000000	8fcf5e67-17c7-401a-ac1d-b2299ec99d3b	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 13:09:12.351015+00	
00000000-0000-0000-0000-000000000000	77ce0953-b8e5-4b99-8347-39a38b9d2537	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 13:45:21.915861+00	
00000000-0000-0000-0000-000000000000	401a77e4-4e9d-4915-b7bd-36e24a042208	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 13:59:11.672405+00	
00000000-0000-0000-0000-000000000000	627cdf16-4a06-4fa6-8511-153a4d3408eb	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 13:59:11.683426+00	
00000000-0000-0000-0000-000000000000	2d1e3ea3-eb5c-442d-8826-50f8eceb9ede	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 14:07:27.177695+00	
00000000-0000-0000-0000-000000000000	18c5cf53-8f20-4590-a3b5-79b9899e3b3d	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 14:07:27.188486+00	
00000000-0000-0000-0000-000000000000	3b287807-f243-4987-885a-31895421236d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 14:45:38.046037+00	
00000000-0000-0000-0000-000000000000	79c56a8d-73b5-44e1-8c51-b788a6f98dbc	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 14:45:38.057642+00	
00000000-0000-0000-0000-000000000000	13ff7adc-9726-403d-b972-82f1ddebf9ab	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 14:56:38.552516+00	
00000000-0000-0000-0000-000000000000	ce4af5b9-d050-416a-8fd5-3880266fe80c	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 14:56:45.175427+00	
00000000-0000-0000-0000-000000000000	870cd3cf-7218-4f93-b6cf-2e099582f2c8	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 15:03:07.492225+00	
00000000-0000-0000-0000-000000000000	2ca809ec-1236-483c-afcf-315b0edc0652	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 15:03:13.829345+00	
00000000-0000-0000-0000-000000000000	fc63ec2f-7056-4a73-99be-7db6f084aebd	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 15:43:43.418432+00	
00000000-0000-0000-0000-000000000000	22aefc88-7b3a-4781-8fe0-026175cef1d8	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 15:43:43.430472+00	
00000000-0000-0000-0000-000000000000	d2ef8fc7-e083-4bec-8807-5e0589b2def9	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 15:47:55.010548+00	
00000000-0000-0000-0000-000000000000	e8c2759c-be77-4ccd-b48a-f0033a3c3ace	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 15:48:02.550947+00	
00000000-0000-0000-0000-000000000000	dd442911-2f23-46b0-a7ec-648053bff0ab	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 15:48:29.716981+00	
00000000-0000-0000-0000-000000000000	73aed97d-00a8-4ce1-bf78-68523a3e3f76	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 15:48:36.763626+00	
00000000-0000-0000-0000-000000000000	168681df-e0f4-4246-abc8-d099565632ea	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 15:48:47.753472+00	
00000000-0000-0000-0000-000000000000	44c5237d-e667-407d-bc48-e81eee56b1d8	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 15:49:01.819751+00	
00000000-0000-0000-0000-000000000000	7b8171c9-be82-4846-90cd-478092f5f18b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 17:22:54.653548+00	
00000000-0000-0000-0000-000000000000	1258a17f-7048-4cec-8fc3-ebdce8dadb1c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 17:22:54.684659+00	
00000000-0000-0000-0000-000000000000	76c35880-47e7-4599-b640-54c4d68d8505	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 17:34:51.14658+00	
00000000-0000-0000-0000-000000000000	de515a91-05e2-49a3-8a4b-219fd870ccf1	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 17:34:51.157957+00	
00000000-0000-0000-0000-000000000000	51e20e83-8cce-40d6-af5d-553d11ee057f	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 17:34:53.018991+00	
00000000-0000-0000-0000-000000000000	1ed1a69d-4ba7-479b-92e0-fcd660de8974	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 17:35:03.045633+00	
00000000-0000-0000-0000-000000000000	82d347ea-170e-4385-af36-71d302463e66	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 17:35:43.600352+00	
00000000-0000-0000-0000-000000000000	d7d1eb69-8ec3-4f3c-8de8-3cc2804b6d3e	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 17:35:53.039627+00	
00000000-0000-0000-0000-000000000000	5bc3d97b-e131-46fb-894a-e58aee773a7f	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 17:36:17.344658+00	
00000000-0000-0000-0000-000000000000	a99237b1-fb4a-4ec8-8009-f410d1038f07	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 17:36:27.073156+00	
00000000-0000-0000-0000-000000000000	bf28866d-d9f8-40cc-9fae-68881c9296b6	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 17:44:39.670424+00	
00000000-0000-0000-0000-000000000000	22e4f9cc-0638-4055-8183-e47a577d131d	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 17:45:03.301328+00	
00000000-0000-0000-0000-000000000000	2ee1794a-ef31-4a0b-a013-cb448824e4c6	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-05 17:51:41.308288+00	
00000000-0000-0000-0000-000000000000	72a7ede3-cfe8-4076-a1a1-f57529cf2562	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-05 17:51:51.531638+00	
00000000-0000-0000-0000-000000000000	7ac89832-6576-463a-b97a-6bfe595d545a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 18:20:53.989755+00	
00000000-0000-0000-0000-000000000000	faa5f1dc-09cf-41a0-9742-d7abb0e21f18	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 18:20:53.997929+00	
00000000-0000-0000-0000-000000000000	263ef28b-0e50-4630-909f-a90f209f8f13	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 18:57:46.078115+00	
00000000-0000-0000-0000-000000000000	be398a74-a2c5-4633-97f2-ae05e308c560	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 18:57:46.098646+00	
00000000-0000-0000-0000-000000000000	6105f1a4-4006-4889-9b79-6c8f31f91ce7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 19:26:54.104648+00	
00000000-0000-0000-0000-000000000000	b14e1e7b-f9b0-4341-841f-2f3162f62f76	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 19:26:54.123211+00	
00000000-0000-0000-0000-000000000000	f97fa31c-9e84-4409-93b7-d8af94c4150f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-06 19:03:52.100795+00	
00000000-0000-0000-0000-000000000000	d5c23436-0e5c-440e-8aa1-9b6565209324	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-06 19:03:52.54138+00	
00000000-0000-0000-0000-000000000000	0bc6a3dc-d41f-4117-874d-bdcaf122cb48	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-06 19:15:05.88568+00	
00000000-0000-0000-0000-000000000000	31e29065-11c2-48c4-bed6-09ef0536ce97	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-06 19:15:12.571918+00	
00000000-0000-0000-0000-000000000000	25442cc5-195d-4ad6-8471-c20f1d769958	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-07 01:37:23.280543+00	
00000000-0000-0000-0000-000000000000	c10186ff-af3a-41f9-8b78-e1be21c88124	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 02:35:56.224394+00	
00000000-0000-0000-0000-000000000000	ee3b7b3a-f57b-41fd-ac8d-98e85ed009f9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 02:35:56.23819+00	
00000000-0000-0000-0000-000000000000	b6982269-161f-4dec-afd4-1160a8891c2f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 03:34:31.743103+00	
00000000-0000-0000-0000-000000000000	8fb25eec-69ec-44f1-b77e-a1947bb01c51	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 03:34:31.769625+00	
00000000-0000-0000-0000-000000000000	05243b03-6c36-4012-83ca-6a1d378e0ca5	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-07 03:35:52.224835+00	
00000000-0000-0000-0000-000000000000	7274c2ba-46e9-48a2-adc8-fb53b06d0e30	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-07 03:35:56.354606+00	
00000000-0000-0000-0000-000000000000	c82e2bbd-53ed-4a1a-b6be-e40f0fef562c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-07 03:42:15.299284+00	
00000000-0000-0000-0000-000000000000	6b5bc1a8-17b6-445b-b4ba-b468227e7b36	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-07 03:42:18.569481+00	
00000000-0000-0000-0000-000000000000	f51ef9b5-c8d4-4dc3-86c0-bd7a40b5bb17	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-08 11:55:50.363923+00	
00000000-0000-0000-0000-000000000000	b0a4965f-3e93-4652-bc49-5413226d6255	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 12:54:11.121088+00	
00000000-0000-0000-0000-000000000000	e058de03-d8fd-416d-80bc-38f008f2c730	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 12:54:11.140647+00	
00000000-0000-0000-0000-000000000000	aadc03d3-12f2-4146-8ca6-308e3f41c884	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 13:52:34.013398+00	
00000000-0000-0000-0000-000000000000	fffd4746-bca0-4a83-a2ae-4ea4fe8ec155	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 13:52:34.025504+00	
00000000-0000-0000-0000-000000000000	4b238672-4117-42f2-a430-cc7939e5fa61	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 14:28:47.467794+00	
00000000-0000-0000-0000-000000000000	d73d73ec-7a5b-46b3-aa0b-907c6fea8a6f	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 14:28:47.49301+00	
00000000-0000-0000-0000-000000000000	bc88a856-05c6-44e2-8ab8-cdb3db836efb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 14:51:12.958863+00	
00000000-0000-0000-0000-000000000000	87709ffe-d029-416e-b50a-4511569f2e28	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 14:51:12.974853+00	
00000000-0000-0000-0000-000000000000	04c852b4-61d9-4051-a2de-f5783afdec4d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 15:28:58.976265+00	
00000000-0000-0000-0000-000000000000	107e3937-4e9c-4a67-b21d-1fc58675344b	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 15:28:58.986219+00	
00000000-0000-0000-0000-000000000000	ccb29718-d796-4fc8-83ea-0cfb47c724a3	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 15:49:31.599473+00	
00000000-0000-0000-0000-000000000000	d0cc9caf-7cf7-4ccc-b32e-9f3709278a74	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 15:49:31.611671+00	
00000000-0000-0000-0000-000000000000	2426d682-6e57-40ae-95f7-9e502a69bac8	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:27:29.095223+00	
00000000-0000-0000-0000-000000000000	80b7e31e-d26f-48c0-ba45-7c0d39cb9989	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:27:29.1065+00	
00000000-0000-0000-0000-000000000000	ddae6c3f-ea87-4a53-84f4-f0106092f421	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:47:32.430223+00	
00000000-0000-0000-0000-000000000000	5ef485e6-604f-4fe6-91d7-18b638b29709	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:47:32.440491+00	
00000000-0000-0000-0000-000000000000	2a9d84d9-c755-4094-9e40-5fb1364d901e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 18:23:36.03671+00	
00000000-0000-0000-0000-000000000000	ed78f9e3-b6fb-42ae-9f10-61b32aadbc2f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 18:23:36.049638+00	
00000000-0000-0000-0000-000000000000	93d4cb85-4aba-4460-a8fc-98df53b2cc28	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 18:57:31.241194+00	
00000000-0000-0000-0000-000000000000	31d659df-bd03-40e3-89d8-7a3b1d6bda01	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 18:57:31.251959+00	
00000000-0000-0000-0000-000000000000	4aa4b7b3-1ebf-410d-8262-c2b1f93c0ae8	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 18:58:14.822562+00	
00000000-0000-0000-0000-000000000000	38fd3cd1-45f5-4be1-80d2-d3317f10b6fe	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-08 18:58:37.721751+00	
00000000-0000-0000-0000-000000000000	f5f30c61-589f-4a53-87e8-592b92711f4f	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 19:37:12.799143+00	
00000000-0000-0000-0000-000000000000	97c7a5d9-889e-425c-aa69-755cadb3c223	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-08 19:37:20.599632+00	
00000000-0000-0000-0000-000000000000	143eed33-68ca-4a8c-aa61-06a971495848	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 11:42:07.655107+00	
00000000-0000-0000-0000-000000000000	83a2f9c0-2c61-4e64-b497-8a4ca060d4de	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 11:42:07.687548+00	
00000000-0000-0000-0000-000000000000	a8eeffe3-3f21-4f08-8dbb-d38aa2bfde0f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 12:52:30.249836+00	
00000000-0000-0000-0000-000000000000	d175988b-42f4-4473-ba9b-6883bab161ef	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 12:52:30.269104+00	
00000000-0000-0000-0000-000000000000	3f99ab2a-bdb4-4818-9772-8092ce50005f	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-09 12:56:02.88403+00	
00000000-0000-0000-0000-000000000000	a50c61c8-d335-4236-ad31-0a9561292233	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-09 12:56:09.204113+00	
00000000-0000-0000-0000-000000000000	e4083054-90ce-4525-9604-1c20884cd23c	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 13:42:25.627508+00	
00000000-0000-0000-0000-000000000000	d8735d31-4b63-4dae-b690-ee73a9aa8a56	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 13:42:25.637147+00	
00000000-0000-0000-0000-000000000000	f5cbe27e-eee5-4d10-9061-729e9abd731f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 13:54:17.180249+00	
00000000-0000-0000-0000-000000000000	7e6efdf1-305f-49af-8c21-e86945a9e6b8	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 13:54:17.18957+00	
00000000-0000-0000-0000-000000000000	101a89f2-878b-4282-a614-fa9a90019fcb	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-09 14:21:03.938286+00	
00000000-0000-0000-0000-000000000000	1e96dcec-ba15-4fbc-b144-56134fe8a50b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-09 14:21:09.709142+00	
00000000-0000-0000-0000-000000000000	621436ae-02bd-4d59-9384-09ca5dd31257	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 15:19:22.455544+00	
00000000-0000-0000-0000-000000000000	0256d771-756a-4233-bd47-061ef62e14d5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 15:19:22.472402+00	
00000000-0000-0000-0000-000000000000	2faaede9-8640-4e9a-8d83-a7d1c6c3cc71	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-09 15:56:03.932148+00	
00000000-0000-0000-0000-000000000000	5c63b36e-e058-4f16-b2df-4bb7397d33c4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 16:43:39.955412+00	
00000000-0000-0000-0000-000000000000	8beeba3d-ca9b-410c-8933-8bdda950b2f3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 16:43:39.968874+00	
00000000-0000-0000-0000-000000000000	56debdbf-c6a8-4894-ad9a-82e552210168	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 17:24:08.065308+00	
00000000-0000-0000-0000-000000000000	8577279e-dbb4-4915-9b79-c5cca69e875a	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 17:24:08.079793+00	
00000000-0000-0000-0000-000000000000	57a6602d-996c-457a-851d-da2e2c7069f2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 17:41:55.19202+00	
00000000-0000-0000-0000-000000000000	8c51f574-c035-4f07-93eb-1af2220e276d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 17:41:55.198844+00	
00000000-0000-0000-0000-000000000000	e5b8440b-2d8f-4007-b932-377247a00c41	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 18:39:56.181408+00	
00000000-0000-0000-0000-000000000000	d45306d9-0536-4309-9f9b-9dedafe14ace	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 18:39:56.195679+00	
00000000-0000-0000-0000-000000000000	8ccfda6c-ff34-4a85-b3a4-b56628dfb5c2	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 01:23:04.589635+00	
00000000-0000-0000-0000-000000000000	69ab9997-9340-42ab-9b57-91f2fd2837b2	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 01:43:24.752007+00	
00000000-0000-0000-0000-000000000000	1e6ee610-ff7f-46f9-aad9-e3af2f919fc9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 01:43:31.979395+00	
00000000-0000-0000-0000-000000000000	730ac30d-9a7c-47cd-919a-d80968c77466	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 03:07:28.627773+00	
00000000-0000-0000-0000-000000000000	0b56a0c2-15ec-4893-9669-a8adbd60dea6	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 03:07:28.642458+00	
00000000-0000-0000-0000-000000000000	9940f50f-ddcd-4ba7-aa11-9060766cb6bc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 04:17:41.851188+00	
00000000-0000-0000-0000-000000000000	fc5686ab-629d-4d97-b791-2b2ad583bda7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 04:17:41.878708+00	
00000000-0000-0000-0000-000000000000	b720089d-de29-4fed-9654-dac34a23b6db	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 14:28:02.199256+00	
00000000-0000-0000-0000-000000000000	8a923e42-0333-430f-938e-7b3691467e4a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 15:26:15.659993+00	
00000000-0000-0000-0000-000000000000	00eb6c02-cab7-40d8-ac3c-ea3c928e2cf9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 15:26:15.673132+00	
00000000-0000-0000-0000-000000000000	0f167959-5c73-4c7c-8482-9cbe83f8e833	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 16:24:54.934491+00	
00000000-0000-0000-0000-000000000000	12b81713-5056-42f7-8a33-1994739a408d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 16:24:54.946365+00	
00000000-0000-0000-0000-000000000000	9f2c12b7-b10c-4686-8cfc-79b786096cd2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 17:22:56.615994+00	
00000000-0000-0000-0000-000000000000	2d1b116b-d03c-4e30-a3ce-66bbd9836705	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 17:22:56.636082+00	
00000000-0000-0000-0000-000000000000	a7b675a6-dc38-4fad-9574-e8a3e812aa32	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 18:21:15.188162+00	
00000000-0000-0000-0000-000000000000	ef5a05ef-6db9-45ae-98e0-c34b6b95024f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 18:21:15.202077+00	
00000000-0000-0000-0000-000000000000	7ce55752-b919-425d-a3b8-6d9c0783c60f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 19:19:27.132021+00	
00000000-0000-0000-0000-000000000000	1ac61941-4833-48c6-913e-945fb26fad23	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 19:19:27.143382+00	
00000000-0000-0000-0000-000000000000	5e7935e4-f3ff-4483-886c-401797cecde4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 19:40:54.29201+00	
00000000-0000-0000-0000-000000000000	878ac900-fc9a-44df-9b8a-7762d35fa208	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 20:18:42.011611+00	
00000000-0000-0000-0000-000000000000	13d682ea-a495-49ea-8e19-4781368e891c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 20:18:42.029948+00	
00000000-0000-0000-0000-000000000000	27e06989-5276-451f-9d93-be1774607439	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:33:15.237126+00	
00000000-0000-0000-0000-000000000000	20702285-573b-487e-9e1a-dcebe2e1a550	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:33:24.037735+00	
00000000-0000-0000-0000-000000000000	d71806c8-d11b-472a-9241-1b835757279c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:37:52.062061+00	
00000000-0000-0000-0000-000000000000	7085ad83-d63a-44e6-90c1-ecb76661ce7a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:38:04.292373+00	
00000000-0000-0000-0000-000000000000	5947861f-6c56-4173-b1f1-1a701ef66791	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:40:05.01917+00	
00000000-0000-0000-0000-000000000000	f03c5c21-d4ec-40bc-9504-bf9734eae2b0	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:40:48.454416+00	
00000000-0000-0000-0000-000000000000	3f926fe9-acc3-47a0-aa2c-4a8b585a58cb	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:45:01.426129+00	
00000000-0000-0000-0000-000000000000	54ea7a64-45c9-42bd-93c0-14072d6bb82a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:45:41.536687+00	
00000000-0000-0000-0000-000000000000	0524c822-17da-42c1-9a17-25e9d2e3ef81	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 20:50:40.17104+00	
00000000-0000-0000-0000-000000000000	b00eb5fa-79c9-4715-92f7-436b5f3edfa0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 21:48:51.594146+00	
00000000-0000-0000-0000-000000000000	f2d3f3fa-10d4-4425-97ca-31242de5ea20	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 21:48:51.601346+00	
00000000-0000-0000-0000-000000000000	44cfed97-b61e-4a61-a375-2ea6f09cc680	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 22:08:14.817488+00	
00000000-0000-0000-0000-000000000000	0c164554-5f97-4943-8977-b20cfad95e69	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-10 22:55:30.472214+00	
00000000-0000-0000-0000-000000000000	09a76778-9844-4014-b8a1-9ce8021e19ce	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 00:14:33.290246+00	
00000000-0000-0000-0000-000000000000	fdb6b9ab-87e5-4112-a1db-bc44100294e9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 03:07:43.793798+00	
00000000-0000-0000-0000-000000000000	7f2dc5ab-9689-423d-a28f-c723c426ed40	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 03:07:43.811334+00	
00000000-0000-0000-0000-000000000000	8cf116c7-8bab-4e4c-aff3-645ee2c9c54d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 03:07:50.018748+00	
00000000-0000-0000-0000-000000000000	2e7eb3a4-063a-4a98-bd8d-54313d0b4600	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 03:27:27.553008+00	
00000000-0000-0000-0000-000000000000	c62ea875-f2d3-4716-982c-90f95d06e50d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 03:27:27.564193+00	
00000000-0000-0000-0000-000000000000	a70c9fae-d111-4b15-8676-8f27c90102f1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 04:22:26.714934+00	
00000000-0000-0000-0000-000000000000	12a8ff5a-28b6-4906-a037-1b33455a8926	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 04:22:26.730393+00	
00000000-0000-0000-0000-000000000000	3e2c5f8a-9556-4274-88e3-85278e7c7f75	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 04:23:13.230036+00	
00000000-0000-0000-0000-000000000000	c5238a01-2c0c-4de2-a520-3eb81a3509d4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 12:25:08.236295+00	
00000000-0000-0000-0000-000000000000	d23eb3ae-7781-4979-80a3-13a382b6d80b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 12:25:08.250191+00	
00000000-0000-0000-0000-000000000000	1471b87f-afaa-4a68-bdae-527bbc447696	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 14:17:57.910957+00	
00000000-0000-0000-0000-000000000000	70a9bf15-8bce-4bb7-be71-47da1bc8df3c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 14:17:57.940587+00	
00000000-0000-0000-0000-000000000000	6f59ce73-788f-4c4e-af9d-248399883ace	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:18:44.27533+00	
00000000-0000-0000-0000-000000000000	57f436b9-0714-459f-a2a1-6d4b66195656	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 14:19:16.026201+00	
00000000-0000-0000-0000-000000000000	7af2d716-f570-4a67-831f-6dc0020c3fd5	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 14:19:16.02712+00	
00000000-0000-0000-0000-000000000000	8b6a2d97-c3d0-4f46-8534-54b1b20216d7	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:27.976401+00	
00000000-0000-0000-0000-000000000000	d42153d0-9376-4e54-9019-a50252a7e16d	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:29.961541+00	
00000000-0000-0000-0000-000000000000	7945444d-94d1-4a92-8400-48fa99830293	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:31.603454+00	
00000000-0000-0000-0000-000000000000	5bd846f2-588c-4a7a-9b8f-184141649164	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:43.991126+00	
00000000-0000-0000-0000-000000000000	adb6e0c1-0fd2-404d-9925-5755f1b9a416	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:47.462649+00	
00000000-0000-0000-0000-000000000000	259e0540-d313-48bc-9e51-625088f66364	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:19:55.312946+00	
00000000-0000-0000-0000-000000000000	108d7983-3da2-4f50-97c0-7d58f58372a4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:20:04.966338+00	
00000000-0000-0000-0000-000000000000	ea5ab8d1-3689-40c5-8297-327934762a1d	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-11 14:21:09.147523+00	
00000000-0000-0000-0000-000000000000	862fdce3-0155-463b-9222-8fc7586cc85b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 15:15:57.953356+00	
00000000-0000-0000-0000-000000000000	38fdc666-a7bc-4c99-893d-fd043fb1b0d4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 15:15:57.960789+00	
00000000-0000-0000-0000-000000000000	67be8850-3543-44d3-a907-9ad34ff44f85	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 15:19:30.187234+00	
00000000-0000-0000-0000-000000000000	ecc66b3f-8ff3-46a3-ad39-eeb59ffc13cc	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 15:19:30.191188+00	
00000000-0000-0000-0000-000000000000	d4e246ec-771e-48aa-af0d-aebfdc6342af	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 16:17:25.410288+00	
00000000-0000-0000-0000-000000000000	893fb153-81c6-4c79-ba40-10e417d48969	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 16:17:25.429563+00	
00000000-0000-0000-0000-000000000000	cff0082e-146a-4966-9464-48f480fd971a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 17:15:53.912512+00	
00000000-0000-0000-0000-000000000000	7f756d92-f9a3-49f5-8514-00103879c51d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 17:15:53.926035+00	
00000000-0000-0000-0000-000000000000	fa5aa47b-355c-4d0f-83c6-a7cfc17b0cd5	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 17:49:02.154906+00	
00000000-0000-0000-0000-000000000000	ec1855ee-f4bf-42e1-8e3b-d60645f92bbc	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 17:49:02.162679+00	
00000000-0000-0000-0000-000000000000	82de0398-acfe-47d4-8fef-c7b02a18eadf	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 18:15:48.913311+00	
00000000-0000-0000-0000-000000000000	bbb1af44-5f20-4a90-bc2c-09d04d3e3bd7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 18:15:48.927276+00	
00000000-0000-0000-0000-000000000000	6475b9db-7854-44c8-ae9b-5ee3ba1ce201	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 18:48:40.717611+00	
00000000-0000-0000-0000-000000000000	ce1d5917-f2dd-4e1d-95da-c928e1ca12f9	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 18:48:40.72933+00	
00000000-0000-0000-0000-000000000000	5c76e6b1-a79c-41eb-9762-6d945a02b2b0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 19:13:59.91393+00	
00000000-0000-0000-0000-000000000000	78285fea-93f2-4563-92c3-f0af080218cc	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 19:13:59.921457+00	
00000000-0000-0000-0000-000000000000	651a4b45-55b1-4c3a-a64d-70cb58102258	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 19:59:27.678936+00	
00000000-0000-0000-0000-000000000000	ee26fab6-75b6-4780-836f-7543324d71bf	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-11 19:59:27.693102+00	
00000000-0000-0000-0000-000000000000	a392ed55-4ee4-4b2d-aca1-56c01899b04e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 01:41:41.651464+00	
00000000-0000-0000-0000-000000000000	5b928017-f339-4d85-b62c-9026f14529df	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 01:41:41.680649+00	
00000000-0000-0000-0000-000000000000	db2efd6b-48d6-496f-a164-34bcd0c0d9b4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-12 01:41:46.742597+00	
00000000-0000-0000-0000-000000000000	7c7c5ea7-f805-463e-b5ee-9f701d929cb8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-12 02:03:31.721198+00	
00000000-0000-0000-0000-000000000000	147a3797-77d1-4bc0-9aea-c80d3cc0aeea	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-12 02:08:24.878976+00	
00000000-0000-0000-0000-000000000000	963f48f3-2b73-4131-8127-951dbc2ede7d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 03:10:06.646675+00	
00000000-0000-0000-0000-000000000000	6101ff9e-0c71-4d68-8303-4051496475fb	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 03:10:06.660691+00	
00000000-0000-0000-0000-000000000000	aaedcf4c-af25-4a45-8ea9-719f161840b1	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 13:13:40.444837+00	
00000000-0000-0000-0000-000000000000	6200c298-7674-4013-b23a-00c1c673451d	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 13:13:40.469863+00	
00000000-0000-0000-0000-000000000000	3ae6f693-74f5-409a-8797-318568bac75d	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-12 13:13:43.65901+00	
00000000-0000-0000-0000-000000000000	9f803e00-b539-48d2-9af6-f636cefd0109	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 13:40:08.296467+00	
00000000-0000-0000-0000-000000000000	da56c2a9-b2be-41d9-abab-17e0aa2eb49d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 13:40:08.308148+00	
00000000-0000-0000-0000-000000000000	1c20bf4b-b1a0-470c-b815-a48d3f550e62	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-12 13:40:17.390471+00	
00000000-0000-0000-0000-000000000000	2552c05e-e80e-4c21-b9cc-cc7fb2f60c81	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:40:50.352254+00	
00000000-0000-0000-0000-000000000000	a71f94ea-1d11-494d-a273-f1e527d7c783	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:40:50.36484+00	
00000000-0000-0000-0000-000000000000	e8b22b7f-d167-44b3-ac3e-d274abfd9403	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:41:01.410268+00	
00000000-0000-0000-0000-000000000000	e34461c2-40d1-4e9d-8388-db93f0017c09	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:41:01.413036+00	
00000000-0000-0000-0000-000000000000	f817fb50-86f9-40a4-98fd-f7dc9cc5968e	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:46:35.055437+00	
00000000-0000-0000-0000-000000000000	f14be489-c897-4950-9ece-ebddc49eef0f	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:46:35.077531+00	
00000000-0000-0000-0000-000000000000	0381a1ae-7135-4af2-9faa-4c23f4f6d039	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:56:11.788934+00	
00000000-0000-0000-0000-000000000000	19469a39-45f2-421f-b515-913e829965d9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:56:11.805279+00	
00000000-0000-0000-0000-000000000000	8a81bd64-567e-40f9-87bf-6f527f11a164	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 16:47:58.783218+00	
00000000-0000-0000-0000-000000000000	68852f3e-ea0d-46f4-90ce-b52f5c28cb12	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 16:47:58.794434+00	
00000000-0000-0000-0000-000000000000	317b7fe5-038e-464a-a3b8-866603df6b06	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 16:54:39.245346+00	
00000000-0000-0000-0000-000000000000	672c7e54-5c3d-4a90-a0b2-668bd93c5e16	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 16:54:39.253463+00	
00000000-0000-0000-0000-000000000000	83da6273-d470-4ce8-99b8-10c1164b817d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 17:46:01.208903+00	
00000000-0000-0000-0000-000000000000	5a51fea2-5378-4bdb-82cd-7ccd8b90fc09	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 17:46:01.220422+00	
00000000-0000-0000-0000-000000000000	333adbc3-7bbf-4e40-bece-08d0110a6768	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 17:53:00.534784+00	
00000000-0000-0000-0000-000000000000	08facbae-2d0d-4883-9370-6c141bdd9520	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 17:53:00.54675+00	
00000000-0000-0000-0000-000000000000	472c8744-1944-424f-b80e-3946904d6b9c	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 18:48:08.705091+00	
00000000-0000-0000-0000-000000000000	4d5032d3-6c45-4e69-b2b5-a4a94ecc5230	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 18:48:08.715092+00	
00000000-0000-0000-0000-000000000000	4238115d-1a51-4642-b67b-f8de50f072e8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 18:51:22.20429+00	
00000000-0000-0000-0000-000000000000	d8c2dc4c-5722-4551-bf54-2cce4eac4d25	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 18:51:22.207035+00	
00000000-0000-0000-0000-000000000000	630211ab-b0f9-4b1f-bd9d-6efad14c3fc2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:54:59.807247+00	
00000000-0000-0000-0000-000000000000	8a7f94c7-076c-45fd-8574-68f96511da52	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 22:54:59.842571+00	
00000000-0000-0000-0000-000000000000	16ce47f3-4956-43c1-a88e-1d92bf8a9fe5	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-13 22:55:02.995042+00	
00000000-0000-0000-0000-000000000000	7f0afac8-ef9f-4451-9d4f-bfa5a5ab9d31	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:58:43.038126+00	
00000000-0000-0000-0000-000000000000	0c682b6c-6ec1-4d30-ace2-76dc17bc303d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 23:58:43.050858+00	
00000000-0000-0000-0000-000000000000	09fdef0f-5a4d-433b-bad2-282c3ac0256d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:59:30.759522+00	
00000000-0000-0000-0000-000000000000	ab3beeec-5200-44d9-8810-f4795cff7a00	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:59:30.767384+00	
00000000-0000-0000-0000-000000000000	06f48691-5d32-4438-8ecd-da4f4db7b6a4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:09:06.584752+00	
00000000-0000-0000-0000-000000000000	f429018d-f22a-49e6-9e7e-0bb153e9c136	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 02:09:06.597729+00	
00000000-0000-0000-0000-000000000000	69c5cab1-5c89-48e1-b370-5dd8399cc5e8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 03:16:41.840459+00	
00000000-0000-0000-0000-000000000000	007f98fc-dd69-45c8-b8aa-95b8f701edc3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 03:16:41.853921+00	
00000000-0000-0000-0000-000000000000	d9247ff4-d048-489f-8b77-204a81cb1bfb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 02:30:38.881325+00	
00000000-0000-0000-0000-000000000000	5f3ef0b8-89ab-43b9-ad75-252e1baf4995	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 02:30:38.889067+00	
00000000-0000-0000-0000-000000000000	06e2bc44-19c7-460b-bc6b-792019d87300	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-15 02:30:44.146572+00	
00000000-0000-0000-0000-000000000000	b9323f19-4168-4a79-acf8-5c235a5fb157	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 03:33:54.696491+00	
00000000-0000-0000-0000-000000000000	3d4e10bd-2f7a-4e78-bcac-5f1b7d895379	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 03:33:54.71162+00	
00000000-0000-0000-0000-000000000000	7f2b29b7-1c91-446a-a33c-b75a9dc2914e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 13:25:56.308529+00	
00000000-0000-0000-0000-000000000000	85db7595-9f69-4b3b-beaf-8462336652ab	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 13:25:56.335641+00	
00000000-0000-0000-0000-000000000000	a046134a-0f05-406c-a945-e1f1c03f79d7	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 13:26:13.919349+00	
00000000-0000-0000-0000-000000000000	90734745-29f7-4c0b-957a-4476307a464b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-15 13:26:20.057269+00	
00000000-0000-0000-0000-000000000000	96c220d7-5105-4218-aa39-c8c4dabc96f9	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 14:10:30.862831+00	
00000000-0000-0000-0000-000000000000	f01f2349-4b2d-4758-8c1a-a4ca3540d309	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 14:10:30.869883+00	
00000000-0000-0000-0000-000000000000	5281c9d3-6ac7-4d00-bf31-d3d1e9f803dd	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-15 14:10:33.014283+00	
00000000-0000-0000-0000-000000000000	a36dad8a-baa5-44ca-a06c-af6af252a760	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 14:50:31.684374+00	
00000000-0000-0000-0000-000000000000	68396e1c-9aa7-4180-b197-d68a2e082bee	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 14:50:31.705234+00	
00000000-0000-0000-0000-000000000000	333056b1-8a32-40c4-bc67-26b4ea3742c0	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 15:09:35.750718+00	
00000000-0000-0000-0000-000000000000	db94a295-b528-49e5-9f6e-426ac3d76741	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 15:09:35.766898+00	
00000000-0000-0000-0000-000000000000	ba1fadd6-0a05-4572-a025-87de141eeee8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 15:54:53.678844+00	
00000000-0000-0000-0000-000000000000	08ced012-5c3d-4634-a7bd-968371337784	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 15:54:53.709886+00	
00000000-0000-0000-0000-000000000000	4552a67f-77af-4946-ab13-59d4684729bc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 16:53:27.020666+00	
00000000-0000-0000-0000-000000000000	7edf7ca3-27e3-4a5a-adae-1b7451d83f5f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 16:53:27.038805+00	
00000000-0000-0000-0000-000000000000	001d4a8a-a5cb-479a-80c4-828e20df10e0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 17:51:33.106073+00	
00000000-0000-0000-0000-000000000000	5e64c565-58e4-4a0a-91dd-5280418ffa80	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 17:51:33.130487+00	
00000000-0000-0000-0000-000000000000	552c2d46-a695-4a7e-8c7c-b23ce35f0ec6	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 18:38:04.985008+00	
00000000-0000-0000-0000-000000000000	f40afb0d-8dc4-4590-b937-63653dde5538	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 18:38:05.001236+00	
00000000-0000-0000-0000-000000000000	1b211723-5390-424e-aa11-0546214c5e39	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 18:49:38.115298+00	
00000000-0000-0000-0000-000000000000	6eade84e-8e3c-4a8b-b2f9-4176cfe0013d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 18:49:38.123048+00	
00000000-0000-0000-0000-000000000000	095bcd78-bd7a-4606-a486-be4c6235e196	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 19:47:56.615995+00	
00000000-0000-0000-0000-000000000000	3b1eecf6-0d1b-4d58-8432-dd945406c4c7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 19:47:56.631508+00	
00000000-0000-0000-0000-000000000000	a9c380b9-e787-47ae-878d-d401abb5bd88	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 20:08:19.301261+00	
00000000-0000-0000-0000-000000000000	fdeb3b07-f64c-45b1-bcbe-36d89c9b3457	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-15 20:12:30.941707+00	
00000000-0000-0000-0000-000000000000	95f97d17-cdc4-4d68-9851-59088761e04d	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 20:13:46.233522+00	
00000000-0000-0000-0000-000000000000	df751fa6-379f-400c-a3e6-fe71d12c1f0c	{"action":"user_signedup","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-15 20:21:29.562454+00	
00000000-0000-0000-0000-000000000000	c77ba69e-fec0-4c9b-b04e-16c2ea82f533	{"action":"logout","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 20:21:44.94668+00	
00000000-0000-0000-0000-000000000000	4c4af042-16b3-46ca-86ca-1d42901d0848	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 00:30:21.504726+00	
00000000-0000-0000-0000-000000000000	f1df3ac4-c5f4-4fba-a73b-6f4f550a82ec	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 01:59:06.525227+00	
00000000-0000-0000-0000-000000000000	37f51488-de87-4750-98d9-2bcae2a04352	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 01:59:06.542645+00	
00000000-0000-0000-0000-000000000000	267215f0-9c82-411a-b3c9-8e8671ca2791	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 02:35:23.605966+00	
00000000-0000-0000-0000-000000000000	7b2a2e4c-e04d-401a-87b2-223a8f37d1c4	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 02:37:31.570903+00	
00000000-0000-0000-0000-000000000000	f7016a1c-227f-4293-9680-5e6a37317a74	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 02:50:54.371988+00	
00000000-0000-0000-0000-000000000000	3e419c1b-8323-488c-aee1-37e64a9f83f1	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 02:52:38.30463+00	
00000000-0000-0000-0000-000000000000	ba47e9a8-0fa9-4542-95c2-5959eaff4c5f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 02:52:45.089561+00	
00000000-0000-0000-0000-000000000000	34f394cc-fb2a-4250-85ff-e4da3ae5aa1c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 02:52:49.593132+00	
00000000-0000-0000-0000-000000000000	28b79300-b0d6-4d08-9a24-8e32b2c9caf3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 02:52:51.970921+00	
00000000-0000-0000-0000-000000000000	3ace0141-5aaf-4046-b668-5bf9b0586723	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 02:52:56.615551+00	
00000000-0000-0000-0000-000000000000	3ce0882b-96d8-4362-87b4-b5ecf9925d66	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 02:53:04.039923+00	
00000000-0000-0000-0000-000000000000	b5327d3e-8170-4ddc-b442-724234814397	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 02:59:01.037035+00	
00000000-0000-0000-0000-000000000000	b6d17124-3a54-445a-9f77-24bb8192d08c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 03:34:19.33649+00	
00000000-0000-0000-0000-000000000000	90e767c4-4157-4339-9737-4fa13de6cf53	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 14:28:27.362421+00	
00000000-0000-0000-0000-000000000000	94ce7c53-df6d-4581-9e2e-1aa793a54676	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 11:28:30.753518+00	
00000000-0000-0000-0000-000000000000	25e7c50d-b8c7-4d55-9d8b-997616f4c508	{"action":"user_confirmation_requested","actor_id":"9e8dd464-db1b-4ea0-a6f6-4d7310b4b615","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 11:58:06.481239+00	
00000000-0000-0000-0000-000000000000	bc296191-c322-4b91-9526-aebb881d0176	{"action":"user_confirmation_requested","actor_id":"9e8dd464-db1b-4ea0-a6f6-4d7310b4b615","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:00:57.856926+00	
00000000-0000-0000-0000-000000000000	111ed68a-dc56-40be-baee-453879a515ba	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"eurdinez@gmail.com","user_id":"9e8dd464-db1b-4ea0-a6f6-4d7310b4b615","user_phone":""}}	2025-09-16 12:06:50.417036+00	
00000000-0000-0000-0000-000000000000	b65de618-4b78-4215-8a4a-cea4adab85f7	{"action":"user_confirmation_requested","actor_id":"b7db87ea-c780-4749-91a4-490f85b575ad","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:07:30.061995+00	
00000000-0000-0000-0000-000000000000	1446d082-bb31-428d-8063-71ed3edb7f34	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"eurdinez@gmail.com","user_id":"b7db87ea-c780-4749-91a4-490f85b575ad","user_phone":""}}	2025-09-16 12:17:40.293313+00	
00000000-0000-0000-0000-000000000000	c2e4f7ae-49b7-4205-9ab5-50f1174ac31c	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:18:01.9323+00	
00000000-0000-0000-0000-000000000000	40bfc545-b9db-49a8-ac4a-a4fd3763e864	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 12:29:58.164718+00	
00000000-0000-0000-0000-000000000000	c018dfe3-ef22-4957-9b0a-6156c1f638f8	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 12:29:58.171695+00	
00000000-0000-0000-0000-000000000000	d3c0a0d8-d0b2-49f4-abd6-3093c0e0ee2c	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:32:23.447499+00	
00000000-0000-0000-0000-000000000000	eede2624-b8bc-49f4-8fcb-917d3a8cee81	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:40:54.391749+00	
00000000-0000-0000-0000-000000000000	b481b65c-91c6-490c-89f8-18f3508bcb4d	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:42:40.830938+00	
00000000-0000-0000-0000-000000000000	aac8c8a8-d03e-4f98-bba9-b0e3a6ae7063	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 12:55:36.502414+00	
00000000-0000-0000-0000-000000000000	4555672e-796e-434e-b39f-a9a7b28e1720	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 13:08:26.017935+00	
00000000-0000-0000-0000-000000000000	cd581d0d-aa1a-4095-b426-736e8a03b9a6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 13:27:57.983957+00	
00000000-0000-0000-0000-000000000000	018d7453-7a67-4f60-a38a-b3db54b33595	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 13:27:57.997612+00	
00000000-0000-0000-0000-000000000000	1e2ec85a-4722-4ba8-9afa-d84290807411	{"action":"user_confirmation_requested","actor_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-16 13:46:02.155351+00	
00000000-0000-0000-0000-000000000000	a3a980e1-46bc-46e9-90cd-9718fb5bdee8	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"eurdinez@gmail.com","user_id":"73237713-d4d9-46d0-83ff-6b27c09d6352","user_phone":""}}	2025-09-16 14:11:12.972525+00	
00000000-0000-0000-0000-000000000000	9d35aebd-f095-415b-89ef-9fb9ecffb506	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"eurdinez@gmail.com","user_id":"3140399f-16c2-4729-b4b1-c6cc58d4eb31","user_phone":""}}	2025-09-16 14:11:46.169472+00	
00000000-0000-0000-0000-000000000000	ed646158-a4e6-45c8-86eb-31cb0f20c7b0	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"eurdinez@gmail.com","user_id":"3140399f-16c2-4729-b4b1-c6cc58d4eb31","user_phone":""}}	2025-09-16 14:17:44.204279+00	
00000000-0000-0000-0000-000000000000	af961c4f-1561-4ec1-9b0c-ee90f5f7cac4	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 14:18:46.907946+00	
00000000-0000-0000-0000-000000000000	42c5da3f-f789-4fe8-9dc4-ca869412e83c	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"eurdinez@gmail.com","user_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","user_phone":""}}	2025-09-16 14:23:52.466827+00	
00000000-0000-0000-0000-000000000000	9dc5b1ca-4fcf-4894-894a-c08c43af35a3	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 14:24:57.32526+00	
00000000-0000-0000-0000-000000000000	1fc1e443-5eba-4829-b4c8-0cf51762bc35	{"action":"login","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 14:25:10.629332+00	
00000000-0000-0000-0000-000000000000	e8f2f47c-c486-4823-aa5f-0121e7ba9399	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-16 14:27:34.293549+00	
00000000-0000-0000-0000-000000000000	9301a7e5-515c-4824-8028-b86686fd1e2d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 14:28:27.360554+00	
00000000-0000-0000-0000-000000000000	a6dba0ca-cdd1-43e0-9b85-3fde48428f85	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 14:30:43.120574+00	
00000000-0000-0000-0000-000000000000	6c319ce3-32d4-4095-947b-ae051d05ac36	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-16 14:30:52.759188+00	
00000000-0000-0000-0000-000000000000	83c145a5-0e3f-49ba-9bc3-fe4975f56b05	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-16 14:40:46.268857+00	
00000000-0000-0000-0000-000000000000	0643e730-2884-45dc-acac-5dbcaf4a01d0	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 14:58:49.40896+00	
00000000-0000-0000-0000-000000000000	6446b3b2-7d73-4237-a8eb-61eb65f21ca5	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 14:58:49.421794+00	
00000000-0000-0000-0000-000000000000	ff81759d-c5e5-4f30-a2e5-31b7743d80cb	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 14:58:51.947397+00	
00000000-0000-0000-0000-000000000000	20a5256f-29c7-492e-bca3-d5ffee4403fe	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-16 15:14:41.576616+00	
00000000-0000-0000-0000-000000000000	3caf4089-3b93-40eb-8f31-aa98563a02db	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 15:26:43.179184+00	
00000000-0000-0000-0000-000000000000	d3f55221-980f-41ae-a089-084c12ed5444	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 15:26:43.187438+00	
00000000-0000-0000-0000-000000000000	ec8beece-b614-4b63-bc63-dd97e0929c9b	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 15:42:32.53343+00	
00000000-0000-0000-0000-000000000000	fe8bb90c-911c-4d05-9988-79cef4b9880f	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 15:42:32.542842+00	
00000000-0000-0000-0000-000000000000	e57e705b-6523-4dc8-99ea-a6ce95c54f44	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:22:25.918246+00	
00000000-0000-0000-0000-000000000000	171430dd-71db-4931-8aea-46906583c8d0	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:22:25.937336+00	
00000000-0000-0000-0000-000000000000	5e70d05a-2636-4fbf-8b34-deb5e59beaab	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:25:07.306497+00	
00000000-0000-0000-0000-000000000000	fa1ca458-dadf-4a6a-9be4-7eb8597e34c8	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:25:07.312917+00	
00000000-0000-0000-0000-000000000000	f27a2d9b-a6fe-4749-bfbe-f826ea824ea6	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:36:36.699654+00	
00000000-0000-0000-0000-000000000000	8b15e049-56fe-432d-ad04-84eb99bed5f9	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 16:36:36.706203+00	
00000000-0000-0000-0000-000000000000	84e1609c-e742-474c-bfb1-39b1c9aca5f0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:25:17.016126+00	
00000000-0000-0000-0000-000000000000	e0a3c2be-bfd7-468f-8055-07819f35d674	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:25:17.030761+00	
00000000-0000-0000-0000-000000000000	1af3dbb5-943b-4af5-a761-99e5ebbeb27d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 17:26:29.192827+00	
00000000-0000-0000-0000-000000000000	6ee92203-ade3-4a67-b4ad-37f3d08f6bef	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:48:57.893106+00	
00000000-0000-0000-0000-000000000000	837c85a3-2cb9-4d87-af55-3aecaf342801	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:48:57.903599+00	
00000000-0000-0000-0000-000000000000	3b654f45-6c7d-42bc-a731-eac41fc522f0	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:58:03.326932+00	
00000000-0000-0000-0000-000000000000	099a091a-c01b-4031-a275-22d6d40efb27	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 17:58:03.337146+00	
00000000-0000-0000-0000-000000000000	8dc746ee-ca6a-48ea-bb79-0f8d09665439	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 18:26:50.427423+00	
00000000-0000-0000-0000-000000000000	b44605a2-f020-4ce4-8e54-d5829b16891e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 18:26:50.441694+00	
00000000-0000-0000-0000-000000000000	1eef8961-4d23-430d-8ffc-1708b6c13248	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 19:04:32.403881+00	
00000000-0000-0000-0000-000000000000	3784858e-1bdc-470f-b70a-0d0c6703ccd2	{"action":"token_refreshed","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:04:39.137707+00	
00000000-0000-0000-0000-000000000000	a6dd5fa8-f167-4540-bdd4-f062ab276ce4	{"action":"token_revoked","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:04:39.138388+00	
00000000-0000-0000-0000-000000000000	34f8f726-fcff-4888-8564-e8f7e17351e9	{"action":"logout","actor_id":"e7b46826-8126-47da-a3ea-ed10eb69d068","actor_name":"Ignacio silva montaner","actor_username":"isilvamontaner02@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 19:04:42.473937+00	
00000000-0000-0000-0000-000000000000	a8f08ab8-64ee-414c-a004-b3020b057b22	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 19:04:49.244589+00	
00000000-0000-0000-0000-000000000000	a69583c8-b09a-4d0f-8304-5f50c2278a96	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-16 19:05:03.444973+00	
00000000-0000-0000-0000-000000000000	abea56a7-bddd-469b-be3e-94c9dfe13986	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 19:05:15.397043+00	
00000000-0000-0000-0000-000000000000	ec3de9d0-f84e-4d63-a548-a501ee0aed6c	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:10:33.318733+00	
00000000-0000-0000-0000-000000000000	a813c702-fc73-4ba2-b6bb-8f9f83a4f352	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:10:33.326897+00	
00000000-0000-0000-0000-000000000000	9a1a1f5f-f42d-4d81-8798-98f8f956b35d	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:19:29.526096+00	
00000000-0000-0000-0000-000000000000	7700cfef-d694-4705-9d8c-8167e28440fe	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-16 19:19:29.533216+00	
00000000-0000-0000-0000-000000000000	f3c19665-d2a5-4880-841e-97c22ac82729	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-16 19:27:17.552667+00	
00000000-0000-0000-0000-000000000000	1829245c-e318-4d83-b8ab-0529e9671969	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 00:35:01.153325+00	
00000000-0000-0000-0000-000000000000	7638de03-030d-4e42-badd-17c53b0080a5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 01:46:59.882341+00	
00000000-0000-0000-0000-000000000000	644acb40-3c61-4ebf-8960-b5c0cb198086	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 01:46:59.906042+00	
00000000-0000-0000-0000-000000000000	0e482531-5f59-4145-a3f0-407b38aacc52	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 11:55:23.21658+00	
00000000-0000-0000-0000-000000000000	bf614386-f33e-4acb-b458-5735b53a6200	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 11:55:23.251754+00	
00000000-0000-0000-0000-000000000000	2c9c4b08-0fe6-465a-8ef0-ac91ca51355c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 11:55:28.964042+00	
00000000-0000-0000-0000-000000000000	94570a29-8cfc-4966-8699-d6842164e58a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 12:01:41.958217+00	
00000000-0000-0000-0000-000000000000	4a87314f-7c49-456d-8e35-37a82d6180df	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 12:48:35.731226+00	
00000000-0000-0000-0000-000000000000	4b1ca4ee-60db-4081-b7f0-1700061ec684	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 12:48:35.743328+00	
00000000-0000-0000-0000-000000000000	d9885250-faeb-40c3-aef2-1b0c157d1f2c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 12:48:46.613747+00	
00000000-0000-0000-0000-000000000000	a36729c4-ae9c-4f49-a8cf-2ea6cd1b1f43	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 13:15:21.642489+00	
00000000-0000-0000-0000-000000000000	3b60f1fd-7420-4a3f-99ba-f623b01c8fc7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 13:15:21.656022+00	
00000000-0000-0000-0000-000000000000	f9549105-d544-4846-87a9-cba36060c07a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 13:17:36.204817+00	
00000000-0000-0000-0000-000000000000	eaa82f28-d428-4d76-8acb-461ba4fd8a67	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 14:15:55.617119+00	
00000000-0000-0000-0000-000000000000	05625c61-afaf-4089-8a24-917e991b485f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 14:15:55.639276+00	
00000000-0000-0000-0000-000000000000	c2982637-6646-4386-8ffb-0ee228f2bcf8	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-17 14:18:05.755882+00	
00000000-0000-0000-0000-000000000000	6bf53b30-07c8-4c48-8326-e703551882ef	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 14:18:13.130242+00	
00000000-0000-0000-0000-000000000000	c3040496-57b9-49bf-a2f2-f08da6f32c06	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-17 14:21:05.411736+00	
00000000-0000-0000-0000-000000000000	25432b12-eba0-4e84-a039-f6fdf6ea67b8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 14:21:11.466679+00	
00000000-0000-0000-0000-000000000000	5fe865e1-c8e4-46fd-93aa-473661b79849	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 15:29:24.827227+00	
00000000-0000-0000-0000-000000000000	612c25e5-dcee-4e3c-b2e7-45523640a49e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 15:29:24.845478+00	
00000000-0000-0000-0000-000000000000	72d0a1a6-a00d-4fa2-bfe0-bc559c64c384	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 15:30:24.950266+00	
00000000-0000-0000-0000-000000000000	940cc34a-3e3d-4f58-ad02-5c2adde74b51	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 15:30:24.954816+00	
00000000-0000-0000-0000-000000000000	60d827f9-721e-476b-a2e8-552d957a66d7	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 15:30:28.429624+00	
00000000-0000-0000-0000-000000000000	ba05c336-88d8-408b-9a9c-09046c2b6861	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-17 15:42:44.435727+00	
00000000-0000-0000-0000-000000000000	48b4d40d-9048-4a42-a7e4-533338862fdb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:13:05.027841+00	
00000000-0000-0000-0000-000000000000	7140e88e-55a5-4bd6-92a6-02463f5a0e75	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:13:05.040323+00	
00000000-0000-0000-0000-000000000000	0670cdb1-e02c-47d7-89fc-8e6a1818f669	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:33:20.157336+00	
00000000-0000-0000-0000-000000000000	77b8cb06-c312-40cd-8829-f281914ff4cc	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:33:20.16621+00	
00000000-0000-0000-0000-000000000000	51e6ac43-96e1-4f1b-a6e5-b417c1d99042	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:39:53.824171+00	
00000000-0000-0000-0000-000000000000	ac840fb9-fbb5-4c75-b8ef-2ff10e90195e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 19:39:53.8278+00	
00000000-0000-0000-0000-000000000000	d4102499-cc31-4a59-aec0-d952c2240e29	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 11:46:26.176448+00	
00000000-0000-0000-0000-000000000000	d793c846-c29b-4a3c-9646-b9c405828a06	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 11:46:26.205853+00	
00000000-0000-0000-0000-000000000000	5606fe9f-f66f-4649-af3b-055b2a953e46	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 11:46:28.332161+00	
00000000-0000-0000-0000-000000000000	82c5a4e8-4a32-4701-b437-c57b1bbae3a2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 11:46:47.698685+00	
00000000-0000-0000-0000-000000000000	322da623-de86-47b2-8fb0-b6c6143ba052	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 11:46:47.699319+00	
00000000-0000-0000-0000-000000000000	aba9965b-d43d-448f-b71c-111eb1b6509b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 11:46:53.308142+00	
00000000-0000-0000-0000-000000000000	2089f596-ee89-4e42-9d31-5be29f27e0c4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:10:49.094173+00	
00000000-0000-0000-0000-000000000000	bf9e799f-4307-4d01-84df-0e354f10bd0f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:10:49.106409+00	
00000000-0000-0000-0000-000000000000	dfd52c56-d9fd-4458-a209-5df16e4cca05	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 12:10:54.799343+00	
00000000-0000-0000-0000-000000000000	c7cf320d-d2e3-4287-9659-30da9ea4cf23	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:51:13.559548+00	
00000000-0000-0000-0000-000000000000	84658ed7-a46b-4e80-92fc-30ee80d7d6aa	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:51:13.570517+00	
00000000-0000-0000-0000-000000000000	0d56c4fd-edc8-4b55-b77b-af1e7e58f198	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:57:32.220526+00	
00000000-0000-0000-0000-000000000000	512a858b-ae9f-482b-9f88-d5abb6f8901b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 12:57:32.227681+00	
00000000-0000-0000-0000-000000000000	f532d6aa-68ca-4e19-912c-6bb165a10900	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 13:09:13.322741+00	
00000000-0000-0000-0000-000000000000	d54b9a6a-8738-4467-8fb0-5a8281e29e56	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 13:09:13.334642+00	
00000000-0000-0000-0000-000000000000	6a29a490-55c4-448f-86c1-d76da1e4186f	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 13:49:55.265148+00	
00000000-0000-0000-0000-000000000000	9195ed20-adcc-455d-8122-bba903223065	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 13:49:55.28696+00	
00000000-0000-0000-0000-000000000000	67e7f17c-81ad-48c0-8aba-b52fd677df53	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:10:00.040252+00	
00000000-0000-0000-0000-000000000000	74fa6dea-9598-4c87-a5dd-83f2cd642793	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:10:00.059398+00	
00000000-0000-0000-0000-000000000000	d83a3f6a-bb1c-49f3-b2a9-5c03e6fc8a08	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:18:47.69363+00	
00000000-0000-0000-0000-000000000000	a5f7ae9f-6020-4e93-8c8c-ebf3926fa692	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:18:47.698227+00	
00000000-0000-0000-0000-000000000000	326629ce-8391-4a5a-8735-21a2ec9676e5	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:52:06.865512+00	
00000000-0000-0000-0000-000000000000	cc4c401a-32b3-42e9-9737-cc0ec9ef4101	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 14:52:06.877245+00	
00000000-0000-0000-0000-000000000000	ba170971-6461-4726-b67b-70c3eb0deaa2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 15:08:17.517673+00	
00000000-0000-0000-0000-000000000000	8ea38214-28f6-437a-889b-f891b1546aa5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 15:08:17.531958+00	
00000000-0000-0000-0000-000000000000	45f11c9f-7795-4d51-ba24-dfb2b0171f1f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 15:20:41.7133+00	
00000000-0000-0000-0000-000000000000	95caed68-66aa-42b5-9f7a-98580e9497e4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 15:20:41.725027+00	
00000000-0000-0000-0000-000000000000	02eb8261-2eb7-4f16-aa5a-a5178a972b4a	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:11:10.362697+00	
00000000-0000-0000-0000-000000000000	c36063c2-0d24-4975-948f-02be463c69fb	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:11:10.373021+00	
00000000-0000-0000-0000-000000000000	cad953d6-002e-4c8c-8c77-4ec552e33c56	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:16:57.207688+00	
00000000-0000-0000-0000-000000000000	46e616f4-c705-4b2c-af01-89287ff4d546	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:16:57.211582+00	
00000000-0000-0000-0000-000000000000	b123dd87-3c9d-4c46-9856-509db4380041	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 16:39:44.731483+00	
00000000-0000-0000-0000-000000000000	4694ed8c-579c-4c5b-8e40-9d771eb281df	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:48:04.867755+00	
00000000-0000-0000-0000-000000000000	5a302596-e7c3-4988-8d20-097d05aa6a1a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 16:48:04.880723+00	
00000000-0000-0000-0000-000000000000	efd575ab-c6a8-4459-a9cb-529399628440	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 17:14:58.642269+00	
00000000-0000-0000-0000-000000000000	9cbe0059-5079-4f28-94dc-6024f82da401	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 17:14:58.653757+00	
00000000-0000-0000-0000-000000000000	514e4e17-e1a7-4233-b176-0064f10c160b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 17:49:48.241272+00	
00000000-0000-0000-0000-000000000000	05d966b5-1468-4eff-9426-0ffe673b3b3d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 17:49:48.262093+00	
00000000-0000-0000-0000-000000000000	40ed3fc2-7ea3-46b3-8ef9-3160f6d501bd	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:24:07.696039+00	
00000000-0000-0000-0000-000000000000	779cfe6c-8b3e-41da-b44c-52969c7beacb	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:24:07.715255+00	
00000000-0000-0000-0000-000000000000	463e211e-bd80-4910-abc6-1630fcaf4f69	{"action":"user_signedup","actor_id":"0a3c12de-5dbc-4ff7-83ae-7de315b392f3","actor_name":"Alejandro Schipani","actor_username":"alejandroschipani@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-18 18:26:50.189582+00	
00000000-0000-0000-0000-000000000000	4e355d91-715e-4c97-b709-feafbfbd64a2	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 18:27:05.959033+00	
00000000-0000-0000-0000-000000000000	b0e074b5-2526-430c-83b0-c7ab4e2b07f3	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:50:35.594069+00	
00000000-0000-0000-0000-000000000000	118ae7b0-2181-413b-a976-be965f924675	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:50:35.603405+00	
00000000-0000-0000-0000-000000000000	0bb54c95-0cbf-4479-abd1-bb3ede817db0	{"action":"logout","actor_id":"0a3c12de-5dbc-4ff7-83ae-7de315b392f3","actor_name":"Alejandro Schipani","actor_username":"alejandroschipani@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-18 18:51:55.863704+00	
00000000-0000-0000-0000-000000000000	8768f46f-2c34-46a5-9799-dd8eab1cfb45	{"action":"login","actor_id":"0a3c12de-5dbc-4ff7-83ae-7de315b392f3","actor_name":"Alejandro Schipani","actor_username":"alejandroschipani@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 18:52:03.623803+00	
00000000-0000-0000-0000-000000000000	d2422dda-baea-403e-81ee-0398201a86f9	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:57:35.706987+00	
00000000-0000-0000-0000-000000000000	4ed0f25a-f94d-4950-a4ec-1804bd460f2f	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 18:57:35.722567+00	
00000000-0000-0000-0000-000000000000	087b95b9-05fe-4287-b535-41354faf1c80	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 19:39:57.006082+00	
00000000-0000-0000-0000-000000000000	1ea03ae9-5f49-4e0f-a984-02b2915fc0e9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 19:39:57.020225+00	
00000000-0000-0000-0000-000000000000	892f504f-57d4-428c-8dbf-da2fc04e2d64	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-18 19:49:25.458617+00	
00000000-0000-0000-0000-000000000000	64b6a671-9999-4781-91fa-3524c22657ac	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 19:53:05.35975+00	
00000000-0000-0000-0000-000000000000	4f5ab13a-88bd-436f-8bba-f2b2e2136c0e	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 19:59:03.894844+00	
00000000-0000-0000-0000-000000000000	9fe408df-93cb-49c5-b84f-67e4d70d6465	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 19:59:03.902315+00	
00000000-0000-0000-0000-000000000000	20b030e7-0487-4b9c-94f2-760551ac5ca2	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 19:59:05.482172+00	
00000000-0000-0000-0000-000000000000	49378abd-7195-42dc-960e-f1819a0e99c0	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 20:51:34.271822+00	
00000000-0000-0000-0000-000000000000	99b9bf02-c15f-416f-b346-844379f9fb7e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 20:51:34.286287+00	
00000000-0000-0000-0000-000000000000	ee6a209a-5504-48ad-8fdd-35ba21a302a8	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-18 20:54:08.294003+00	
00000000-0000-0000-0000-000000000000	93c74fa6-96d2-4579-9887-0f6028aa5832	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 20:54:15.047807+00	
00000000-0000-0000-0000-000000000000	1e42ff1b-ddf0-40a2-981a-42b479043686	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-18 21:10:21.012709+00	
00000000-0000-0000-0000-000000000000	680679f3-b631-4f9e-9d37-865488b87bc4	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-18 21:10:27.952647+00	
00000000-0000-0000-0000-000000000000	995a5fdc-c309-42ed-a399-9ae33d5e8f6d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 22:11:29.913796+00	
00000000-0000-0000-0000-000000000000	6151680d-0471-4773-807b-3fcdcf3dc8ab	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-18 22:11:29.926821+00	
00000000-0000-0000-0000-000000000000	bbb3e0ab-8f34-4c1c-ab92-04f9c207b687	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 11:45:35.056258+00	
00000000-0000-0000-0000-000000000000	7e5cf335-2f85-410b-9d5a-186335e347a4	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 11:45:35.070824+00	
00000000-0000-0000-0000-000000000000	129ec50d-1a5e-43df-b92e-40ce6c556d87	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 11:45:41.712114+00	
00000000-0000-0000-0000-000000000000	839eb108-2bca-4857-a5b0-2d81d7ac4a62	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-19 11:46:01.498383+00	
00000000-0000-0000-0000-000000000000	64481c4a-471d-4f5c-9d6b-534461838573	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 11:46:06.583532+00	
00000000-0000-0000-0000-000000000000	61d77b39-d72d-4237-82e9-6dfa0273fbaf	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 12:09:55.155947+00	
00000000-0000-0000-0000-000000000000	fe056105-eb7f-421f-89e2-7cd83e02fe02	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 12:44:23.844872+00	
00000000-0000-0000-0000-000000000000	c88bece2-4019-4cd2-ba28-1fa89658cd46	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 12:44:23.862501+00	
00000000-0000-0000-0000-000000000000	278dc147-bbfa-4d47-8e21-b0be99d3a84a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 13:12:38.670904+00	
00000000-0000-0000-0000-000000000000	778f2a6c-3a51-4adc-9d4a-e2d915b16761	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 14:23:12.827615+00	
00000000-0000-0000-0000-000000000000	e856fdeb-0cd0-4877-bb3f-24e9de9a977d	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 14:23:12.863217+00	
00000000-0000-0000-0000-000000000000	b0202ad5-b26b-4031-b03d-024eaf928963	{"action":"logout","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-21 15:17:55.645023+00	
00000000-0000-0000-0000-000000000000	be00586a-7ca3-46aa-8a84-b0322d796777	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 14:23:17.593963+00	
00000000-0000-0000-0000-000000000000	84693dbd-6ffb-4a38-bbac-9c9910436903	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 14:38:01.275597+00	
00000000-0000-0000-0000-000000000000	a4727e82-68af-4aaa-a744-0e596bdf805c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 14:38:01.282878+00	
00000000-0000-0000-0000-000000000000	97cd0b04-3e3b-44ad-a767-82724c56a755	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 15:51:34.006104+00	
00000000-0000-0000-0000-000000000000	c70b1895-9df8-4e04-b024-2dd61505f40a	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 15:51:34.027128+00	
00000000-0000-0000-0000-000000000000	30365dcb-0107-41f9-97d6-b8c3c70d3bbb	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 17:58:09.167782+00	
00000000-0000-0000-0000-000000000000	69f04f86-6d1e-4008-af98-0aad0138f854	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 17:58:09.197711+00	
00000000-0000-0000-0000-000000000000	758f6302-dd16-4832-b853-999447e6e308	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-19 18:51:50.23378+00	
00000000-0000-0000-0000-000000000000	cd338f75-96e7-415c-82fe-fc8c7a991ce0	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-19 18:53:19.812664+00	
00000000-0000-0000-0000-000000000000	75abf6e7-0d5e-43b4-a6e7-568803d5a0ea	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 19:51:23.588776+00	
00000000-0000-0000-0000-000000000000	4bd7fc9e-8f99-4e48-aaca-68d0aaa1eac7	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 19:51:23.604889+00	
00000000-0000-0000-0000-000000000000	d4dc6517-68f6-4cbb-88c2-f86c54449ca2	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 20:06:33.321625+00	
00000000-0000-0000-0000-000000000000	2da78988-417c-49ff-88d8-c5d1e0384941	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-19 20:06:33.336237+00	
00000000-0000-0000-0000-000000000000	1d213255-790e-4841-bf83-6c32bd0f4504	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 21:37:07.59567+00	
00000000-0000-0000-0000-000000000000	032002bb-ebdf-4e11-a35e-37fabb2fa1da	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-19 21:48:47.120663+00	
00000000-0000-0000-0000-000000000000	9dca2031-ef8b-4ce8-a1f6-613eac14619e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-19 21:48:54.724685+00	
00000000-0000-0000-0000-000000000000	ab81a487-37a9-4ad4-94f6-e207cf3bc69f	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-19 21:49:56.064684+00	
00000000-0000-0000-0000-000000000000	51f57562-a99e-42fa-aaa7-060258593aa9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-20 15:07:34.898967+00	
00000000-0000-0000-0000-000000000000	422d1fd2-4d9b-45b0-8ff5-5b85c0643894	{"action":"user_signedup","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-09-20 15:08:34.570571+00	
00000000-0000-0000-0000-000000000000	73bedde1-df94-45ae-bb7e-04c5dfd7287e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 16:05:43.915491+00	
00000000-0000-0000-0000-000000000000	bc569838-7ccb-455d-ada8-59335ea06c9f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 16:05:43.934127+00	
00000000-0000-0000-0000-000000000000	60c46e40-927f-40da-ae61-2da390eb92bc	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 16:06:41.458934+00	
00000000-0000-0000-0000-000000000000	6744daf7-c10e-489d-9e25-d0b62c015363	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 16:06:41.462519+00	
00000000-0000-0000-0000-000000000000	24350d89-a346-471b-82ab-cf2ff94983d2	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 17:04:42.316705+00	
00000000-0000-0000-0000-000000000000	ec3b8140-4c2f-478c-9bc7-d1ddce1e014e	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 17:04:42.345403+00	
00000000-0000-0000-0000-000000000000	26ff289e-b3ef-4d91-af26-2e84069dbebf	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 18:03:07.716252+00	
00000000-0000-0000-0000-000000000000	c452ab92-b31b-4220-bcb5-95e78e25aed1	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 18:03:07.734557+00	
00000000-0000-0000-0000-000000000000	fa664a15-7567-497a-ad49-3c9a968bfc7f	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 19:01:37.678842+00	
00000000-0000-0000-0000-000000000000	1db09453-a404-4b24-8b41-8cfd9a724b0b	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 19:01:37.698623+00	
00000000-0000-0000-0000-000000000000	c6564a1a-d1db-41ee-b8e7-95c6d013b070	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 20:08:14.095814+00	
00000000-0000-0000-0000-000000000000	4a2cf673-07e2-4495-87c3-a1240632437a	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 20:08:14.126496+00	
00000000-0000-0000-0000-000000000000	224e222d-a2ef-47ae-8b76-9bfa2b5da340	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 21:06:43.737096+00	
00000000-0000-0000-0000-000000000000	3881f2c8-3472-4c07-aeb4-8fcf011f89e7	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 21:06:43.76527+00	
00000000-0000-0000-0000-000000000000	9ec4fbbc-e885-4982-bdd1-c3d9c74b21d9	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 00:11:56.377326+00	
00000000-0000-0000-0000-000000000000	5f61ed32-e60c-4722-91cd-7eff7bcf168e	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 00:11:56.404648+00	
00000000-0000-0000-0000-000000000000	75499f94-1e79-4538-bcb1-18f2bdda640c	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 12:25:14.071296+00	
00000000-0000-0000-0000-000000000000	8dac0ab9-b5ab-4a86-9e1d-a99cdd84bf4e	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 12:25:14.102457+00	
00000000-0000-0000-0000-000000000000	ed0ed25e-4a33-4213-8827-9a1d5d7befa5	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 13:23:44.991271+00	
00000000-0000-0000-0000-000000000000	386b8606-5d74-4bf1-922e-8b290e3d77a0	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 13:23:45.013615+00	
00000000-0000-0000-0000-000000000000	58c3f52d-f618-48e0-a835-87ebf87dd59f	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 14:22:13.999399+00	
00000000-0000-0000-0000-000000000000	552bc2fa-9226-4131-b92c-8e01ac6f6433	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 14:22:14.019638+00	
00000000-0000-0000-0000-000000000000	637dcfc8-0b5d-458d-a897-61a6934faca1	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 15:20:44.111031+00	
00000000-0000-0000-0000-000000000000	93c709d7-ebde-4615-a872-568f647592fc	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 15:20:44.139673+00	
00000000-0000-0000-0000-000000000000	f0263780-8917-4b2c-8d64-bf80e8b4e66e	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 20:43:38.615004+00	
00000000-0000-0000-0000-000000000000	0867b9c4-7069-452c-b242-dd71316a1f51	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 20:43:38.648109+00	
00000000-0000-0000-0000-000000000000	05d7a038-ab41-4924-b38a-8db502c8ecdd	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 12:08:28.905588+00	
00000000-0000-0000-0000-000000000000	61a255a5-3f8e-48da-a8af-16da00c1dc55	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 12:25:51.644807+00	
00000000-0000-0000-0000-000000000000	2cbae8e9-d9cc-46f2-9d56-a73efe2384d7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 12:26:07.45661+00	
00000000-0000-0000-0000-000000000000	449b1410-f3e8-4118-8773-6190b208f6e1	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 12:47:46.699908+00	
00000000-0000-0000-0000-000000000000	091a16a2-7565-4322-82d9-53658290a353	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 13:24:19.8142+00	
00000000-0000-0000-0000-000000000000	6c04b120-9c87-49b8-bf46-da6e0dd76382	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 13:24:19.829329+00	
00000000-0000-0000-0000-000000000000	c561cb28-adc5-4bbd-8e52-9250de15e8f1	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 13:45:45.936203+00	
00000000-0000-0000-0000-000000000000	3292739a-52e6-4241-9c0a-3ac9d2035eba	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 13:45:45.948172+00	
00000000-0000-0000-0000-000000000000	e1e87a20-0eab-4e5e-9c24-28037c5587fd	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 14:22:37.060333+00	
00000000-0000-0000-0000-000000000000	c21282cb-b668-4ccf-a19f-bd099592e394	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 14:22:37.078839+00	
00000000-0000-0000-0000-000000000000	e3f5c8ce-fd59-49d9-b8ff-c1391a5b62c4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 14:41:16.846795+00	
00000000-0000-0000-0000-000000000000	84e0177d-3bd9-4b04-a2ae-e30877ef05be	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:39:31.250427+00	
00000000-0000-0000-0000-000000000000	d782815f-9eca-4d22-accd-d9994ed56864	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:39:31.274874+00	
00000000-0000-0000-0000-000000000000	938f6e77-9179-4bb9-be11-6ddd5d85d33e	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:46:03.941062+00	
00000000-0000-0000-0000-000000000000	330bac71-1385-463b-b5b4-322b452157fc	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:46:03.952843+00	
00000000-0000-0000-0000-000000000000	3ed2a9aa-85b5-4ae6-8f69-ceba29b345b6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 16:00:32.367485+00	
00000000-0000-0000-0000-000000000000	5084dd68-4b83-408c-b447-957a640a8cd9	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 16:47:44.663721+00	
00000000-0000-0000-0000-000000000000	7698c244-0340-4369-8c12-38b65b955f39	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 16:52:04.158643+00	
00000000-0000-0000-0000-000000000000	178d92e7-5d03-4834-8ae1-3e84784318ad	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 17:25:20.706048+00	
00000000-0000-0000-0000-000000000000	da2a0d2a-1121-4e2a-b9ab-33a5635803c0	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 17:25:20.723444+00	
00000000-0000-0000-0000-000000000000	f78ad1ad-688b-403e-a19a-bcc52f640c93	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 17:25:40.983791+00	
00000000-0000-0000-0000-000000000000	e1b42916-f369-4a5a-8e28-365c09a0fa95	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 17:25:49.697255+00	
00000000-0000-0000-0000-000000000000	eaaa83ad-d262-4ba7-a9f9-2ecd047e0cab	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 17:29:22.917335+00	
00000000-0000-0000-0000-000000000000	aa53dba8-b753-435e-bc70-786b449a4722	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 17:29:28.761734+00	
00000000-0000-0000-0000-000000000000	84144713-98e0-43c9-9dd6-e7cb6d583c15	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 18:27:53.313398+00	
00000000-0000-0000-0000-000000000000	fc6dfe56-285d-424d-80ba-a77b093d94b1	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 18:27:53.330459+00	
00000000-0000-0000-0000-000000000000	37191451-b475-47f1-a12b-ae08c0912ed5	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 18:43:04.188518+00	
00000000-0000-0000-0000-000000000000	61f0221c-25ba-47cc-90f0-ba6b7dfb717e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 18:43:04.201413+00	
00000000-0000-0000-0000-000000000000	669b6218-3d0b-46b4-a8f9-520826e619a9	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 18:48:47.303982+00	
00000000-0000-0000-0000-000000000000	d370f6be-df31-4d4d-9dd6-783f0600cf4b	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 18:50:09.264771+00	
00000000-0000-0000-0000-000000000000	a03ea76a-f87f-4191-bb48-ca85615907de	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 18:50:14.645964+00	
00000000-0000-0000-0000-000000000000	0345cf1c-60e2-46b6-bd86-2c4f73b46818	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 19:26:28.40905+00	
00000000-0000-0000-0000-000000000000	ca18e92f-c732-4a7a-affd-9a96b81cb137	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 19:26:34.87857+00	
00000000-0000-0000-0000-000000000000	ba205694-1428-4855-a266-08c9f35e654a	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-22 19:27:15.996702+00	
00000000-0000-0000-0000-000000000000	4d215147-7b17-402c-93f9-401b4af6ae1c	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-22 19:27:25.033484+00	
00000000-0000-0000-0000-000000000000	dd7056b7-0daa-4638-b7c6-a1cb868f160e	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 23:02:12.475821+00	
00000000-0000-0000-0000-000000000000	6efb3b1a-e0a6-41b5-93d6-7e730bd184b0	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 23:02:12.507197+00	
00000000-0000-0000-0000-000000000000	be4fadc8-f134-460d-85a2-d59f74ef1935	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 00:00:14.42391+00	
00000000-0000-0000-0000-000000000000	9c4e64f8-32dd-4ea4-ba10-8138cd2624bf	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 00:00:14.45276+00	
00000000-0000-0000-0000-000000000000	450acf66-c864-4387-9f4a-430635d65cee	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 01:20:45.147058+00	
00000000-0000-0000-0000-000000000000	4d7cb7ea-1304-45ea-8f75-1bbc73ad94b8	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 01:20:45.170135+00	
00000000-0000-0000-0000-000000000000	85c26b1c-568e-405e-bd06-18146e946564	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 11:00:45.990299+00	
00000000-0000-0000-0000-000000000000	1ea87dc4-b6a4-4275-a88c-9e471744a738	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 11:00:46.026046+00	
00000000-0000-0000-0000-000000000000	685fca52-57ac-491e-9c07-5647459d1c37	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 12:33:36.4441+00	
00000000-0000-0000-0000-000000000000	3d0ec767-560d-4e8f-a75c-665bf8697352	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 12:33:36.462423+00	
00000000-0000-0000-0000-000000000000	163c39a5-16c4-443c-bd80-a804a99844f1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 12:34:50.805454+00	
00000000-0000-0000-0000-000000000000	ce7fa7fe-1359-4c3a-9df7-06dc92fcbf44	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 12:35:45.887713+00	
00000000-0000-0000-0000-000000000000	430a9e89-2c9b-4864-a0e5-62899485b855	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 12:35:56.988902+00	
00000000-0000-0000-0000-000000000000	48dde59a-c186-463c-af14-b6b7c932c3ec	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 13:32:25.825292+00	
00000000-0000-0000-0000-000000000000	07650906-00cb-41e8-8b44-58a91cfe4a9d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 14:04:06.43891+00	
00000000-0000-0000-0000-000000000000	487e0d17-8882-47ff-9435-198bfa4baae6	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 14:04:13.358077+00	
00000000-0000-0000-0000-000000000000	8137b3cd-55b4-4fa7-a32a-7962b24d67e5	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 14:04:19.341868+00	
00000000-0000-0000-0000-000000000000	7425355f-fc41-42db-a6c7-96ea6f42012e	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 15:02:45.938687+00	
00000000-0000-0000-0000-000000000000	b4ab426b-c0a7-4067-b3ba-f41ada3d39a3	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 15:02:45.961956+00	
00000000-0000-0000-0000-000000000000	ef89c549-a21d-436e-9c05-46a98d96cbfa	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 15:56:42.364422+00	
00000000-0000-0000-0000-000000000000	96918af1-47b1-425b-950b-cc3ea4d24d4a	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 15:56:54.71901+00	
00000000-0000-0000-0000-000000000000	6ebbf406-ccf2-4bee-910f-e34028420104	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 15:56:59.873041+00	
00000000-0000-0000-0000-000000000000	7f07ffae-3514-436c-a765-752c30216050	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 16:00:25.145729+00	
00000000-0000-0000-0000-000000000000	7b1599b3-c7b3-48e2-bff8-8b3ba69cb424	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 16:03:40.742816+00	
00000000-0000-0000-0000-000000000000	c67b565a-975c-4eb0-9eff-bb560719bdf4	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:08:34.743189+00	
00000000-0000-0000-0000-000000000000	fb06f283-0947-4013-a3fc-51b3a7bdcbf2	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:08:34.75289+00	
00000000-0000-0000-0000-000000000000	2f26d260-e336-4903-804e-31fe2deda469	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:08:34.804404+00	
00000000-0000-0000-0000-000000000000	7cc82b1e-8eb8-4f86-8e0f-4d2afc469b33	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:08:34.807028+00	
00000000-0000-0000-0000-000000000000	32016292-65ca-4622-b263-1b898f9063e1	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:31:29.400347+00	
00000000-0000-0000-0000-000000000000	b53102b0-c1b0-4b29-8c16-15a74293b3ac	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 17:31:29.4154+00	
00000000-0000-0000-0000-000000000000	c2e134f1-c4ab-4211-b328-29f902e17867	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 18:13:54.645213+00	
00000000-0000-0000-0000-000000000000	9f9bf872-5290-452a-81cd-1d8d61881127	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 18:13:54.667565+00	
00000000-0000-0000-0000-000000000000	03877dbe-ff9e-4ce1-ba31-8974c2ed437d	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 18:29:11.716553+00	
00000000-0000-0000-0000-000000000000	9a84ea47-e0d4-4673-8e12-551fd748380e	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 18:29:14.874064+00	
00000000-0000-0000-0000-000000000000	c0b42eb0-8ef5-4c57-9ad3-31735b01697e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 18:29:14.877822+00	
00000000-0000-0000-0000-000000000000	60db1b50-e1be-47ca-837b-9bac0a12b203	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 18:29:19.923112+00	
00000000-0000-0000-0000-000000000000	76e94a09-6ed2-4e0c-ae42-adbbc4fc87d2	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 18:31:28.775049+00	
00000000-0000-0000-0000-000000000000	ea3cfe16-e0c3-48b8-b69a-07d42f27e23a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 18:31:36.404109+00	
00000000-0000-0000-0000-000000000000	88d648b7-4fc7-407c-9d98-f0a2b726cdfe	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 19:05:37.278012+00	
00000000-0000-0000-0000-000000000000	2ccdce26-bbe3-46ca-bfa0-741ef7549947	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 19:05:44.11848+00	
00000000-0000-0000-0000-000000000000	0be94475-2686-41f5-8662-8f5923268e96	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 19:06:09.141916+00	
00000000-0000-0000-0000-000000000000	fe066c72-6be3-454b-9dc6-aa3c4e57f229	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-23 19:06:16.894098+00	
00000000-0000-0000-0000-000000000000	e63f7157-1e1c-470c-8440-3ca16a526c61	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 12:05:41.866596+00	
00000000-0000-0000-0000-000000000000	3ebaf4f4-ab3b-4580-bdba-a08de0c5cb56	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 12:05:41.89502+00	
00000000-0000-0000-0000-000000000000	1b8ce01e-6a3f-4715-9f7a-61d0c5655e2b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 13:03:42.321659+00	
00000000-0000-0000-0000-000000000000	5112d1f1-1337-4252-ac23-a70cd38083de	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 13:03:42.338979+00	
00000000-0000-0000-0000-000000000000	beb9f7f3-eff0-4b42-9437-67a0d4725711	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 14:01:53.748327+00	
00000000-0000-0000-0000-000000000000	41f72148-a5f9-4a2d-836d-29cac1ea6b1a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 14:01:53.764658+00	
00000000-0000-0000-0000-000000000000	1490db85-9632-4f48-ad37-779dd7bf20f6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 15:09:39.89117+00	
00000000-0000-0000-0000-000000000000	2fd72c87-c02e-4c05-9dff-10979ac43ffe	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 15:09:39.91987+00	
00000000-0000-0000-0000-000000000000	a9e0d956-7194-402e-b80b-d0a1df9f4aa3	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 16:04:54.945698+00	
00000000-0000-0000-0000-000000000000	b55861c2-9a5a-4915-9f36-5c6a94a6bbdd	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 16:04:54.964037+00	
00000000-0000-0000-0000-000000000000	e3f3a8b8-a2ec-4ea9-afd7-0f800eabd1c1	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:05:05.956951+00	
00000000-0000-0000-0000-000000000000	1f040c4e-0840-45c0-a279-3147dd94310b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 16:07:50.901746+00	
00000000-0000-0000-0000-000000000000	5f980245-7567-4453-be02-cff3a3ae336f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 16:07:50.90514+00	
00000000-0000-0000-0000-000000000000	a341e947-bc67-4634-9ae4-f2adb58fec60	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"gemini.dev.assistant.g@gmail.com","user_id":"5e803c44-a3c6-430d-9ae1-7a025651555e","user_phone":""}}	2025-09-24 16:10:12.27354+00	
00000000-0000-0000-0000-000000000000	5dc122e3-de1b-4868-9abb-78717ea7f613	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:12:21.078903+00	
00000000-0000-0000-0000-000000000000	a4d79482-e320-4a38-a795-fe54d256e356	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:14:08.104525+00	
00000000-0000-0000-0000-000000000000	e6c97264-bd29-48d1-9f4b-e4b3dc4871fa	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:21:37.28408+00	
00000000-0000-0000-0000-000000000000	7f538ef7-e115-4946-9cf3-45b085defe34	{"action":"logout","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-24 16:21:46.224118+00	
00000000-0000-0000-0000-000000000000	50454111-9e1f-46f4-bebc-be1bb67bd925	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:23:15.438059+00	
00000000-0000-0000-0000-000000000000	18c3af3a-1721-4798-aecc-f0793204a833	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 16:57:34.557633+00	
00000000-0000-0000-0000-000000000000	b77ed97e-2072-45a2-8548-c0778f89c3c7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:36:16.380825+00	
00000000-0000-0000-0000-000000000000	307b1149-e888-42f9-a054-1f3bff42ca7a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:36:16.400239+00	
00000000-0000-0000-0000-000000000000	567d6bfe-0b63-4bd5-b1bd-d7b9fd5f4190	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:59:55.310147+00	
00000000-0000-0000-0000-000000000000	c5bf84db-f6c3-487e-8eee-2b1df59172ea	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:59:55.312093+00	
00000000-0000-0000-0000-000000000000	2b43fa00-6822-43e8-a75f-d7f48a15101c	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:59:55.315856+00	
00000000-0000-0000-0000-000000000000	22f0560f-bc61-4478-a613-ba8c7e2eb89c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:59:55.315947+00	
00000000-0000-0000-0000-000000000000	7202d422-140b-4937-af41-b1189fddce15	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 18:35:43.530185+00	
00000000-0000-0000-0000-000000000000	fc03e6e5-c83a-4918-9268-9c0cbddc692e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 18:35:43.539307+00	
00000000-0000-0000-0000-000000000000	f25099fe-fa34-4403-927d-ff8e37f01360	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 19:03:53.174165+00	
00000000-0000-0000-0000-000000000000	68d6806d-5a90-4f51-bfe4-3ad52904e057	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-24 19:12:48.247468+00	
00000000-0000-0000-0000-000000000000	f223ca4e-1fd6-4691-bed4-dc487bcb7fcc	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-24 19:13:52.939591+00	
00000000-0000-0000-0000-000000000000	2ff65d9c-6a94-4fde-a9cd-4cfb0c994e5a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 19:33:50.382448+00	
00000000-0000-0000-0000-000000000000	b0c968bf-40db-4756-8bbe-92e7c3630273	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 19:33:50.394934+00	
00000000-0000-0000-0000-000000000000	db0ce577-d524-4d90-9eac-f13ccf6fec78	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 22:37:47.30073+00	
00000000-0000-0000-0000-000000000000	9f116601-03b4-499a-ad38-5d2e4f8da856	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 22:37:47.300675+00	
00000000-0000-0000-0000-000000000000	ae653a8d-9f70-4a61-9d1d-c09af8bc801a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 22:37:47.329351+00	
00000000-0000-0000-0000-000000000000	dbf2d557-c56c-4f4d-a25b-247858278de7	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 22:37:47.330523+00	
00000000-0000-0000-0000-000000000000	591ccc8d-b6a3-4d4f-87ae-2916f45e1eb0	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 23:36:17.64201+00	
00000000-0000-0000-0000-000000000000	20ffcb5b-ba24-494b-b2c4-94957396fe49	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 23:36:17.642972+00	
00000000-0000-0000-0000-000000000000	ad6e6d5e-d3bd-4720-abd3-9e78b4a359ac	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 23:36:17.660342+00	
00000000-0000-0000-0000-000000000000	f93a61c3-46b0-4740-9a60-f68693c23dfd	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 23:36:17.664202+00	
00000000-0000-0000-0000-000000000000	e097bfef-c35f-45d0-9124-f58995c0b2f4	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 00:35:25.247483+00	
00000000-0000-0000-0000-000000000000	36659906-b6d9-45c5-95db-bfa2e106d17f	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 00:35:25.263743+00	
00000000-0000-0000-0000-000000000000	bd63c5c7-8fab-4f57-a962-67fdc4c1665a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 00:35:25.247605+00	
00000000-0000-0000-0000-000000000000	03aeaba7-71e3-46f2-837c-1ff92fb529c3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 00:35:25.266918+00	
00000000-0000-0000-0000-000000000000	15e9dc6c-6edb-4984-8dfb-84c72b78a591	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 01:33:55.353321+00	
00000000-0000-0000-0000-000000000000	3b1d2b18-9881-4798-aeac-d5f32e56920f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 01:33:55.355583+00	
00000000-0000-0000-0000-000000000000	9f13e50a-ebde-4fae-ad8f-191d1ef256b3	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 01:33:55.380502+00	
00000000-0000-0000-0000-000000000000	34cb8414-fccd-459f-b20a-2d2c70a95648	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 01:33:55.382205+00	
00000000-0000-0000-0000-000000000000	3aac9c14-74cd-46b6-8d91-66b7a7ad1474	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 03:32:58.434982+00	
00000000-0000-0000-0000-000000000000	040cdaa3-5e59-45c5-a36c-6cdc485432ae	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 03:33:26.323344+00	
00000000-0000-0000-0000-000000000000	764e8b5e-b4f6-4242-ae87-46d53724b7d7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 11:26:19.513968+00	
00000000-0000-0000-0000-000000000000	297ec356-4df1-45af-858a-4002340864bd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 11:26:19.545264+00	
00000000-0000-0000-0000-000000000000	7d391a8c-63ce-4b9a-be36-7535aef93af2	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 11:42:42.989899+00	
00000000-0000-0000-0000-000000000000	20b24876-4a57-475c-bc0b-2341dd19d47c	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 11:42:48.773332+00	
00000000-0000-0000-0000-000000000000	8fc3f323-eefb-4144-aa51-4f7c4e99766c	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 11:42:50.26234+00	
00000000-0000-0000-0000-000000000000	a03ba0ff-94f3-4569-af23-d5f16da3c0df	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 11:42:50.264658+00	
00000000-0000-0000-0000-000000000000	b9789c9d-7be6-47bc-a027-04be50c82e69	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 11:58:59.365412+00	
00000000-0000-0000-0000-000000000000	a79a9c6f-b8ef-48f2-98d7-f917089473f5	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 11:59:06.608112+00	
00000000-0000-0000-0000-000000000000	d67fbbf0-5a7e-4c82-9d41-fd2526bfa5d8	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 12:36:02.322748+00	
00000000-0000-0000-0000-000000000000	e90033df-7cc9-44f0-a570-245c2ce96f7f	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 12:41:19.63935+00	
00000000-0000-0000-0000-000000000000	26279073-f296-41d4-af36-e1b61b6b72a5	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 12:41:19.649659+00	
00000000-0000-0000-0000-000000000000	705e9a8d-236b-4619-a07a-9d877db30038	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:34:47.915977+00	
00000000-0000-0000-0000-000000000000	9e0939de-c005-4b71-a5d2-71c807cb30a5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:34:47.939195+00	
00000000-0000-0000-0000-000000000000	8dad196d-a177-486c-b1a3-f4a64c5e07f1	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 13:37:48.163855+00	
00000000-0000-0000-0000-000000000000	f2630d93-35ce-45d2-8d51-625461b45c39	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:37:58.291619+00	
00000000-0000-0000-0000-000000000000	a8c5e5f0-f3f0-472b-8bf6-6da81ac77d1e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:37:58.293474+00	
00000000-0000-0000-0000-000000000000	60a47f68-7530-48d1-8159-000438896ebb	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 13:37:58.690255+00	
00000000-0000-0000-0000-000000000000	8ce2c525-69b6-4372-9c03-296448a7bd0c	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:39:49.541023+00	
00000000-0000-0000-0000-000000000000	c3198830-58c2-4ef6-a7d9-7aa4ce5b3294	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 13:39:49.543784+00	
00000000-0000-0000-0000-000000000000	35d9d3b6-d6d0-4b8a-854c-527408a28a51	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:36:03.862042+00	
00000000-0000-0000-0000-000000000000	456a7fb9-8b27-463d-b8e0-da6ded7453aa	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:36:03.881183+00	
00000000-0000-0000-0000-000000000000	ead6446b-3ea7-4751-952b-f2cdd49eec60	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:36:17.458349+00	
00000000-0000-0000-0000-000000000000	e2cdc4a2-9b46-4701-b0db-bbac78706171	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:36:17.45999+00	
00000000-0000-0000-0000-000000000000	ef59dea2-dd13-4047-8c7a-a41baea680cf	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:38:20.015829+00	
00000000-0000-0000-0000-000000000000	37178c01-d2d1-484d-a78e-fe4052afc5ba	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:38:20.019179+00	
00000000-0000-0000-0000-000000000000	f7ecf01c-a806-4962-96fe-fd476078e6d9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:34:33.939896+00	
00000000-0000-0000-0000-000000000000	e3ae9803-47ad-4ab2-99e7-712a487b64cc	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:34:33.950809+00	
00000000-0000-0000-0000-000000000000	e47d67d8-7c46-4f7b-b963-cd2784e82bab	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:36:49.387042+00	
00000000-0000-0000-0000-000000000000	3e3b3f26-b0ca-46c3-9c77-7be94fedf553	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:36:49.387983+00	
00000000-0000-0000-0000-000000000000	a63a33a0-1e7d-493a-b966-f9cae9c9bee3	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:38:20.252297+00	
00000000-0000-0000-0000-000000000000	c7b8a4ee-88cc-4da6-bb56-047c0d14caa1	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 15:38:20.254894+00	
00000000-0000-0000-0000-000000000000	2578be57-a8f0-4708-8b76-2954a2a30bc6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 16:32:44.705178+00	
00000000-0000-0000-0000-000000000000	c0a46b3d-c7b5-4e49-9ccf-51c5f401d021	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 16:32:44.718405+00	
00000000-0000-0000-0000-000000000000	487311c9-fe43-4287-83ee-cfa07f77e328	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 16:35:19.840269+00	
00000000-0000-0000-0000-000000000000	42bedeca-aa70-41ec-aa74-c48e6a44e153	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 16:35:19.844981+00	
00000000-0000-0000-0000-000000000000	def980ca-3bbf-4c1c-8de2-33b2e61b12ea	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 17:30:47.005798+00	
00000000-0000-0000-0000-000000000000	019be93d-1065-493f-9832-26b389644a90	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 17:30:47.025313+00	
00000000-0000-0000-0000-000000000000	813acdbc-4d68-4f46-b827-4de21f7bd9d7	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 17:33:49.700848+00	
00000000-0000-0000-0000-000000000000	ae9147f4-de98-4710-b4c5-038514640e9a	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 17:33:49.713363+00	
00000000-0000-0000-0000-000000000000	49200c13-0096-48e1-8db0-925300bf6942	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 17:36:26.361739+00	
00000000-0000-0000-0000-000000000000	6a3b9953-28dd-4f6a-ab9c-17479c5d68ef	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 17:43:59.40011+00	
00000000-0000-0000-0000-000000000000	bf05041d-4553-47d9-bba8-8a5343d15be5	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 18:32:19.872327+00	
00000000-0000-0000-0000-000000000000	0d2f683d-9aa0-4af8-9d78-a71bb749a0c5	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 18:32:19.897024+00	
00000000-0000-0000-0000-000000000000	b5b9e180-e186-498a-9cf4-7a60ced2b412	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 18:57:48.550448+00	
00000000-0000-0000-0000-000000000000	4c3ce144-febb-4f82-94c7-85baf7a2c471	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 18:57:48.571828+00	
00000000-0000-0000-0000-000000000000	8bccfa3a-4df0-46b7-9a08-aaff1b8b2732	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 19:30:49.829813+00	
00000000-0000-0000-0000-000000000000	7b58a565-6b60-4311-b373-06db0d6df5aa	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 19:30:49.853031+00	
00000000-0000-0000-0000-000000000000	98f0c525-0007-4805-82da-23ca2018466a	{"action":"token_refreshed","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 20:29:19.949625+00	
00000000-0000-0000-0000-000000000000	6c9c2ddb-4acc-4a59-8ded-7694d08b1211	{"action":"token_revoked","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 20:29:19.968148+00	
00000000-0000-0000-0000-000000000000	24485a5c-27c5-48b8-833f-73cc686cc25d	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:01:01.396112+00	
00000000-0000-0000-0000-000000000000	fe4ba41c-3c75-4b5e-be19-6ad10fad1eee	{"action":"login","actor_id":"485fd993-8102-472e-94d4-803e80bc4d9a","actor_name":"Enrique Gabriel","actor_username":"egb.labot@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:01:56.235338+00	
00000000-0000-0000-0000-000000000000	10ee00b3-ceaf-4bb6-b2fc-2f42c340c8d1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:41:35.535295+00	
00000000-0000-0000-0000-000000000000	9e8350cf-26db-45f6-8e34-d4b1ad82a0dd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:41:42.296369+00	
00000000-0000-0000-0000-000000000000	1368506b-5e6d-43d8-b010-735e87e9b19b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:47:55.597301+00	
00000000-0000-0000-0000-000000000000	012805f2-a3fc-4967-b289-f3e9c98eeb9b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:48:22.0791+00	
00000000-0000-0000-0000-000000000000	8a9ce26a-bfa8-4090-b5c8-fe57396ea4c1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 21:49:00.109155+00	
00000000-0000-0000-0000-000000000000	2c1c33bc-1d0d-4607-86f6-6e719de07fe2	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 21:52:22.576979+00	
00000000-0000-0000-0000-000000000000	934666dd-ef90-46a4-8f46-794077fd428d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-25 23:07:47.482797+00	
00000000-0000-0000-0000-000000000000	024a9b1f-7bdb-43bc-8a26-d3447d56d369	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 03:34:30.39531+00	
00000000-0000-0000-0000-000000000000	dda5ac16-22aa-4aab-8e45-13f911d90d97	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-26 03:42:48.873815+00	
00000000-0000-0000-0000-000000000000	16d0524e-d3ad-49a0-8be9-c8796ac938bf	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 03:42:51.947789+00	
00000000-0000-0000-0000-000000000000	05fda660-1def-4adf-a397-208922c6bc84	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-26 03:42:57.597524+00	
00000000-0000-0000-0000-000000000000	9339b30e-591b-48fe-b3a2-bfa99333ad74	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 03:42:59.765205+00	
00000000-0000-0000-0000-000000000000	8f3fa0e5-2896-4373-9faa-b2c7cf9bd693	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 11:52:08.46036+00	
00000000-0000-0000-0000-000000000000	38b25d7d-1b80-4117-bc6b-45e767f2f4b9	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 11:52:08.490104+00	
00000000-0000-0000-0000-000000000000	24d49121-b63b-4954-b160-b660b0d2e007	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 12:07:43.28117+00	
00000000-0000-0000-0000-000000000000	cd22d9be-5e03-4626-b0e0-cbb5992f76d2	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 13:04:47.584115+00	
00000000-0000-0000-0000-000000000000	12093458-48fc-41f5-a886-20f1d15b46af	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 13:04:47.599115+00	
00000000-0000-0000-0000-000000000000	7fbb540e-a41e-4ee9-80b3-339a8e86d525	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 13:19:13.152306+00	
00000000-0000-0000-0000-000000000000	34d4c756-0495-4aaa-94fd-c851325506f7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 13:19:13.162081+00	
00000000-0000-0000-0000-000000000000	0253df1f-2a32-4560-9a5e-cb457b4d9675	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-26 13:55:38.83517+00	
00000000-0000-0000-0000-000000000000	b7a0ced5-5f10-4392-9d8c-44e07b9aa441	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 13:55:50.492752+00	
00000000-0000-0000-0000-000000000000	0f4f6ba6-ab81-4fb1-a54a-b7a057fdd665	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-26 13:58:39.674859+00	
00000000-0000-0000-0000-000000000000	1cbe10f9-e8e7-4c36-8264-6754f4d91b02	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 13:58:45.375077+00	
00000000-0000-0000-0000-000000000000	b5bdd7b7-c63e-44d9-b0ac-e4ed4205eee9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 15:32:20.00776+00	
00000000-0000-0000-0000-000000000000	0b190670-9540-40b8-a18a-a81e543bc933	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 15:32:20.016841+00	
00000000-0000-0000-0000-000000000000	00eba8e7-c875-4b75-9666-670b51981cfc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 16:30:31.901975+00	
00000000-0000-0000-0000-000000000000	c7066905-fedd-404b-8e8c-371f7bd6076e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 16:30:31.954563+00	
00000000-0000-0000-0000-000000000000	cb4657c5-b55c-41a0-8692-eb799a147881	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-26 16:42:06.723444+00	
00000000-0000-0000-0000-000000000000	627ec932-2ecf-4f47-a24f-097ddb8b1a37	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 17:50:28.91151+00	
00000000-0000-0000-0000-000000000000	9f3ab15b-2aef-4b96-88f8-55e416e65ffb	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 17:50:28.940067+00	
00000000-0000-0000-0000-000000000000	efa26e08-65ef-4f18-b24f-2cc505333314	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 17:57:23.691387+00	
00000000-0000-0000-0000-000000000000	8fc7f320-3bc1-498e-9c26-1a2d63fe4b3a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 17:57:23.696854+00	
00000000-0000-0000-0000-000000000000	6d0d421a-db0a-4e3d-920b-71d3ff9ff1d8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 19:11:25.196181+00	
00000000-0000-0000-0000-000000000000	eeb011d7-c904-4476-afa0-6247c3b0f0a3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 19:11:25.212627+00	
00000000-0000-0000-0000-000000000000	98c92ffe-b213-4106-ab3d-47d701c2bd0f	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 19:12:04.3076+00	
00000000-0000-0000-0000-000000000000	f4147548-70ca-4976-8f35-195986bda7cc	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 19:12:04.30988+00	
00000000-0000-0000-0000-000000000000	07c3a4f2-ba4a-486f-8a0a-bdb70269dfa4	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 13:20:35.27601+00	
00000000-0000-0000-0000-000000000000	013629e1-b766-4dfe-be89-eb432091c293	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 13:20:35.306717+00	
00000000-0000-0000-0000-000000000000	e53231aa-b7b8-4f4f-b9b5-ae9a3d7b8ffc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 14:28:21.537525+00	
00000000-0000-0000-0000-000000000000	7b2d6584-a07a-4d5b-b32e-1f4e0e3fa1dd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 14:28:21.565373+00	
00000000-0000-0000-0000-000000000000	bf7097a8-11f0-4cb1-b7a8-17def2f2ee22	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 15:22:11.857739+00	
00000000-0000-0000-0000-000000000000	66b1814d-1f8f-4849-9acd-30cafa538985	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 15:22:11.873475+00	
00000000-0000-0000-0000-000000000000	aa872b88-ea08-4e68-948b-07d8ac6c97aa	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 15:39:40.676214+00	
00000000-0000-0000-0000-000000000000	7ab93bfc-a224-400a-b33d-62dc398487c5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 15:39:40.6896+00	
00000000-0000-0000-0000-000000000000	92515c8d-b3d2-4917-b9a5-8e740d4dd9ad	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 17:18:25.981708+00	
00000000-0000-0000-0000-000000000000	f2ba1434-65ab-4187-a41c-4f0ca9dba51e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 17:18:26.00963+00	
00000000-0000-0000-0000-000000000000	41ec8c94-fd6a-4f61-b5f8-472a7256bd0f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 17:47:21.183356+00	
00000000-0000-0000-0000-000000000000	770a4180-304e-482b-a7fd-da6e1b35c3ed	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 17:47:21.199316+00	
00000000-0000-0000-0000-000000000000	0a4d9567-1314-4a36-82db-262e1ecc7053	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 18:21:18.306499+00	
00000000-0000-0000-0000-000000000000	bd2b33df-9303-4c2b-848f-855677b2f2dd	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 18:21:18.32017+00	
00000000-0000-0000-0000-000000000000	664480b1-0d65-4b7e-b0d9-fbcefc8e0197	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 19:14:11.324782+00	
00000000-0000-0000-0000-000000000000	d9d2c830-dcd3-4ce8-a374-49ae29b2d883	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 19:14:11.347332+00	
00000000-0000-0000-0000-000000000000	fc922d6c-07e2-40ed-896b-fb18823e430a	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 19:20:31.422477+00	
00000000-0000-0000-0000-000000000000	8381b94a-7590-4251-b4b2-dd7ac1e5053f	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 19:20:31.434622+00	
00000000-0000-0000-0000-000000000000	98cb1ba6-66fd-41c1-b476-303636e2aa6e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-29 22:31:12.925282+00	
00000000-0000-0000-0000-000000000000	f0f16010-c350-493a-82fa-58b3021d46d5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 23:31:29.208841+00	
00000000-0000-0000-0000-000000000000	7263b142-20f6-445d-b149-a6a6daa561e4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-29 23:31:29.226076+00	
00000000-0000-0000-0000-000000000000	d9f33324-6286-4baf-ae1d-f33128df78eb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 01:11:21.770973+00	
00000000-0000-0000-0000-000000000000	d0157cdd-e6a6-422a-bc13-75e2baf489a0	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 01:11:21.798902+00	
00000000-0000-0000-0000-000000000000	9c2eb51e-343f-4ee9-b4bb-9c4f8088db64	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 01:13:01.903169+00	
00000000-0000-0000-0000-000000000000	0c5faded-2164-4aa6-8246-1847c3831bfe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 01:38:44.922904+00	
00000000-0000-0000-0000-000000000000	14a46f6f-dcf0-4772-9214-1828f3986a44	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 02:14:19.144219+00	
00000000-0000-0000-0000-000000000000	a680665d-7aa5-4517-8d99-fb754002f03c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 02:40:15.745432+00	
00000000-0000-0000-0000-000000000000	e74fb3d7-0e52-4933-a2b6-bc5391fb3075	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 02:52:20.353858+00	
00000000-0000-0000-0000-000000000000	5d93a0b0-ab9e-43ef-898c-14ae093ee5cd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 03:00:49.137154+00	
00000000-0000-0000-0000-000000000000	99db460b-9900-4dd5-bdc7-7341168963eb	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 03:12:12.461452+00	
00000000-0000-0000-0000-000000000000	fee8a3d4-1357-42c8-9ebe-5805f0590cf1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 03:12:23.553599+00	
00000000-0000-0000-0000-000000000000	0be1cc52-6033-417a-bb3f-ae23dcff377e	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 03:25:15.259489+00	
00000000-0000-0000-0000-000000000000	9d03fe80-ab86-451b-9b16-9e00ef84853f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 03:27:17.057567+00	
00000000-0000-0000-0000-000000000000	acde1d46-c2d2-437e-b773-a2b0cf27ef20	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 12:38:40.301217+00	
00000000-0000-0000-0000-000000000000	7b640711-0a04-4e3d-a9fc-954daa389ea1	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 12:38:40.321054+00	
00000000-0000-0000-0000-000000000000	e189d80e-3936-4339-a548-5ed15d79471a	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 13:49:40.605504+00	
00000000-0000-0000-0000-000000000000	80fa6be9-eb8c-424d-a64c-891cf5b5d47b	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 13:49:40.633233+00	
00000000-0000-0000-0000-000000000000	58debd17-200f-41c3-8930-ee45cf14b1b7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 14:19:31.341613+00	
00000000-0000-0000-0000-000000000000	308673ff-1af5-4c34-9d52-fe10a9818cb5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 15:18:38.137608+00	
00000000-0000-0000-0000-000000000000	7872e66e-f67e-48e0-bd2e-100688f7e923	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 15:18:38.151769+00	
00000000-0000-0000-0000-000000000000	7c18bd5d-fe39-4368-818b-6f64b4c574ba	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 16:50:42.368001+00	
00000000-0000-0000-0000-000000000000	b81a65bc-6538-43a6-9eea-095cfff144c9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 17:49:10.431527+00	
00000000-0000-0000-0000-000000000000	7715d296-af9d-4b4c-a65a-1e289770b5e7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 17:49:10.46265+00	
00000000-0000-0000-0000-000000000000	5ea7d7fd-9351-4666-a98d-12d577eb5f3c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 18:34:39.320871+00	
00000000-0000-0000-0000-000000000000	14ea8e81-ddf3-4c33-9eb4-e0644f69554d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 18:59:02.267426+00	
00000000-0000-0000-0000-000000000000	f141541a-5bb8-4365-b47f-ee149537a4c8	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 18:59:04.201743+00	
00000000-0000-0000-0000-000000000000	20227b18-7b81-44f5-9fa5-fbcbca8f6e5e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 18:59:10.84371+00	
00000000-0000-0000-0000-000000000000	35edac3b-c096-4216-b53d-fa5652d6d1c1	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 18:59:11.92852+00	
00000000-0000-0000-0000-000000000000	cc0cf854-da29-4857-afd1-0a2807849567	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 18:59:29.134281+00	
00000000-0000-0000-0000-000000000000	30c0686e-75c5-4988-b44c-4f7b180dd01c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 18:59:30.234265+00	
00000000-0000-0000-0000-000000000000	88df5533-f273-4fe1-9736-f6d33ec58c1e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:00:11.011127+00	
00000000-0000-0000-0000-000000000000	c2e3e34d-64e3-443f-be37-8615244312f5	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:00:15.439461+00	
00000000-0000-0000-0000-000000000000	c6ba1946-d023-4d49-90eb-7e98959669fe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:00:30.385096+00	
00000000-0000-0000-0000-000000000000	75f8bdfe-e285-4e3a-87fd-0b32c94e1c0c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:00:31.688858+00	
00000000-0000-0000-0000-000000000000	b91ff949-2e06-4503-aedb-99a6d3242627	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:01:03.283957+00	
00000000-0000-0000-0000-000000000000	2981895d-2c4a-4650-80cc-729118b15a25	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:01:04.515789+00	
00000000-0000-0000-0000-000000000000	d50c5a07-31da-4815-8cba-c77c667af8ee	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:01:26.637552+00	
00000000-0000-0000-0000-000000000000	451ea4a9-71dc-4980-a797-0e8d3d8b2d4c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:01:27.770028+00	
00000000-0000-0000-0000-000000000000	779cb159-e5a6-4d87-89ec-c14654509f2f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:05:08.917857+00	
00000000-0000-0000-0000-000000000000	81ee77bf-cf29-4909-80e8-e74f194e5d6d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 19:08:24.072971+00	
00000000-0000-0000-0000-000000000000	e7107460-457d-499f-a79d-3fa5351151d7	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-30 19:08:24.07606+00	
00000000-0000-0000-0000-000000000000	36ad06c1-1bb2-4053-a38c-01e8356f45fd	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:08:29.302541+00	
00000000-0000-0000-0000-000000000000	52ecd2b0-6f27-4137-aa81-dab2d68a3c1e	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:08:31.98203+00	
00000000-0000-0000-0000-000000000000	fa002056-b2b0-4cb2-a201-eb1246ed0ab3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:47:06.435774+00	
00000000-0000-0000-0000-000000000000	906d49e0-6fac-4653-993b-12ac7f4553e2	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:47:08.810276+00	
00000000-0000-0000-0000-000000000000	3f3e9f47-97e2-46ff-8626-887597c2006d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 19:47:31.281976+00	
00000000-0000-0000-0000-000000000000	b29b7f76-153d-4f20-9bbc-950e5b680645	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 19:47:32.689979+00	
00000000-0000-0000-0000-000000000000	7823f2e6-a2e7-48c7-af57-6a46502cbc36	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 20:27:46.172243+00	
00000000-0000-0000-0000-000000000000	91560698-2f98-45b6-b30e-92b52f4ede58	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 20:27:48.610301+00	
00000000-0000-0000-0000-000000000000	af9687c7-811f-490e-b4ac-f852b7dbfa32	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 22:43:48.630842+00	
00000000-0000-0000-0000-000000000000	5338ac3a-7dda-4e6f-a5b9-9bb4780f9c29	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-30 22:45:31.60182+00	
00000000-0000-0000-0000-000000000000	c02794ec-9c84-438e-b9fe-ad23c3a6d44e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-09-30 22:45:36.549733+00	
00000000-0000-0000-0000-000000000000	4c9777b3-9913-4f75-99a3-15cd91fc552e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 00:04:32.391907+00	
00000000-0000-0000-0000-000000000000	e840a088-2679-447c-ba81-3fb30a10314d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 00:04:32.407597+00	
00000000-0000-0000-0000-000000000000	f0fc05e3-ea8a-4be9-9ea6-0d2a02123426	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-01 00:24:07.371224+00	
00000000-0000-0000-0000-000000000000	1f9f0ebb-c8ab-4995-bfe1-fea9974312cc	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 00:24:18.252596+00	
00000000-0000-0000-0000-000000000000	cd23fb9e-86ec-4562-ac0c-399395a58ced	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 00:30:02.935173+00	
00000000-0000-0000-0000-000000000000	3f452599-1bc1-48d2-a37e-b4a31ee46016	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-01 00:30:04.692917+00	
00000000-0000-0000-0000-000000000000	b1a20d24-ac8c-4864-acfd-7b8aeaa20965	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 00:34:10.831887+00	
00000000-0000-0000-0000-000000000000	60ebf6d3-1953-4571-9c73-7d4e64cf6114	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 03:47:50.048548+00	
00000000-0000-0000-0000-000000000000	1bb653ce-c952-4616-803f-45a66eb0ac21	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-01 03:49:23.885419+00	
00000000-0000-0000-0000-000000000000	35a5f621-7d85-4695-b0c1-a62522bef5ab	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 03:49:30.837188+00	
00000000-0000-0000-0000-000000000000	6a893b07-f1bc-4fd0-9fe2-25acaa12d5de	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 14:13:23.719947+00	
00000000-0000-0000-0000-000000000000	9484b204-e6dd-43e9-8d64-01561dfb1028	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 15:11:36.151177+00	
00000000-0000-0000-0000-000000000000	d37a7f47-7ec6-475b-aedc-6de29950d60e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 15:11:36.167629+00	
00000000-0000-0000-0000-000000000000	51f25427-5d02-419c-8e8c-c9157c1db4f8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 16:09:59.469946+00	
00000000-0000-0000-0000-000000000000	4a1beb81-88ca-4255-be7c-bb4f33203c79	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 16:09:59.496157+00	
00000000-0000-0000-0000-000000000000	52983786-455d-452c-94bc-e3dce9a951be	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 17:38:49.358896+00	
00000000-0000-0000-0000-000000000000	4b040956-06f4-4d38-a6b6-ab360b8b254a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 17:38:49.392688+00	
00000000-0000-0000-0000-000000000000	af10bc5d-c320-458c-be0e-ac82f157b5ad	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 18:14:49.800355+00	
00000000-0000-0000-0000-000000000000	1af94af3-f889-40bd-bc10-b36cd2df6057	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-01 18:21:57.199462+00	
00000000-0000-0000-0000-000000000000	026e18c8-63a0-4dc4-9afb-03838853c4d3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 18:22:07.920237+00	
00000000-0000-0000-0000-000000000000	c6b2c643-64ed-4431-aa18-583b77ca292b	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 18:32:59.637511+00	
00000000-0000-0000-0000-000000000000	73bb5b6d-8361-45f0-b930-821c4db0936e	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 18:32:59.641687+00	
00000000-0000-0000-0000-000000000000	a67097ae-cdf5-408d-b1b5-119707ed92d6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 19:20:15.422143+00	
00000000-0000-0000-0000-000000000000	0a2ce79b-47bd-4175-a768-f56231ab7b78	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 19:20:15.434887+00	
00000000-0000-0000-0000-000000000000	00f144af-20de-435c-b1ed-fd193d2a0ea1	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 19:33:32.420466+00	
00000000-0000-0000-0000-000000000000	167bef82-7a13-4f95-bb7d-fabbef88da25	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-01 19:33:32.433603+00	
00000000-0000-0000-0000-000000000000	6cff40b8-f684-4948-a755-559a15ad444c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 22:49:07.043749+00	
00000000-0000-0000-0000-000000000000	243338b7-09f2-4b99-aace-9f82ba39afb6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-01 23:05:50.15011+00	
00000000-0000-0000-0000-000000000000	49096c87-e8c8-4ae1-92eb-f25a229e8393	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 01:35:34.846947+00	
00000000-0000-0000-0000-000000000000	bae81bb5-19fd-4a83-a2b1-112b0fd88359	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 01:35:34.878302+00	
00000000-0000-0000-0000-000000000000	02668dba-9e12-45bb-b405-df388349baa5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 02:34:53.279563+00	
00000000-0000-0000-0000-000000000000	8073fff6-8d69-4543-a36a-89c353899ece	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 02:34:53.301309+00	
00000000-0000-0000-0000-000000000000	f40b53c8-2409-4083-b7f0-332f0f425514	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 03:34:27.952148+00	
00000000-0000-0000-0000-000000000000	47134bbb-6bb6-44cc-ae3b-9258b4875700	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 03:34:27.974583+00	
00000000-0000-0000-0000-000000000000	294490e4-78a1-4fae-8b3f-4209495e2dde	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 12:14:11.626119+00	
00000000-0000-0000-0000-000000000000	4c705d3c-0774-4a18-9f77-0262bf0f37fa	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 12:14:11.64144+00	
00000000-0000-0000-0000-000000000000	e1d2c0d5-5a5d-4274-8282-6e81e6feb343	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 12:15:43.795761+00	
00000000-0000-0000-0000-000000000000	7d18f6bc-486f-44ff-839b-515a3389c4d4	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 12:15:43.803075+00	
00000000-0000-0000-0000-000000000000	5e50346a-95de-4ca7-90f7-0aabcc1ea3a2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 13:12:11.311233+00	
00000000-0000-0000-0000-000000000000	cbcfea0a-b541-4f6a-a368-152dff0f36c2	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 13:12:11.333768+00	
00000000-0000-0000-0000-000000000000	0899c6c4-4051-41b1-800e-aa2d6a8f52a7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 14:10:34.361673+00	
00000000-0000-0000-0000-000000000000	3d3d8b05-1bfc-4952-a199-71d4a1837b7c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 14:10:34.378869+00	
00000000-0000-0000-0000-000000000000	86e7bfbd-fcb4-48d9-a1e6-5296871f2ce2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 15:52:17.19599+00	
00000000-0000-0000-0000-000000000000	9a5bb2bb-9eb4-44e3-942e-ba46d001b521	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 15:52:17.223877+00	
00000000-0000-0000-0000-000000000000	adb439a6-3c79-4869-b974-b3a741b50928	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 16:25:57.615608+00	
00000000-0000-0000-0000-000000000000	9f530306-fab9-4a06-8db4-98fa731f68f2	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 16:25:57.629312+00	
00000000-0000-0000-0000-000000000000	fc2638da-d8a9-4d13-a8d8-f6aa64050114	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 16:50:17.611268+00	
00000000-0000-0000-0000-000000000000	a9e90841-65c1-476c-9bf1-a0d687de89f5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 16:50:17.624344+00	
00000000-0000-0000-0000-000000000000	0619be22-d2c7-4cfb-85da-4f7404585a4e	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-02 17:37:54.897774+00	
00000000-0000-0000-0000-000000000000	889fcee6-67ad-4d8f-b06c-acaf5f03dd52	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 17:48:19.787026+00	
00000000-0000-0000-0000-000000000000	f5f42a7b-0a57-4951-b21e-16d750525597	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 17:48:19.800178+00	
00000000-0000-0000-0000-000000000000	945a1a11-7d8a-4a32-b85a-a95038a7e995	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-02 17:53:21.013952+00	
00000000-0000-0000-0000-000000000000	5d95c141-7a06-4195-a22f-728f6aa594d6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-02 17:58:17.968566+00	
00000000-0000-0000-0000-000000000000	98c65afc-45e6-4dc7-9243-9a8a7a796903	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 18:52:11.537121+00	
00000000-0000-0000-0000-000000000000	b355ba0c-4795-45f7-b619-9b664ae8b366	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 18:52:11.562327+00	
00000000-0000-0000-0000-000000000000	e31e5746-8f3b-483c-9d23-0ce28f9a6aad	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 19:50:14.972083+00	
00000000-0000-0000-0000-000000000000	7422f5a6-7ba5-43f8-808c-53dd0ad74a7f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 19:50:14.994276+00	
00000000-0000-0000-0000-000000000000	e9a707df-cfb2-4e77-9f7c-6cb23a653a19	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 20:48:17.924809+00	
00000000-0000-0000-0000-000000000000	95ce3fd1-b93c-4047-8465-d1e25dfa3d4d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-02 20:48:17.940312+00	
00000000-0000-0000-0000-000000000000	2f51e02c-36f1-4a8f-9dd7-a2e331f64ab1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 02:50:38.627137+00	
00000000-0000-0000-0000-000000000000	2ae09869-52b5-49e5-8844-41b59b9cc16b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 02:50:38.664977+00	
00000000-0000-0000-0000-000000000000	a0baee2f-790e-4f12-9e0e-7ecb1fec261a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 03:49:22.258064+00	
00000000-0000-0000-0000-000000000000	23f01bbe-89c2-4323-98a5-7d6168730fbc	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 03:49:22.283012+00	
00000000-0000-0000-0000-000000000000	77388455-d58c-4018-9b93-09a329a39e5a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 05:07:12.098165+00	
00000000-0000-0000-0000-000000000000	6127d815-7272-465a-b885-d21c21d3edf1	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 05:07:12.126364+00	
00000000-0000-0000-0000-000000000000	215d4278-e0cb-4949-b16a-474b82efbdae	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 11:14:09.878817+00	
00000000-0000-0000-0000-000000000000	ad18f9a8-4f1b-4022-a4c6-27bef587c4b4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 11:14:09.890135+00	
00000000-0000-0000-0000-000000000000	3d7eb8e3-e63c-469a-8cc8-701a02726db5	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:07:03.792561+00	
00000000-0000-0000-0000-000000000000	8a7e3828-f83a-4107-afe1-a13d6b579d70	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:08:14.907318+00	
00000000-0000-0000-0000-000000000000	b782c278-8905-4f4c-bd80-13b8a7b6b353	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-03 12:11:00.914525+00	
00000000-0000-0000-0000-000000000000	911d78a6-695d-4c78-b9a9-18795064f929	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 12:19:34.244935+00	
00000000-0000-0000-0000-000000000000	47101ceb-804b-4611-80b2-7c3ed33d5a8b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 12:19:34.25879+00	
00000000-0000-0000-0000-000000000000	d6eed748-a96b-4a10-938a-9a70151c40e7	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:22:55.181092+00	
00000000-0000-0000-0000-000000000000	bb07f097-18f1-48c6-a51b-d27443134e4d	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:23:53.111787+00	
00000000-0000-0000-0000-000000000000	f7ba116c-10b2-4b8d-9650-dfddbc8c1f69	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:24:52.932556+00	
00000000-0000-0000-0000-000000000000	53d1c77e-4aec-4462-aa39-5f0a3bcbaf5c	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-03 12:26:14.389547+00	
00000000-0000-0000-0000-000000000000	269acfde-6130-4e76-ac15-a3512af3f5b5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 13:17:59.150514+00	
00000000-0000-0000-0000-000000000000	f3231fbe-926b-4ff4-985d-bbb6daefbf66	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 13:17:59.166861+00	
00000000-0000-0000-0000-000000000000	06390c32-3c61-4b37-ba96-defafa817c44	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 13:50:23.691766+00	
00000000-0000-0000-0000-000000000000	4c2adf29-4ed2-445c-a30a-c13bcd07c2f9	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 13:50:23.718017+00	
00000000-0000-0000-0000-000000000000	53a342d2-b0fe-4046-8695-06536dfba6ed	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 14:06:15.140529+00	
00000000-0000-0000-0000-000000000000	165f052d-6134-41a3-ac64-d13c1db2442e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 14:06:15.15289+00	
00000000-0000-0000-0000-000000000000	5494dc1c-e564-48f9-bb0c-9e15b0137240	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 14:16:26.490857+00	
00000000-0000-0000-0000-000000000000	7cc5cb6e-cf07-494c-9172-83fb1603996b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 14:16:26.496752+00	
00000000-0000-0000-0000-000000000000	07dc0cfe-9d9e-439d-982a-12d2d86b29ef	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-03 14:16:50.401101+00	
00000000-0000-0000-0000-000000000000	408b790c-7976-49a7-a5c9-a39f643d36be	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 15:07:21.894963+00	
00000000-0000-0000-0000-000000000000	310ca543-a883-4d9c-b026-7a2e59d41065	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 15:07:21.909883+00	
00000000-0000-0000-0000-000000000000	fbe6bbbf-9c70-44af-99f8-e92625d5b66d	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-03 15:32:11.708549+00	
00000000-0000-0000-0000-000000000000	6db99750-925d-49c2-93ad-78e304411945	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-03 15:49:46.552587+00	
00000000-0000-0000-0000-000000000000	ea5c5ecb-0d82-4108-a725-3c94c7418534	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:25:21.781059+00	
00000000-0000-0000-0000-000000000000	facd3102-6868-44d3-9f36-d7a39d624f82	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:25:21.801086+00	
00000000-0000-0000-0000-000000000000	b49bc99f-0220-4951-8efe-95a1b3a53d87	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:31:55.984348+00	
00000000-0000-0000-0000-000000000000	daa9e10f-d850-4278-8852-c800d41cb496	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:31:55.991132+00	
00000000-0000-0000-0000-000000000000	fe9f7e03-5ad8-47fd-85c9-1c5e96ecf46d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:48:28.06394+00	
00000000-0000-0000-0000-000000000000	f5b3675d-a31c-4679-bc0d-f9e49d53096e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 16:48:28.075119+00	
00000000-0000-0000-0000-000000000000	4930a13c-f937-41f0-949d-bade07ebd76c	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 17:35:27.349845+00	
00000000-0000-0000-0000-000000000000	3c2eb636-9979-4474-917c-d3e1ead024a1	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 17:35:27.362764+00	
00000000-0000-0000-0000-000000000000	6911d680-4fd2-446f-8f51-ea4f9605214d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 17:38:48.29361+00	
00000000-0000-0000-0000-000000000000	ec13962c-72e1-4113-a855-79bd607da902	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 17:38:48.298187+00	
00000000-0000-0000-0000-000000000000	59cd64d5-bad3-4c46-a5f2-8c113aba291f	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 18:33:38.057956+00	
00000000-0000-0000-0000-000000000000	53cf5327-3a25-4b4f-a73a-bdf8a89018e4	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 18:33:38.08064+00	
00000000-0000-0000-0000-000000000000	dbf89115-e471-4c81-9390-661a4f716290	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 19:31:44.985331+00	
00000000-0000-0000-0000-000000000000	6c33a6b4-9183-481d-9a65-8a48d8f1bb57	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-03 19:31:45.000504+00	
00000000-0000-0000-0000-000000000000	454f5b5b-277e-499b-b659-6ff08ea6b79b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-05 18:13:34.918371+00	
00000000-0000-0000-0000-000000000000	37d5ddba-0832-4765-9e34-21207e67ec8c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 19:52:41.213484+00	
00000000-0000-0000-0000-000000000000	43c8b420-db4f-4644-8ed2-d7bc6eba39ec	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 19:52:41.249229+00	
00000000-0000-0000-0000-000000000000	c2672580-6575-4e64-a235-c8eab41aac07	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 21:07:49.941934+00	
00000000-0000-0000-0000-000000000000	e22a3452-ac35-4fee-85c3-c75b6d2d34af	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 21:07:49.958544+00	
00000000-0000-0000-0000-000000000000	180c3359-b134-48bd-9e16-40e610438acf	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-05 21:46:25.89123+00	
00000000-0000-0000-0000-000000000000	8c0cf78c-ae88-461a-bf89-4a33cba7b589	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-05 21:46:29.305078+00	
00000000-0000-0000-0000-000000000000	fab6d27b-1f72-47a9-94da-8faeaf8ca5bf	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-05 21:46:32.419608+00	
00000000-0000-0000-0000-000000000000	d6d6d647-9ddb-4da4-8d9d-22121427f048	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-05 21:46:34.794668+00	
00000000-0000-0000-0000-000000000000	e4178f8a-52dd-463a-8a1f-34307f17fdea	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-05 21:46:37.603144+00	
00000000-0000-0000-0000-000000000000	1a3bd82c-726e-4df7-8d12-c3c69beb4f47	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-05 21:46:42.539996+00	
00000000-0000-0000-0000-000000000000	98398d3e-1350-479c-b472-11120dff7111	{"action":"user_signedup","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-10-05 21:47:29.639049+00	
00000000-0000-0000-0000-000000000000	2d8fb599-a342-40e9-858a-e6add72e2a04	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 22:58:56.10783+00	
00000000-0000-0000-0000-000000000000	68521f31-77b1-44bb-bd09-321eb27bd509	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 22:58:56.124119+00	
00000000-0000-0000-0000-000000000000	6a5abd78-e6c8-42d3-8f5d-00f5f452be24	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 23:00:12.750871+00	
00000000-0000-0000-0000-000000000000	105e3b7a-62e2-4fa9-a3f9-9f63d3eda9bd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-05 23:00:12.751812+00	
00000000-0000-0000-0000-000000000000	b7b8609d-1695-4d48-9eef-52a303389568	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 00:51:35.650896+00	
00000000-0000-0000-0000-000000000000	489b1923-3bf4-49fe-baa5-a5bf23dd9d97	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 00:51:35.685293+00	
00000000-0000-0000-0000-000000000000	adf2cd41-a21c-4e70-b6da-873515f353f5	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 01:03:21.710598+00	
00000000-0000-0000-0000-000000000000	e96a116f-ca97-4819-bf8f-c9c791e36e7d	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 01:03:21.713489+00	
00000000-0000-0000-0000-000000000000	ee06f52d-5e67-402f-a738-965d8ab1eb9c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 01:59:34.361291+00	
00000000-0000-0000-0000-000000000000	4674d3c0-7236-4ab2-a369-6d1f76f1580b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 01:59:34.374766+00	
00000000-0000-0000-0000-000000000000	372a59aa-715c-4cf3-86d8-ba38fd8511bf	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:42:21.432497+00	
00000000-0000-0000-0000-000000000000	39bf85ac-e725-44b5-9707-d289e65d98c5	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:42:21.450258+00	
00000000-0000-0000-0000-000000000000	3c06ab51-7336-4d90-8136-671e50cc1411	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:59:03.915973+00	
00000000-0000-0000-0000-000000000000	f491c4c5-4307-4bd0-ae27-12b7efcc5770	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 02:59:03.922516+00	
00000000-0000-0000-0000-000000000000	306ff4a3-29e0-4bfa-b800-6a6989357300	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 11:04:11.622232+00	
00000000-0000-0000-0000-000000000000	0c54040e-27f6-4bd2-b43e-8486e918eda1	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 11:04:11.662616+00	
00000000-0000-0000-0000-000000000000	66d00fa5-7d84-42f7-85aa-d489587289e5	{"action":"login","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 11:05:11.809424+00	
00000000-0000-0000-0000-000000000000	6c97bbc3-71a1-4317-886c-c0134055c38b	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 12:09:19.824232+00	
00000000-0000-0000-0000-000000000000	d8e20804-f7bf-45a9-9571-07013dbed419	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 12:09:19.835999+00	
00000000-0000-0000-0000-000000000000	871d4df4-b1c4-46dd-8d65-875e31ab1be9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 12:14:36.848991+00	
00000000-0000-0000-0000-000000000000	4b60a3d8-46c5-46b0-88d1-4b4ac42838c5	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 12:21:57.39259+00	
00000000-0000-0000-0000-000000000000	f4d963b5-0451-465e-9770-2a80c2c763a8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 12:22:03.261669+00	
00000000-0000-0000-0000-000000000000	e7d46083-c224-4280-b775-58f695eb3704	{"action":"login","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 12:28:56.882912+00	
00000000-0000-0000-0000-000000000000	668579e9-1eb6-4875-a280-95380d4e4f36	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:14:40.877404+00	
00000000-0000-0000-0000-000000000000	5af3f6f0-53bb-47f0-bec8-3784d530dd2d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:14:40.890688+00	
00000000-0000-0000-0000-000000000000	dd56af26-7eac-4b21-a6e4-de3babf64021	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 13:14:48.839838+00	
00000000-0000-0000-0000-000000000000	8d147cb9-2c40-4ed3-a711-15ea5d91a0bb	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-06 13:14:49.42062+00	
00000000-0000-0000-0000-000000000000	8cb337dd-6141-43c7-9a86-c99666dd7daa	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:38:28.76985+00	
00000000-0000-0000-0000-000000000000	50ae1e9c-69fc-4ab7-b6f5-5e370a3152d7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:38:28.782097+00	
00000000-0000-0000-0000-000000000000	549a2982-7b04-4864-93ba-62e80feb7a48	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:46:24.26896+00	
00000000-0000-0000-0000-000000000000	6713e5de-b8dc-4b8d-9154-4ddbb558df43	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 13:46:24.277622+00	
00000000-0000-0000-0000-000000000000	d0f44d7c-4ef2-4ef4-bba4-a173aafc4c58	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:16:29.675089+00	
00000000-0000-0000-0000-000000000000	e45c41cc-1636-4ffc-9734-75388963f245	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:16:29.703766+00	
00000000-0000-0000-0000-000000000000	1365d67c-452f-4a81-9b1b-14c83448a1c6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:44:23.180431+00	
00000000-0000-0000-0000-000000000000	b00de846-7f40-4d3d-b573-e43de5529922	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 14:44:23.203854+00	
00000000-0000-0000-0000-000000000000	098fa4e5-3f03-4c99-aacb-90044a3f3380	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 15:42:48.779591+00	
00000000-0000-0000-0000-000000000000	396ab674-ec0f-4e6b-86eb-7626d549e6bf	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 15:42:48.798414+00	
00000000-0000-0000-0000-000000000000	76fa9f66-6ef3-481f-9c87-da25afc6dcf7	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:01:02.183078+00	
00000000-0000-0000-0000-000000000000	94d38f1a-c5a6-4000-8b91-932e29f3ffa4	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:01:02.18991+00	
00000000-0000-0000-0000-000000000000	ba07a355-db04-4109-bbc9-5f428c95eae0	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:08:51.173234+00	
00000000-0000-0000-0000-000000000000	fdd742e7-f1ec-4f8a-b7dc-e87c4a27e277	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:08:51.186412+00	
00000000-0000-0000-0000-000000000000	c18f7c9e-ab2d-4e72-b06e-1c9bea8626f3	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:42:47.007315+00	
00000000-0000-0000-0000-000000000000	00614989-e1bc-4df4-b5fa-ef4070ff5076	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 16:42:47.017462+00	
00000000-0000-0000-0000-000000000000	fca3be8a-41f2-4249-8a19-4c1cf6fd7393	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:27:02.465604+00	
00000000-0000-0000-0000-000000000000	109964f5-b8bf-40ee-ab15-2744b8bdb745	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:27:02.481523+00	
00000000-0000-0000-0000-000000000000	0d4cf644-896b-4e8f-b637-545d27d5cd16	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:41:15.888583+00	
00000000-0000-0000-0000-000000000000	f4c3c5a5-841c-4e56-bcb1-2269e8c60565	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:41:15.8994+00	
00000000-0000-0000-0000-000000000000	0d434c2d-509c-418f-afbd-662e74237811	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:26:02.576983+00	
00000000-0000-0000-0000-000000000000	e274260e-6356-4ee2-91bf-4ae982c6e98a	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:26:02.603691+00	
00000000-0000-0000-0000-000000000000	3a41af40-13cf-4370-a49d-4ee17cbf8687	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:27:10.027916+00	
00000000-0000-0000-0000-000000000000	79d6bb30-ae37-4fff-847f-b5b87d0f755b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:27:10.031443+00	
00000000-0000-0000-0000-000000000000	519b97cb-220f-41af-b85c-d719b359a5a8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:39:43.345338+00	
00000000-0000-0000-0000-000000000000	e74dd16c-1516-4f82-9166-30706b9a4660	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 18:39:43.356022+00	
00000000-0000-0000-0000-000000000000	9ce1aa5d-6c1a-4af5-a4f0-595bc6b6731d	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:35:07.748664+00	
00000000-0000-0000-0000-000000000000	208b3381-6db2-40ef-af34-6efa4943d956	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:35:07.768206+00	
00000000-0000-0000-0000-000000000000	4f61f731-31e0-4747-b92f-1ed2464f22e5	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:35:54.985431+00	
00000000-0000-0000-0000-000000000000	21e16133-edd9-4934-b881-8f0ea5f6c806	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:35:54.988109+00	
00000000-0000-0000-0000-000000000000	cabcc84d-0897-4d74-a630-645594834c83	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:36:05.67623+00	
00000000-0000-0000-0000-000000000000	312ab470-f0b2-4b45-afe3-746c0ec8c65c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 19:36:05.678014+00	
00000000-0000-0000-0000-000000000000	83c79b87-e905-40db-99bd-038ab257b23f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 12:09:48.227299+00	
00000000-0000-0000-0000-000000000000	16a3c7ba-302b-4d0a-8fe9-ae61a3732567	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 12:09:48.245281+00	
00000000-0000-0000-0000-000000000000	be7c3dca-2195-4e21-ae8f-5d11a5bf6d3d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 13:14:16.448645+00	
00000000-0000-0000-0000-000000000000	6cb8f8ff-313e-40b6-b309-6184ffd567ac	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 13:14:16.480566+00	
00000000-0000-0000-0000-000000000000	47db555e-8225-47bc-a4fb-bb34f1450259	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:20:09.57543+00	
00000000-0000-0000-0000-000000000000	50146425-1935-43f3-8cda-dd6d42cbf0ca	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:20:09.593173+00	
00000000-0000-0000-0000-000000000000	156e169d-19de-4830-bb39-78161d644000	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:37:22.725689+00	
00000000-0000-0000-0000-000000000000	7a23cfd1-8f31-4cca-bd89-c96f1e371687	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:37:22.740754+00	
00000000-0000-0000-0000-000000000000	d07c839a-b061-4b9f-b9ed-c7cb94ff2424	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:59:56.287313+00	
00000000-0000-0000-0000-000000000000	ed626b68-9378-4c42-95ff-4bbdba544f65	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:59:56.317654+00	
00000000-0000-0000-0000-000000000000	04fb36dd-3c25-403f-99a5-3909e8fb9cdd	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:00:09.150096+00	
00000000-0000-0000-0000-000000000000	16f83804-39b5-4308-810a-d7dc41b18d2f	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:00:09.151672+00	
00000000-0000-0000-0000-000000000000	25ae3175-ca5a-49cd-a7c7-81adbf229eb2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:15:24.631071+00	
00000000-0000-0000-0000-000000000000	cee9a3d6-6158-4e56-bd8f-fecb9ba88a56	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:15:24.650054+00	
00000000-0000-0000-0000-000000000000	82383259-bcf1-40e4-8027-054c0ceacad0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:02:33.360972+00	
00000000-0000-0000-0000-000000000000	3770e617-7072-40ae-835b-563c78b7f68f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:02:33.389162+00	
00000000-0000-0000-0000-000000000000	9bf3a552-949b-48be-a977-ebe38c728db1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:32:34.007115+00	
00000000-0000-0000-0000-000000000000	f2abc458-4dd7-427d-9ca9-0cb8fd210488	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:32:34.036167+00	
00000000-0000-0000-0000-000000000000	70ca0f89-3319-4351-82e2-cdb1d666967d	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:33:49.154621+00	
00000000-0000-0000-0000-000000000000	d0714a37-025c-45d4-b290-dae9df4186df	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:33:49.155599+00	
00000000-0000-0000-0000-000000000000	44aebac3-52fd-46ea-86e2-124a18d0a5b7	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 17:52:57.843714+00	
00000000-0000-0000-0000-000000000000	5ce38b8e-2c03-4ac6-92e0-830bb72ffb8a	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 17:53:14.555344+00	
00000000-0000-0000-0000-000000000000	cadfb1c6-562b-4676-ba0b-0141b60e0d25	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-07 17:53:17.155502+00	
00000000-0000-0000-0000-000000000000	0a02d8df-d156-481e-ac31-5e8912c08910	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-07 17:53:24.01308+00	
00000000-0000-0000-0000-000000000000	5894b045-9ba9-4aaa-9584-e990bf0ee88e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 19:12:28.616288+00	
00000000-0000-0000-0000-000000000000	e3e90550-8388-43ef-a75d-fe96bb2f8fe6	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 19:12:28.649392+00	
00000000-0000-0000-0000-000000000000	6fae56be-9e17-4bf0-a655-b83f6543dd7b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 12:00:21.233347+00	
00000000-0000-0000-0000-000000000000	7789f3b4-f4db-4382-8ade-22cac3f4dee0	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 12:00:21.246011+00	
00000000-0000-0000-0000-000000000000	4a39bbf7-8dc0-44db-9589-a3959adb72f7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:00:13.135868+00	
00000000-0000-0000-0000-000000000000	6e65d7f0-321a-4122-9661-f083b832440e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:00:13.157365+00	
00000000-0000-0000-0000-000000000000	43032283-5329-4b28-a9c0-4c61db6eb109	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 15:03:10.996804+00	
00000000-0000-0000-0000-000000000000	832cf0ef-4168-4777-af51-80d3099c3627	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 15:03:11.023983+00	
00000000-0000-0000-0000-000000000000	890ccd25-c6f5-437d-a0e6-f0221793f738	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 16:01:39.03983+00	
00000000-0000-0000-0000-000000000000	d2c275a4-1aed-4b0c-a40b-4f296a480510	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 16:01:39.05255+00	
00000000-0000-0000-0000-000000000000	cca3dd03-5b66-4225-96d7-a0d48a19a04f	{"action":"login","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-08 16:54:31.854516+00	
00000000-0000-0000-0000-000000000000	11532c6f-7c7c-4645-83c0-cfce682c450a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-08 17:03:34.034262+00	
00000000-0000-0000-0000-000000000000	174c1c1e-0ed6-4cb8-b35c-85ff1f290d70	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 17:04:47.282744+00	
00000000-0000-0000-0000-000000000000	5a3124d8-4126-48b2-8d1b-e494912a827e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 17:04:47.296231+00	
00000000-0000-0000-0000-000000000000	7be47ae1-0597-49df-846a-9f9793e533d9	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 17:57:55.876505+00	
00000000-0000-0000-0000-000000000000	10620ded-905e-4050-8ded-aec36d083921	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 17:57:55.904386+00	
00000000-0000-0000-0000-000000000000	f85c0d9c-9cae-4818-bb7d-a3fc26ba2620	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 18:19:02.781241+00	
00000000-0000-0000-0000-000000000000	1e2282bd-629e-4530-924b-9bd8fa8659d4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 18:19:02.804991+00	
00000000-0000-0000-0000-000000000000	771b1846-f8e1-4ab9-a682-fd86dd886085	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 18:19:24.232231+00	
00000000-0000-0000-0000-000000000000	0c66a30b-5450-431d-b932-fe28762d51f3	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 18:19:24.233993+00	
00000000-0000-0000-0000-000000000000	ab442362-01c3-4fcd-8d74-57f4ffbb409e	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-08 18:20:35.262208+00	
00000000-0000-0000-0000-000000000000	68c6dce6-561f-4124-863b-8c228f2a63ff	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 12:44:59.064971+00	
00000000-0000-0000-0000-000000000000	e46977f2-c84e-44a8-8958-ff7d5f0c8cc2	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 12:44:59.098367+00	
00000000-0000-0000-0000-000000000000	fc2ff2b2-0838-40bc-b732-6c9c5448d03c	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:14:16.980829+00	
00000000-0000-0000-0000-000000000000	ff1e49b9-c997-4a8c-834f-023c2874c35d	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:14:16.997669+00	
00000000-0000-0000-0000-000000000000	50a2e1c2-c9a8-43c5-81b1-053a9d351efd	{"action":"logout","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 13:14:28.632063+00	
00000000-0000-0000-0000-000000000000	54ed2b66-46d8-4fb4-9bd8-9f356300ec40	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-09 13:14:34.616537+00	
00000000-0000-0000-0000-000000000000	6e03f8fe-46a6-4fc1-b9e8-836f2411b7ee	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:15:45.178602+00	
00000000-0000-0000-0000-000000000000	04fb7eef-8e93-4f0e-91ad-6a305d5516f3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:15:45.180013+00	
00000000-0000-0000-0000-000000000000	a269560a-84fe-4301-a71b-de171d9b762c	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:43:06.118717+00	
00000000-0000-0000-0000-000000000000	ffa13bbc-5f95-4622-bb3a-85ee5a60d35c	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 13:43:06.128312+00	
00000000-0000-0000-0000-000000000000	3fdccc7d-d847-4272-8eaf-0fd89483b4c5	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 15:25:43.345246+00	
00000000-0000-0000-0000-000000000000	77a30e60-79cd-451c-b3fd-1cf8b2da1531	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 15:25:43.367438+00	
00000000-0000-0000-0000-000000000000	78286c97-d981-41cd-b9f6-424085d5114f	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 15:41:46.423874+00	
00000000-0000-0000-0000-000000000000	1ed05efc-6b66-4f63-8390-bebdbb2c8521	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 15:41:46.431047+00	
00000000-0000-0000-0000-000000000000	fae8fb32-dfbe-4b3d-964d-0cec2b122c13	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 16:53:27.342125+00	
00000000-0000-0000-0000-000000000000	a60ffac2-aed0-41a8-b7ab-d256aeadee2e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 16:53:27.372805+00	
00000000-0000-0000-0000-000000000000	fa37873a-b1ba-4a8c-95e6-65ffe603e59d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 18:10:39.080042+00	
00000000-0000-0000-0000-000000000000	3706d316-8f58-496d-ba40-c60c82898b7c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 18:10:39.101344+00	
00000000-0000-0000-0000-000000000000	db7beb2c-2bc4-42b6-9a6a-7cc40060049b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 18:41:03.07219+00	
00000000-0000-0000-0000-000000000000	720acc8c-052b-4e51-8b57-e07c4fc615ae	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 18:41:03.092293+00	
00000000-0000-0000-0000-000000000000	70514925-ccb1-45db-8fee-3d0f63fce7b4	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 19:06:42.229853+00	
00000000-0000-0000-0000-000000000000	3309d612-f443-4366-b430-96091ade2054	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 19:06:42.245304+00	
00000000-0000-0000-0000-000000000000	71972f8b-7f7e-46b6-b648-0e3c4dcf6a39	{"action":"user_signedup","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-10-12 16:20:36.837265+00	
00000000-0000-0000-0000-000000000000	adf13aae-54db-4b26-9413-0af9875d0fd2	{"action":"token_refreshed","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:18:59.601008+00	
00000000-0000-0000-0000-000000000000	4726985c-db22-4a65-8f69-af435c996732	{"action":"token_revoked","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:18:59.628851+00	
00000000-0000-0000-0000-000000000000	5365ab03-2a8c-4246-af7a-5c910e16767d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-12 17:34:07.909078+00	
00000000-0000-0000-0000-000000000000	e12a02b8-3ff9-4278-bf38-d3b47aa7ae24	{"action":"login","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-12 17:53:35.650491+00	
00000000-0000-0000-0000-000000000000	422f1aaf-08d7-4991-8ceb-12167e6640c5	{"action":"token_refreshed","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 18:41:10.853283+00	
00000000-0000-0000-0000-000000000000	00331582-9625-4deb-a481-b0fe16b0094c	{"action":"token_revoked","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 18:41:10.875489+00	
00000000-0000-0000-0000-000000000000	aa5502de-7295-4b87-990b-805372e18aa7	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-12 20:14:29.365457+00	
00000000-0000-0000-0000-000000000000	6a2a5443-6114-48b4-b968-079fbcfb625f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 11:43:11.124466+00	
00000000-0000-0000-0000-000000000000	6e91378f-70e5-49cf-b65b-2e859df48734	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 11:43:11.159088+00	
00000000-0000-0000-0000-000000000000	b514302b-7191-4c58-b5cf-e458b1323816	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 12:41:38.328713+00	
00000000-0000-0000-0000-000000000000	e8549b27-dd5b-41fd-a424-bf14849d3493	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 12:41:38.345204+00	
00000000-0000-0000-0000-000000000000	335acafb-b953-4677-a281-8f815ac80651	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 13:24:31.407467+00	
00000000-0000-0000-0000-000000000000	46921d68-b56e-43df-aeb2-fe64c95e00ae	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 13:24:31.418763+00	
00000000-0000-0000-0000-000000000000	be88b2ce-8a7a-44b1-ae2f-0e8b143c9266	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 13:39:51.669913+00	
00000000-0000-0000-0000-000000000000	a8610783-1bef-4fde-b937-40fdb5b3a35b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 13:39:51.680183+00	
00000000-0000-0000-0000-000000000000	47e830c7-cd09-4fba-b172-46e19e2c4bf9	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:11:30.206199+00	
00000000-0000-0000-0000-000000000000	ec54252f-2a07-4951-bfec-b09147abe293	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:11:42.301993+00	
00000000-0000-0000-0000-000000000000	1fb19bfe-fba2-44c4-98b2-c525eee7b1a3	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:11:43.485951+00	
00000000-0000-0000-0000-000000000000	2b540b72-687c-48ca-b50a-54534a9394a3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:12:12.387511+00	
00000000-0000-0000-0000-000000000000	c65152d1-bb53-45cd-ab71-58830ccfd5be	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:12:13.284479+00	
00000000-0000-0000-0000-000000000000	5a156486-b933-4ff1-b3cf-6da53353e5f6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:14:22.470275+00	
00000000-0000-0000-0000-000000000000	57d3906e-31a4-4dc5-b2bf-f376d6796999	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:14:24.01427+00	
00000000-0000-0000-0000-000000000000	2e9b83ef-0fca-4486-acbb-db1108943a94	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:18:48.504847+00	
00000000-0000-0000-0000-000000000000	c3ca3a5c-8765-4550-ae0e-84abfcffe72f	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:18:49.599203+00	
00000000-0000-0000-0000-000000000000	38925ce1-b6a6-4527-bef5-f614cab28b6c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:26:03.150451+00	
00000000-0000-0000-0000-000000000000	0c8ddafc-40d6-45a3-bb7d-c55b6dda0303	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:26:04.843156+00	
00000000-0000-0000-0000-000000000000	feb19723-4479-4140-b34e-a63658be1e05	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 14:39:06.60814+00	
00000000-0000-0000-0000-000000000000	a6ad12b3-c317-4fcf-9bd0-ccc4c14626dc	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 14:39:08.158422+00	
00000000-0000-0000-0000-000000000000	5ca9e96a-8def-4365-a5d8-780f58f3e366	{"action":"token_refreshed","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 15:51:55.903383+00	
00000000-0000-0000-0000-000000000000	08dee506-6fd2-43b7-9d0d-5635cb5b55ac	{"action":"token_revoked","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 15:51:55.922958+00	
00000000-0000-0000-0000-000000000000	489aabad-eb8e-47e9-8131-69533cb25c03	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdiñez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 15:51:58.105496+00	
00000000-0000-0000-0000-000000000000	74229823-a52b-47db-8af0-1e2d66ec377a	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 15:52:50.553452+00	
00000000-0000-0000-0000-000000000000	9a3d71e1-f8ed-4e4a-a226-407bc599a9e3	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 15:52:52.454525+00	
00000000-0000-0000-0000-000000000000	7041429e-779d-461b-bf60-15af8329f07d	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 15:53:50.038162+00	
00000000-0000-0000-0000-000000000000	471c5a24-86d1-410a-ba5e-2748f744ed38	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 15:53:51.882249+00	
00000000-0000-0000-0000-000000000000	7ff2e0d9-e4b8-4fc0-915d-2b102986da33	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-13 15:54:16.504134+00	
00000000-0000-0000-0000-000000000000	6726812a-092a-45c9-8495-e95cf934a87c	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 15:54:18.485406+00	
00000000-0000-0000-0000-000000000000	a0d0e9ad-7fbe-4493-b30f-28d79e2ba7f0	{"action":"login","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 15:54:29.461815+00	
00000000-0000-0000-0000-000000000000	7ca079f6-f6c2-4ac5-9d7b-fff5c6075886	{"action":"logout","actor_id":"b6037848-7408-4c5e-b8e5-9a4bb378f9ac","actor_name":"Ezequiel Urdinez","actor_username":"eurdinez@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 15:54:32.00717+00	
00000000-0000-0000-0000-000000000000	ed8e9dc3-e980-4b81-9428-fe5fd26352fd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 16:17:00.688084+00	
00000000-0000-0000-0000-000000000000	0d2863b4-bb9e-414d-8d7d-b82e13e01130	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 16:17:02.492801+00	
00000000-0000-0000-0000-000000000000	0be0c304-0be0-404e-8481-86d34e62d7fe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 16:21:47.364162+00	
00000000-0000-0000-0000-000000000000	b0fd80a0-b1f9-42e2-a511-d60d8eaf15f6	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 16:21:48.655984+00	
00000000-0000-0000-0000-000000000000	44775be1-e8cd-4044-8382-2061c2a57df7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 16:27:11.326492+00	
00000000-0000-0000-0000-000000000000	ab6e30fa-bd49-4058-a47a-b3f2a3ece15e	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-13 16:27:12.822802+00	
00000000-0000-0000-0000-000000000000	28adf0bf-b454-4bed-a45c-4b0878fcf10b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-13 16:29:09.903356+00	
00000000-0000-0000-0000-000000000000	4669a54d-5744-4166-a744-281a8fee79ba	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 17:30:47.443613+00	
00000000-0000-0000-0000-000000000000	4197cc23-a16a-4fed-8b50-389200993ea6	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-13 17:30:47.455341+00	
00000000-0000-0000-0000-000000000000	b0bf2b72-ed61-42e4-b80c-4cbd8ddb228f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-14 02:13:23.839173+00	
00000000-0000-0000-0000-000000000000	31c18572-a311-44da-ba7f-a0ae6616a2b4	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"testuser-892355a7-5bfc-4d4e-86ff-33c4344e2571@example.com","user_id":"129b1c80-56e6-4d26-9de9-a787744ea261","user_phone":""}}	2025-10-14 03:15:52.774061+00	
00000000-0000-0000-0000-000000000000	a65cbb98-5f20-48e2-9d8c-d90a71eb6e50	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testuser-892355a7-5bfc-4d4e-86ff-33c4344e2571@example.com","user_id":"129b1c80-56e6-4d26-9de9-a787744ea261","user_phone":""}}	2025-10-14 03:16:11.228205+00	
00000000-0000-0000-0000-000000000000	afefb26a-cd6e-4e62-9e38-a19c58114e3f	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"testuser-cdf4b2fb-0aa2-4961-850d-e65a82ee514a@example.com","user_id":"cec8897f-8f1f-47db-abbe-8e0deb263829","user_phone":""}}	2025-10-14 03:17:00.011615+00	
00000000-0000-0000-0000-000000000000	aea8dbec-97a4-4dbb-b219-6ec84c812792	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testuser-cdf4b2fb-0aa2-4961-850d-e65a82ee514a@example.com","user_id":"cec8897f-8f1f-47db-abbe-8e0deb263829","user_phone":""}}	2025-10-14 03:17:01.108167+00	
00000000-0000-0000-0000-000000000000	36cd988c-21ac-4d9a-b6a1-6b732d429a9f	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"testuser-76aa6546-d2bc-4dd0-b4b2-a18d783d8e01@example.com","user_id":"955a9b0b-6315-4e37-a4b5-a6b487f22942","user_phone":""}}	2025-10-14 03:17:47.409112+00	
00000000-0000-0000-0000-000000000000	26732d66-b878-4e3c-84b8-aa182f8829f7	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"testuser-76aa6546-d2bc-4dd0-b4b2-a18d783d8e01@example.com","user_id":"955a9b0b-6315-4e37-a4b5-a6b487f22942","user_phone":""}}	2025-10-14 03:18:05.212461+00	
00000000-0000-0000-0000-000000000000	c3edd7f9-6262-46de-b0be-4ac195033c18	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 03:31:12.16837+00	
00000000-0000-0000-0000-000000000000	0fac86b2-7378-4cf1-9f55-c76d5cd5c981	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 03:31:12.178454+00	
00000000-0000-0000-0000-000000000000	9b393761-db70-4a94-b6ef-5fcb2bc9c06c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 13:02:33.844725+00	
00000000-0000-0000-0000-000000000000	d2515ba5-c48d-464e-85d0-6ded408e1c23	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 13:02:33.873774+00	
00000000-0000-0000-0000-000000000000	755a9fbd-829a-4ffb-b77d-d6d47c0f949f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 14:04:30.677385+00	
00000000-0000-0000-0000-000000000000	83a086a9-f8c8-4427-88d5-713564d8853f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 14:04:30.695997+00	
00000000-0000-0000-0000-000000000000	ee0cab22-199d-4a52-b169-a17282bfc40e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 15:06:55.18104+00	
00000000-0000-0000-0000-000000000000	808b8c29-317a-45e2-955d-90073ea76b70	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 15:06:55.198547+00	
00000000-0000-0000-0000-000000000000	343b987b-225a-480d-af8b-ebd7c55ba9fc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 16:18:11.93955+00	
00000000-0000-0000-0000-000000000000	326a70b3-ed60-4860-bf2b-a00af7edfa7b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 16:18:11.954168+00	
00000000-0000-0000-0000-000000000000	d12eda00-1d72-46f2-93ba-4e0d60090cf6	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 17:16:28.85446+00	
00000000-0000-0000-0000-000000000000	9805a769-33e6-46a9-8fdc-e5a90af63c21	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 17:16:28.870862+00	
00000000-0000-0000-0000-000000000000	caa17569-b21f-4123-9f72-1ed7cdbb6118	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 18:14:39.051498+00	
00000000-0000-0000-0000-000000000000	9107d6c0-a1af-4b78-b40b-60e0ff17cc04	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 18:14:39.063868+00	
00000000-0000-0000-0000-000000000000	618a5138-4844-4f88-a564-86d6d1233278	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 19:12:53.621218+00	
00000000-0000-0000-0000-000000000000	712b8b54-5a2a-49eb-b5dc-1b8bc8ae4fad	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-14 19:12:53.641088+00	
00000000-0000-0000-0000-000000000000	e5bdfa74-2109-402d-8365-ec45c86a5a32	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-15 01:40:31.265536+00	
00000000-0000-0000-0000-000000000000	11445950-1f47-4ff6-8fdd-9bf3acde8fff	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 01:59:08.518153+00	
00000000-0000-0000-0000-000000000000	3cb9b2fc-54a7-47e6-81f9-a17c179c1704	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 01:59:08.526389+00	
00000000-0000-0000-0000-000000000000	6eaa8e5e-783d-445b-8240-f7da234cb056	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 03:02:39.426972+00	
00000000-0000-0000-0000-000000000000	91312067-becf-4dd6-80d2-0240b1c23f24	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 03:02:39.444619+00	
00000000-0000-0000-0000-000000000000	91a45630-c7d3-4452-a5a9-adec2020d71b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 12:47:21.049516+00	
00000000-0000-0000-0000-000000000000	f8301c46-785a-4abc-b6b7-6fc18edef49d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 12:47:21.063561+00	
00000000-0000-0000-0000-000000000000	d40af4f5-803e-4ba9-ad0f-5759d6e20d6d	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-15 13:33:14.408708+00	
00000000-0000-0000-0000-000000000000	b708bc6b-2c93-4287-8224-c5e652f75f03	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-15 13:33:54.513166+00	
00000000-0000-0000-0000-000000000000	9e029484-ff49-4d2a-a7a1-f058d2a805e0	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-15 13:55:43.534206+00	
00000000-0000-0000-0000-000000000000	fc606dd8-50ce-4428-8674-4658ea8fce47	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 14:32:17.969359+00	
00000000-0000-0000-0000-000000000000	d0e45d6b-15d9-4130-938b-ced3e665f27f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 14:32:17.982566+00	
00000000-0000-0000-0000-000000000000	f9c78138-3dd9-483c-832f-486d5f1fc1a4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 15:04:06.909986+00	
00000000-0000-0000-0000-000000000000	0fadae8b-5f50-47d9-8bc9-3a7e9ac85627	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 15:04:06.928568+00	
00000000-0000-0000-0000-000000000000	10b275b2-5ee3-4c20-a798-aa552a426655	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 15:30:36.864437+00	
00000000-0000-0000-0000-000000000000	cbcd1e27-e6e4-4f91-870a-69a60a838f09	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 15:30:36.881273+00	
00000000-0000-0000-0000-000000000000	d5583c74-cf13-450f-8123-96c8c450188f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 16:29:00.48116+00	
00000000-0000-0000-0000-000000000000	f2054744-c207-4ec2-9fc7-a96fe4a11d80	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 16:29:00.491961+00	
00000000-0000-0000-0000-000000000000	3798bebb-9280-4e93-a090-ba3456429822	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 16:58:17.602873+00	
00000000-0000-0000-0000-000000000000	c57ebf3a-050e-48c0-8317-bccd004b606d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 16:58:17.626247+00	
00000000-0000-0000-0000-000000000000	02a6ae0b-a12c-4189-b3a3-1b1a4799d832	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 18:00:58.81444+00	
00000000-0000-0000-0000-000000000000	06267827-ad73-4cce-a2b5-08cc1c29735d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 18:00:58.824898+00	
00000000-0000-0000-0000-000000000000	4b1f1bad-253e-43ae-80e2-8f1afc884654	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-15 18:27:14.479698+00	
00000000-0000-0000-0000-000000000000	ec739b9b-2cf6-4216-ab61-cf2dc64ea0a2	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-15 18:27:28.504603+00	
00000000-0000-0000-0000-000000000000	90b020d7-f025-4a21-adeb-9f292e8690f9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 19:25:54.805853+00	
00000000-0000-0000-0000-000000000000	cbb11b79-7c25-4ed0-9163-23b0f7d94526	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 19:25:54.822803+00	
00000000-0000-0000-0000-000000000000	f8cc44eb-bec6-4a74-93bf-197b60192500	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 01:03:59.632696+00	
00000000-0000-0000-0000-000000000000	10507e5f-5537-4413-bd04-78256efdb492	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 02:11:51.633786+00	
00000000-0000-0000-0000-000000000000	445309f0-8282-4bfa-949e-51970900e315	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 02:11:51.645927+00	
00000000-0000-0000-0000-000000000000	c5b79211-8c22-4942-90b0-15e70bd46034	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 12:21:38.829236+00	
00000000-0000-0000-0000-000000000000	baa57fce-b382-47f6-8ab5-3f43757f5d62	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 12:21:38.850871+00	
00000000-0000-0000-0000-000000000000	f02059aa-9932-458b-9549-804d73b2310e	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-16 12:21:39.811536+00	
00000000-0000-0000-0000-000000000000	5ab1d9a9-7695-4892-a089-5410455e58cf	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 12:21:50.463326+00	
00000000-0000-0000-0000-000000000000	336c5801-f0dd-4be7-ab47-d0d9d05be546	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-16 12:21:50.953134+00	
00000000-0000-0000-0000-000000000000	d8a3922f-64a8-4ced-9ec6-fec411ab6cb9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 12:22:23.77213+00	
00000000-0000-0000-0000-000000000000	047cde02-cfdd-4640-94f4-535c04803abc	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 12:52:08.262037+00	
00000000-0000-0000-0000-000000000000	2cabdc7c-72d3-4036-81f8-4e6f5039eaea	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 12:52:08.283016+00	
00000000-0000-0000-0000-000000000000	9b6ca096-d160-461b-a977-a315af8591f5	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 12:52:32.898725+00	
00000000-0000-0000-0000-000000000000	03f2032a-6a36-467a-ac9a-6f90af81a463	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-16 12:52:33.523082+00	
00000000-0000-0000-0000-000000000000	79e2c830-a73a-4127-a4f6-827bbed6746a	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 12:52:43.10623+00	
00000000-0000-0000-0000-000000000000	5d3b4db3-ed54-46ff-93c9-afd0d65fb23f	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-16 12:52:43.502145+00	
00000000-0000-0000-0000-000000000000	4cfb83d0-0179-4799-84aa-e02d51d6c3cf	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 13:23:49.769144+00	
00000000-0000-0000-0000-000000000000	68700aef-b0a9-49ac-8cfe-e9cee4080e5f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 13:50:16.786184+00	
00000000-0000-0000-0000-000000000000	565510fb-f9bd-4315-a971-370e88e19841	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 13:50:16.797098+00	
00000000-0000-0000-0000-000000000000	aa43b42b-c440-40f2-b5ff-05a5fc7135df	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 13:53:27.303118+00	
00000000-0000-0000-0000-000000000000	1dc89236-5f93-489d-aab5-008be5c53cbb	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 13:53:27.319885+00	
00000000-0000-0000-0000-000000000000	5b9704cf-dd3c-42fd-b346-79fbd1458d07	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 14:27:51.059355+00	
00000000-0000-0000-0000-000000000000	62e7985a-2b82-4103-9088-26aa995ea8b1	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 14:27:51.072415+00	
00000000-0000-0000-0000-000000000000	0932bc11-765d-4797-909e-2c2c510aa7e9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 14:58:04.203876+00	
00000000-0000-0000-0000-000000000000	64261eea-a0f5-4e4a-8372-31ba6fab0881	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 14:58:04.216248+00	
00000000-0000-0000-0000-000000000000	697dde55-0a50-4665-8eac-3ee5a1edca6c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:01:15.534276+00	
00000000-0000-0000-0000-000000000000	e81b5bf1-00d6-4cfc-8bed-264a5b71bed3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:01:15.539646+00	
00000000-0000-0000-0000-000000000000	0e7da3e3-3c61-4e8b-b7d8-dd06dec82a2b	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:37:50.35862+00	
00000000-0000-0000-0000-000000000000	aebfad0c-0098-490b-8918-74d177a71f22	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:37:50.374894+00	
00000000-0000-0000-0000-000000000000	f3df2e45-a3bc-4b6f-9c3d-d141f9424e64	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:59:40.223041+00	
00000000-0000-0000-0000-000000000000	5fbef3d4-738c-4b5a-bb77-082375231570	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 15:59:40.239545+00	
00000000-0000-0000-0000-000000000000	312db1f5-59e2-4581-abc3-1ab6980374bd	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 16:49:11.391312+00	
00000000-0000-0000-0000-000000000000	cf5ad151-510c-4257-be26-a6962a4c4237	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 16:49:11.405074+00	
00000000-0000-0000-0000-000000000000	fec398c5-c9a2-47a5-827a-903333ae443a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 16:58:38.781033+00	
00000000-0000-0000-0000-000000000000	c34a9d87-9571-43f2-9451-65d2fed822d6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:01:23.451376+00	
00000000-0000-0000-0000-000000000000	db1a3dc5-556e-440e-90b9-7aadf2fce3de	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:05:14.761363+00	
00000000-0000-0000-0000-000000000000	b5507ad6-154e-418a-b53c-cf18d7fd4917	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:34:31.304655+00	
00000000-0000-0000-0000-000000000000	589311f6-cdd6-4c14-80f4-4911208f67d6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:36:22.551328+00	
00000000-0000-0000-0000-000000000000	a69cbe1e-0b6a-4ad9-b4f7-86976d1901c4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:42:01.763991+00	
00000000-0000-0000-0000-000000000000	0260b367-94d7-4422-a334-19da45724ff0	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 17:47:49.813105+00	
00000000-0000-0000-0000-000000000000	580650d5-7aec-4628-9268-3ae8c0f15776	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 18:56:42.186679+00	
00000000-0000-0000-0000-000000000000	3fea2f5b-b202-4da3-85a4-1be3d73fdc53	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 18:56:42.218317+00	
00000000-0000-0000-0000-000000000000	ea993e36-c941-4df4-955c-32a12156317e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 19:09:55.440017+00	
00000000-0000-0000-0000-000000000000	43035a54-bde4-4c7b-9829-4ab679472d7e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 19:09:55.457871+00	
00000000-0000-0000-0000-000000000000	e17892fc-1f73-401c-93cf-b8ae6cecc1cf	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 19:10:36.692268+00	
00000000-0000-0000-0000-000000000000	06ab4814-3827-4208-b708-e0be1ece8500	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 19:12:00.041471+00	
00000000-0000-0000-0000-000000000000	06fdde60-edc8-45e0-ab28-b4d96ce007d0	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 19:12:00.048731+00	
00000000-0000-0000-0000-000000000000	1147dd31-f020-4977-aee4-4aadf734536c	{"action":"login","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 19:12:35.657839+00	
00000000-0000-0000-0000-000000000000	97b14273-5925-4015-8f6f-1e4a02e48d57	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 19:17:52.803558+00	
00000000-0000-0000-0000-000000000000	5dfcc516-7c86-4f4c-a092-adaf0d75b3e8	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 22:28:51.807692+00	
00000000-0000-0000-0000-000000000000	464dac1a-a5fb-426c-ab21-cc5ca41f8132	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-16 22:28:51.848522+00	
00000000-0000-0000-0000-000000000000	c01313e9-8963-4ec7-aea7-967ec3dc6480	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-16 23:50:51.564714+00	
00000000-0000-0000-0000-000000000000	91867645-5c7d-4a99-a79f-d91df00d58c7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 12:08:50.149547+00	
00000000-0000-0000-0000-000000000000	b96f22ba-1d17-4c87-9afa-52bbc4e7b806	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 12:08:50.181653+00	
00000000-0000-0000-0000-000000000000	f9ec0b0e-1878-48ae-af8a-473a8cc01ac5	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 12:55:10.876054+00	
00000000-0000-0000-0000-000000000000	d2e778f1-d06e-43fc-9ad6-91e9c2cdf852	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 13:05:17.583507+00	
00000000-0000-0000-0000-000000000000	c67f6b89-02df-4f28-a793-e5a5787ed65b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 13:16:37.850463+00	
00000000-0000-0000-0000-000000000000	a18d55b8-8b32-4d5c-8272-dc439ced33e7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 13:16:37.854626+00	
00000000-0000-0000-0000-000000000000	66f0ac91-75ab-4310-880a-dc8363e9fcf6	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 13:32:49.936624+00	
00000000-0000-0000-0000-000000000000	7d59f0e8-0cae-4066-a1c3-f96d4ae3ad01	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 13:44:35.147113+00	
00000000-0000-0000-0000-000000000000	f90c7770-a311-4253-9476-8cdb54e8a6e5	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:03:05.89804+00	
00000000-0000-0000-0000-000000000000	95c640e6-155e-41aa-b370-d5aa8afbb08a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 14:08:48.333716+00	
00000000-0000-0000-0000-000000000000	97a7b003-2c26-47b8-a878-056fd2cd8055	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 14:08:48.338808+00	
00000000-0000-0000-0000-000000000000	11895eee-2ef8-4964-85a3-16838c86f609	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:25:09.20594+00	
00000000-0000-0000-0000-000000000000	6dad30c3-9af4-4ce4-8e81-6903a2b179cb	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:29:03.615834+00	
00000000-0000-0000-0000-000000000000	da08608e-001c-438d-b6aa-087948805340	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:29:10.349722+00	
00000000-0000-0000-0000-000000000000	ee35dd99-68a0-499f-93eb-067d58070714	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:32:26.689966+00	
00000000-0000-0000-0000-000000000000	3d4b6f8f-a5ee-407d-84d6-4ba3800cc322	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:32:33.354248+00	
00000000-0000-0000-0000-000000000000	289c1e7c-d8a3-468f-8631-c82b850d41f3	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:34:46.813833+00	
00000000-0000-0000-0000-000000000000	0ac1be58-b045-4ae4-9a6d-cfbde545001f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:34:52.610459+00	
00000000-0000-0000-0000-000000000000	f6799f0c-10f9-4905-9738-c4eccadd12c5	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:35:22.723034+00	
00000000-0000-0000-0000-000000000000	7f1cc7f2-6c82-4785-8bcc-c4b5ff9620b4	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:35:30.007523+00	
00000000-0000-0000-0000-000000000000	eb0030bb-5915-446f-ad0a-45aec847b5d2	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:35:47.817725+00	
00000000-0000-0000-0000-000000000000	be0e8568-081e-4ef1-b875-2b38e72ce730	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:35:50.16994+00	
00000000-0000-0000-0000-000000000000	4001774b-fcf1-4b68-85c3-ba9cf95266df	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:35:56.888174+00	
00000000-0000-0000-0000-000000000000	891f78b2-3e1a-46ac-80fc-66022df74b4b	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:39:13.2487+00	
00000000-0000-0000-0000-000000000000	f1e18e61-f5cd-474c-b782-ea058fde4224	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:39:21.634231+00	
00000000-0000-0000-0000-000000000000	a8a642fb-df2a-4b56-845e-f1a977614dff	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:47:10.118703+00	
00000000-0000-0000-0000-000000000000	4141a04b-2326-4c26-83c8-da4e09308280	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:47:16.839586+00	
00000000-0000-0000-0000-000000000000	b9dff7df-9740-4c38-9bfd-e526cf58e3dd	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:47:36.683631+00	
00000000-0000-0000-0000-000000000000	a73146ab-b41d-4f29-b520-022aceb8cbcf	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:47:41.976298+00	
00000000-0000-0000-0000-000000000000	3daaff54-cf8a-4aef-9884-004d7dfc3c4f	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:50:34.527352+00	
00000000-0000-0000-0000-000000000000	5f7dab14-2800-4c32-96e5-384c8edd08fe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:50:51.342505+00	
00000000-0000-0000-0000-000000000000	a840f6d6-834c-4a69-970a-9475e78f523d	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 14:50:54.028975+00	
00000000-0000-0000-0000-000000000000	20ea2b1b-715e-48e8-959d-90618889f648	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 14:50:59.629485+00	
00000000-0000-0000-0000-000000000000	16b61777-ef92-478b-8eb3-5aab788a6933	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 15:27:12.652736+00	
00000000-0000-0000-0000-000000000000	9d0eeb08-e10d-4577-bc99-916441e5560c	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 16:26:40.425872+00	
00000000-0000-0000-0000-000000000000	0626b03a-871b-4fca-8372-8db368fccd31	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 16:28:17.787023+00	
00000000-0000-0000-0000-000000000000	763d7150-9257-43d8-9ff5-44fa9894e99a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 16:28:25.137944+00	
00000000-0000-0000-0000-000000000000	15e89e89-d057-49a3-afc7-bfbeb656cf8b	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 17:14:06.53793+00	
00000000-0000-0000-0000-000000000000	16f9a580-cbad-4975-b8ba-85ef9ccefd48	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 17:16:13.56071+00	
00000000-0000-0000-0000-000000000000	0b40dc39-70cb-4ded-83db-55d7bf01b9b9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 18:15:03.56222+00	
00000000-0000-0000-0000-000000000000	143d39c5-fe49-4f2c-8ae1-b16f5431ba99	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-17 18:15:03.596009+00	
00000000-0000-0000-0000-000000000000	18b263c0-063c-4270-94b5-d4bf43bd15f1	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 18:16:47.732162+00	
00000000-0000-0000-0000-000000000000	01dc3511-da33-4174-b12f-97917ceb0f60	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 18:32:00.057158+00	
00000000-0000-0000-0000-000000000000	85a7c0c0-bfc0-41b5-93bb-64722242ce25	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 19:20:23.880119+00	
00000000-0000-0000-0000-000000000000	6f79e778-6dc8-41e0-9bb4-a9e806b58ca3	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 19:22:40.419915+00	
00000000-0000-0000-0000-000000000000	c748a89a-e09f-4551-b849-5b365739dfe4	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 19:22:43.018973+00	
00000000-0000-0000-0000-000000000000	d3e055dd-f503-44eb-a431-3f6dc53e4331	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 19:22:45.43476+00	
00000000-0000-0000-0000-000000000000	8c0f10fe-9a46-43d0-a0aa-ef581622301d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 19:24:51.859428+00	
00000000-0000-0000-0000-000000000000	8db5ba96-4e8c-43b0-9184-0d3968cdb48b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 19:26:19.123929+00	
00000000-0000-0000-0000-000000000000	009c967f-1249-47d0-9678-b92fe27a8746	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-17 19:26:52.625646+00	
00000000-0000-0000-0000-000000000000	b97d095f-f52a-4a66-b01c-55bc48cfb73a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-17 19:26:55.854638+00	
00000000-0000-0000-0000-000000000000	1e8eec96-9441-43ad-842c-0580d4db3aef	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 01:49:37.101744+00	
00000000-0000-0000-0000-000000000000	869a2b9c-0e58-44df-bb4a-d31fe56fcabb	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 12:45:35.512964+00	
00000000-0000-0000-0000-000000000000	e0f89290-d72d-48b7-88bb-b8ee2ca8207f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 12:49:31.235049+00	
00000000-0000-0000-0000-000000000000	462bccf9-b65f-4870-9330-7689cf58fc4b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 13:51:19.979766+00	
00000000-0000-0000-0000-000000000000	4fc0ea9d-4be6-41e5-9677-5cc09552d96e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 13:52:15.277636+00	
00000000-0000-0000-0000-000000000000	dd26ff76-cc80-416a-a733-d0a48373da94	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 13:52:18.167259+00	
00000000-0000-0000-0000-000000000000	c8e88742-b822-4324-81fe-44ad5562d44e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 13:52:18.16918+00	
00000000-0000-0000-0000-000000000000	20914638-1c29-44a2-be01-ff5e37c210fb	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 14:25:58.035498+00	
00000000-0000-0000-0000-000000000000	07521e35-4868-4618-bf01-faec349b785d	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 14:25:58.052356+00	
00000000-0000-0000-0000-000000000000	1eafaabb-aa6c-4ebc-ac18-d281a5be40e7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 14:40:24.251957+00	
00000000-0000-0000-0000-000000000000	d4192d94-5b17-48f3-a23c-f4aa22de55ac	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 14:46:47.688507+00	
00000000-0000-0000-0000-000000000000	208d2ffa-516c-4f7a-b7b4-ab081bbf62f6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 14:53:49.743232+00	
00000000-0000-0000-0000-000000000000	b5a16eae-52f9-4a0b-94f4-8f566ba1ca7a	{"action":"user_repeated_signup","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-20 14:58:25.546906+00	
00000000-0000-0000-0000-000000000000	e827371d-19de-41b7-9513-3816ef94e2c1	{"action":"user_confirmation_requested","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-20 14:59:03.527276+00	
00000000-0000-0000-0000-000000000000	994727b3-4a29-4129-bc5c-0bfe26b6b26c	{"action":"user_signedup","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-20 15:00:00.297001+00	
00000000-0000-0000-0000-000000000000	cc3c0dc1-8955-4267-9aeb-b7cc7c3db62c	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-20 15:00:41.498363+00	
00000000-0000-0000-0000-000000000000	d1dfc25c-0777-4b09-a462-95cef1b94829	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 15:03:35.750147+00	
00000000-0000-0000-0000-000000000000	1f2ff4af-6d60-4fbf-927c-d130894ee4ad	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 15:04:04.830485+00	
00000000-0000-0000-0000-000000000000	3bc6bad7-8aaf-49ad-8fb7-2442f8d29431	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 15:04:04.831907+00	
00000000-0000-0000-0000-000000000000	ad95f47a-b2e9-4c93-a1bf-916c31ad5cbd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-20 15:43:17.837266+00	
00000000-0000-0000-0000-000000000000	f2175025-5570-4edf-ad87-73e2d5dcba15	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-20 16:27:44.170302+00	
00000000-0000-0000-0000-000000000000	9eb6577f-20d2-47d8-bc26-9b1b2af7caa5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 16:42:27.888323+00	
00000000-0000-0000-0000-000000000000	b9b062e6-68e4-49c4-bf31-21e7e90936c7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 16:42:27.898825+00	
00000000-0000-0000-0000-000000000000	0f8aee65-c40a-439f-8289-bf6a3dda7894	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 16:46:03.373568+00	
00000000-0000-0000-0000-000000000000	e82700de-7c16-400e-af07-b261f3373375	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 16:46:03.379965+00	
00000000-0000-0000-0000-000000000000	904da33b-4434-455a-8af1-ed1af9ada548	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:21:26.899518+00	
00000000-0000-0000-0000-000000000000	3aec1d7f-2b53-4fcb-baae-bd14d11f3076	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:21:26.91565+00	
00000000-0000-0000-0000-000000000000	1d41eb37-ba0e-450b-986f-507546fd7cdc	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:26:06.977103+00	
00000000-0000-0000-0000-000000000000	445d43ba-88f0-4984-8dea-a3db694c3ade	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:26:06.982895+00	
00000000-0000-0000-0000-000000000000	c1bdbf0e-9f62-41d8-b09a-5921d10ebcd1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:46:21.417093+00	
00000000-0000-0000-0000-000000000000	5ea04a78-22b7-4f38-8445-bc820878b10d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:46:21.428037+00	
00000000-0000-0000-0000-000000000000	77880985-2d3c-4ef3-8655-44be51a94997	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:51:28.138035+00	
00000000-0000-0000-0000-000000000000	bdcde7c0-ea90-46d3-b9d7-d23c665ce506	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 17:51:28.143937+00	
00000000-0000-0000-0000-000000000000	252e957f-f675-4a49-9b5f-6e8de28eee7c	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 18:24:15.773216+00	
00000000-0000-0000-0000-000000000000	8b94c9e3-2934-42c1-ba73-33832fee4140	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 18:24:15.78679+00	
00000000-0000-0000-0000-000000000000	084a18f4-28ca-4b3e-9176-70cde383e1da	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 18:45:09.44791+00	
00000000-0000-0000-0000-000000000000	8e3630e5-a3bd-452d-b077-20df0160936a	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-20 18:45:09.462245+00	
00000000-0000-0000-0000-000000000000	66b9990e-9eb4-4094-9041-34dd8f412deb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 11:56:30.395377+00	
00000000-0000-0000-0000-000000000000	326c8a9e-af16-40bd-b0f2-a25f1033ea71	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 11:56:30.427626+00	
00000000-0000-0000-0000-000000000000	f13d3245-4b02-4cb5-aaf7-f6255204e5ac	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 12:40:27.347257+00	
00000000-0000-0000-0000-000000000000	307f0007-9d98-469a-b4af-67c106cf4bb4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 12:40:27.374284+00	
00000000-0000-0000-0000-000000000000	de633ff9-40ed-4fe1-b529-7480ad35d6bc	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-21 12:40:45.387385+00	
00000000-0000-0000-0000-000000000000	710d0096-e9e3-4aab-8fe8-bb4a3bc7ef06	{"action":"login","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 12:40:52.115039+00	
00000000-0000-0000-0000-000000000000	6b1d9753-356d-441f-bd5c-03a383a63932	{"action":"logout","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-21 12:41:21.403891+00	
00000000-0000-0000-0000-000000000000	2fcdc550-aa46-4435-8271-6196ca4189ff	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 12:41:26.959476+00	
00000000-0000-0000-0000-000000000000	2fb6ae6c-9188-4a2c-9432-d04c2b35ba4a	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-21 12:43:19.096671+00	
00000000-0000-0000-0000-000000000000	350018d3-5734-425f-8916-c9295c918c39	{"action":"login","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 12:43:25.299851+00	
00000000-0000-0000-0000-000000000000	62e38dcf-89d8-4065-a064-5bd2f2b8e909	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 13:10:21.595807+00	
00000000-0000-0000-0000-000000000000	83047957-9ef3-4a03-8a5a-f73f5ccda140	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 13:10:21.6058+00	
00000000-0000-0000-0000-000000000000	8c20bac9-ae1f-459b-bd92-f2a7a43bef08	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 13:35:33.286044+00	
00000000-0000-0000-0000-000000000000	a8824566-f646-47d1-8c3d-4f722d94b26c	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 13:41:50.954917+00	
00000000-0000-0000-0000-000000000000	0cf37ace-0319-422a-8d42-3281abb74068	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 13:41:50.964157+00	
00000000-0000-0000-0000-000000000000	f79ae54e-3620-4c61-9d19-85d521362142	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:15:04.452208+00	
00000000-0000-0000-0000-000000000000	30ba8635-0c05-4416-8016-d3624e36b98d	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:15:04.464455+00	
00000000-0000-0000-0000-000000000000	baaf3602-df50-4cd5-9dc2-b4e6ccd2207a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:34:23.896345+00	
00000000-0000-0000-0000-000000000000	1076a04b-2a44-4ff9-9175-1046eb674c41	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:34:23.904937+00	
00000000-0000-0000-0000-000000000000	538b3218-39d9-40c4-8675-8b050c544ea8	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:40:18.642573+00	
00000000-0000-0000-0000-000000000000	ee436694-5696-42e5-b2e2-2ab5efc3d0aa	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 14:40:18.646127+00	
00000000-0000-0000-0000-000000000000	58fc9cc8-2c1f-48d1-a571-35f44805af0f	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 15:13:10.966704+00	
00000000-0000-0000-0000-000000000000	bf06e6af-b68d-4bb3-a5b2-b345b484ed1c	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 15:13:10.981159+00	
00000000-0000-0000-0000-000000000000	517770c9-376a-496b-9ea7-c6fa6236ff6f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 15:18:01.914301+00	
00000000-0000-0000-0000-000000000000	2a503dea-89eb-4de4-9f53-ebefdfd6a8be	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-21 15:18:55.29415+00	
00000000-0000-0000-0000-000000000000	4b90d8c6-ab1e-40de-978a-e77ca9cfd258	{"action":"login","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 15:19:00.398966+00	
00000000-0000-0000-0000-000000000000	eeb4b0e0-8a13-43e9-9a5a-81db9a8a999e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 15:54:58.365738+00	
00000000-0000-0000-0000-000000000000	8e5cd2b5-4271-4a7a-8a84-e9a0e90c48a2	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:19:49.820168+00	
00000000-0000-0000-0000-000000000000	31a9f0e2-79ca-4af0-b4f0-4fbca6f866b0	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:19:49.832946+00	
00000000-0000-0000-0000-000000000000	925173f5-2584-4eff-a87e-78a89f8f50d5	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:37:20.255859+00	
00000000-0000-0000-0000-000000000000	13bf019f-79bb-4d32-b0f4-b68cbf38225a	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:37:20.265178+00	
00000000-0000-0000-0000-000000000000	7023fb48-4336-4e9a-8553-8b6f386dca97	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:56:07.530315+00	
00000000-0000-0000-0000-000000000000	bf4980b2-9c57-4a6d-b036-5605e2622b35	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 16:56:07.541029+00	
00000000-0000-0000-0000-000000000000	8d83c23b-89b2-4a7f-9000-8fc66c719e6b	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 17:17:57.006975+00	
00000000-0000-0000-0000-000000000000	70532121-616c-4330-8bd5-e288205b7038	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 17:17:57.018963+00	
00000000-0000-0000-0000-000000000000	7cb6f4dd-a875-4975-9608-30e3e8bbfe10	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 18:16:42.226868+00	
00000000-0000-0000-0000-000000000000	c12bf870-18f3-44c7-b437-293e23dfa127	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 18:16:42.248605+00	
00000000-0000-0000-0000-000000000000	e4f1a90e-d8fa-4cf0-9da9-682642c76cc1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 18:42:23.699297+00	
00000000-0000-0000-0000-000000000000	14126540-9814-474d-8890-0a5fcfebc94c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 18:42:23.710321+00	
00000000-0000-0000-0000-000000000000	54e15b29-0553-4e04-9c5b-f7b537e21c89	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 19:15:08.177464+00	
00000000-0000-0000-0000-000000000000	045a2e16-3c45-40c1-88dd-6867e3ee245c	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-21 19:15:08.193822+00	
00000000-0000-0000-0000-000000000000	24f9d05d-d16c-4d6b-b4b8-7c153b715623	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-21 22:52:25.760406+00	
00000000-0000-0000-0000-000000000000	f7cd07f9-5313-4679-bae5-d9231467004b	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 12:42:24.563984+00	
00000000-0000-0000-0000-000000000000	8c1afcd4-3173-4b3d-8e93-10534985ed05	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 12:42:24.595346+00	
00000000-0000-0000-0000-000000000000	37ee68cd-243f-4c7e-900c-558b4cea859a	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 14:33:59.02002+00	
00000000-0000-0000-0000-000000000000	3841e420-0ea3-4b7e-97dc-3568106237d4	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 14:33:59.051148+00	
00000000-0000-0000-0000-000000000000	7afcc465-964e-4c8d-95f3-f4fbf05b1df0	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 14:33:59.129923+00	
00000000-0000-0000-0000-000000000000	6ed1417f-24ac-42e9-9510-e8a7e328b230	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-22 14:57:11.678122+00	
00000000-0000-0000-0000-000000000000	0e5c9d63-cff3-4993-bb0d-68991de58120	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-22 14:57:27.706096+00	
00000000-0000-0000-0000-000000000000	f28efb28-e09b-4a11-a369-bbc038e96832	{"action":"token_refreshed","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 15:32:03.205121+00	
00000000-0000-0000-0000-000000000000	cdb0525d-7388-4787-9364-3e790b422552	{"action":"token_revoked","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 15:32:03.22287+00	
00000000-0000-0000-0000-000000000000	d668eff2-1f59-473c-a829-ab883a244440	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 15:40:20.623722+00	
00000000-0000-0000-0000-000000000000	477f5832-c72b-4c90-8565-e01c67d7b4b1	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 15:40:20.639634+00	
00000000-0000-0000-0000-000000000000	2ef8a02a-94bf-4940-8bc2-838f0da3e989	{"action":"logout","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-22 16:03:35.946178+00	
00000000-0000-0000-0000-000000000000	59dedece-4cea-4318-8f7e-147081aaa8d6	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 16:03:40.616437+00	
00000000-0000-0000-0000-000000000000	63264e42-d286-4946-8590-fcbde56ac810	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 16:38:58.679664+00	
00000000-0000-0000-0000-000000000000	d7bd1a13-c7ce-4b77-a92a-5caffbbaa616	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 16:38:58.696803+00	
00000000-0000-0000-0000-000000000000	2d06fcc0-c175-4018-abf7-d66f5fc4381b	{"action":"logout","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-22 16:39:26.408353+00	
00000000-0000-0000-0000-000000000000	3644f3cf-fcb8-4e13-b75b-ea8275212e7f	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 16:39:27.98547+00	
00000000-0000-0000-0000-000000000000	a2143118-f0d5-4a27-af94-5edb1e26f576	{"action":"logout","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-22 16:40:21.629598+00	
00000000-0000-0000-0000-000000000000	08d1ccb3-dccb-4054-8914-eec231e2769a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-22 16:41:12.469429+00	
00000000-0000-0000-0000-000000000000	9d631cab-4581-4aed-bc50-3e3abb75c39f	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 16:41:51.347559+00	
00000000-0000-0000-0000-000000000000	bcb7d741-bb80-4865-a86d-02988396d0c9	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 16:49:55.446255+00	
00000000-0000-0000-0000-000000000000	9aba414b-1632-45d5-bb9d-7563a3b62457	{"action":"logout","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-22 16:50:13.89961+00	
00000000-0000-0000-0000-000000000000	d807df2f-82f5-4357-b86c-5e2bd755db3e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-22 16:50:22.176127+00	
00000000-0000-0000-0000-000000000000	03bd475c-a62c-458b-8783-c0fe58d4ded9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 17:53:33.515134+00	
00000000-0000-0000-0000-000000000000	a3f49b8a-da15-4809-bf6c-4076cfae9e6b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-22 17:53:33.543884+00	
00000000-0000-0000-0000-000000000000	0a37c99e-590c-4596-a6c1-72bf0ff9a8d6	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 18:27:01.202002+00	
00000000-0000-0000-0000-000000000000	be28f77f-3215-4338-a48f-7eb84bdcc9a0	{"action":"logout","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-22 18:27:13.585682+00	
00000000-0000-0000-0000-000000000000	83e756b6-daf7-4511-a601-827790520580	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-22 18:27:51.633295+00	
00000000-0000-0000-0000-000000000000	f9ad9827-7cae-405f-b7e3-45743dc58884	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 12:08:30.839265+00	
00000000-0000-0000-0000-000000000000	a3702e6d-fb33-41d7-a905-999cf56409d7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 12:08:30.872143+00	
00000000-0000-0000-0000-000000000000	4b77304e-5104-49d4-97db-6bfbdfd7c38a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 12:55:04.1194+00	
00000000-0000-0000-0000-000000000000	72ac0aff-dc61-492f-bf07-44de54ef113b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 12:55:04.135487+00	
00000000-0000-0000-0000-000000000000	9561d037-6c04-4a4a-adc1-039f5e426a89	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 13:06:49.306037+00	
00000000-0000-0000-0000-000000000000	3d33931f-b380-4179-b59f-2c2c79431882	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 13:06:49.31764+00	
00000000-0000-0000-0000-000000000000	b40bcd31-e321-4b78-b584-6340ff101894	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 13:32:15.536084+00	
00000000-0000-0000-0000-000000000000	b49b1741-5ec6-4324-a0ea-47abb97bc4e9	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 13:32:15.548363+00	
00000000-0000-0000-0000-000000000000	9a6f0c80-ae44-4b24-b8df-96167602b32b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 14:05:03.06657+00	
00000000-0000-0000-0000-000000000000	d9138647-1029-4a70-bf94-2e7a253adf47	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 14:05:03.08449+00	
00000000-0000-0000-0000-000000000000	f816df23-399c-490f-bd33-3ec7475899e9	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:01:27.702707+00	
00000000-0000-0000-0000-000000000000	0839fb0c-b032-4799-ba8e-695fa1ea2baa	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:01:27.715556+00	
00000000-0000-0000-0000-000000000000	8e18adf4-52f2-4119-9494-26152b69c96e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:04:06.710725+00	
00000000-0000-0000-0000-000000000000	4a6f94fa-5feb-42d3-80cb-b6e9a6951bd4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:04:06.712268+00	
00000000-0000-0000-0000-000000000000	692b56a6-7c45-42fa-a1de-067af3d47beb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:05:50.296121+00	
00000000-0000-0000-0000-000000000000	54f753dd-5b6d-4764-aa09-f201d00b6369	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:05:50.298163+00	
00000000-0000-0000-0000-000000000000	be13b9d9-01c5-4503-a9d2-f4d465b1d15f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 16:03:39.510871+00	
00000000-0000-0000-0000-000000000000	69483507-2bbf-4552-857a-b94e2bcc1bc8	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 16:03:39.530893+00	
00000000-0000-0000-0000-000000000000	63b44bdb-7de0-498f-8ce0-b7a605426cc5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 16:04:13.034725+00	
00000000-0000-0000-0000-000000000000	55aa1331-8c31-45e8-ba03-d9c95d055e23	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 16:04:13.035446+00	
00000000-0000-0000-0000-000000000000	82682374-fe0e-4611-99ac-99eb5dd83b20	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 17:02:30.674051+00	
00000000-0000-0000-0000-000000000000	d28bb4cd-821d-480c-967b-c7b385491d6a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 17:02:30.694153+00	
00000000-0000-0000-0000-000000000000	ed9f2dc0-2d0c-4e5e-a9f0-5bfe926e504e	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 17:22:13.217668+00	
00000000-0000-0000-0000-000000000000	af3710db-4fcb-484a-a155-dc3722e21a3f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 17:22:13.228773+00	
00000000-0000-0000-0000-000000000000	9ce7c66d-9347-43e1-80eb-7482fea129a0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:00:29.851709+00	
00000000-0000-0000-0000-000000000000	dfb9dc5e-1905-4b43-8d7f-085db0cced5f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:00:29.864582+00	
00000000-0000-0000-0000-000000000000	70966b1a-87a6-4bc6-8348-276a36fb444a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:28:54.029054+00	
00000000-0000-0000-0000-000000000000	c7dc85e0-aedb-4dd0-805b-65bee624c701	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:28:54.041597+00	
00000000-0000-0000-0000-000000000000	58ec1f46-00f4-431f-83a9-23d9822aa9f5	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:58:53.923259+00	
00000000-0000-0000-0000-000000000000	5fa59b00-aa73-4173-8796-714f624847b4	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 18:58:53.936471+00	
00000000-0000-0000-0000-000000000000	8adb59e4-8e67-4b5a-b57a-5fcc54d5a1ed	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-23 19:12:07.17012+00	
00000000-0000-0000-0000-000000000000	3b1bd6b1-2532-4224-93b3-0d624e2c1dd1	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-23 19:12:14.256386+00	
00000000-0000-0000-0000-000000000000	3f638219-afc0-4dfe-90e0-e1fa502e9dd2	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-23 19:13:46.702345+00	
00000000-0000-0000-0000-000000000000	4ff460ef-8370-4926-9af6-5f268cc0c6bb	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-23 19:13:53.572015+00	
00000000-0000-0000-0000-000000000000	b1096222-7045-4b7c-98f0-b23fb6a6c039	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 11:33:46.288093+00	
00000000-0000-0000-0000-000000000000	b3f4ab4c-d632-4344-b8da-679f3e2cab0d	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 11:33:46.324579+00	
00000000-0000-0000-0000-000000000000	da1c539c-e0e3-4599-8bad-1b857ce4dc2b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 12:37:04.948275+00	
00000000-0000-0000-0000-000000000000	26230b68-2f03-4ad3-8bc7-7eaaaaaffca5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 12:37:04.971157+00	
00000000-0000-0000-0000-000000000000	87586ff0-bea9-403e-b0c1-e4cac025d5db	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 14:07:03.660365+00	
00000000-0000-0000-0000-000000000000	26069c6a-ba9e-4470-9af9-daaa504a89ec	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 14:18:22.598361+00	
00000000-0000-0000-0000-000000000000	04816357-55d3-457c-a783-d35c3bb146fd	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 14:18:22.610567+00	
00000000-0000-0000-0000-000000000000	3e607cf1-0d61-4042-ac5f-737206c61dde	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 14:20:16.349032+00	
00000000-0000-0000-0000-000000000000	4cb4c5fd-70b9-4b91-be01-1c7f010ae29d	{"action":"logout","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-24 14:20:24.566978+00	
00000000-0000-0000-0000-000000000000	0a5ffcd9-c190-4d48-ae42-93bafbc39d73	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 14:20:30.682631+00	
00000000-0000-0000-0000-000000000000	6c038a2e-e945-4caa-82b4-c1fe9703446d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 15:16:40.015613+00	
00000000-0000-0000-0000-000000000000	3aff5571-6f05-4dac-ad70-e016f7b80f7c	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 15:16:40.034954+00	
00000000-0000-0000-0000-000000000000	9b83420a-6f40-41b5-8324-d0e9168f2cbe	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-24 15:23:30.786779+00	
00000000-0000-0000-0000-000000000000	c2fb9dbe-591b-4e6c-876b-488df1e08afc	{"action":"login","actor_id":"b8d511d8-60c5-4e45-85d6-84382495eadd","actor_name":"Pepe mujica","actor_username":"yoreparolomas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-24 15:23:34.281437+00	
00000000-0000-0000-0000-000000000000	6bc1f817-e300-4756-b5c5-b8473888b3de	{"action":"login","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 15:23:41.516657+00	
00000000-0000-0000-0000-000000000000	503741e7-dcdb-429b-9fd7-df3b7f460f83	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 16:38:11.322831+00	
00000000-0000-0000-0000-000000000000	c4e54bdc-3d78-4529-ba08-b6135bbd3254	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 16:54:16.489297+00	
00000000-0000-0000-0000-000000000000	9aade09e-b356-44b0-8c3a-23f7177d7c13	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 16:54:16.506936+00	
00000000-0000-0000-0000-000000000000	0a34f58c-bfdd-4bbf-b137-636c2ebae462	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 17:36:32.920012+00	
00000000-0000-0000-0000-000000000000	397429d9-39af-462c-9d08-469f341df986	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 17:36:32.936701+00	
00000000-0000-0000-0000-000000000000	0fb2e2d5-b239-4d36-b19f-5fc358fa71a7	{"action":"token_refreshed","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 17:52:48.812072+00	
00000000-0000-0000-0000-000000000000	d15a1e4e-b8b5-42ec-ab61-47c048afd8df	{"action":"token_revoked","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 17:52:48.823064+00	
00000000-0000-0000-0000-000000000000	b259ae6c-9092-4c88-a2de-5deabb0a91fa	{"action":"logout","actor_id":"c39967c6-cf8a-4546-a65d-168e43b4b1c3","actor_name":"Biosplus","actor_username":"ventasbiosplus@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-24 17:53:03.576763+00	
00000000-0000-0000-0000-000000000000	95a73d34-cb7f-49d1-b0cb-dde368a2704a	{"action":"login","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-24 17:53:11.354487+00	
00000000-0000-0000-0000-000000000000	d27f88fc-110c-48df-b158-2169963c2335	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-26 20:10:54.109218+00	
00000000-0000-0000-0000-000000000000	a3544859-f154-41f8-95f2-ea51cb9c9b91	{"action":"token_refreshed","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 20:13:17.20536+00	
00000000-0000-0000-0000-000000000000	c46a9782-33cf-4874-9951-9d018b934b3f	{"action":"token_revoked","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 20:13:17.211291+00	
00000000-0000-0000-0000-000000000000	d18a0ace-e4a6-47be-b239-7216792bbfed	{"action":"logout","actor_id":"fcd336ee-71b2-4cc9-8573-bab798216501","actor_name":"IPE Shop","actor_username":"ipemercadoshop@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-26 20:13:59.632949+00	
00000000-0000-0000-0000-000000000000	f7511015-70de-433d-937a-cb17c8056afe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-26 20:14:08.175479+00	
00000000-0000-0000-0000-000000000000	aa894ed3-e417-48d6-bd25-9dbb55e9e870	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 21:09:08.380756+00	
00000000-0000-0000-0000-000000000000	0f6715a9-c296-4fff-a4e9-ba5477101f8f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 21:09:08.397999+00	
00000000-0000-0000-0000-000000000000	d183892b-3a0e-48ca-83f8-5cf731cfedec	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 21:34:55.130756+00	
00000000-0000-0000-0000-000000000000	da9c7de0-6eef-426d-9c27-4fca1f681e3a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 21:34:55.150344+00	
00000000-0000-0000-0000-000000000000	8d821d0d-dbf9-452e-bdc8-2cba1653a1e8	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:58:15.528278+00	
00000000-0000-0000-0000-000000000000	6b7f0f25-9b57-4ea3-bbf1-a4d8d2a873f6	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:58:15.563+00	
00000000-0000-0000-0000-000000000000	d5a7bcd0-625b-4254-ad1b-1aa657b8eaeb	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:58:30.519993+00	
00000000-0000-0000-0000-000000000000	e4871fe6-8fb4-4405-8e1a-b46b362a2c43	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:58:30.531233+00	
00000000-0000-0000-0000-000000000000	847e997d-fe86-44ed-979f-715b2fa3618d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:09:53.39448+00	
00000000-0000-0000-0000-000000000000	1a30719c-3ae9-499a-ae0b-644db7dfa3ab	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:09:53.42711+00	
00000000-0000-0000-0000-000000000000	0d4c0cd0-0047-49be-91cd-91e6593d395f	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 15:04:24.296521+00	
00000000-0000-0000-0000-000000000000	2eac9e84-d5b5-4bc6-ad09-f8386a83ab53	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 15:04:24.317353+00	
00000000-0000-0000-0000-000000000000	ec962030-8e3e-434e-820b-6eb0b1ffc322	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-27 15:57:18.529096+00	
00000000-0000-0000-0000-000000000000	84580e04-cf62-4c13-bd9a-61acd18b9343	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 16:02:37.390931+00	
00000000-0000-0000-0000-000000000000	9f641c47-b153-46b2-9951-3656776d77e3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 16:02:37.400919+00	
00000000-0000-0000-0000-000000000000	db866dba-3091-41f3-bf01-dd5f5eb11062	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-27 16:09:46.068809+00	
00000000-0000-0000-0000-000000000000	6eb668d6-ceda-4e3c-b6bf-4908aa88cb6d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 17:00:03.615417+00	
00000000-0000-0000-0000-000000000000	39f57354-eb1e-4a9a-82d6-bf88cf4045b0	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 17:00:03.633593+00	
00000000-0000-0000-0000-000000000000	784af435-4411-4021-9ed0-1fa8bc11392b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 17:00:37.699588+00	
00000000-0000-0000-0000-000000000000	c68e919b-aaca-4ecd-8fb0-58797bac4a9b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 17:00:37.718415+00	
00000000-0000-0000-0000-000000000000	91c6bd14-67d0-4d61-8d78-26f10ab0fffa	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 18:11:14.513305+00	
00000000-0000-0000-0000-000000000000	97e75eb0-f141-486d-9703-f1b4fc91ddee	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 18:11:14.539664+00	
00000000-0000-0000-0000-000000000000	dd8dd60c-7de0-472f-8409-ad3dc0ae7b96	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 18:11:46.478723+00	
00000000-0000-0000-0000-000000000000	99654f85-7a96-4603-a683-824688b45de0	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 18:11:46.481234+00	
00000000-0000-0000-0000-000000000000	fc4fc7dc-64c9-4dac-ae56-d415c5486f66	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 19:26:44.901811+00	
00000000-0000-0000-0000-000000000000	9b5d3602-cc25-4daa-9958-b60088126228	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 19:26:44.927852+00	
00000000-0000-0000-0000-000000000000	0518b8c8-a6f8-40fa-aa75-2ab2bcd8c32b	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 19:31:19.712249+00	
00000000-0000-0000-0000-000000000000	f36b9c60-8dfe-44c8-86c8-8e785cca89b7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 19:31:19.721117+00	
00000000-0000-0000-0000-000000000000	a4d0207e-8ba9-438e-a497-d7bf3c3e59f7	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 12:22:32.033205+00	
00000000-0000-0000-0000-000000000000	45f3d26d-3c1d-4220-ad14-e9ee3f266547	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 12:22:32.066651+00	
00000000-0000-0000-0000-000000000000	f0e6ce22-3c5d-4de0-a405-a59c4a20af84	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 13:20:43.621491+00	
00000000-0000-0000-0000-000000000000	613a6efd-fa06-4958-9253-c00849b82b51	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 13:20:43.646463+00	
00000000-0000-0000-0000-000000000000	9a9d39ee-87b3-435b-9e32-69e05d270c02	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 14:18:43.666749+00	
00000000-0000-0000-0000-000000000000	8ea01e75-5eae-4b7f-8ad9-3e8ba2efda62	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 14:18:43.696311+00	
00000000-0000-0000-0000-000000000000	021643ca-59d0-4867-8da5-0d3e10449ca3	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 15:32:47.307967+00	
00000000-0000-0000-0000-000000000000	4c15002c-abfe-44a9-8cd5-67f9247aece5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 15:32:47.332097+00	
00000000-0000-0000-0000-000000000000	b9848af8-6e96-44b5-94e8-3218399e33b4	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-28 15:57:40.363715+00	
00000000-0000-0000-0000-000000000000	c8f73d6d-4cfe-401d-9b3c-5ab01c171d22	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 16:30:56.582412+00	
00000000-0000-0000-0000-000000000000	2c076ada-2176-4102-9235-91d39d71ac04	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 16:30:56.59886+00	
00000000-0000-0000-0000-000000000000	cf3f1978-c11d-47d2-a470-a88fa3f79ae2	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 17:31:42.515543+00	
00000000-0000-0000-0000-000000000000	0a4cfc93-9797-4293-98c3-6716cdae76c7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 17:31:42.535022+00	
00000000-0000-0000-0000-000000000000	d258a6c2-a413-4da5-93fa-947308383491	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 17:37:48.962479+00	
00000000-0000-0000-0000-000000000000	cefa7084-2406-4a3b-a5ec-a8b3be043189	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 17:37:48.970078+00	
00000000-0000-0000-0000-000000000000	1c11d32a-a27e-4cad-80a0-2f259d25ccbf	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 18:30:11.582481+00	
00000000-0000-0000-0000-000000000000	361c7797-0d9c-4208-a59d-4a88e94ca7f1	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 18:30:11.600658+00	
00000000-0000-0000-0000-000000000000	c6eaa229-3e01-4c04-8afb-4e4feba28dd1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 19:41:51.235611+00	
00000000-0000-0000-0000-000000000000	f9077b05-83ed-4242-acde-7d3dc8275a55	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 19:41:51.256736+00	
00000000-0000-0000-0000-000000000000	890043e4-c340-48a5-85dc-502208a29f03	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 19:41:53.899805+00	
00000000-0000-0000-0000-000000000000	f0cdc2e5-5228-4e04-a93a-eaba7e6ac514	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 19:41:53.903532+00	
00000000-0000-0000-0000-000000000000	67fcc45b-5186-46bf-b1b0-fd4a6f132008	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-29 22:03:21.046355+00	
00000000-0000-0000-0000-000000000000	53f36467-27a4-485d-9d6f-b3811742b76c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-29 22:28:14.34346+00	
00000000-0000-0000-0000-000000000000	cb3854ac-3c45-4cac-bc91-a4e3e917d8a8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-29 23:02:56.694639+00	
00000000-0000-0000-0000-000000000000	2e387c30-e122-4984-8a4e-738715aff393	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-29 23:31:21.293813+00	
00000000-0000-0000-0000-000000000000	e360e38e-36fa-47f1-b817-3e2f41f98c3d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-29 23:41:02.409081+00	
00000000-0000-0000-0000-000000000000	042383e3-4307-456e-bfb9-542075fef843	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 01:07:24.5208+00	
00000000-0000-0000-0000-000000000000	ed3686ea-7ce3-4d7f-a5e2-de6727133242	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 01:07:24.533864+00	
00000000-0000-0000-0000-000000000000	51ebafb0-d2eb-44e3-bfb3-a512ba6e9d71	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-30 01:45:26.706256+00	
00000000-0000-0000-0000-000000000000	c88f7f6b-783d-4001-837c-434ddeb455a6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-30 02:19:06.232443+00	
00000000-0000-0000-0000-000000000000	198b203e-e7b9-4269-9b04-81e009101036	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-30 02:29:31.764788+00	
00000000-0000-0000-0000-000000000000	e9c10c9a-bdab-45b9-bf6a-8feba5e64025	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-30 02:35:05.810326+00	
00000000-0000-0000-0000-000000000000	281b6575-dc2b-4d90-a21c-1142ac2250e3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-30 02:45:18.221314+00	
00000000-0000-0000-0000-000000000000	09a4e0ab-d890-46a9-bdba-1c867f335e50	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 11:35:04.207676+00	
00000000-0000-0000-0000-000000000000	ec70fd92-e9e2-4ba7-9f97-87952567e8d7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 13:20:32.137598+00	
00000000-0000-0000-0000-000000000000	c561b2ca-8b34-4c25-8fac-6f4d525a4972	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 13:21:14.184262+00	
00000000-0000-0000-0000-000000000000	1db76333-cd05-4cbb-aa1a-bbc168c44915	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 13:50:05.569985+00	
00000000-0000-0000-0000-000000000000	4935241a-0bc8-44ef-a2c7-36aa73dcb50d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 13:50:37.383249+00	
00000000-0000-0000-0000-000000000000	9a348e3a-5b43-4fce-adc0-43b0e29ab40e	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 14:00:52.985781+00	
00000000-0000-0000-0000-000000000000	39a80aa9-dd39-44bd-82ca-481ee788f090	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 14:43:18.735823+00	
00000000-0000-0000-0000-000000000000	f5f81b1a-d9d6-4a69-b4fb-e99a216cdc58	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 15:00:42.66622+00	
00000000-0000-0000-0000-000000000000	15dc4b58-1a20-4ac4-b057-0dbb9e5e5a82	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 15:00:42.674514+00	
00000000-0000-0000-0000-000000000000	8b48b3ae-10af-49d7-b288-8716cda165d8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:01:09.892569+00	
00000000-0000-0000-0000-000000000000	ae50607c-da4b-475d-adfc-153b4922169c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:02:08.277268+00	
00000000-0000-0000-0000-000000000000	eaaa6265-9ad3-4379-a770-38f684b87c25	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:05:16.790284+00	
00000000-0000-0000-0000-000000000000	2c0d16dd-d689-402a-ab79-49e26effb3ab	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:20:25.764213+00	
00000000-0000-0000-0000-000000000000	6e819592-14c4-4397-a56f-d454109dae5d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:26:42.051553+00	
00000000-0000-0000-0000-000000000000	672aa440-4742-4c42-8abb-1cbde978b6aa	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:42:47.043291+00	
00000000-0000-0000-0000-000000000000	f41b1351-28d9-45ba-8b0a-2a035ad83c40	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:52:27.800109+00	
00000000-0000-0000-0000-000000000000	5c3419a1-4089-4a20-9676-fbbd03e7349b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 15:58:55.197038+00	
00000000-0000-0000-0000-000000000000	7c688e5f-02fb-400f-a78f-d0cce9f8e8cf	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:02:44.476246+00	
00000000-0000-0000-0000-000000000000	9d2aecc6-4ded-40e1-8380-7ce803058d63	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:11:20.992227+00	
00000000-0000-0000-0000-000000000000	9e4d9ee4-83fb-4653-94b6-cef6e9db795a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:19:30.865574+00	
00000000-0000-0000-0000-000000000000	0e63e841-683f-4f61-ae67-7083fad72067	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:25:23.364555+00	
00000000-0000-0000-0000-000000000000	4e5dfe16-aee4-4245-bf9b-d56fbbda90a8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:33:14.249861+00	
00000000-0000-0000-0000-000000000000	981b5134-8496-4d34-89e0-14c11e239476	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:38:02.696008+00	
00000000-0000-0000-0000-000000000000	1460cea6-6ae2-4775-a379-2e73b4fccf69	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 16:45:18.159184+00	
00000000-0000-0000-0000-000000000000	ce0135b8-e4e0-49d8-9d6c-e89874ce2ab6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:00:32.094648+00	
00000000-0000-0000-0000-000000000000	7fcf8b07-3239-4288-be90-172ca84bd961	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:14:31.896232+00	
00000000-0000-0000-0000-000000000000	12bee2ea-d4e5-47be-846e-921e333d6677	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:39:12.143534+00	
00000000-0000-0000-0000-000000000000	22f0385e-245f-4072-9f0e-8aa00334d98f	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:48:04.789395+00	
00000000-0000-0000-0000-000000000000	78296c97-402a-47e9-92dd-0ccdfaf2a5ba	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:48:21.374872+00	
00000000-0000-0000-0000-000000000000	54d10866-cff7-43f0-a8de-2fa9344b6a51	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 17:59:53.228138+00	
00000000-0000-0000-0000-000000000000	67bcad52-7375-4c25-ba25-06260ca98ae1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 18:07:59.205083+00	
00000000-0000-0000-0000-000000000000	a8a31c24-239e-4657-867e-8f18c6dddc48	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 18:08:07.929398+00	
00000000-0000-0000-0000-000000000000	bc812a49-64df-4235-80b1-f9a584940af6	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 18:11:27.12847+00	
00000000-0000-0000-0000-000000000000	5ae4b6d4-4303-42d9-81e6-7343015c8762	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 18:12:48.367257+00	
00000000-0000-0000-0000-000000000000	62e11034-db3a-422f-91ce-f677c5bfe233	{"action":"login","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 18:19:18.11712+00	
00000000-0000-0000-0000-000000000000	dc7be8bc-353e-4b86-9153-0c64e7b91c06	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 18:49:35.873446+00	
00000000-0000-0000-0000-000000000000	99742b5b-6f7c-4831-9f61-053f6eaea4dd	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 18:49:35.886952+00	
00000000-0000-0000-0000-000000000000	32db8a23-9693-4f3c-b4a3-0e60adb37867	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 19:11:10.60784+00	
00000000-0000-0000-0000-000000000000	54fc3b9d-4a9f-4488-aafa-c4993af72021	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 19:11:10.620632+00	
00000000-0000-0000-0000-000000000000	22321d1b-6e78-4e5d-b63e-72edb71d8d51	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 19:12:59.550146+00	
00000000-0000-0000-0000-000000000000	0fe309a2-2e0f-417f-8904-9bfe44bfadc2	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 19:12:59.552444+00	
00000000-0000-0000-0000-000000000000	6f148e0c-9042-4a14-8943-a19d4a483576	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-10-31 19:19:04.404894+00	
00000000-0000-0000-0000-000000000000	94170949-c82a-4b95-aee9-b357fd98a303	{"action":"login","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-01 14:05:25.93916+00	
00000000-0000-0000-0000-000000000000	c28fa3ae-c4e3-48a7-af3e-a76786d1ddba	{"action":"login","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-01 14:11:31.848842+00	
00000000-0000-0000-0000-000000000000	89fbce25-b2e5-4961-9491-20a5b8a5933d	{"action":"logout","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-01 14:11:52.894962+00	
00000000-0000-0000-0000-000000000000	c6362d96-f381-43c2-96d6-e32f7949d610	{"action":"login","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-01 14:12:52.688771+00	
00000000-0000-0000-0000-000000000000	0c220a5d-6f6a-449f-bbc2-02c3641ea7ac	{"action":"token_refreshed","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 15:11:00.239281+00	
00000000-0000-0000-0000-000000000000	7ba1aa47-361e-4fca-abf5-1e5dc0e0f4c4	{"action":"token_revoked","actor_id":"c03591f7-1edf-412b-bcc6-89124e6ff1c9","actor_name":"Enrique Barbeito","actor_username":"barbeito.enrique@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-01 15:11:00.25846+00	
00000000-0000-0000-0000-000000000000	3743f0d1-5389-4306-a089-6becbc78b63f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-01 19:59:51.051245+00	
00000000-0000-0000-0000-000000000000	b6c53f38-11f9-4468-be68-e7a186a25303	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-01 20:00:32.250288+00	
00000000-0000-0000-0000-000000000000	04f81794-6e2e-4081-8cb8-2bdeca360dae	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-02 17:23:19.736563+00	
00000000-0000-0000-0000-000000000000	f00d7261-7f47-4cab-9809-327acc7ad304	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-02 17:23:19.769466+00	
00000000-0000-0000-0000-000000000000	aaec8e97-0100-4a6a-b116-93e8be8c917b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 17:23:38.521963+00	
00000000-0000-0000-0000-000000000000	74dca6a8-56d3-4e2b-8396-137d34150479	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 17:44:13.485266+00	
00000000-0000-0000-0000-000000000000	1f08f56f-fb08-45bc-8aab-a116671811d1	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-02 18:44:45.715978+00	
00000000-0000-0000-0000-000000000000	a2aa4f19-2235-4fcb-adbf-c0483e3feb54	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-02 18:44:45.743787+00	
00000000-0000-0000-0000-000000000000	87e636fd-1c54-455c-86a7-5c600bb2272a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 18:45:15.541001+00	
00000000-0000-0000-0000-000000000000	2d385a56-c0f9-4981-a8a5-5aa23a102e3a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 19:09:55.641967+00	
00000000-0000-0000-0000-000000000000	a076f17e-2733-47bd-b4d4-8171b3171b6f	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 19:18:29.15555+00	
00000000-0000-0000-0000-000000000000	24effef8-3479-46ce-9625-d97405aa0d06	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 19:26:04.424585+00	
00000000-0000-0000-0000-000000000000	78438fb1-6a8d-47f7-938a-30a8572617d9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 19:52:47.093904+00	
00000000-0000-0000-0000-000000000000	8b98a74d-2843-4b8b-b7ee-ca8774e835b6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 20:04:25.328973+00	
00000000-0000-0000-0000-000000000000	67e46a12-4f6a-48e3-b0cc-5617f413aa82	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 20:18:32.711277+00	
00000000-0000-0000-0000-000000000000	4f211c5a-c394-46de-9d07-5ee1f9856cfe	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 22:48:22.545888+00	
00000000-0000-0000-0000-000000000000	b5fb4aad-6123-41a9-b296-9a52e4981a26	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 23:03:28.245445+00	
00000000-0000-0000-0000-000000000000	90665279-fa9f-4ab9-aa97-97cea747ae08	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 23:20:46.863122+00	
00000000-0000-0000-0000-000000000000	05414c08-bdc7-4350-95f9-83390a4e4cb9	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-02 23:53:40.881866+00	
00000000-0000-0000-0000-000000000000	2b91b15f-55a0-4d9e-9ed4-0a99d973a596	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 00:04:26.756898+00	
00000000-0000-0000-0000-000000000000	e503fb6c-577a-42dc-a1a4-c3cbb3425c70	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 02:06:38.688595+00	
00000000-0000-0000-0000-000000000000	b5d9f5e6-b77b-4326-be37-4f67f5d21cb7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 02:13:56.036263+00	
00000000-0000-0000-0000-000000000000	772b42ac-235e-4e95-809f-fae1cf7c1047	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 02:47:39.902267+00	
00000000-0000-0000-0000-000000000000	6aa8e25a-0549-450e-90e6-4fe8f7e83a64	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 02:51:18.531918+00	
00000000-0000-0000-0000-000000000000	ac1c702b-f20c-4563-ab0d-f5edfbea9bc1	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 02:58:38.345616+00	
00000000-0000-0000-0000-000000000000	162fe3d2-7d83-4d83-9f08-5660e0bcd68d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 03:11:44.192358+00	
00000000-0000-0000-0000-000000000000	6f491a90-a88e-41e3-812a-fc2ea4b9373c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 03:18:05.857046+00	
00000000-0000-0000-0000-000000000000	a35be51d-b44a-437e-acbc-d4eac12958d3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 03:26:32.496959+00	
00000000-0000-0000-0000-000000000000	35e41c0d-752e-4233-b2b9-948b805b0405	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 03:32:22.760871+00	
00000000-0000-0000-0000-000000000000	862bcddf-2032-4b4b-bb72-fec391dfcc03	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 11:47:21.745285+00	
00000000-0000-0000-0000-000000000000	07248fd2-d78c-48dd-9b07-f0b19584ee24	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 11:47:21.762046+00	
00000000-0000-0000-0000-000000000000	6f8b48ea-f6c7-40bf-987a-2ceab62b4f7d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 11:47:43.521584+00	
00000000-0000-0000-0000-000000000000	e8e19f0f-3f02-4286-b616-1f0fdc34135d	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 12:54:30.955122+00	
00000000-0000-0000-0000-000000000000	be2b011e-b876-49a1-95b6-d00c5a2378aa	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 12:54:30.980713+00	
00000000-0000-0000-0000-000000000000	4f382e12-7285-41c2-8e26-79b88b0454a6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 12:57:32.044782+00	
00000000-0000-0000-0000-000000000000	99a5e0d0-bcf1-41e4-93e7-1de859e466c8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 13:30:14.183442+00	
00000000-0000-0000-0000-000000000000	146ef9e5-0337-40ef-99fe-c63ffd1019dc	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 13:36:15.723536+00	
00000000-0000-0000-0000-000000000000	1d5692c6-6193-43b8-a6d6-99e35250ae91	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 13:59:19.85794+00	
00000000-0000-0000-0000-000000000000	8adb7c2d-19a7-413d-9ce1-41f74247d9ff	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 14:14:55.721687+00	
00000000-0000-0000-0000-000000000000	4409e4a9-3c91-4329-9294-8346b2a09a7b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 14:55:30.11641+00	
00000000-0000-0000-0000-000000000000	27cb94ef-535c-4e95-9dd2-fa2a876c086d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 15:05:28.308915+00	
00000000-0000-0000-0000-000000000000	b8d26a99-01eb-46bc-a999-0b762629b17b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 15:12:55.345327+00	
00000000-0000-0000-0000-000000000000	91c82ec0-5204-43a2-98dc-dcd9d06dbeec	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 16:13:03.326513+00	
00000000-0000-0000-0000-000000000000	2ca20a5a-78f6-415f-b170-dac9008fd68a	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 16:13:03.337116+00	
00000000-0000-0000-0000-000000000000	77d35330-82d1-4e00-a5fe-5fff1ef16963	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 16:13:39.682526+00	
00000000-0000-0000-0000-000000000000	5c985707-1b2e-4cc2-8a9c-e69bbab52770	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 16:19:03.282031+00	
00000000-0000-0000-0000-000000000000	e9579ff5-a1b1-4a32-a39a-8d78da980781	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 16:38:10.016906+00	
00000000-0000-0000-0000-000000000000	d2c30d90-985b-4b86-86f1-60913656828a	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 16:47:33.842705+00	
00000000-0000-0000-0000-000000000000	54db539a-fe02-474e-a34d-28a83cf3de20	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 16:49:44.210659+00	
00000000-0000-0000-0000-000000000000	8cc5e772-c850-451e-8ee3-7864d0438847	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 16:49:44.22185+00	
00000000-0000-0000-0000-000000000000	3917a078-70ed-4aa5-aa1f-a21e368d69dd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 16:53:23.711706+00	
00000000-0000-0000-0000-000000000000	79e4183b-9ccc-4b11-ba56-4d4fccb1bb3e	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 17:05:35.584097+00	
00000000-0000-0000-0000-000000000000	e2f18ddf-2a3c-4e31-b89e-a455d4965521	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 17:15:43.942595+00	
00000000-0000-0000-0000-000000000000	7e52ccf3-6728-46fd-a2b3-58c22007fc72	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 17:22:53.833339+00	
00000000-0000-0000-0000-000000000000	b21a3ba3-14ef-4366-a342-e40c8c4e8245	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 17:33:08.0827+00	
00000000-0000-0000-0000-000000000000	8aa91777-5947-4ffb-9862-e71218539663	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 17:55:49.79515+00	
00000000-0000-0000-0000-000000000000	113b0943-13b5-4206-82a4-bcd2d8bf4f98	{"action":"token_refreshed","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 17:59:08.608974+00	
00000000-0000-0000-0000-000000000000	dea5bb82-d693-42b2-acc8-bea649632af5	{"action":"token_revoked","actor_id":"0cd44ec8-1243-41c3-baea-e61dc19de624","actor_name":"conrado muriñigo","actor_username":"conra.iturria@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 17:59:08.617793+00	
00000000-0000-0000-0000-000000000000	8077c8d9-fdc4-45d0-a1f5-d27c413ea180	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 18:08:09.454059+00	
00000000-0000-0000-0000-000000000000	7b12b3f4-64e8-4e7c-9815-03dd03d697bd	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 18:28:09.551928+00	
00000000-0000-0000-0000-000000000000	de43eed2-a512-4e63-9845-c0e991c56de6	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 18:40:25.199572+00	
00000000-0000-0000-0000-000000000000	2e83b638-8fbb-4ee1-8f1b-efdb7175f526	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 19:10:34.848479+00	
00000000-0000-0000-0000-000000000000	7b47b5fa-ca87-473a-8ad3-e9df91c9d16e	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-03 19:10:34.87069+00	
00000000-0000-0000-0000-000000000000	6b82d457-55af-4c85-afc7-572f18f195ec	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-03 21:27:49.046016+00	
00000000-0000-0000-0000-000000000000	80171e00-b0d9-4403-94be-e36502a0d2cf	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 02:31:52.80473+00	
00000000-0000-0000-0000-000000000000	65e4488f-d5a8-4f41-93e9-18e49dbb45fa	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 02:31:52.835619+00	
00000000-0000-0000-0000-000000000000	b40c9fc4-d0d8-4d42-96a2-7fa91b4e2ada	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 02:32:51.820471+00	
00000000-0000-0000-0000-000000000000	ff7d8608-84aa-498c-a0c0-3d3e1f80a12b	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 03:01:44.469865+00	
00000000-0000-0000-0000-000000000000	f5fde79d-5923-47c5-b9c3-0b297d347d62	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 03:08:07.701408+00	
00000000-0000-0000-0000-000000000000	4b1b0f9b-a82f-433f-a501-afdb91a29c55	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 11:06:58.158774+00	
00000000-0000-0000-0000-000000000000	4a068b4a-e497-4c7c-8d71-9227e94705d2	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 11:06:58.192019+00	
00000000-0000-0000-0000-000000000000	64a86b83-1290-466e-afc6-012d94cb37bf	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 11:57:23.563418+00	
00000000-0000-0000-0000-000000000000	5fc3cf83-9103-4687-af49-d6635cce93af	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 11:57:23.58111+00	
00000000-0000-0000-0000-000000000000	c91a83fa-3b6d-4897-9526-ca68af5af8dd	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 15:02:17.040518+00	
00000000-0000-0000-0000-000000000000	2cdf0fbd-fbfe-4371-b52c-e99632d840c7	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 15:02:17.070496+00	
00000000-0000-0000-0000-000000000000	5830da99-13b9-48ea-8f1e-e3f17bc5a23c	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 15:39:41.13143+00	
00000000-0000-0000-0000-000000000000	1c2ab738-3b88-4fc9-b2c8-6c3a6b1656ab	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 15:39:41.147807+00	
00000000-0000-0000-0000-000000000000	2ba733dc-1da9-439b-9548-c747c457454c	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 15:39:45.094397+00	
00000000-0000-0000-0000-000000000000	ddbdbae3-c3a2-426b-abc8-2e52cb3cbcb0	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 15:41:55.97052+00	
00000000-0000-0000-0000-000000000000	dc70e115-5002-44f7-ba92-cfe41bd0b93d	{"action":"user_signedup","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-11-04 15:51:50.985868+00	
00000000-0000-0000-0000-000000000000	5927e277-11af-4b3e-b035-ea20a6053c9f	{"action":"login","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 15:51:56.516222+00	
00000000-0000-0000-0000-000000000000	974b5b85-c437-400f-80ec-ef4a58caa6f2	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:03:10.397376+00	
00000000-0000-0000-0000-000000000000	6559fb42-8711-4e23-8711-c72799972512	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:06:10.138902+00	
00000000-0000-0000-0000-000000000000	9add5d12-ec4d-4190-8049-7892972bdfe7	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:06:15.002963+00	
00000000-0000-0000-0000-000000000000	7026583a-872e-4976-ae40-19c1afc4de41	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:06:20.99957+00	
00000000-0000-0000-0000-000000000000	880e8701-9732-4b0f-a72b-d5dd58ac86c3	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:06:27.610436+00	
00000000-0000-0000-0000-000000000000	3d6cb196-80b7-4ec7-9114-bba35bb75c69	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:06:31.179713+00	
00000000-0000-0000-0000-000000000000	7ac998d0-b1d7-4ff5-816b-b646bcac7c44	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:06:49.015766+00	
00000000-0000-0000-0000-000000000000	8542d8e0-8e80-4f30-8cc3-d0def209b7be	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 16:06:57.549613+00	
00000000-0000-0000-0000-000000000000	abb28ac8-dfad-4105-8738-2efe89f4baa5	{"action":"login","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:09:43.492812+00	
00000000-0000-0000-0000-000000000000	89f62faa-b76c-46f1-9592-4b13bc3360c8	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:16:40.486794+00	
00000000-0000-0000-0000-000000000000	91cc822d-40f3-4831-9525-a6d468e4178d	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 16:19:10.639351+00	
00000000-0000-0000-0000-000000000000	3e41af78-fd2d-4f19-b304-43432d3e5b8a	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 17:18:49.797323+00	
00000000-0000-0000-0000-000000000000	eb6d9e6e-7843-47cc-85e8-23d4e01a04a3	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 17:18:49.82001+00	
00000000-0000-0000-0000-000000000000	35ba94c0-9ca1-4b45-af9f-fb5d4347b081	{"action":"token_refreshed","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 17:32:39.327529+00	
00000000-0000-0000-0000-000000000000	faaf1492-af55-458e-a321-05c291203436	{"action":"token_revoked","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 17:32:39.337314+00	
00000000-0000-0000-0000-000000000000	2335d041-6da3-4c2a-884b-1fb9e7a3f4d0	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 18:17:15.335426+00	
00000000-0000-0000-0000-000000000000	85353f17-9fad-4fff-935c-5330ea0ae93b	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 18:17:15.358033+00	
00000000-0000-0000-0000-000000000000	4adf0f0f-80c6-44df-99e9-1b68b3fef76d	{"action":"logout","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-04 18:19:31.607521+00	
00000000-0000-0000-0000-000000000000	103f28fb-ab5b-453a-8251-a5a6315301be	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 18:19:37.336934+00	
00000000-0000-0000-0000-000000000000	ad1d7a26-4344-4851-9014-b34b851e676a	{"action":"token_refreshed","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 18:19:55.340482+00	
00000000-0000-0000-0000-000000000000	d181c70c-231a-4cbc-be14-aa2aa87a5be8	{"action":"token_revoked","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 18:19:55.342703+00	
00000000-0000-0000-0000-000000000000	4fe941ef-ba12-4034-acb1-faa1c201c8b2	{"action":"login","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 18:19:58.93137+00	
00000000-0000-0000-0000-000000000000	efd681c9-b88b-4dc4-ae8e-a034efdb46cd	{"action":"token_refreshed","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 19:03:42.791954+00	
00000000-0000-0000-0000-000000000000	80121f25-4b9a-4f87-ae52-67e2569b8916	{"action":"token_revoked","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-04 19:03:42.805988+00	
00000000-0000-0000-0000-000000000000	e1811387-b223-488d-989b-96eb21794b6a	{"action":"login","actor_id":"8874606b-f5c7-41cb-83b0-93cb368e5f9e","actor_name":"Conrado Muriñigo","actor_username":"comprasalimentia@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:05:30.619051+00	
00000000-0000-0000-0000-000000000000	39180171-ce5b-4e90-a94c-f4022543b91c	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:07:05.171623+00	
00000000-0000-0000-0000-000000000000	9374ef44-589b-4432-b9a6-e028e884ce64	{"action":"user_signedup","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}	2025-11-04 19:11:40.383076+00	
00000000-0000-0000-0000-000000000000	f4dee640-87b9-456a-a262-8edde830848c	{"action":"login","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:11:57.915969+00	
00000000-0000-0000-0000-000000000000	e5a9e243-9879-45b3-be1d-045c2aab77ce	{"action":"login","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:13:15.235865+00	
00000000-0000-0000-0000-000000000000	34b3a301-c507-44e2-acae-f2eb87fbb894	{"action":"login","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:18:00.01147+00	
00000000-0000-0000-0000-000000000000	aba5fa8d-203c-48db-9887-a2b2ed567b1a	{"action":"login","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:19:55.799573+00	
00000000-0000-0000-0000-000000000000	246f2874-6ae9-4a29-ae79-d550784aa901	{"action":"login","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:31:12.760856+00	
00000000-0000-0000-0000-000000000000	d953ddbc-9056-47be-aa7e-6e528bbaa17b	{"action":"login","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}	2025-11-04 19:32:17.372069+00	
00000000-0000-0000-0000-000000000000	f9c103f8-129c-440f-bf9a-e634c062bab3	{"action":"token_refreshed","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 00:56:53.389184+00	
00000000-0000-0000-0000-000000000000	bfd3d56f-1235-4fb9-9271-5494df8bae6e	{"action":"token_revoked","actor_id":"bab1e667-f842-4ebc-9f5f-6039ebd1d526","actor_name":"Erika Valker","actor_username":"erikabiosplus@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 00:56:53.429079+00	
00000000-0000-0000-0000-000000000000	7e0799f1-d0e6-44df-b9b4-48c98e486633	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 12:33:48.924129+00	
00000000-0000-0000-0000-000000000000	b7e280cb-d5e2-4c07-8e56-118d16f6cbed	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 12:33:48.954026+00	
00000000-0000-0000-0000-000000000000	9767b858-ecc8-4e1a-bf20-90847decbef4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 14:31:38.986842+00	
00000000-0000-0000-0000-000000000000	99b04a1d-df17-4b62-bfdf-67c115d14cb6	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 14:31:39.001548+00	
00000000-0000-0000-0000-000000000000	e9d161a6-c0c6-4c1e-85fa-f265c379f7b4	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 15:56:51.796597+00	
00000000-0000-0000-0000-000000000000	96b2cc5c-bada-4cbb-9017-941f3a5893d5	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 15:56:51.805278+00	
00000000-0000-0000-0000-000000000000	7c67e22b-0e93-45a2-9a94-17442740eb69	{"action":"token_refreshed","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 17:12:11.62646+00	
00000000-0000-0000-0000-000000000000	c6e66258-e2c1-4ca1-a5dc-a2bbc3b5bc5f	{"action":"token_revoked","actor_id":"c145694f-77b3-4baf-90c0-c7ebeee69cd6","actor_name":"Hernan Maldacena","actor_username":"maldacenah@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-05 17:12:11.630272+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	c145694f-77b3-4baf-90c0-c7ebeee69cd6	authenticated	authenticated	maldacenah@gmail.com	$2a$10$PtxRUEcVl6F4dy2jbBaNGOhxJnkYSE2lVa9tIOqGMahg/NAeOcimK	2025-08-20 16:09:04.283652+00	\N		\N		\N			\N	2025-11-04 19:18:00.018306+00	{"provider": "email", "providers": ["email", "google"]}	{"iss": "https://accounts.google.com", "sub": "111382764234567824199", "name": "Hernan Maldacena", "email": "maldacenah@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJvrrFfVamdAIkeAnMzWGbWG68l4zNd1J_kn-6L3rMN0_rqBiNS=s96-c", "full_name": "Hernan Maldacena", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJvrrFfVamdAIkeAnMzWGbWG68l4zNd1J_kn-6L3rMN0_rqBiNS=s96-c", "provider_id": "111382764234567824199", "email_verified": true, "phone_verified": false}	\N	2025-08-20 16:09:04.250116+00	2025-11-05 17:12:11.633245+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	bab1e667-f842-4ebc-9f5f-6039ebd1d526	authenticated	authenticated	erikabiosplus@gmail.com	\N	2025-11-04 19:11:40.38591+00	\N		\N		\N			\N	2025-11-04 19:32:17.373035+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "101492105146570045972", "name": "Erika Valker", "email": "erikabiosplus@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKuGVIWak-rqSbWTOvcJ-AK-0b5lN8l_gccFk427ENx47K2zg=s96-c", "full_name": "Erika Valker", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKuGVIWak-rqSbWTOvcJ-AK-0b5lN8l_gccFk427ENx47K2zg=s96-c", "provider_id": "101492105146570045972", "email_verified": true, "phone_verified": false}	\N	2025-11-04 19:11:40.314176+00	2025-11-05 00:56:53.480207+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c39967c6-cf8a-4546-a65d-168e43b4b1c3	authenticated	authenticated	ventasbiosplus@gmail.com	\N	2025-09-15 20:21:29.564837+00	\N		\N		\N			\N	2025-10-24 15:23:41.517187+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "117701502142552763977", "name": "Biosplus", "email": "ventasbiosplus@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIbBQUpEUdhwguMQA3jdwxGbkoum-3-V_oC817uytQEPg2YPQ=s96-c", "full_name": "Biosplus", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIbBQUpEUdhwguMQA3jdwxGbkoum-3-V_oC817uytQEPg2YPQ=s96-c", "provider_id": "117701502142552763977", "email_verified": true, "phone_verified": false}	\N	2025-09-15 20:21:29.521837+00	2025-10-24 17:52:48.83876+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	0cd44ec8-1243-41c3-baea-e61dc19de624	authenticated	authenticated	conra.iturria@gmail.com	\N	2025-09-05 12:23:59.055139+00	\N		\N		\N			\N	2025-10-31 18:19:18.118232+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "112257359390952518035", "name": "conrado muriñigo", "email": "conra.iturria@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL-G4bH9xLtxzqoPn_7UZ8KnWTRFJoUdkgkON66_T10ZxIyO-w=s96-c", "full_name": "conrado muriñigo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL-G4bH9xLtxzqoPn_7UZ8KnWTRFJoUdkgkON66_T10ZxIyO-w=s96-c", "provider_id": "112257359390952518035", "email_verified": true, "phone_verified": false}	\N	2025-09-05 12:23:59.044602+00	2025-11-03 17:59:08.626929+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e7b46826-8126-47da-a3ea-ed10eb69d068	authenticated	authenticated	isilvamontaner02@gmail.com	\N	2025-09-05 12:21:43.465969+00	\N		\N		\N			\N	2025-09-16 14:25:10.633121+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "113489521668621096009", "name": "Ignacio silva montaner", "email": "isilvamontaner02@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJpK0_fied58gHadvIdiMWrAlVpmiQ_lQpJgu5XNuEe50StfQ=s96-c", "full_name": "Ignacio silva montaner", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJpK0_fied58gHadvIdiMWrAlVpmiQ_lQpJgu5XNuEe50StfQ=s96-c", "provider_id": "113489521668621096009", "email_verified": true, "phone_verified": false}	\N	2025-09-05 12:21:43.433911+00	2025-09-16 19:04:39.142891+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b6037848-7408-4c5e-b8e5-9a4bb378f9ac	authenticated	authenticated	eurdinez@gmail.com	$2a$10$yXKRJlxSrmq2viZfoeFj4epPChfLsHSPTUHLPIVPTua7vAl2ELk3u	2025-09-16 14:23:52.476986+00	\N		\N		\N			\N	2025-10-13 15:54:29.462384+00	{"provider": "email", "providers": ["email", "google"]}	{"iss": "https://accounts.google.com", "sub": "107029139057089043842", "name": "Ezequiel Urdinez", "email": "eurdinez@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJiQZbJ8Uzsl99PnbvAv-JPqGbkYFD1ZaGHOKYWVl6I1xaUIA=s96-c", "full_name": "Ezequiel Urdinez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJiQZbJ8Uzsl99PnbvAv-JPqGbkYFD1ZaGHOKYWVl6I1xaUIA=s96-c", "provider_id": "107029139057089043842", "email_verified": true, "phone_verified": false}	\N	2025-09-16 14:23:52.422324+00	2025-10-13 15:54:29.463975+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	0a3c12de-5dbc-4ff7-83ae-7de315b392f3	authenticated	authenticated	alejandroschipani@gmail.com	\N	2025-09-18 18:26:50.19029+00	\N		\N		\N			\N	2025-09-18 18:52:03.624567+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "106198379571261967391", "name": "Alejandro Schipani", "email": "alejandroschipani@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIOWsV873dudRosfU67cNcbeFG8R4S68elkPO1ZN66JKzSSg3UR=s96-c", "full_name": "Alejandro Schipani", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIOWsV873dudRosfU67cNcbeFG8R4S68elkPO1ZN66JKzSSg3UR=s96-c", "provider_id": "106198379571261967391", "email_verified": true, "phone_verified": false}	\N	2025-09-18 18:26:50.140874+00	2025-09-18 18:52:03.635229+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5e803c44-a3c6-430d-9ae1-7a025651555e	authenticated	authenticated	gemini.dev.assistant.g@gmail.com	$2a$10$7r7LFaN62AHsDoRd6pwzh.tMeQk2L.dmpf0iY.seeexs2M2JPz7lW	2025-09-24 16:10:12.277344+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-09-24 16:10:12.247492+00	2025-09-24 16:10:12.278895+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	485fd993-8102-472e-94d4-803e80bc4d9a	authenticated	authenticated	egb.labot@gmail.com	\N	2025-09-20 15:08:34.571988+00	\N		\N		\N			\N	2025-09-25 21:01:56.23681+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "117801483302801995779", "name": "Enrique Gabriel", "email": "egb.labot@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIleaNhKGj35T1cCE77_rYguPoINZrtK1P1KCK_YA6NkgTcYw=s96-c", "full_name": "Enrique Gabriel", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIleaNhKGj35T1cCE77_rYguPoINZrtK1P1KCK_YA6NkgTcYw=s96-c", "provider_id": "117801483302801995779", "email_verified": true, "phone_verified": false}	\N	2025-09-20 15:08:34.533265+00	2025-09-25 21:01:56.239424+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	fcd336ee-71b2-4cc9-8573-bab798216501	authenticated	authenticated	ipemercadoshop@gmail.com	\N	2025-10-05 21:47:29.639856+00	\N		\N		\N			\N	2025-10-24 17:53:11.356288+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "105817740735545276022", "name": "IPE Shop", "email": "ipemercadoshop@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocI4RQzY3rW6WULvy38UmjYkUcMIgKOcoa0073upU5v1BpJsJw=s96-c", "full_name": "IPE Shop", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocI4RQzY3rW6WULvy38UmjYkUcMIgKOcoa0073upU5v1BpJsJw=s96-c", "provider_id": "105817740735545276022", "email_verified": true, "phone_verified": false}	\N	2025-10-05 21:47:29.600495+00	2025-10-26 20:13:17.228932+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c03591f7-1edf-412b-bcc6-89124e6ff1c9	authenticated	authenticated	barbeito.enrique@gmail.com	\N	2025-10-12 16:20:36.855207+00	\N		\N		\N			\N	2025-11-01 14:12:52.689404+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "110885869741311039519", "name": "Enrique Barbeito", "email": "barbeito.enrique@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIpL9Y5AWtIaUzQamVPJuB6_FWI4-FLelWc285OodXTI14JRdq0=s96-c", "full_name": "Enrique Barbeito", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIpL9Y5AWtIaUzQamVPJuB6_FWI4-FLelWc285OodXTI14JRdq0=s96-c", "provider_id": "110885869741311039519", "email_verified": true, "phone_verified": false}	\N	2025-10-12 16:20:36.66537+00	2025-11-01 15:11:00.279456+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b8d511d8-60c5-4e45-85d6-84382495eadd	authenticated	authenticated	yoreparolomas@gmail.com	$2a$10$DNZ9sM6iEpIZkJ9IkAHZtORgB1sGVCxlHoWDwn60V1D8ZVTRKvcpu	2025-10-20 15:00:00.298775+00	\N		2025-10-20 14:59:03.532007+00		\N			\N	2025-10-24 15:23:34.287781+00	{"provider": "email", "providers": ["email"]}	{"sub": "b8d511d8-60c5-4e45-85d6-84382495eadd", "email": "yoreparolomas@gmail.com", "full_name": "Pepe mujica", "email_verified": true, "phone_verified": false}	\N	2025-10-20 14:59:03.480329+00	2025-10-24 15:23:34.303148+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	8874606b-f5c7-41cb-83b0-93cb368e5f9e	authenticated	authenticated	comprasalimentia@gmail.com	\N	2025-11-04 15:51:50.987653+00	\N		\N		\N			\N	2025-11-04 19:05:30.621946+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "117903218784386531975", "name": "Conrado Muriñigo", "email": "comprasalimentia@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL_m2tlqslKn6ot1Xve2OXMzHRC32wb2SQVpKWzU0o3MM7c7Q=s96-c", "full_name": "Conrado Muriñigo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL_m2tlqslKn6ot1Xve2OXMzHRC32wb2SQVpKWzU0o3MM7c7Q=s96-c", "provider_id": "117903218784386531975", "email_verified": true, "phone_verified": false}	\N	2025-11-04 15:51:50.936178+00	2025-11-04 19:05:30.636956+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
c145694f-77b3-4baf-90c0-c7ebeee69cd6	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{"sub": "c145694f-77b3-4baf-90c0-c7ebeee69cd6", "email": "maldacenah@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-08-20 16:09:04.265385+00	2025-08-20 16:09:04.265459+00	2025-08-20 16:09:04.265459+00	3ebd2d5c-04dc-4aca-8561-b54bcdde3394
106198379571261967391	0a3c12de-5dbc-4ff7-83ae-7de315b392f3	{"iss": "https://accounts.google.com", "sub": "106198379571261967391", "name": "Alejandro Schipani", "email": "alejandroschipani@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIOWsV873dudRosfU67cNcbeFG8R4S68elkPO1ZN66JKzSSg3UR=s96-c", "full_name": "Alejandro Schipani", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIOWsV873dudRosfU67cNcbeFG8R4S68elkPO1ZN66JKzSSg3UR=s96-c", "provider_id": "106198379571261967391", "email_verified": true, "phone_verified": false}	google	2025-09-18 18:26:50.178718+00	2025-09-18 18:26:50.179257+00	2025-09-18 18:52:03.620036+00	c6b3bb30-3dba-4def-8862-1bd2e80dddd5
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	b6037848-7408-4c5e-b8e5-9a4bb378f9ac	{"sub": "b6037848-7408-4c5e-b8e5-9a4bb378f9ac", "email": "eurdinez@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-09-16 14:23:52.462808+00	2025-09-16 14:23:52.463444+00	2025-09-16 14:23:52.463444+00	71d67968-2485-4e91-8ce3-b281600661d6
117801483302801995779	485fd993-8102-472e-94d4-803e80bc4d9a	{"iss": "https://accounts.google.com", "sub": "117801483302801995779", "name": "Enrique Gabriel", "email": "egb.labot@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIleaNhKGj35T1cCE77_rYguPoINZrtK1P1KCK_YA6NkgTcYw=s96-c", "full_name": "Enrique Gabriel", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIleaNhKGj35T1cCE77_rYguPoINZrtK1P1KCK_YA6NkgTcYw=s96-c", "provider_id": "117801483302801995779", "email_verified": true, "phone_verified": false}	google	2025-09-20 15:08:34.561483+00	2025-09-20 15:08:34.561534+00	2025-09-25 21:01:56.231042+00	40753836-ec65-4341-a540-e410486076b5
113489521668621096009	e7b46826-8126-47da-a3ea-ed10eb69d068	{"iss": "https://accounts.google.com", "sub": "113489521668621096009", "name": "Ignacio silva montaner", "email": "isilvamontaner02@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJpK0_fied58gHadvIdiMWrAlVpmiQ_lQpJgu5XNuEe50StfQ=s96-c", "full_name": "Ignacio silva montaner", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJpK0_fied58gHadvIdiMWrAlVpmiQ_lQpJgu5XNuEe50StfQ=s96-c", "provider_id": "113489521668621096009", "email_verified": true, "phone_verified": false}	google	2025-09-05 12:21:43.458643+00	2025-09-05 12:21:43.458707+00	2025-09-16 14:25:10.620337+00	3a5f10a5-0246-47d1-96b9-9a26abf10231
5e803c44-a3c6-430d-9ae1-7a025651555e	5e803c44-a3c6-430d-9ae1-7a025651555e	{"sub": "5e803c44-a3c6-430d-9ae1-7a025651555e", "email": "gemini.dev.assistant.g@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-09-24 16:10:12.268002+00	2025-09-24 16:10:12.268064+00	2025-09-24 16:10:12.268064+00	c6536d36-7c6e-472d-a14b-ea5427244a6b
b8d511d8-60c5-4e45-85d6-84382495eadd	b8d511d8-60c5-4e45-85d6-84382495eadd	{"sub": "b8d511d8-60c5-4e45-85d6-84382495eadd", "email": "yoreparolomas@gmail.com", "full_name": "Pepe mujica", "email_verified": true, "phone_verified": false}	email	2025-10-20 14:59:03.517253+00	2025-10-20 14:59:03.517302+00	2025-10-20 14:59:03.517302+00	5abdcdb2-43bb-497b-af02-62ecd9e10351
107029139057089043842	b6037848-7408-4c5e-b8e5-9a4bb378f9ac	{"iss": "https://accounts.google.com", "sub": "107029139057089043842", "name": "Ezequiel Urdinez", "email": "eurdinez@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJiQZbJ8Uzsl99PnbvAv-JPqGbkYFD1ZaGHOKYWVl6I1xaUIA=s96-c", "full_name": "Ezequiel Urdinez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJiQZbJ8Uzsl99PnbvAv-JPqGbkYFD1ZaGHOKYWVl6I1xaUIA=s96-c", "provider_id": "107029139057089043842", "email_verified": true, "phone_verified": false}	google	2025-10-13 15:52:50.544471+00	2025-10-13 15:52:50.544536+00	2025-10-13 15:54:29.456312+00	fce2327e-9d6a-4cb8-97ab-597029f6f16f
117701502142552763977	c39967c6-cf8a-4546-a65d-168e43b4b1c3	{"iss": "https://accounts.google.com", "sub": "117701502142552763977", "name": "Biosplus", "email": "ventasbiosplus@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIbBQUpEUdhwguMQA3jdwxGbkoum-3-V_oC817uytQEPg2YPQ=s96-c", "full_name": "Biosplus", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIbBQUpEUdhwguMQA3jdwxGbkoum-3-V_oC817uytQEPg2YPQ=s96-c", "provider_id": "117701502142552763977", "email_verified": true, "phone_verified": false}	google	2025-09-15 20:21:29.55236+00	2025-09-15 20:21:29.552419+00	2025-10-24 15:23:41.511688+00	91f6f664-2956-4f26-85e0-83ad0a3afe90
112257359390952518035	0cd44ec8-1243-41c3-baea-e61dc19de624	{"iss": "https://accounts.google.com", "sub": "112257359390952518035", "name": "conrado muriñigo", "email": "conra.iturria@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL-G4bH9xLtxzqoPn_7UZ8KnWTRFJoUdkgkON66_T10ZxIyO-w=s96-c", "full_name": "conrado muriñigo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL-G4bH9xLtxzqoPn_7UZ8KnWTRFJoUdkgkON66_T10ZxIyO-w=s96-c", "provider_id": "112257359390952518035", "email_verified": true, "phone_verified": false}	google	2025-09-05 12:23:59.050924+00	2025-09-05 12:23:59.050974+00	2025-10-31 18:19:18.111905+00	4a23e136-f27f-44f7-905d-cb003d2bee9f
105817740735545276022	fcd336ee-71b2-4cc9-8573-bab798216501	{"iss": "https://accounts.google.com", "sub": "105817740735545276022", "name": "IPE Shop", "email": "ipemercadoshop@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocI4RQzY3rW6WULvy38UmjYkUcMIgKOcoa0073upU5v1BpJsJw=s96-c", "full_name": "IPE Shop", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocI4RQzY3rW6WULvy38UmjYkUcMIgKOcoa0073upU5v1BpJsJw=s96-c", "provider_id": "105817740735545276022", "email_verified": true, "phone_verified": false}	google	2025-10-05 21:47:29.633429+00	2025-10-05 21:47:29.633478+00	2025-10-24 17:53:11.335857+00	1e3baf1f-8d19-496e-af9c-e8622ec41016
110885869741311039519	c03591f7-1edf-412b-bcc6-89124e6ff1c9	{"iss": "https://accounts.google.com", "sub": "110885869741311039519", "name": "Enrique Barbeito", "email": "barbeito.enrique@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIpL9Y5AWtIaUzQamVPJuB6_FWI4-FLelWc285OodXTI14JRdq0=s96-c", "full_name": "Enrique Barbeito", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIpL9Y5AWtIaUzQamVPJuB6_FWI4-FLelWc285OodXTI14JRdq0=s96-c", "provider_id": "110885869741311039519", "email_verified": true, "phone_verified": false}	google	2025-10-12 16:20:36.821907+00	2025-10-12 16:20:36.821969+00	2025-11-01 14:12:52.685171+00	510051c3-c8b6-4046-900e-5a65f101830b
111382764234567824199	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{"iss": "https://accounts.google.com", "sub": "111382764234567824199", "name": "Hernan Maldacena", "email": "maldacenah@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJvrrFfVamdAIkeAnMzWGbWG68l4zNd1J_kn-6L3rMN0_rqBiNS=s96-c", "full_name": "Hernan Maldacena", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJvrrFfVamdAIkeAnMzWGbWG68l4zNd1J_kn-6L3rMN0_rqBiNS=s96-c", "provider_id": "111382764234567824199", "email_verified": true, "phone_verified": false}	google	2025-09-03 17:01:17.41285+00	2025-09-03 17:01:17.412899+00	2025-11-04 19:17:59.996731+00	558892ee-3ec5-4655-a36c-e31d6136b094
117903218784386531975	8874606b-f5c7-41cb-83b0-93cb368e5f9e	{"iss": "https://accounts.google.com", "sub": "117903218784386531975", "name": "Conrado Muriñigo", "email": "comprasalimentia@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocL_m2tlqslKn6ot1Xve2OXMzHRC32wb2SQVpKWzU0o3MM7c7Q=s96-c", "full_name": "Conrado Muriñigo", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocL_m2tlqslKn6ot1Xve2OXMzHRC32wb2SQVpKWzU0o3MM7c7Q=s96-c", "provider_id": "117903218784386531975", "email_verified": true, "phone_verified": false}	google	2025-11-04 15:51:50.971546+00	2025-11-04 15:51:50.971616+00	2025-11-04 19:05:30.609008+00	071fad07-903a-4158-a46b-8ed897aa3b50
101492105146570045972	bab1e667-f842-4ebc-9f5f-6039ebd1d526	{"iss": "https://accounts.google.com", "sub": "101492105146570045972", "name": "Erika Valker", "email": "erikabiosplus@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKuGVIWak-rqSbWTOvcJ-AK-0b5lN8l_gccFk427ENx47K2zg=s96-c", "full_name": "Erika Valker", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKuGVIWak-rqSbWTOvcJ-AK-0b5lN8l_gccFk427ENx47K2zg=s96-c", "provider_id": "101492105146570045972", "email_verified": true, "phone_verified": false}	google	2025-11-04 19:11:40.371918+00	2025-11-04 19:11:40.371984+00	2025-11-04 19:32:17.366709+00	e4633d48-9cd7-4026-9a7d-f901fb76dff1
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter) FROM stdin;
ee7ac005-f3ef-451d-b74f-02f8254d22c6	485fd993-8102-472e-94d4-803e80bc4d9a	2025-09-24 16:23:15.439053+00	2025-09-25 20:29:20.010915+00	\N	aal1	\N	2025-09-25 20:29:20.010837	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	190.55.17.232	\N	\N	\N	\N
7e6137cd-552d-4e14-b7cf-ddce84d84e8d	8874606b-f5c7-41cb-83b0-93cb368e5f9e	2025-11-04 16:09:43.498853+00	2025-11-04 18:19:55.352792+00	\N	aal1	\N	2025-11-04 18:19:55.352139	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
73a96da2-b6db-428b-91e8-fa411abde668	8874606b-f5c7-41cb-83b0-93cb368e5f9e	2025-11-04 19:05:30.622055+00	2025-11-04 19:05:30.622055+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
1324570e-97f4-44cb-8b60-138d48b245c7	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:11:40.394044+00	2025-11-04 19:11:40.394044+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
8cef9efa-672c-4411-8f23-668c6f27951d	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:11:57.917976+00	2025-11-04 19:11:57.917976+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
c56285a1-8ab8-4c5d-819e-b8c104598615	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-11-04 19:18:00.018441+00	2025-11-04 19:18:00.018441+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
57045e7d-2f70-466b-b883-d5c022c660da	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:31:12.764661+00	2025-11-04 19:31:12.764661+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
3adaf8de-84e6-4220-a92f-2c10a5771266	0a3c12de-5dbc-4ff7-83ae-7de315b392f3	2025-09-18 18:52:03.62464+00	2025-09-18 18:52:03.62464+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	190.193.131.36	\N	\N	\N	\N
6bc83431-b73e-4dc6-8196-ee83a6403659	485fd993-8102-472e-94d4-803e80bc4d9a	2025-09-25 21:01:01.41241+00	2025-09-25 21:01:01.41241+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	190.55.17.232	\N	\N	\N	\N
60801843-9970-49ae-8100-8ca0482a7fce	485fd993-8102-472e-94d4-803e80bc4d9a	2025-09-25 21:01:56.236902+00	2025-09-25 21:01:56.236902+00	\N	aal1	\N	\N	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	190.55.17.232	\N	\N	\N	\N
d0a390c8-4408-40df-bbec-8f05e690c2d5	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-10-31 14:00:52.995656+00	2025-10-31 15:00:42.69581+00	\N	aal1	\N	2025-10-31 15:00:42.695716	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
6609e3ff-48bf-4698-a8a2-dc8b1d2ef43a	b8d511d8-60c5-4e45-85d6-84382495eadd	2025-10-24 15:23:34.288516+00	2025-10-24 15:23:34.288516+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.157.64	\N	\N	\N	\N
a2b3f4e4-0dbb-4f81-ab95-b8762a7276ed	8874606b-f5c7-41cb-83b0-93cb368e5f9e	2025-11-04 15:51:50.997007+00	2025-11-04 15:51:50.997007+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
f5bac7a2-aaf6-4470-874a-5348a581a738	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-11-04 18:19:37.339367+00	2025-11-04 18:19:37.339367+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
ab761e55-1a94-4b19-982c-07dc8ba3f3d4	8874606b-f5c7-41cb-83b0-93cb368e5f9e	2025-11-04 18:19:58.932328+00	2025-11-04 18:19:58.932328+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
62b2e470-9ab5-438b-954e-ba89d5d9de34	8874606b-f5c7-41cb-83b0-93cb368e5f9e	2025-11-04 15:51:56.516955+00	2025-11-04 19:03:42.835861+00	\N	aal1	\N	2025-11-04 19:03:42.835117	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
69149382-4335-41f8-bec3-0b48fddfbd27	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:13:15.250667+00	2025-11-04 19:13:15.250667+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
baf76a86-50f0-4f3d-9de4-4e6975f79fc4	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:19:55.804651+00	2025-11-04 19:19:55.804651+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
520c8651-1797-400e-bd82-e7d7f0129199	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-10-31 18:11:27.134227+00	2025-10-31 18:11:27.134227+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
6c3505ff-1ca3-47d6-a566-18404a06b461	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-04 19:32:17.37313+00	2025-11-05 00:56:53.500668+00	\N	aal1	\N	2025-11-05 00:56:53.499972	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.117.77.83	\N	\N	\N	\N
30fbf22e-584f-4230-9bf7-6ecf5dfcf227	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-10-31 17:48:04.798371+00	2025-10-31 18:49:35.913263+00	\N	aal1	\N	2025-10-31 18:49:35.913165	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	181.24.24.96	\N	\N	\N	\N
483ddbab-a526-4263-add7-17747cd691e9	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-11-04 19:07:05.178401+00	2025-11-05 17:12:11.634787+00	\N	aal1	\N	2025-11-05 17:12:11.634691	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
d36f5afc-3978-4626-99b7-d91759bdfcfb	c03591f7-1edf-412b-bcc6-89124e6ff1c9	2025-11-01 14:12:52.689487+00	2025-11-01 15:11:00.291209+00	\N	aal1	\N	2025-11-01 15:11:00.289473	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	190.55.17.232	\N	\N	\N	\N
e7bf0146-ed5b-4247-9a07-f5e59b7e3c3d	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-10-31 18:19:18.118344+00	2025-11-03 17:59:08.634078+00	\N	aal1	\N	2025-11-03 17:59:08.633973	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	186.132.139.56	\N	\N	\N	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
a2b3f4e4-0dbb-4f81-ab95-b8762a7276ed	2025-11-04 15:51:51.009405+00	2025-11-04 15:51:51.009405+00	oauth	123cc0fb-3b62-47d7-aeca-cb443ecba744
62b2e470-9ab5-438b-954e-ba89d5d9de34	2025-11-04 15:51:56.518907+00	2025-11-04 15:51:56.518907+00	oauth	4f959245-822b-4d51-b534-ff9763f5264e
7e6137cd-552d-4e14-b7cf-ddce84d84e8d	2025-11-04 16:09:43.519169+00	2025-11-04 16:09:43.519169+00	oauth	fd433b6d-3d2a-459b-8925-6fffef78264d
f5bac7a2-aaf6-4470-874a-5348a581a738	2025-11-04 18:19:37.358638+00	2025-11-04 18:19:37.358638+00	oauth	7a2cd174-3dee-4749-a9fb-7d87e3e350f4
ab761e55-1a94-4b19-982c-07dc8ba3f3d4	2025-11-04 18:19:58.935709+00	2025-11-04 18:19:58.935709+00	oauth	07022bcf-c188-462f-9c90-a2851e9e2e54
73a96da2-b6db-428b-91e8-fa411abde668	2025-11-04 19:05:30.63754+00	2025-11-04 19:05:30.63754+00	oauth	2164ec0e-31b7-4eb7-97e4-7acd228b1507
483ddbab-a526-4263-add7-17747cd691e9	2025-11-04 19:07:05.192051+00	2025-11-04 19:07:05.192051+00	oauth	68e8450c-4ae4-4021-9be9-47603a3737dc
1324570e-97f4-44cb-8b60-138d48b245c7	2025-11-04 19:11:40.413705+00	2025-11-04 19:11:40.413705+00	oauth	1c52d381-f24f-41bd-91a9-68bb9c8bb6c0
8cef9efa-672c-4411-8f23-668c6f27951d	2025-11-04 19:11:57.924516+00	2025-11-04 19:11:57.924516+00	oauth	01eea067-3510-4c9e-b397-9990fcd6de58
69149382-4335-41f8-bec3-0b48fddfbd27	2025-11-04 19:13:15.281494+00	2025-11-04 19:13:15.281494+00	oauth	0be66a0a-f522-44fa-956c-2750694b29e4
c56285a1-8ab8-4c5d-819e-b8c104598615	2025-11-04 19:18:00.033768+00	2025-11-04 19:18:00.033768+00	oauth	fc00ec6d-12ad-4e22-a68e-3d8102248b22
baf76a86-50f0-4f3d-9de4-4e6975f79fc4	2025-11-04 19:19:55.81411+00	2025-11-04 19:19:55.81411+00	oauth	15bc7ea7-6315-4710-9f07-98cefea13b84
57045e7d-2f70-466b-b883-d5c022c660da	2025-11-04 19:31:12.782167+00	2025-11-04 19:31:12.782167+00	oauth	8d8fa353-b219-4965-bfd0-f6555a4aedf9
6c3505ff-1ca3-47d6-a566-18404a06b461	2025-11-04 19:32:17.37808+00	2025-11-04 19:32:17.37808+00	oauth	8d5237ca-2303-4599-88d8-0de711e7d8dd
d0a390c8-4408-40df-bbec-8f05e690c2d5	2025-10-31 14:00:53.01931+00	2025-10-31 14:00:53.01931+00	oauth	fa1e32dc-3639-4918-b47c-55e4fa0aca2c
ee7ac005-f3ef-451d-b74f-02f8254d22c6	2025-09-24 16:23:15.448121+00	2025-09-24 16:23:15.448121+00	oauth	b4b2cfa5-00c6-49b3-96d5-b3939555ae1b
3adaf8de-84e6-4220-a92f-2c10a5771266	2025-09-18 18:52:03.635677+00	2025-09-18 18:52:03.635677+00	oauth	1665fdd5-fc33-452c-8686-815ae5463251
6bc83431-b73e-4dc6-8196-ee83a6403659	2025-09-25 21:01:01.454144+00	2025-09-25 21:01:01.454144+00	oauth	5f23629f-f1e7-4975-a321-3a12efb3f07b
30fbf22e-584f-4230-9bf7-6ecf5dfcf227	2025-10-31 17:48:04.813789+00	2025-10-31 17:48:04.813789+00	oauth	4a11184e-710b-4dbf-8bf3-42b70292e19b
60801843-9970-49ae-8100-8ca0482a7fce	2025-09-25 21:01:56.240412+00	2025-09-25 21:01:56.240412+00	oauth	babf0560-a087-458e-82cd-a38e1ff7123c
520c8651-1797-400e-bd82-e7d7f0129199	2025-10-31 18:11:27.143971+00	2025-10-31 18:11:27.143971+00	oauth	b07981c0-3c81-403a-9169-8c19358a4776
e7bf0146-ed5b-4247-9a07-f5e59b7e3c3d	2025-10-31 18:19:18.126962+00	2025-10-31 18:19:18.126962+00	oauth	3e11be70-83f9-4cdd-b57c-951cc2dc209d
d36f5afc-3978-4626-99b7-d91759bdfcfb	2025-11-01 14:12:52.691346+00	2025-11-01 14:12:52.691346+00	oauth	f40cbda6-1446-4aa1-a002-c9278e5d70cd
6609e3ff-48bf-4698-a8a2-dc8b1d2ef43a	2025-10-24 15:23:34.303815+00	2025-10-24 15:23:34.303815+00	password	dd7173ad-6cb4-4098-b28f-10d93aeb51cf
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	388	dy24xs2rf7mk	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 17:33:49.727882+00	2025-09-25 18:32:19.901016+00	z3e77nwc4j3d	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	350	k6unxwfaycu3	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-24 16:23:15.444092+00	2025-09-24 17:59:55.317104+00	\N	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	982	jhffzefpqhbh	8874606b-f5c7-41cb-83b0-93cb368e5f9e	t	2025-11-04 16:09:43.507654+00	2025-11-04 18:19:55.344436+00	\N	7e6137cd-552d-4e14-b7cf-ddce84d84e8d
00000000-0000-0000-0000-000000000000	393	vvnrxq2zuwdk	485fd993-8102-472e-94d4-803e80bc4d9a	f	2025-09-25 20:29:19.991198+00	2025-09-25 20:29:19.991198+00	czb7l7eag7te	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	986	35nya3z2fzrq	8874606b-f5c7-41cb-83b0-93cb368e5f9e	t	2025-11-04 17:32:39.34992+00	2025-11-04 19:03:42.80972+00	iknicnuk2air	62b2e470-9ab5-438b-954e-ba89d5d9de34
00000000-0000-0000-0000-000000000000	992	wodqntfckrbu	8874606b-f5c7-41cb-83b0-93cb368e5f9e	f	2025-11-04 19:05:30.63275+00	2025-11-04 19:05:30.63275+00	\N	73a96da2-b6db-428b-91e8-fa411abde668
00000000-0000-0000-0000-000000000000	997	uvjnjr2ijo7q	c145694f-77b3-4baf-90c0-c7ebeee69cd6	f	2025-11-04 19:18:00.026704+00	2025-11-04 19:18:00.026704+00	\N	c56285a1-8ab8-4c5d-819e-b8c104598615
00000000-0000-0000-0000-000000000000	1001	u7dxugjh76vu	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-05 00:56:53.463925+00	2025-11-05 00:56:53.463925+00	kzcyfymmzdrf	6c3505ff-1ca3-47d6-a566-18404a06b461
00000000-0000-0000-0000-000000000000	1004	33r23oi25c6k	c145694f-77b3-4baf-90c0-c7ebeee69cd6	t	2025-11-05 15:56:51.808186+00	2025-11-05 17:12:11.631197+00	jhb3pqrklhqn	483ddbab-a526-4263-add7-17747cd691e9
00000000-0000-0000-0000-000000000000	366	mekumgooxh6d	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 01:33:55.397471+00	2025-09-25 11:42:50.265253+00	rgg5llzjqkza	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	374	tge3acoj4xwl	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 12:41:19.655803+00	2025-09-25 13:39:49.546321+00	z2brbd6zm2cb	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	386	z3e77nwc4j3d	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 16:35:19.851961+00	2025-09-25 17:33:49.715421+00	jwztqhkva6tl	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	254	xhglgyga2c6b	0a3c12de-5dbc-4ff7-83ae-7de315b392f3	f	2025-09-18 18:52:03.633409+00	2025-09-18 18:52:03.633409+00	\N	3adaf8de-84e6-4220-a92f-2c10a5771266
00000000-0000-0000-0000-000000000000	976	iqtzb2kkv546	8874606b-f5c7-41cb-83b0-93cb368e5f9e	f	2025-11-04 15:51:51.000101+00	2025-11-04 15:51:51.000101+00	\N	a2b3f4e4-0dbb-4f81-ab95-b8762a7276ed
00000000-0000-0000-0000-000000000000	390	z2b6no73ccs6	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 18:32:19.915955+00	2025-09-25 19:30:49.856334+00	dy24xs2rf7mk	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	392	czb7l7eag7te	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 19:30:49.877627+00	2025-09-25 20:29:19.973196+00	z2b6no73ccs6	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	394	2uh7zdnqhvnk	485fd993-8102-472e-94d4-803e80bc4d9a	f	2025-09-25 21:01:01.435837+00	2025-09-25 21:01:01.435837+00	\N	6bc83431-b73e-4dc6-8196-ee83a6403659
00000000-0000-0000-0000-000000000000	395	hd3i7q6byhx3	485fd993-8102-472e-94d4-803e80bc4d9a	f	2025-09-25 21:01:56.238393+00	2025-09-25 21:01:56.238393+00	\N	60801843-9970-49ae-8100-8ca0482a7fce
00000000-0000-0000-0000-000000000000	353	e3mnq25tjnry	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-24 17:59:55.321831+00	2025-09-24 22:37:47.340357+00	k6unxwfaycu3	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	977	iknicnuk2air	8874606b-f5c7-41cb-83b0-93cb368e5f9e	t	2025-11-04 15:51:56.517775+00	2025-11-04 17:32:39.342639+00	\N	62b2e470-9ab5-438b-954e-ba89d5d9de34
00000000-0000-0000-0000-000000000000	359	5qcu3r5ft54r	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-24 22:37:47.371733+00	2025-09-24 23:36:17.665566+00	e3mnq25tjnry	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	998	r5nnucfatfbd	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-04 19:19:55.809701+00	2025-11-04 19:19:55.809701+00	\N	baf76a86-50f0-4f3d-9de4-4e6975f79fc4
00000000-0000-0000-0000-000000000000	361	yvqho2dk4req	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-24 23:36:17.694896+00	2025-09-25 00:35:25.266782+00	5qcu3r5ft54r	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	993	mm6xjpk3qzqt	c145694f-77b3-4baf-90c0-c7ebeee69cd6	t	2025-11-04 19:07:05.186579+00	2025-11-05 12:33:48.961882+00	\N	483ddbab-a526-4263-add7-17747cd691e9
00000000-0000-0000-0000-000000000000	363	rgg5llzjqkza	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 00:35:25.282364+00	2025-09-25 01:33:55.381473+00	yvqho2dk4req	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	789	4ot5i7lwcxl7	b8d511d8-60c5-4e45-85d6-84382495eadd	f	2025-10-24 15:23:34.299017+00	2025-10-24 15:23:34.299017+00	\N	6609e3ff-48bf-4698-a8a2-dc8b1d2ef43a
00000000-0000-0000-0000-000000000000	1002	zngmeq6l2cde	c145694f-77b3-4baf-90c0-c7ebeee69cd6	t	2025-11-05 12:33:48.984616+00	2025-11-05 14:31:39.003098+00	mm6xjpk3qzqt	483ddbab-a526-4263-add7-17747cd691e9
00000000-0000-0000-0000-000000000000	1005	wjigmgwznj37	c145694f-77b3-4baf-90c0-c7ebeee69cd6	f	2025-11-05 17:12:11.631981+00	2025-11-05 17:12:11.631981+00	33r23oi25c6k	483ddbab-a526-4263-add7-17747cd691e9
00000000-0000-0000-0000-000000000000	371	z2brbd6zm2cb	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 11:42:50.266725+00	2025-09-25 12:41:19.652005+00	mekumgooxh6d	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	378	mxlxhhh2noag	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 13:39:49.549164+00	2025-09-25 14:38:20.023027+00	tge3acoj4xwl	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	381	nqzdrcccypol	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 14:38:20.028185+00	2025-09-25 15:36:49.391968+00	mxlxhhh2noag	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	383	jwztqhkva6tl	485fd993-8102-472e-94d4-803e80bc4d9a	t	2025-09-25 15:36:49.394498+00	2025-09-25 16:35:19.846201+00	nqzdrcccypol	ee7ac005-f3ef-451d-b74f-02f8254d22c6
00000000-0000-0000-0000-000000000000	874	fpfkrygds4dy	0cd44ec8-1243-41c3-baea-e61dc19de624	t	2025-10-31 14:00:53.004544+00	2025-10-31 15:00:42.676085+00	\N	d0a390c8-4408-40df-bbec-8f05e690c2d5
00000000-0000-0000-0000-000000000000	876	7w6zoafb36gp	0cd44ec8-1243-41c3-baea-e61dc19de624	f	2025-10-31 15:00:42.680935+00	2025-10-31 15:00:42.680935+00	fpfkrygds4dy	d0a390c8-4408-40df-bbec-8f05e690c2d5
00000000-0000-0000-0000-000000000000	988	bh66ar2hnpva	c145694f-77b3-4baf-90c0-c7ebeee69cd6	f	2025-11-04 18:19:37.355536+00	2025-11-04 18:19:37.355536+00	\N	f5bac7a2-aaf6-4470-874a-5348a581a738
00000000-0000-0000-0000-000000000000	989	4myn5kxmka5z	8874606b-f5c7-41cb-83b0-93cb368e5f9e	f	2025-11-04 18:19:55.345632+00	2025-11-04 18:19:55.345632+00	jhffzefpqhbh	7e6137cd-552d-4e14-b7cf-ddce84d84e8d
00000000-0000-0000-0000-000000000000	900	biqv2iocobng	0cd44ec8-1243-41c3-baea-e61dc19de624	f	2025-10-31 18:11:27.137462+00	2025-10-31 18:11:27.137462+00	\N	520c8651-1797-400e-bd82-e7d7f0129199
00000000-0000-0000-0000-000000000000	990	hscfhaoarn4m	8874606b-f5c7-41cb-83b0-93cb368e5f9e	f	2025-11-04 18:19:58.933136+00	2025-11-04 18:19:58.933136+00	\N	ab761e55-1a94-4b19-982c-07dc8ba3f3d4
00000000-0000-0000-0000-000000000000	994	7274eh4qo4ea	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-04 19:11:40.404454+00	2025-11-04 19:11:40.404454+00	\N	1324570e-97f4-44cb-8b60-138d48b245c7
00000000-0000-0000-0000-000000000000	895	xk7jxgmovwki	0cd44ec8-1243-41c3-baea-e61dc19de624	t	2025-10-31 17:48:04.805857+00	2025-10-31 18:49:35.889526+00	\N	30fbf22e-584f-4230-9bf7-6ecf5dfcf227
00000000-0000-0000-0000-000000000000	903	7m5u5wgtum5j	0cd44ec8-1243-41c3-baea-e61dc19de624	f	2025-10-31 18:49:35.894496+00	2025-10-31 18:49:35.894496+00	xk7jxgmovwki	30fbf22e-584f-4230-9bf7-6ecf5dfcf227
00000000-0000-0000-0000-000000000000	995	rvxozsfnxpdh	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-04 19:11:57.918924+00	2025-11-04 19:11:57.918924+00	\N	8cef9efa-672c-4411-8f23-668c6f27951d
00000000-0000-0000-0000-000000000000	999	rgfwbopgjaau	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-04 19:31:12.771432+00	2025-11-04 19:31:12.771432+00	\N	57045e7d-2f70-466b-b883-d5c022c660da
00000000-0000-0000-0000-000000000000	1003	jhb3pqrklhqn	c145694f-77b3-4baf-90c0-c7ebeee69cd6	t	2025-11-05 14:31:39.016774+00	2025-11-05 15:56:51.805975+00	zngmeq6l2cde	483ddbab-a526-4263-add7-17747cd691e9
00000000-0000-0000-0000-000000000000	909	ppjenep3lopt	c03591f7-1edf-412b-bcc6-89124e6ff1c9	t	2025-11-01 14:12:52.690179+00	2025-11-01 15:11:00.263852+00	\N	d36f5afc-3978-4626-99b7-d91759bdfcfb
00000000-0000-0000-0000-000000000000	910	qlbq6l5skvc4	c03591f7-1edf-412b-bcc6-89124e6ff1c9	f	2025-11-01 15:11:00.274079+00	2025-11-01 15:11:00.274079+00	ppjenep3lopt	d36f5afc-3978-4626-99b7-d91759bdfcfb
00000000-0000-0000-0000-000000000000	902	qmrupluk4vgw	0cd44ec8-1243-41c3-baea-e61dc19de624	t	2025-10-31 18:19:18.121561+00	2025-11-03 16:49:44.223859+00	\N	e7bf0146-ed5b-4247-9a07-f5e59b7e3c3d
00000000-0000-0000-0000-000000000000	991	3c3tu2zvcco4	8874606b-f5c7-41cb-83b0-93cb368e5f9e	f	2025-11-04 19:03:42.817667+00	2025-11-04 19:03:42.817667+00	35nya3z2fzrq	62b2e470-9ab5-438b-954e-ba89d5d9de34
00000000-0000-0000-0000-000000000000	996	w24ynu2hnvxf	bab1e667-f842-4ebc-9f5f-6039ebd1d526	f	2025-11-04 19:13:15.263355+00	2025-11-04 19:13:15.263355+00	\N	69149382-4335-41f8-bec3-0b48fddfbd27
00000000-0000-0000-0000-000000000000	1000	kzcyfymmzdrf	bab1e667-f842-4ebc-9f5f-6039ebd1d526	t	2025-11-04 19:32:17.374515+00	2025-11-05 00:56:53.436169+00	\N	6c3505ff-1ca3-47d6-a566-18404a06b461
00000000-0000-0000-0000-000000000000	954	tag3lzfs5mrs	0cd44ec8-1243-41c3-baea-e61dc19de624	t	2025-11-03 16:49:44.233966+00	2025-11-03 17:59:08.619775+00	qmrupluk4vgw	e7bf0146-ed5b-4247-9a07-f5e59b7e3c3d
00000000-0000-0000-0000-000000000000	961	lfbyq5lwghg7	0cd44ec8-1243-41c3-baea-e61dc19de624	f	2025-11-03 17:59:08.624372+00	2025-11-03 17:59:08.624372+00	tag3lzfs5mrs	e7bf0146-ed5b-4247-9a07-f5e59b7e3c3d
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: supabase_admin
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
1	0 12 * * *	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	localhost	5432	postgres	postgres	t	actualizacion-diaria-dolar
2	0 5 * * *	SELECT public.anular_pedidos_reserva_expirada()	localhost	5432	postgres	postgres	t	anular-reservas-expiradas
\.


--
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: supabase_admin
--

COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
1	3	471551	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-01 12:00:00.196453+00	2025-09-01 12:00:00.200638+00
1	1	379531	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-08-30 12:00:00.231515+00	2025-08-30 12:00:00.237218+00
1	4	521208	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-02 12:00:00.200064+00	2025-09-02 12:00:00.206291+00
1	2	425193	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-08-31 12:00:00.190886+00	2025-08-31 12:00:00.19703+00
1	68	2526882	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-14 12:00:00.221191+00	2025-10-14 12:00:00.223561+00
2	61	2374084	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-11 05:00:00.219514+00	2025-10-11 05:00:00.369235+00
1	64	2433212	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-12 12:00:00.217166+00	2025-10-12 12:00:00.223967+00
1	5	570407	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-03 12:00:00.209053+00	2025-09-03 12:00:00.216032+00
1	66	2479563	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-13 12:00:00.172747+00	2025-10-13 12:00:00.174288+00
1	62	2387824	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-11 12:00:00.203117+00	2025-10-11 12:00:00.208627+00
2	67	2512989	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-14 05:00:00.205087+00	2025-10-14 05:00:00.345353+00
2	65	2466100	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-13 05:00:00.205629+00	2025-10-13 05:00:00.371549+00
2	63	2419823	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-12 05:00:00.20517+00	2025-10-12 05:00:00.36163+00
1	70	2574123	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-15 12:00:00.198474+00	2025-10-15 12:00:00.205305+00
2	69	2560706	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-15 05:00:00.207384+00	2025-10-15 05:00:00.351564+00
2	71	2609546	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-16 05:00:00.220028+00	2025-10-16 05:00:00.369457+00
1	8	713049	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-06 12:00:00.197426+00	2025-09-06 12:00:00.202511+00
1	6	617491	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-04 12:00:00.197239+00	2025-09-04 12:00:00.198827+00
1	9	759979	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-07 12:00:00.213385+00	2025-09-07 12:00:00.219352+00
1	7	664707	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-05 12:00:00.189193+00	2025-09-05 12:00:00.190843+00
2	91	3093149	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-26 05:00:00.192726+00	2025-10-26 05:00:00.3286+00
1	94	3155639	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-27 12:00:00.183729+00	2025-10-27 12:00:00.185072+00
1	10	805424	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-08 12:00:00.181555+00	2025-09-08 12:00:00.183437+00
1	96	3203720	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-28 12:00:00.192436+00	2025-10-28 12:00:00.197988+00
1	92	3107478	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-26 12:00:00.19193+00	2025-10-26 12:00:00.199424+00
2	97	3237560	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-29 05:00:00.196587+00	2025-10-29 05:00:00.349951+00
2	95	3189501	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-28 05:00:00.195227+00	2025-10-28 05:00:00.343797+00
2	93	3141594	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-27 05:00:00.195041+00	2025-10-27 05:00:00.326439+00
1	13	955374	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-11 12:00:00.188571+00	2025-09-11 12:00:00.194642+00
1	11	855081	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-09 12:00:00.161919+00	2025-09-09 12:00:00.163074+00
1	18	1197782	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-16 12:00:00.240762+00	2025-09-16 12:00:00.242415+00
1	17	1146963	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-15 12:00:00.196033+00	2025-09-15 12:00:00.202463+00
1	14	1004476	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-12 12:00:00.200368+00	2025-09-12 12:00:00.206341+00
1	12	904699	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-10 12:00:00.205641+00	2025-09-10 12:00:00.212611+00
1	16	1100654	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-14 12:00:00.203038+00	2025-09-14 12:00:00.209451+00
1	15	1052927	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-13 12:00:00.204622+00	2025-09-13 12:00:00.211248+00
1	19	1247246	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-17 12:00:00.192688+00	2025-09-17 12:00:00.194413+00
1	20	1295005	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-18 12:00:00.209846+00	2025-09-18 12:00:00.212221+00
1	21	1344997	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-19 12:00:00.172925+00	2025-09-19 12:00:00.174638+00
1	22	1392151	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-20 12:00:00.206729+00	2025-09-20 12:00:00.214411+00
1	36	1773581	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-28 12:00:00.23092+00	2025-09-28 12:00:00.237425+00
1	26	1532308	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-23 12:00:00.214587+00	2025-09-23 12:00:00.2209+00
1	23	1438149	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-21 12:00:00.222814+00	2025-09-21 12:00:00.230279+00
1	32	1678898	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-26 12:00:00.169729+00	2025-09-26 12:00:00.172+00
1	30	1628996	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-25 12:00:00.200376+00	2025-09-25 12:00:00.202139+00
1	24	1484058	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-22 12:00:00.222435+00	2025-09-22 12:00:00.229492+00
2	27	1567342	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-24 05:00:00.203654+00	2025-09-24 05:00:00.342868+00
2	25	1518455	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-23 05:00:00.211054+00	2025-09-23 05:00:00.348697+00
1	34	1727784	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-27 12:00:00.220893+00	2025-09-27 12:00:00.226515+00
1	28	1580736	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-24 12:00:00.211086+00	2025-09-24 12:00:00.218385+00
2	31	1665068	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-26 05:00:00.191289+00	2025-09-26 05:00:00.241692+00
2	29	1615280	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-25 05:00:00.218573+00	2025-09-25 05:00:00.33741+00
2	33	1714295	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-27 05:00:00.215445+00	2025-09-27 05:00:00.350971+00
1	38	1819385	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-29 12:00:00.202442+00	2025-09-29 12:00:00.205021+00
2	35	1759864	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-28 05:00:00.222448+00	2025-09-28 05:00:00.312075+00
2	37	1805669	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-29 05:00:00.224407+00	2025-09-29 05:00:00.367383+00
1	40	1867548	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-09-30 12:00:00.23364+00	2025-09-30 12:00:00.239727+00
2	39	1854073	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-09-30 05:00:00.223769+00	2025-09-30 05:00:00.360974+00
2	41	1902038	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-01 05:00:00.215382+00	2025-10-01 05:00:00.354267+00
1	58	2295946	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-09 12:00:00.212531+00	2025-10-09 12:00:00.219174+00
1	46	2012671	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-03 12:00:00.25513+00	2025-10-03 12:00:00.257068+00
1	42	1915384	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-01 12:00:00.224898+00	2025-10-01 12:00:00.232185+00
2	49	2092271	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-05 05:00:00.214659+00	2025-10-05 05:00:00.365314+00
2	43	1950148	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-02 05:00:00.233453+00	2025-10-02 05:00:00.372465+00
1	56	2249059	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-08 12:00:00.189775+00	2025-10-08 12:00:00.191828+00
2	47	2046663	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-04 05:00:00.204316+00	2025-10-04 05:00:00.303584+00
1	44	1963671	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-02 12:00:00.197278+00	2025-10-02 12:00:00.198713+00
1	52	2154059	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-06 12:00:00.196971+00	2025-10-06 12:00:00.19877+00
1	50	2105672	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-05 12:00:00.212185+00	2025-10-05 12:00:00.219188+00
2	45	1999088	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-03 05:00:00.219356+00	2025-10-03 05:00:00.249056+00
1	48	2060300	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-04 12:00:00.219099+00	2025-10-04 12:00:00.225823+00
1	54	2202453	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-07 12:00:00.231451+00	2025-10-07 12:00:00.237661+00
2	55	2235512	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-08 05:00:00.211513+00	2025-10-08 05:00:00.365228+00
2	53	2188664	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-07 05:00:00.216319+00	2025-10-07 05:00:00.364176+00
2	51	2140238	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-06 05:00:00.205776+00	2025-10-06 05:00:00.285788+00
2	59	2328636	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-10 05:00:00.223752+00	2025-10-10 05:00:00.379265+00
2	57	2282565	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-09 05:00:00.209262+00	2025-10-09 05:00:00.358712+00
1	60	2342081	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-10 12:00:00.21401+00	2025-10-10 12:00:00.219137+00
2	85	2948008	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-23 05:00:00.201942+00	2025-10-23 05:00:00.359106+00
1	76	2720796	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-18 12:00:00.217489+00	2025-10-18 12:00:00.223677+00
1	72	2623593	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-16 12:00:00.206111+00	2025-10-16 12:00:00.207847+00
1	82	2863855	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-21 12:00:00.185326+00	2025-10-21 12:00:00.18633+00
2	73	2658479	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-17 05:00:00.218378+00	2025-10-17 05:00:00.396384+00
1	80	2815299	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-20 12:00:00.215718+00	2025-10-20 12:00:00.221641+00
2	77	2754118	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-19 05:00:00.211762+00	2025-10-19 05:00:00.3808+00
1	74	2672316	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-17 12:00:00.208974+00	2025-10-17 12:00:00.21337+00
1	84	2912732	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-22 12:00:00.186764+00	2025-10-22 12:00:00.192137+00
2	75	2706593	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-18 05:00:00.192326+00	2025-10-18 05:00:00.364324+00
1	78	2767929	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-19 12:00:00.213839+00	2025-10-19 12:00:00.219942+00
2	81	2849692	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-21 05:00:00.223781+00	2025-10-21 05:00:00.346214+00
1	86	2962358	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-23 12:00:00.19297+00	2025-10-23 12:00:00.200348+00
2	79	2801044	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-20 05:00:00.227527+00	2025-10-20 05:00:00.382196+00
2	83	2898784	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-22 05:00:00.197229+00	2025-10-22 05:00:00.348762+00
2	89	3045452	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-25 05:00:00.207126+00	2025-10-25 05:00:00.343008+00
1	88	3010871	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-24 12:00:00.194812+00	2025-10-24 12:00:00.196757+00
2	87	2996767	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-24 05:00:00.202241+00	2025-10-24 05:00:00.359069+00
1	90	3059383	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-25 12:00:00.208999+00	2025-10-25 12:00:00.213927+00
2	98	3289471	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-10-30 05:00:00.355152+00	2025-10-30 05:00:00.500108+00
1	136	141369	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-11-02 12:00:00.183323+00	2025-11-02 12:00:00.1911+00
1	132	44436	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-10-31 12:00:00.30343+00	2025-10-31 12:00:00.306104+00
2	139	226337	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-11-04 05:00:00.230304+00	2025-11-04 05:00:00.385487+00
2	133	79970	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-11-01 05:00:00.176126+00	2025-11-01 05:00:00.304025+00
2	137	176352	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-11-03 05:00:00.335567+00	2025-11-03 05:00:00.470488+00
1	134	94175	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-11-01 12:00:00.173342+00	2025-11-01 12:00:00.180938+00
1	142	288877	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-11-05 12:00:00.228175+00	2025-11-05 12:00:00.235764+00
1	140	240491	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-11-04 12:00:00.239942+00	2025-11-04 12:00:00.242337+00
2	135	127654	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-11-02 05:00:00.18515+00	2025-11-02 05:00:00.325096+00
1	138	190205	postgres	postgres	\r\n    SELECT net.http_post(\r\n        url:='https://<jsbgutbsckwintsnhnno>.supabase.co/functions/v1/obtener-dolar-bna',\r\n        headers:='{"Content-Type": "application/json", "Authorization": "Bearer <eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpzYmd1dGJzY2t3aW50c25obm5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwNjk3MjIsImV4cCI6MjA2ODY0NTcyMn0.aRa4s9rzVIFbPBQYcaPDnbRgFXWZ8jmVDYmO2HhY930>"}'::jsonb\r\n    )\r\n    	failed	ERROR:  schema "net" does not exist\nLINE 2:     SELECT net.http_post(\n                   ^\n	2025-11-03 12:00:00.272324+00	2025-11-03 12:00:00.274552+00
2	141	275100	postgres	postgres	SELECT public.anular_pedidos_reserva_expirada()	succeeded	1 row	2025-11-05 05:00:00.230074+00	2025-11-05 05:00:00.39023+00
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: extensions; Owner: supabase_admin
--

COPY extensions.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: condiciones_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.condiciones_pago (id, created_at, nombre, dias) FROM stdin;
1	2025-08-07 14:10:09.261539+00	60 días con Echeq	60
4	2025-08-07 23:32:47.900257+00	50% Anticipado y 50% Echeq a 30 días	15
5	2025-08-08 00:12:02.609762+00	Transferencia	0
6	2025-08-11 15:23:37.958894+00	30 días transferencia	30
7	2025-08-11 15:47:40.722473+00	30 días FF (50% Facturado)	30
8	2025-08-12 18:50:03.965245+00	no paga	10000
\.


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados (id, created_at, nombre) FROM stdin;
1	2025-07-21 04:29:06.520404+00	Lead
2	2025-07-21 04:29:06.520404+00	Activo
3	2025-07-21 04:29:06.520404+00	Inactivo
6	2025-08-05 15:30:15.794292+00	Archivado
7	2025-08-08 13:49:57.309137+00	Pendiente de Aprobación
\.


--
-- Data for Name: organizaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizaciones (id, nombre, created_at) FROM stdin;
1	BiosPlus	2025-10-29 23:28:27.648496+00
2	IPE	2025-10-29 23:28:27.648496+00
\.


--
-- Data for Name: vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedores (id, created_at, tipo, direccion, porcentaje_comision, meta_ventas) FROM stdin;
13	2025-08-05 15:30:23.613547+00	Vendedor	{"cp": "1852", "zona": "", "calle": "Av Monteverde", "localidad": "Burzaco", "provincia": "Buenos Aires"}	4	40000000
1	2025-07-21 04:29:06.520404+00	Vendedor	{"cp": "", "zona": "", "calle": "", "localidad": "", "provincia": ""}	6	50000000
2	2025-07-21 04:29:06.520404+00	Vendedor	{"cp": "1852", "zona": "", "calle": "Av Monteverde", "localidad": "Burzaco", "provincia": "Buenos Aires"}	10	50000000
16	2025-10-03 11:33:47.954226+00	\N	\N	6	50000000
17	2025-10-05 21:48:35.1997+00	\N	\N	7	500000
18	2025-10-20 15:13:03.702718+00	\N	\N	5	50000000
15	2025-09-24 17:04:19.297555+00	\N	\N	6	5000000
3	2025-07-21 04:52:20.414945+00	Vendedor	{"cp": "B1836", "zona": "BA", "calle": "Argerich 151", "localidad": "Llavallol", "provincia": "Provincia de Buenos Aires"}	6	80000000
4	2025-07-22 17:08:43.34645+00	Vendedor	{"cp": "B1852", "zona": "BA", "calle": "Justo German Bermúdez 1041", "localidad": "Burzaco", "provincia": "Provincia de Buenos Aires"}	1	10000000
19	2025-11-04 19:32:08.184783+00	\N	\N	3	20000000
\.


--
-- Data for Name: zonas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zonas (id, nombre, created_at) FROM stdin;
3	GBA Oeste	2025-10-20 16:45:18.567692+00
4	GBA Sur	2025-10-20 16:45:18.567692+00
5	Rosario	2025-10-20 16:45:18.567692+00
6	Córdoba	2025-10-20 16:45:18.567692+00
7	SF	2025-10-20 16:45:18.567692+00
1	CABA	2025-10-20 16:45:18.567692+00
10	CABA (Capital Federal)	2025-11-04 02:37:33.054953+00
2	GBA Norte	2025-10-20 16:45:18.567692+00
15	Rosario (Centro)	2025-11-04 03:02:22.308955+00
16	Nueva Zona	2025-11-04 15:09:45.25208+00
\.


--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos (id, created_at, nombre, cuit, email, telefono, profesion, especialidades, ultima_compra, domicilio_fiscal, direccion_entrega, direccion_entrega_2, vendedor_id, estado_id, zona, clasificacion, pais, deuda_actual, condicion_pago_id, productos_habituales, entrega_en_sucursal, fecha_ultimo_contacto, historial_whatsapp, condicion_iva, requiere_factura, porcentaje_facturacion_preferido, limite_credito, intereses, codigo_confirmacion, confirmado_sorteo, participa_sorteo, razon_social, numero_iibb, iibb_jurisdiccion, regimen_percepcion_iibb, alicuota_percepcion_iibb, fecha_ultima_consulta_padron, zona_id, organizacion_id) FROM stdin;
274	2025-10-31 14:24:36.917037+00	Leandro Rojas	20360184588	leandrorojas1993@gmail.com	+54 9 362 438-5718	Médico Esteticista	{}	2025-10-31	{"piso": "", "depto": "", "full_address": "Avenida Paraguay 2766, Resistencia, Chaco"}	{"days": "L a V", "piso": "5", "depto": "A", "hours": "8 a 13 y 16 a 21hs", "full_address": "Entre Ríos 142, Resistencia, Chaco"}	{"days": "", "piso": "", "depto": "", "hours": "", "full_address": ""}	3	2	CHA	B	\N	0	6	Cirujano general	f	\N	\N	Monotributista	f	50	1	\N	\N	f	f	ROJAS LEANDRO ISAAC	\N	\N	\N	\N	\N	\N	1
171	2025-09-12 14:16:19.914447+00	Agostina Dellafiore	\N	agostinadellafiore@gmail.com	+54 9 3416 15-2757	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	17	2	\N	\N	\N	0	\N	Revanesse, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f		\N	\N	\N	\N	\N	\N	1
217	2025-09-29 14:32:08.662076+00	Arantxa Iturria	30716912252	yoreparolomas@gmail.com	01164783312	\N	{}	2025-10-06	{"full_address": "Bassi 141 ALEJANDRO KORN"}	{"days": null, "hours": null, "full_address": "Bassi 141 ALEJANDRO KORN"}	{"days": null, "hours": null, "full_address": null}	13	2	BA	\N	\N	0	6	\N	f	\N	\N	Responsable Inscripto	f	100	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
231	2025-10-21 12:52:15.215702+00	Carolina Medina	\N	\N	1131088785	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": "AV LIBERTADOR 918 PISO 6"}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
242	2025-10-21 13:47:14.078852+00	Dapne Perez	\N	\N	1137960129	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Dapne Perez	\N	\N	\N	\N	\N	\N	1
252	2025-10-21 13:58:16.253051+00	Gisela Batet	\N	\N	1151263970	Médico Esteticista	{}	\N	{"full_address": "Avenida Crámer 2454, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": "Avenida Crámer 2454, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Gisela Batet	\N	\N	\N	\N	\N	1	1
263	2025-10-21 14:07:34.470439+00	Sofia Fassere	\N	\N	1144468551	\N	{}	\N	{"full_address": "Avenida del Libertador 5740, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": "SOFIA"}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Sofia Fassere	\N	\N	\N	\N	\N	1	1
194	2025-09-12 17:02:43.751615+00	Lorrany Silva Duarte 	\N	lorranymedicina@gmail.com	+54 9 11 4146-1227	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
222	2025-10-07 16:19:18.002986+00	Caserotto Ana Maria	27208300321	\N	1159589795	\N	{}	2025-10-31	{"full_address": "LAS HERAS GRAL AV. 2881 Piso:5 Dpto:A"}	{"days": "Lunes a viernes", "hours": " 9 a 12  o  de 17 a 20", "full_address": "Avenida General Las Heras 2881, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": " Gutiérrez 3993 7 B"}	3	1	\N	\N	\N	0	\N	\N	f	\N	\N	Monotributista	f	\N	1.00	\N	\N	f	f	Caserotto Ana Maria	\N	\N	\N	\N	\N	\N	1
200	2025-09-12 17:13:16.832336+00	Eugenia Herrera	\N	dermatocosmiatra.eugeniah@gmail.com	+54 9 11 3052-6693	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
120	2025-09-11 15:41:50.459913+00	Graciela Rodríguez Palazzo 	\N	grodriguezpalazzo@gmail.com	+54 9 11 4146-8528	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
133	2025-09-11 16:49:08.525398+00	Eliana Heredia 	\N	elianamheredia@gmail.com	+52 1 55 4902 4602	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
182	2025-09-12 15:15:27.535269+00	Mariana De Rege 	\N	mderege@hotmail.com	+54 9 3462 50-7237	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
232	2025-10-21 13:38:36.607655+00	Valeria Jorge	\N	\N	2646733622	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Valeria Jorge	\N	\N	\N	\N	\N	\N	1
243	2025-10-21 13:49:17.778391+00	Mel Estetica	\N	\N	1153539486	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Mel Estetica	\N	\N	\N	\N	\N	\N	1
253	2025-10-21 13:58:56.072501+00	Ignacio Casal	\N	\N	1157175402	Médico Esteticista	{}	\N	{"full_address": "Pico 2329, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": "Pico 2329, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Ignacio Casal	\N	\N	\N	\N	\N	1	1
272	2025-10-24 16:54:30.469845+00	Juan Palermo	20046401116	Jpalermo@3mundos.com	+54 9 11 5314-0064	Médico Esteticista	{}	2025-10-24	{"full_address": "Libertad 632, Aldo Bonzi, Provincia de Buenos Aires, Argentina"}	{"days": "Lunes y miercoles y viernes", "hours": "8 a 20 hs", "full_address": "Libertad 632, Aldo Bonzi, Provincia de Buenos Aires, Argentina"}	{"days": null, "hours": null, "full_address": null}	3	1	\N	C	\N	0	6	\N	f	\N	\N	Monotributista	f	\N	1.00	\N	\N	f	f	Palermo Juan Antonio	\N	\N	\N	\N	\N	\N	1
117	2025-09-11 15:38:45.039037+00	Geraldine Canteros 	\N	geralcanteros@gmail.com	+54 9 11 5464-6332	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
148	2025-09-11 21:01:28.084811+00	Mónica Morillo 	\N	md.mony.mm@gmail.com	+54 9 11 3806-9282	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Hilos Tensores MINT"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
275	2025-11-04 19:42:29.196426+00	Erika Valker	 3071622182	erivalker@gmail.com	+54 9 11 5715 4102	Médico Esteticista	{"Cirugía Plástica"}	2025-11-04	{"zip": "B1640", "piso": "", "depto": "", "full_address": "Juan José Paso 276, Martínez, Provincia de Buenos Aires"}	{"zip": "B1640", "days": "L aJ", "piso": "", "depto": "", "hours": "7 a 16", "full_address": "Juan José Paso 276, Martínez, Provincia de Buenos Aires"}	{"zip": "", "days": "", "piso": "", "depto": "", "hours": "", "full_address": ""}	19	2	\N	C	\N	0	\N	\N	f	2025-11-04 19:43:42.42+00	\N	Monotributista	t	50	1.00	\N	\N	f	f	Erika	\N	\N	\N	\N	\N	\N	1
151	2025-09-12 00:00:12.283927+00	Roksolana Hnatyuk 	\N	dra.roksolanahnatyuk@gmail.com	+54 9 11 3137-6902	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen","Hilos Tensores MINT",Olidia,Revanesse}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
135	2025-09-12 14:50:36.337416+00	Zina Velasquez 	\N	zinavfernandez@gmail.com	+54 9 11 6812-4374	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
223	2025-10-09 13:23:35.652984+00	Oscar Diaz	20254901394	dentalbeautycba@gmail.com	+54 9 3517 17-1019	Odontólogo	{}	\N	{"full_address": null}	{"days": "lunes a viernes", "hours": "11 A 18", "full_address": "Humberto Primo 630, Córdoba, Córdoba, Argentina"}	{"days": null, "hours": null, "full_address": null}	3	1	COR	C	\N	0	\N	\N	f	\N	\N	Monotributista	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
233	2025-10-21 13:39:54.97168+00	Tania Abasto	\N	\N	1139471145	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Tania Abasto	\N	\N	\N	\N	\N	\N	1
244	2025-10-21 13:49:42.868245+00	Alejandro Luna	\N	\N	3816800105	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Alejandro Luna	\N	\N	\N	\N	\N	\N	1
273	2025-10-27 16:43:12.594915+00	Marisa Lezcano	30714384429	\N	+54 9 11 4979-9959	Médico Esteticista	{}	2025-10-27	{"full_address": null}	{"days": "Lunes a viernes", "hours": "9 a 19hs", "full_address": "Belgrano 162, Ramos Mejía, Provincia de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	3	1	BA	\N	\N	0	\N	Enzimas, Rellenos y Bioestimuladores	f	\N	\N	Responsable Inscripto	f	\N	1.00	\N	\N	f	f	Clinica Dim Rivadavia Sa	\N	\N	\N	\N	\N	\N	1
189	2025-09-12 16:38:55.524377+00	Isabel Badani	\N	badanicapilar@gmail.com	+54 9 11 2476-2105	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	t	\N	\N	\N	\N	\N	\N	\N	1
129	2025-09-11 15:35:38.274772+00	María Lurdes Gallego 	\N	od.luligallego@gmail.com	+54 9 3854 38-1796	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
67	2025-09-01 18:12:25.410203+00	Fabio Uribe	20140159175	fabioupazos@yahoo.com.ar	+5491153860488	medico	{"cirujana plàstica"}	2025-09-02	{"zip": "C1001", "city": "Buenos Aires", "street": "Avenida del Libertador 672", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": "C1001", "city": "Buenos Aires", "days": "Lunes, Martes, Jueves y Viernes", "hours": "12 a 18hs", "street": "Avenida del Libertador 672", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	2	CABA	C	AR	0.00	6	\N	f	\N	\N	\N	f	100	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	1	1
246	2025-10-21 13:50:25.866507+00	Antonella Mazarella 	\N	\N	1130539518	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Antonella Mazarella 	\N	\N	\N	\N	\N	\N	1
256	2025-10-21 14:01:17.804855+00	Melina Conde	\N	\N	1169463227	Médico Esteticista	{}	\N	{"full_address": "Gallo 1184, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Melina Conde	\N	\N	\N	\N	\N	1	1
126	2025-09-11 15:08:55.819429+00	María Eugenia Delgado 	\N	eugedelg@yahoo.com.ar	+54 9 3816 46 6955	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
181	2025-09-12 15:14:45.815679+00	Luciana Nardelli 	\N	lucianavnardelli@gmail.com	+54 9 2604 82-8117	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
254	2025-10-21 13:59:41.166451+00	Mariela Chimielewski	27183676593	\N	1152486135	Médico Esteticista	{}	2025-10-31	{"piso": "1", "depto": "5", "full_address": "HUSARES 2255 T2 1 DPTO 5"}	{"days": "Torre 2, Lunes", "piso": "1", "depto": "5", "hours": "a partir de las 11", "full_address": "Húsares 2255, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	3	1	\N	\N	\N	0	\N	\N	f	\N	\N	Monotributista	f	\N	1	\N	\N	f	f	Mariela Chimielewski	\N	\N	\N	\N	\N	\N	1
173	2025-09-12 14:33:05.882022+00	Lesly De Pablos	\N	corpomedic.ca@gmail.com	1134751300	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	16	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	t	f		\N	\N	\N	\N	\N	\N	1
234	2025-10-21 13:40:47.405653+00	Carolina Cigneti	\N	\N	1150244640	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Carolina Cigneti	\N	\N	\N	\N	\N	\N	1
245	2025-10-21 13:50:08.743203+00	Barbara Andreoli	\N	\N	1131932272	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Barbara Andreoli	\N	\N	\N	\N	\N	\N	1
255	2025-10-21 14:00:31.352571+00	Etel Cohen	\N	\N	1141421901	Médico Esteticista	{}	\N	{"full_address": "La Pampa 5033, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	2025-10-21 15:16:51.374+00	\N	\N	f	\N	1.00	\N	\N	f	f	Etel Cohen	\N	\N	\N	\N	\N	1	1
197	2025-09-12 17:06:06.563785+00	Gabriela Zapata 	\N	dra.gabrielazapatac@gmail.com	+54 9 11 4034-6455	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
203	2025-09-12 17:21:53.041205+00	Otilia Avendaño 	\N	dra.otiliaavendano@gmail.com	+54 9 11 3373-1769	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
130	2025-09-11 16:03:32.360853+00	Elizabeth Corrales	\N	elizabcorrales@gmail.com	+51 982 327 557	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen","Hilos Tensores MINT",Olidia,Revanesse}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
99	2025-09-10 19:47:40.145593+00	Fatima Ines Molina	36227581	fatimaimolina@gmail.com	+54 9 11 3762-8494	medico	{}	2025-09-15	{"zip": "W3450", "city": "Goya", "street": "Mariano I. Loza 930", "province": "Corrientes"}	{"zip": "W3450", "city": "Goya", "days": "Lunes a viernes", "hours": "9 a 18 hs", "street": "Mariano I. Loza 930", "province": "Corrientes"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	1	CRR	\N	AR	0.00	\N	Xeomin, Radiesse y Revanesse	f	\N	\N	\N	f	100	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
219	2025-10-02 17:56:49.918479+00	Soledad Pavon	27296183518	solepavon_4@hotmail.com	+54 9 3516 63-9032	Médico Esteticista	{}	2025-10-02	{"full_address": "25 de Mayo 1617, Puerto Madryn, Chubut"}	{"days": null, "hours": null, "full_address": "Los Paraísos 1794, Puerto Madryn, Chubut"}	{"days": null, "hours": null, "full_address": null}	3	2	CHU	C	\N	1710000.00	7	Olidia Revanesse, Xeomin, Radiesse, Enzimas	t	\N	\N	Monotributista	f	50	1.00	\N	\N	f	f	Soledad Pavon	\N	\N	\N	\N	\N	\N	1
238	2025-10-21 13:43:47.135175+00	Lucia Gut 	\N	\N	1164356143	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Lucia Gut 	\N	\N	\N	\N	\N	\N	1
74	2025-09-02 16:51:07.877112+00	Catalina Gomez Guevara 	27370999274	mariacatalinagg@gmail.com	3462344997	\N	{}	2025-10-24	{"full_address": "Avenida Belgrano 456, Rosario, Santa Fe"}	{"days": "lunes y martes ", "hours": "13 a 16 Dpto C Piso 2", "full_address": "Arenales 3457, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	3	2	SF	C	\N	0.00	7	toxina botulinica, hidroxiapatita de calcio, acido hialuronico	f	\N	\N	Monotributista	f	50	1.00	\N	\N	f	f	Maria Catalina Gomez Guevara 	\N	\N	\N	\N	\N	7	1
249	2025-10-21 13:51:37.911191+00	Eugenia Salvucci	\N	\N	1133149568	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Eugenia Salvucci	\N	\N	\N	\N	\N	\N	1
251	2025-10-21 13:56:45.957297+00	Juan Balestrelli	\N	\N	1157279600	\N	{}	\N	{"full_address": "General Lucio Norberto Mansilla 2935, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Juan Balestrelli	\N	\N	\N	\N	\N	1	1
224	2025-10-15 14:05:33.062004+00	Agostina Dellafiore	27406177195	Agostinadellafiore@gmail.com	3416152757	Médico Esteticista	{}	2025-10-15	{"zip": "S2152", "full_address": "Mont Cenis 4656, Rosario, Santa Fe"}	{"zip": "S2005", "days": "Martes a Viernes", "hours": "9 a 18 hs", "full_address": "Doctor Pedro José Agrelo 2362, Rosario, Santa Fe"}	{"days": null, "hours": null, "full_address": null}	3	1	SF	C	\N	0	5	Smartker Firmness, Hialuronidasa, Multivit. 	f	\N	\N	Monotributista	t	100	1	\N	\N	f	f	Agostina Dellafiore	\N	\N	\N	\N	\N	7	1
215	2025-09-16 15:06:20.125673+00	Bárbara Ferraro	27345198542	byferraro@gmail.com	+54 9 11 2875-8281	cosmiatra	{}	2025-09-16	{"zip": "C1429", "city": "Buenos Aires", "street": "Deheza 2921", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": "C1425", "city": "Buenos Aires", "days": null, "hours": null, "street": "Tagle 2520", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	1	CABA	C	AR	0.00	5	Hialuronidasa	f	\N	\N	\N	f	100	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	1	1
235	2025-10-21 13:41:17.293351+00	Florencia Corbella  	\N	\N	1165844645	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Florencia Corbella  	\N	\N	\N	\N	\N	\N	1
48	2025-08-11 15:22:09.024823+00	Candelaria Bertuzzi	27373955928	Bertuzzic@otamendi.com.ar	+54 9 3415 85-0015	\N	{}	2025-10-14	{"full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": "Martes", "hours": "10 a 12 Hs.", "full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	3	2	CABA	B	\N	0.00	7	Rellenos, Toxinaa	f	\N	\N	Responsable Inscripto	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	1	1
216	2025-09-23 16:05:58.026278+00	Martina Rodriguez Belardinelli	27317091783	marturodbel@gmail.com	+54 9 11 2737-4882	medico	{}	\N	{"zip": "B1814", "city": "Cañuelas", "street": "9 de Julio 2051", "province": "Provincia de Buenos Aires"}	{"zip": "B1814", "city": "Cañuelas", "days": null, "hours": null, "street": "9 de Julio 2051", "province": "Provincia de Buenos Aires"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	1	BA	C	AR	0	5	Olidia	f	\N	\N	\N	f	100	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
85	2025-09-09 11:53:27.239834+00	Mytral Surgery SAS	30716912252	Ceciliapochat@gmail.com	+54 9 11 4061-5095	medico	{"cirujana plástica"}	\N	{"zip": "Q8302", "city": "Neuquén", "street": "Gobernador Anaya 4024", "province": "Neuquén"}	{"zip": "8300", "city": "Neuquén", "days": "Lunes a viernes", "hours": "Barrio La ZAGALA UF84", "street": "Ignacio Rivas 2908", "province": "Neuquén"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	2	NEU	C	AR	0	5	\N	f	\N	\N	\N	f	100	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
236	2025-10-21 13:42:10.387387+00	Eduardo Masaro 	\N	\N	1158604121	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Eduardo Masaro 	\N	\N	\N	\N	\N	\N	1
247	2025-10-21 13:50:55.158511+00	Andrea Castano	\N	\N	1150495332	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Andrea Castano	\N	\N	\N	\N	\N	\N	1
257	2025-10-21 14:02:14.503021+00	Alfredo Cortes	\N	\N	2317538597	Médico Esteticista	{}	\N	{"full_address": "Teniente General Juan Domingo Perón 4190, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Alfredo Cortes	\N	\N	\N	\N	\N	1	1
262	2025-10-21 14:06:44.478666+00	Daniela Esposito 	\N	\N	1135748929	Médico Esteticista	{}	\N	{"full_address": "Segurola 489, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Daniela Esposito 	\N	\N	\N	\N	\N	1	1
121	2025-09-11 15:03:14.912772+00	Maria Fernanda Rodriguez Velazquez	24310600659	mfernandarodriguezv@gmail.com	+54 9 11 6473 9978	Médico Esteticista	{"Ginecología Estética"}	2025-11-03	{"zip": "B1836", "full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	{"zip": "B1836", "days": "Lunes", "piso": "", "depto": "", "hours": "9 a 16", "full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	{"days": "todos", "hours": "8 a 19", "full_address": "av "}	13	2	GBA Sur	B	\N	660000	5	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	Responsable Inscripto	f	\N	1	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	Maria Fernanda Rodriguez Velazquez	\N	\N	\N	\N	\N	4	1
220	2025-10-03 15:43:20.548906+00	Paula Zalazar	:3071849417	paulizalazar96@gmail.com	+54 9 362 454-4593	Odontólogo	{}	2025-11-04	{"full_address": "Calle Zelaya de González 726, Resistencia, Chaco"}	{"days": "Lunes a viernes", "hours": "12 a 18hs", "full_address": "Avenida Rissione 535, Resistencia, Chaco, Argentina"}	{"days": null, "hours": null, "full_address": null}	3	2	CHA	\N	\N	0	6	Revanesse, olidia	f	\N	\N	Responsable Inscripto	t	100	1.00	\N	\N	f	f	 Vz Group Sas	\N	\N	\N	\N	\N	\N	1
225	2025-10-21 12:46:33.904989+00	Valeria Arnowicz	\N	dra.aronowicz@gmail.com	1144077284	\N	{}	\N	{"full_address": "LUIS MARIA CAMPOS 559 Palermo CABA"}	{"days": "Lunes a viernes", "hours": "10 a 12 Hs.", "full_address": "LUIS MARIA CAMPOS 559 Palermo CABA"}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Valeria Arnowicz	\N	\N	\N	\N	\N	\N	1
237	2025-10-21 13:42:52.394104+00	Campos Josiene 	\N	\N	1157670821	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Campos Josiene 	\N	\N	\N	\N	\N	\N	1
248	2025-10-21 13:51:20.157643+00	Carolina Pereira 	\N	\N	1160591978	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Carolina Pereira 	\N	\N	\N	\N	\N	\N	1
258	2025-10-21 14:02:58.097612+00	Laura Cortes	\N	\N	1167968600	Médico Esteticista	{}	\N	{"full_address": "Blanco Encalada 5384, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Laura Cortes	\N	\N	\N	\N	\N	1	1
158	2025-09-12 13:10:46.116627+00	Natalia Cataldi	\N	nataliacataldi@yahoo.com	+5491151514041	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
40	2025-08-08 00:55:32.949996+00	Jose Pablo Cardenas	20288707988	drpablocardenassde@gmail.com	+5493571619160	medico	{}	2025-09-17	{"zip": "G4200", "city": "Santiago del Estero", "street": "Sarmiento 65", "province": "Santiago del Estero"}	{"zip": "G4200", "city": "Santiago del Estero", "days": "Piso 3", "hours": "9:00 a 21:00 hs.", "street": "Sarmiento 65", "province": "Santiago del Estero"}	{"zip": "", "city": "", "days": "", "hours": "", "street": "", "province": ""}	3	2	SGO	A	AR	0.00	5	Speaker Galderma	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
66	2025-08-25 17:24:40.696511+00	Gabarini María Eugenia	27218335948	Eugeniag43@hotmail.com	+54 9 11 4184-8463	medico	{}	2025-09-17	{"zip": "C1429", "city": "C1429BTG", "street": "Crisólogo Larralde 2627", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": "C1429", "city": "C1429BTG", "days": "Lunes a viernes", "hours": "12 a 19", "street": "Crisólogo Larralde 2627", "province": "Ciudad Autónoma de Buenos Aires"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	3	2	CABA	C	AR	0.00	5	Radiesse, suclptra, belotero, Restylane	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	1	1
176	2025-09-12 14:48:43.670127+00	Analia Cristel Bravo Garcia	\N	analia-28cris@hotmail.com	+54 9 11 2695-4187	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
164	2025-09-12 13:55:53.582557+00	Alcorta Milagros 	\N	milagros_alcorta@hotmail.com	1558623678	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
140	2025-09-11 19:37:42.481993+00	Karen Casin	\N	karencasin12@gmail.com	+54 9 2214 94-0597	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
208	2025-09-12 18:02:29.761875+00	Pao Barzola 	\N	pbsrzola@hptmail.com	\N	\N	\N	\N	\N	\N	\N	\N	7	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
153	2025-09-12 02:49:17.768285+00	Magali Narváez 	\N	dramagalinarvaez@gmail.com	+54 9 11 2454-0882	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
124	2025-09-11 15:06:31.393326+00	Lucila Suar	\N	lucila.suar@hotmail.com	+54 9 11 4171-6697	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
152	2025-09-12 02:07:40.728093+00	Maldonado Eliana 	\N	eliana_24@live.com	+54 9 11 2345-6393	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
212	2025-09-12 20:52:32.052517+00	Ana Scoccia	\N	anamariascoccia@gmail.com	+54 9 11 6133-2524	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	t	\N	\N	\N	\N	\N	\N	\N	1
188	2025-09-12 16:36:27.17823+00	Hirvin Vargas	\N	hirvinvargas@gmail.com	+54 9 11 2501-9084	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
196	2025-09-12 17:05:43.530969+00	José Roberto 	\N	jribeirorlopes@gmail.com	+54 9 11 3099-7073	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
202	2025-09-12 17:15:47.455297+00	Julieta Luque	\N	drajulietaluque@yahoo.com.ar	+54 9 362 431-9793	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
160	2025-09-12 13:25:00.991319+00	Gustavo Cano	\N	memgustavo7@gmail.com	1141689209	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
132	2025-09-11 16:45:19.437985+00	Celeste Silva	\N	od.celesilva@gmail.com	+54 9 3816 56-1496	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
259	2025-10-21 14:04:11.343004+00	Adrian Cufaro	\N	\N	1149158133	Médico Esteticista	{}	\N	{"full_address": "Avenida Federico Lacroze 1820, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Adrian Cufaro	\N	\N	\N	\N	\N	1	1
218	2025-10-01 16:58:59.011911+00	HERNAN MALDACENA	30710208936	maldacenah@gmail.com	01128237482	Médico Esteticista	{Flebología}	\N	{"full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	{"full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	\N	3	1	BA	A	\N	0	\N	\N	f	\N	\N	Responsable Inscripto	f	\N	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
39	2025-08-05 16:39:48.412139+00	Anabela Vallica	27337585693	ANABELABALLICA@GMAIL.COM	3834751282	\N	{}	2025-10-14	{"full_address": "Gregorio Juárez de Babiano 322 San Fernando del Valle de Catamarca"}	{"days": null, "hours": "11 A 18", "full_address": "Gregorio Juárez de Babiano 322 San Fernando del Valle de Catamarca"}	{"days": null, "hours": null, "full_address": null}	3	2	CAT	B	AR	0.00	6	\N	f	\N	\N	Monotributista	f	100	1.00	\N	\N	f	f	Anabela Vallica	\N	\N	\N	\N	\N	\N	1
226	2025-10-21 12:47:32.746833+00	Carolina Abal	\N	caroabal5@gmail.com	1551424363	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Carolina Abal	\N	\N	\N	\N	\N	\N	1
227	2025-10-21 12:47:55.742012+00	Zambrana Mariela	\N	\N	1164414320	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Zambrana Mariela	\N	\N	\N	\N	\N	\N	1
239	2025-10-21 13:44:17.93239+00	Lezcano Beatriz	\N	\N	1159633340	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Lezcano Beatriz	\N	\N	\N	\N	\N	\N	1
250	2025-10-21 13:55:54.406956+00	Ines Alo 	\N	\N	1124852020	\N	{}	\N	{"full_address": "Avenida Santa Fe 2911, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": "Avenida Santa Fe 2911, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Ines Alo 	\N	\N	\N	\N	\N	1	1
221	2025-10-03 15:49:36.940683+00	Nadia Elizabeth Chmyzowski	27358045192	nadia.chmy@gmail.com	11-6221-5440	Médico Esteticista	{}	2025-10-03	{"full_address": " Dean Funes 2147, caba"}	{"days": "Lunes a viernes", "hours": "12 a 18hs", "full_address": " Hipólito Yrigoyen 3737, piso 13 depto F, Almagro, caba"}	{"days": null, "hours": null, "full_address": null}	3	1	\N	\N	\N	315000.00	\N	\N	f	\N	\N	Monotributista	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
128	2025-09-11 15:09:44.016047+00	Maccio Ignacio Gabriel	\N	ignaciomacciorigourd@gmail.com	+54 3854 78 4013	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
146	2025-09-11 20:44:57.557487+00	Fernanda Begliardo	\N	fernandabegliardo@gmail.com	+54 9 3492 60-1134	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
145	2025-09-11 20:37:50.329525+00	Roxana Caricato 	\N	rocaricato@hotmail.com	+54 9 11 5794-1137	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
139	2025-09-11 19:33:27.020796+00	Ezequiel Montiel 	\N	montielezequiel.d@gmail.com	+54 9 11 5892-7350	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
260	2025-10-21 14:04:49.884494+00	Gabriela Delgado	\N	\N	1535581828	Médico Esteticista	{}	\N	{"full_address": "Avenida Carrasco 732, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Gabriela Delgado	\N	\N	\N	\N	\N	1	1
170	2025-09-12 14:13:56.823757+00	Sneider Monrroy Burgos 	\N	dr.sneidermb.derma@gmail.com	+54 9 11 7364-8383	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Olidia, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
138	2025-09-11 19:33:12.5365+00	María Cecilia Martín 	\N	ceciliamartin1010@gmail.com	+54 9 2664 54-0805	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
175	2025-09-12 14:39:40.884258+00	Facundo Exequiel 	\N	gerencia.esteticaciac@gmail.com	+54 9 11 6255-1818	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
131	2025-09-11 16:07:25.139702+00	Fernanda Rodriguez	\N	mfernandarodriguezv@gmail.com	+54 9 11 6590-8253	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
183	2025-09-12 15:35:35.862122+00	Addy Mendez	\N	hassanleah60@gmail.com	+54 9 11 3160-8473	\N	{}	\N	{"full_address": ""}	{"days": "", "hours": "", "full_address": ""}	{"days": "", "hours": "", "full_address": ""}	\N	2	\N	\N	\N	0	\N	B	f	\N	\N	\N	f	\N	1	{Revanesse,"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
122	2025-09-11 15:03:19.786778+00	Marcela Cahue	\N	marcelacahue@hotmail.com	+541167160800	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
159	2025-09-12 13:14:27.264893+00	Emanuel Moscatello	\N	moscatelloemanuel@gmail.com	3537678332	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
165	2025-09-12 13:56:21.149803+00	Gallay Romina 	\N	romigallay@hotmail.com.ar	+54 9 3425 44-0915	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
177	2025-09-12 14:48:50.143744+00	Adriana Barnabo 	\N	abarnabo@yahoo.com.ar	+54 9 2622 41-4752	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
195	2025-09-12 17:04:09.912175+00	Thais Cruz 	\N	thaisinhacruz@icloud.com	+54 9 11 6419-0022	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
201	2025-09-12 17:14:23.570122+00	Antonio De Biasi	\N	drdebiasi@gmail.com	+54 9 11 6337-4867	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
213	2025-09-12 20:59:44.030586+00	Liciani Segovia 	\N	licianisegovia@gmail.com	+54 9 2216 22-0341	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	t	\N	\N	\N	\N	\N	\N	\N	1
141	2025-09-11 19:39:53.319394+00	Silvana Giannelli 	\N	silvanagiannelli@hotmail.com	+54 9 2920 58-6671	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
147	2025-09-11 20:52:56.053352+00	Paula Barboza 	\N	florenciabarboza49@gmail.com	+54 9 2901 51-0905	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
166	2025-09-12 14:03:56.07758+00	Jessica Matorras	\N	jessicamatorras@gmail.com	+54 9 3794 99-9953	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
172	2025-09-12 14:20:44.485858+00	María Sol Garrido	\N	solgarr1@hotmail.com	+54 9 3436 20-1740	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
214	2025-09-13 15:29:53.920613+00	Cortes	\N	carinacortes@hotmail.com	+54 9 2234 23-0254	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	t	\N	\N	\N	\N	\N	\N	\N	1
178	2025-09-12 14:49:00.133411+00	Rashida Jure	\N	rashijure@hotmail.com	+54 9 280 420-4040	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
190	2025-09-12 16:40:59.98824+00	Ariel Blachet	\N	drblachet@hotmail.com	+54 9 2936 41-4505	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
184	2025-09-12 15:35:26.308026+00	Matías Sotelo	\N	ezequielmsotelo@gmail.com	1128391705	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
136	2025-09-11 19:26:27.105162+00	Monica Mazzei	\N	monicamazzei77@hotmail.com	+54 9 11 5961-9101	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
185	2025-09-12 16:03:10.923067+00	Soledad Pons	\N	sponsdermatologia@gmail.com	+54 9 11 5319-3583	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
142	2025-09-11 19:40:55.077338+00	Ana Carolina Moriconi	\N	dra.anacarolinamoriconi@gmail.com	+54 9 3584 41-4124	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
154	2025-09-12 12:53:36.012981+00	Mariana Carrera	\N	marianaod.carrera@gmail.com	+54 9 2214 36-2580	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Olidia	f	\N	\N	\N	f	\N	1.00	{Olidia}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
155	2025-09-12 12:53:56.220912+00	Sofia De Franceschi	\N	sofi_df15@hotmail.com	+54 9 2215 46-7306	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
167	2025-09-12 14:03:56.869205+00	Cintia Acuña 	\N	dra.cintiaacuna@gmail.com	+54 9 11 4479-5405	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
179	2025-09-12 14:49:23.474636+00	Claudia Cabeller	\N	claudiacabeller@hotmail.com	+54 9 2616 30-0999	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
161	2025-09-12 13:38:32.541812+00	Lasa	\N	doctorafernandalasa@gmail.com	+54 9 11 5016-7059	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
191	2025-09-12 16:59:04.274131+00	Analía Hadad 	\N	hadadanalia@gmail.com	+54 9 2993 28-0388	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
209	2025-09-12 18:21:26.622966+00	Andrea Alvarez	\N	drandreaalvarez@gmail.com	+54 9 11 6900-2662	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
180	2025-09-12 14:54:27.437187+00	Sabrina Burd	\N	sabri_burd@hotmail.com	+54 9 11 5024-8133	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
76	2025-09-05 13:59:11.093833+00	HERNAN MALDACENA	\N	maldacenah@gmail.com	0111564783312	\N	{}	\N	{"zip": "1852", "city": "Burzaco", "street": "Av Monteverde", "province": "Buenos Aires"}	{"zip": "1852", "city": "Burzaco", "days": null, "hours": "9 a 18 hs", "street": "Av Monteverde", "province": "Buenos Aires"}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	4	2	BA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
228	2025-10-21 12:49:15.58933+00	Liliana Castro	\N	\N	1133556759	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": "SANCHEZ DE BUSTAMANTE 1690"}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
261	2025-10-21 14:05:49.422818+00	Florencia Di Napoli	\N	\N	3329566274	\N	{}	\N	{"full_address": "Alsina 417, Martínez, Provincia de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	BA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
186	2025-09-12 16:09:37.825475+00	Gabriela Alejandra Lopez 	\N	dragabilopez@gmail.com	+54 9 11 3281-2737	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Olidia, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
198	2025-09-12 17:09:42.79168+00	Nadina Marini	\N	nadu.marini@gmail.com	+54 9 3416 92-4472	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
192	2025-09-12 16:59:04.853772+00	Martina Lopez 	\N	martina.caranday@gmail.com	+54 9 2656 41-3222	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
149	2025-09-11 22:24:19.406816+00	Elys Paula De Amorim Bezerra 	\N	draelyspaula@gmail.com	+54 9 11 3783-0931	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
210	2025-09-12 19:02:09.045685+00	Conrado Xavier Muriñigo Iturria 	\N	conra.iturria@gmail.com	+54 9 11 2823-7482	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia}	\N	t	t	\N	\N	\N	\N	\N	\N	\N	1
143	2025-09-11 19:59:54.603537+00	Gabriela Del Valle Teseira 	\N	gvteseira@gmail.com	+54 9 3816 26-2007	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
156	2025-09-12 13:00:01.406206+00	Alejandro Arévalo 	\N	aleare.92@gmail.com	+595 973 759226	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
162	2025-09-12 13:40:33.378131+00	Mariana Hernandez	\N	bramani999@gmail.com	+54 9 11 2780-6358	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
204	2025-09-12 17:39:58.585232+00	Luciana Sánchez 	\N	lulasanchezc@hotmail.comp	+54 9 3816 10-6699	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
168	2025-09-12 14:06:42.651512+00	Cecilia Sáez 	\N	cecinsaez@hotmail.com	3794058368	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
174	2025-09-12 14:33:46.410306+00	Romina Mijalenko 	\N	romina_mijalenko@hotmail.com	1150619322	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
150	2025-09-11 22:24:54.765234+00	Ana Karolina Araujo Montezuma	\N	dra.karolmontezuma@gmail.com	+54 9 11 3446-2020	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
119	2025-09-11 14:36:23.187207+00	Soledad Melgarejo	\N	msmelgarejo@hotmail.com	+54 9 2944 41-7842	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Olidia, Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 1ra Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
157	2025-09-12 13:04:02.76528+00	Elisabet Cristaldo	\N	ecristaldo30@gmail.com	+54 9 11 4405-4480	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Hilos Tensores MINT, Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Hilos Tensores MINT","Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
163	2025-09-12 13:48:05.667925+00	Castro Maria Clara 	\N	clararcastro@hotmail.com	+54 9 2613 42-0984	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
144	2025-09-11 20:37:06.98656+00	Walter Bravo	\N	nkwal@hotmail.com	+54 9 11 5313-1250	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse	f	\N	\N	\N	f	\N	1.00	{Revanesse}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
169	2025-09-12 14:10:05.204959+00	Sneider Monrroy Burgos 	\N	sneidermonroycb@gmail.com	+54 9 11 2406-9515	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{Olidia,"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	f	\N	\N	\N	\N	\N	\N	\N	1
199	2025-09-12 17:11:28.014064+00	Gabriela Laks	\N	gabriela.laks@gmail.com	+54 9 11 4401-3548	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
229	2025-10-21 12:50:35.431286+00	Cristian Suarez	\N	\N	2665018396	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
240	2025-10-21 13:45:04.635678+00	Pamela Aliberreti	\N	\N	1155980706	\N	{}	\N	{"full_address": "Zapiola 2319, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": "ZAPIOLA 2319"}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f	Pamela Aliberreti	\N	\N	\N	\N	\N	1	1
193	2025-09-12 16:59:16.126263+00	Nuño María Jimena 	\N	jimena.nunio@gmail.com	+54 9 11 5828-0270	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 1ra Gen, Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
205	2025-09-12 17:40:32.970512+00	Guillermo Terán 	\N	guillermo.jteran@gmail.com	+54 9 3814 64-8483	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Revanesse, Olidia, Enzimas 1ra Gen	f	\N	\N	\N	f	\N	1.00	{Revanesse,Olidia,"Enzimas 1ra Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
187	2025-09-12 16:34:59.257009+00	Marco Antonio Quino Copa	\N	m.quino@hotmail.com	+54 9 11 2692-0706	\N	{}	\N	{"zip": null, "city": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	{"zip": null, "city": null, "days": null, "hours": null, "street": null, "province": null}	\N	2	\N	\N	\N	0	\N	Enzimas 2da Gen	f	\N	\N	\N	f	\N	1.00	{"Enzimas 2da Gen"}	\N	f	f	\N	\N	\N	\N	\N	\N	\N	1
211	2025-09-12 20:13:20.468056+00	Carol Camacho 	\N	ojitosyriss@hoymail.com	+591 63800701	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	{"Enzimas 1ra Gen","Enzimas 2da Gen"}	\N	t	t	\N	\N	\N	\N	\N	\N	\N	1
230	2025-10-21 12:51:46.61937+00	Paula Benitez	\N	\N	1165189158	\N	{}	\N	{"full_address": null}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	\N	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	\N	1
241	2025-10-21 13:46:31.6827+00	Julieta Professi	\N	\N	\N	\N	{}	\N	{"full_address": "Avenida Coronel Díaz 2177, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	{"days": null, "hours": null, "full_address": null}	{"days": null, "hours": null, "full_address": null}	15	1	CABA	\N	\N	0	\N	\N	f	\N	\N	\N	f	\N	1.00	\N	\N	f	f		\N	\N	\N	\N	\N	1	1
\.


--
-- Data for Name: cuentas_bancarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_bancarias (id, banco, alias, cbu_cvu, cuit, created_at, numero_cuenta, sucursal, organizacion_id) FROM stdin;
4	Galicia	BIOSPLUS.ARGENTINA	0070335020000006888822	30-71622188-8	2025-08-11 13:55:53.463026+00	0006888-8 335-2	335	1
\.


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id, created_at, contacto_id, fecha_pago, monto, metodo_pago, referencia, cuenta_bancaria_id, es_pago_cruzado, comprobante_url, user_id) FROM stdin;
34	2025-09-17 15:15:37.472108+00	74	2025-09-17	1500000.00	Transferencia	\N	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
35	2025-09-18 14:22:22.853389+00	74	2025-09-18	1755000.00	Efectivo	\N	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
36	2025-09-18 18:45:41.668324+00	215	2025-09-18	111600.00	Transferencia	\N	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
37	2025-09-19 12:10:59.661277+00	215	2025-09-19	111600.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_215/cobranza_2025-09-19_b_rbara_ferraro_monto_111600.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
20	2025-08-29 14:21:26.15466+00	66	2025-08-29	500000.00	Transferencia	Pago de Prueba	\N	f	\N	\N
21	2025-08-29 14:54:49.373662+00	66	2025-08-29	500000.00	Transferencia	Pago de Prueba	\N	f	\N	\N
22	2025-09-02 17:36:30.99164+00	67	2025-09-02	825000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_67/cobranza_2025-09-02_fabio_uribe_monto_825000.png	c145694f-77b3-4baf-90c0-c7ebeee69cd6
23	2025-09-05 13:38:16.467007+00	67	2025-09-05	825000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_67/cobranza_2025-09-05_fabio_uribe_monto_825000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
24	2025-09-15 14:16:54.593628+00	99	2025-09-11	630000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_99/cobranza_2025-09-15_fatima_ines_molina_monto_630000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
25	2025-09-17 01:31:54.824708+00	74	2025-09-17	255000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_74/cobranza_2025-09-17_maria_catalina_gomez_guevara__monto_255000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
26	2025-09-17 12:15:02.521833+00	48	2025-09-17	2880000.00	Efectivo	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_48/cobranza_2025-09-17_candelaria_bertuzzi_monto_2880000.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
27	2025-09-17 12:19:57.47411+00	40	2025-09-17	149000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_40/cobranza_2025-09-17_jose_pablo_cardenas_monto_149000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
28	2025-09-17 12:29:02.965661+00	39	2025-08-11	2880000.00	Echeq	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_39/cobranza_2025-09-17_anabela_vallica_monto_2880000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
29	2025-09-17 12:29:29.630693+00	39	2025-08-11	319500.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_39/cobranza_2025-09-17_anabela_vallica_monto_319500.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
30	2025-09-17 12:29:51.178503+00	39	2025-09-04	310500.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_39/cobranza_2025-09-17_anabela_vallica_monto_310500.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
31	2025-09-17 12:31:15.151479+00	39	2025-09-17	9000.00	Efectivo	\N	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
32	2025-09-17 12:34:19.636929+00	66	2025-09-17	216600.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_66/cobranza_2025-09-17_gabarini_mar_a_eugenia_monto_216600.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
33	2025-09-17 15:15:11.046385+00	74	2025-09-17	3255000.00	Efectivo	1500000	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
38	2025-10-06 18:50:36.876095+00	219	2025-10-02	855000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_219/cobranza_2025-10-06_soledad_pavon_monto_855000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
39	2025-10-06 18:53:09.436257+00	221	2025-10-06	315000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_221/cobranza_2025-10-06_nadia_elizabeth_chmyzowski_monto_315000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6
40	2025-10-13 17:30:30.935786+00	121	2025-10-05	330000.00	Migrado del Historial	Anulación de Pedido N°0001-00000055	\N	f	\N	\N
41	2025-10-13 17:30:30.935786+00	121	2025-10-05	330000.00	Migrado del Historial	Anulación de Pedido N°0001-00000056	\N	f	\N	\N
42	2025-10-13 17:30:30.935786+00	222	2025-10-07	336600.00	Migrado del Historial	Anulación de Pedido N°0001-00000062	\N	f	\N	\N
43	2025-10-13 17:30:30.935786+00	121	2025-10-07	2850000.00	Migrado del Historial	Anulación de Pedido N°0001-00000061	\N	f	\N	\N
44	2025-10-13 17:30:30.935786+00	48	2025-10-09	660000.00	Migrado del Historial	Anulación de Pedido N°0001-00000063	\N	f	\N	\N
45	2025-10-13 17:30:30.935786+00	217	2025-10-06	330000.00	Migrado del Historial	Anulación de Pedido N°0001-00000060	\N	f	\N	\N
46	2025-10-15 15:40:12.960722+00	48	2025-10-15	1800000.00	Efectivo	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_48/cobranza_2025-10-15_candelaria_bertuzzi_monto_1800000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
47	2025-10-20 13:01:30.370123+00	224	2025-10-18	324000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_224/cobranza_2025-10-20_agostina_dellafiore_monto_324000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
48	2025-10-20 13:04:53.563523+00	220	2025-10-17	2000000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_220/cobranza_2025-10-20_paula_zalazar_monto_2000000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6
49	2025-10-22 15:49:24.969702+00	220	2025-10-22	1800000.00	Transferencia	2 comprobantes	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_220/cobranza_2025-10-22_paula_zalazar_monto_1800000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6
50	2025-10-27 16:19:15.520258+00	48	2025-10-27	1800000.00	Transferencia	\N	\N	f	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/comprobantes_pago_clientes/cliente_48/cobranza_2025-10-27_candelaria_bertuzzi_monto_1800000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6
51	2025-10-28 15:58:54.712156+00	48	2025-10-27	525000.00	Efectivo	Recibimos y enviamos a Eze con la toxinas	\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
52	2025-11-02 17:58:23.206233+00	121	2025-11-02	41600.00	Transferencia		\N	f	\N	c145694f-77b3-4baf-90c0-c7ebeee69cd6
\.


--
-- Data for Name: aplicacion_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aplicacion_pagos (id, pago_id, monto_aplicado, documento_id, tipo_documento) FROM stdin;
2	23	825000.00	28	Pedido
3	24	630000.00	35	Pedido
4	25	255000.00	29	Pedido
5	26	2880000.00	37	Pedido
6	27	149000.00	38	Pedido
7	28	2880000.00	39	Pedido
8	29	319500.00	40	Pedido
9	30	310500.00	40	Pedido
10	31	9000.00	40	Pedido
11	32	216600.00	41	Pedido
13	34	1500000.00	29	Pedido
14	35	1755000.00	29	Pedido
16	37	111600.00	36	Pedido
17	38	855000.00	76	Pedido
18	39	315000.00	79	Pedido
19	20	216600.00	41	Pedido
20	21	216600.00	41	Pedido
21	22	825000.00	28	Pedido
22	33	3255000.00	29	Pedido
23	36	111600.00	36	Pedido
24	44	660000.00	37	Pedido
25	46	1800000.00	81	Pedido
26	47	324000.00	89	Pedido
27	48	2000000.00	80	Pedido
28	49	1800000.00	80	Pedido
29	50	1800000.00	81	Pedido
30	51	525000.00	88	Pedido
31	52	41600.00	96	Pedido
\.


--
-- Data for Name: depositos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depositos (id, created_at, nombre) FROM stdin;
1	2025-07-27 23:11:57.294275+00	Depósito 1
2	2025-07-27 23:11:57.294275+00	Depósito 2
\.


--
-- Data for Name: estados_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_pedido (id, created_at, nombre, orden) FROM stdin;
1	2025-07-27 23:11:57.294275+00	Pendiente	1
2	2025-07-27 23:11:57.294275+00	En Preparación	2
3	2025-07-27 23:11:57.294275+00	Despachado	3
4	2025-07-27 23:11:57.294275+00	Entregado	4
5	2025-07-27 23:11:57.294275+00	Cancelado	5
6	2025-07-29 20:19:38.950729+00	Preparado	\N
7	2025-09-02 00:00:05.540852+00	Anulado	99
8	2025-09-17 14:30:57.339666+00	Borrador	0
\.


--
-- Data for Name: etapas_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etapas_venta (id, nombre, orden) FROM stdin;
3	Propuesta Enviada	3
5	Ganada	5
6	Perdida	6
7	Pendiente de Aprobación	0
\.


--
-- Data for Name: oportunidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oportunidades (id, created_at, nombre, valor, contacto_id, vendedor_id, etapa_id, fecha_cierre_prevista, numero_propuesta, productos, condicion_pago_id, organizacion_id, observaciones) FROM stdin;
27	2025-09-26 18:02:56.931139+00	Maria Fernanda Rodriguez Velazquez - PBS - 26/9	1015000	121	13	5	2025-09-26	7	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 1v", "cantidad": 35, "subtotal": 1015000, "producto_id": "4", "promo_aplicada": "Precio Aprobado", "precio_unitario": 29000}]	5	1	\N
25	2025-09-26 16:45:27.612222+00	Maria Fernanda Rodriguez Velazquez - OLI - 26/9	2990000	121	13	5	2025-09-26	5	[{"nombre": "Olidia", "cantidad": 13, "subtotal": 2990000, "producto_id": "34", "promo_aplicada": "Precio Aprobado", "precio_unitario": 230000}]	5	1	\N
36	2025-10-03 16:51:26.229728+00	Paula Zalazar - OLI, REV, REV - 3/10	3800000	220	3	5	2025-10-03	16	[{"nombre": "Olidia", "cantidad": 4, "subtotal": 920000, "producto_id": "34", "promo_aplicada": "Precio Manual", "precio_unitario": 230000}, {"nombre": "Revanesse Ultra+", "cantidad": 10, "subtotal": 2400000, "producto_id": "26", "promo_aplicada": "Precio Manual", "precio_unitario": 240000}, {"nombre": "Revanesse Shape+", "cantidad": 2, "subtotal": 480000, "producto_id": "28", "promo_aplicada": "Precio Manual", "precio_unitario": 240000}]	6	1	\N
40	2025-10-16 01:04:53.233482+00	Caserotto Ana Maria - REV, REV - 15/10	1710000	222	3	5	\N	20	[{"nombre": "Revanesse Contour+", "cantidad": 3, "subtotal": 855000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Revanesse Shape+", "cantidad": 3, "subtotal": 855000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	\N	1	\N
41	2025-11-03 19:18:26.130544+00	03-11 Dra. Maria Fernanda - pbserum MEDICAL	409999.95	121	13	3	\N	21	[{"nombre": "PBSerum Medical Medium", "cantidad": 1, "subtotal": 409999.95, "producto_id": 45, "promo_aplicada": "Precio Manual", "precio_unitario": 409999.95}]	5	1	\N
42	2025-11-04 19:45:36.910829+00	04-11 Dra. Erika Valker - Revanesse + pbserum MEDICAL	2715000	275	19	5	\N	22	[{"nombre": "Revanesse Shape+", "cantidad": 7, "subtotal": 1995000, "producto_id": 28, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "PBSerum Medical High", "cantidad": 2, "subtotal": 720000, "producto_id": 46, "promo_aplicada": "Promo Combinada", "precio_unitario": 360000}]	5	1	\N
6	2025-09-09 11:54:47.114059+00	Mytral Surgery SAS - REV - 6/10	1710000	85	3	3	2025-09-19	1	[{"nombre": "Revanesse Shape+", "cantidad": 6, "subtotal": 1710000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	5	1	\N
39	2025-10-07 16:20:34.870871+00	Caserotto Ana Maria - REV, ENV - 7/10	336600	222	3	5	2025-10-07	19	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 330000, "producto_id": "35", "promo_aplicada": "Promo Combinada", "precio_unitario": 330000}, {"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "producto_id": "33", "promo_aplicada": null, "precio_unitario": 6600}]	\N	1	\N
28	2025-09-26 19:12:51.686589+00	Maria Fernanda Rodriguez Velazquez - REV - 26/9	2990000	121	13	5	2025-09-26	8	[{"nombre": "Revanesse Kiss+", "cantidad": 13, "subtotal": 2990000, "producto_id": "25", "promo_aplicada": "Precio Aprobado", "precio_unitario": 230000}]	5	1	\N
\.


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id, created_at, numero_pedido, oportunidad_id, contacto_id, vendedor_id, deposito_principal_id, estado_id, productos, valor, direccion_entrega, dia_hora_entrega, observaciones, pagos_efectuados, cobrar_en_entrega, monto_a_cobrar, condicion_pago_id, estado_pago, origen_stock, fecha_entrega_prevista, reserva_creada, reserva_confirmada, modalidad_entrega, organizacion_id) FROM stdin;
94	2025-10-31 15:22:40.954644+00	0001-00000072	\N	274	3	1	6	[{"nombre": "Revanesse Shape+", "cantidad": 7, "subtotal": 1995000, "lote_numero": "8987", "producto_id": 28, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000, "fecha_vencimiento": "2028-02-02", "lote_seleccionado_id": 8}, {"nombre": "Revanesse Ultra+", "cantidad": 3, "subtotal": 855000, "lote_numero": "8955", "producto_id": 38, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000, "fecha_vencimiento": "2028-02-02", "lote_seleccionado_id": 9}]	2850000	{"days": "L a V", "piso": "5", "depto": "A", "hours": "8 a 13 y 16 a 21hs", "full_address": "Entre Ríos 142, Resistencia, Chaco"}	L a V 8 a 13 y 16 a 21hs		\N	f	0	6	Pendiente	deposito_principal	2025-10-31	f	f	DOMICILIO	1
101	2025-11-04 11:09:00.038853+00	0001-00000083	\N	220	3	1	2	[{"nombre": "Revanesse Ultra+", "cantidad": 12, "subtotal": 3180000, "lote_numero": "8955", "producto_id": 38, "promo_aplicada": "Promo Combinada", "precio_unitario": 265000, "fecha_vencimiento": "2028-02-02", "lote_seleccionado_id": 21}, {"nombre": "Olidia (Bioestimulador PLLA)", "cantidad": 4, "subtotal": 1020000, "lote_numero": "CARGA-INICIAL-2025", "producto_id": 43, "promo_aplicada": "Promo Combinada", "precio_unitario": 255000, "fecha_vencimiento": "2029-12-31", "lote_seleccionado_id": 26}]	4200000	\N	Lunes a viernes 12 a 18hs	Retira en sucursal 	\N	f	0	6	Pendiente	deposito_principal	2025-11-04	f	f	SUCURSAL_CORREO	1
42	2025-09-17 13:56:46.864329+00	0001-00000017	\N	66	3	1	7	[{"nombre": "Envio al Interior", "cantidad": 1, "subtotal": 9000, "producto_id": "36", "promo_aplicada": null, "precio_unitario": 9000}]	9000	{"zip": "C1429", "city": "C1429BTG", "days": "Lunes a viernes", "hours": "12 a 19", "street": "Crisólogo Larralde 2627", "province": "Ciudad Autónoma de Buenos Aires"}			\N	f	0	5	Pendiente	stock_vendedor	\N	f	f	DOMICILIO	1
90	2025-10-24 16:58:08.644901+00	0001-00000068	\N	272	3	1	4	[{"nombre": "Revanesse Ultra+", "cantidad": 3, "subtotal": 900000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 300000, "lote_seleccionado_id": 9}]	900000	{"days": "Lunes y miercoles y viernes", "hours": "8 a 20 hs", "full_address": "Libertad 632, Aldo Bonzi, Provincia de Buenos Aires, Argentina"}	8 a 20 Lun, Mier, Vier		\N	f	0	6	Pendiente	deposito_principal	2025-10-27	f	f	DOMICILIO	1
102	2025-11-04 19:47:45.033825+00	0001-00000084	42	275	19	1	2	[{"nombre": "Revanesse Shape+", "cantidad": 7, "subtotal": 1995000, "producto_id": 28, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000, "lote_seleccionado_id": 8}, {"nombre": "PBSerum Medical High", "cantidad": 2, "subtotal": 720000, "producto_id": 46, "promo_aplicada": "Promo Combinada", "precio_unitario": 360000, "lote_seleccionado_id": 29}]	2723000	{"zip": "B1640", "days": "L aJ", "piso": "", "depto": "", "hours": "7 a 16", "full_address": "Juan José Paso 276, Martínez, Provincia de Buenos Aires"}	L aJ 7 a 16	\N	\N	f	0	5	Pendiente	deposito_principal	2025-11-06	f	f	DOMICILIO	1
95	2025-10-31 17:53:53.79581+00	0001-00000073	\N	254	3	1	2	[{"nombre": "DRAIN+ Hialuronidasa (1 vial)", "cantidad": 1, "subtotal": 35000, "lote_numero": "CARGA-INICIAL-2025", "producto_id": 55, "promo_aplicada": null, "precio_unitario": 35000, "fecha_vencimiento": "2029-12-31", "lote_seleccionado_id": 38}, {"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "lote_numero": "8988", "producto_id": 33, "promo_aplicada": null, "precio_unitario": 6600, "fecha_vencimiento": "2029-08-02", "lote_seleccionado_id": 10}]	41600	{"days": "Torre 2, Lunes", "piso": "1", "depto": "5", "hours": "a partir de las 11", "full_address": "Húsares 2255, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	Torre 2, Lunes a partir de las 11	\N	\N	f	0	5	Pendiente	deposito_principal	2025-11-03	f	f	DOMICILIO	1
55	2025-09-26 19:44:23.332686+00	0001-00000033	25	121	13	1	7	[{"nombre": "Olidia", "cantidad": 13, "subtotal": 2860000, "producto_id": "34", "promo_aplicada": "Precio Aprobado", "precio_unitario": 220000}]	2860000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}	9 a 18		\N	f	0	5	Pendiente	deposito_principal	2025-09-26	f	f	DOMICILIO	1
63	2025-09-30 18:46:02.667987+00	0001-00000042	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000, "lote_seleccionado_id": null}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	2025-10-02	f	f	DOMICILIO	1
96	2025-10-31 18:13:17.757353+00	0001-00000074	\N	121	13	1	2	[{"nombre": "DRAIN+ Hialuronidasa (1 vial)", "cantidad": 1, "subtotal": 35000, "lote_numero": "CARGA-INICIAL-2025", "producto_id": 55, "promo_aplicada": null, "precio_unitario": 35000, "fecha_vencimiento": "2029-12-31", "lote_seleccionado_id": 38}, {"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "lote_numero": "8988", "producto_id": 33, "promo_aplicada": null, "precio_unitario": 6600, "fecha_vencimiento": "2029-08-02", "lote_seleccionado_id": 10}]	41600	{"days": "Lunes", "hours": "9 a 16", "full_address": "Sarmiento 113, Rivadavia, Mendoza"}	Lunes 9 a 16	\N	\N	f	0	5	Pendiente	deposito_principal	2025-11-01	f	f	DOMICILIO	1
97	2025-10-31 18:52:54.133333+00	0001-00000077	40	222	3	1	7	[{"nombre": "Revanesse Contour+", "cantidad": 3, "subtotal": 855000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Revanesse Shape+", "cantidad": 3, "subtotal": 855000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	1710000	{"days": "Lunes a viernes", "hours": " 9 a 12  o  de 17 a 20", "full_address": "Avenida General Las Heras 2881, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	Lunes a viernes  9 a 12  o  de 17 a 20	\N	\N	f	0	6	Pendiente	deposito_principal	2025-11-07	f	f	DOMICILIO	1
78	2025-10-03 12:11:27.004844+00	0001-00000055	\N	121	13	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 330000, "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000}]	330000	\N	9 a 18		\N	f	0	5	Pendiente	deposito_principal	2025-10-03	f	f	OFICINA_COMERCIAL	1
91	2025-10-24 17:18:04.701245+00	0001-00000069	\N	74	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 2, "subtotal": 210000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 2, "subtotal": 210000, "producto_id": 31, "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 2, "subtotal": 210000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000}]	630000	{"days": "lunes y martes ", "hours": "13 a 16 Dpto C Piso 2", "full_address": "Arenales 3457, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	13 a 16 Hs. Dpto C Piso 2	(les aviso si me cambia el horario)	\N	f	0	7	Pendiente	deposito_principal	2025-10-27	f	f	DOMICILIO	1
50	2025-09-22 14:45:22.212679+00	0001-00000025	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 240000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Ultra+", "cantidad": 2, "subtotal": 480000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Olidia", "cantidad": 10, "subtotal": 2300000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 230000}, {"nombre": "Olidia", "cantidad": 15, "subtotal": 3450000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 230000}, {"nombre": "Olidia", "cantidad": 15, "subtotal": 3450000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 230000}]	9920000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	stock_vendedor	2025-09-23	f	f	DOMICILIO	1
67	2025-09-30 19:33:55.896378+00	0001-00000045	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
64	2025-09-30 18:46:02.6744+00	0001-00000041	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000, "lote_seleccionado_id": null}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	2025-10-02	f	f	DOMICILIO	1
74	2025-10-02 18:14:01.220433+00	0001-00000052	\N	219	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 285000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Olidia", "cantidad": 5, "subtotal": 1425000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	1710000	{"zip": "", "city": "Puerto Madryn", "street": "los paraisos 1794", "province": "Chubut"}		Retira en sucursal	\N	f	0	7	Pendiente	deposito_principal	2025-10-03	f	f	DOMICILIO	1
92	2025-10-27 16:44:22.034793+00	0001-00000070	\N	273	3	1	2	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 3}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": 31, "promo_aplicada": "Precio x1", "precio_unitario": 105000, "lote_seleccionado_id": 5}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 1, "subtotal": 105000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 4}]	315000	{"days": "Lunes a viernes", "hours": "9 a 19hs", "full_address": "Belgrano 162, Ramos Mejía, Provincia de Buenos Aires"}	9 a 19	Envío bonificado, Pedido válido abonando dentro de los 7 dias. Solicitaron Factura para el proceso de pago	\N	f	0	5	Pendiente	deposito_principal	2025-10-04	f	f	DOMICILIO	1
70	2025-09-30 22:45:08.80412+00	0001-00000048	\N	39	3	1	7	[{"nombre": "Olidia", "cantidad": 1, "subtotal": 210000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 210000}]	210000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
59	2025-09-30 03:13:24.846242+00	0001-00000038	\N	39	3	1	7	[{"nombre": "Olidia", "cantidad": 1, "subtotal": 270000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 270000, "lote_seleccionado_id": null}]	270000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
77	2025-10-03 12:11:26.998864+00	0001-00000056	\N	121	13	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 330000, "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000}]	330000	\N	12		\N	f	0	5	Pendiente	deposito_principal	2025-10-03	f	f	OFICINA_COMERCIAL	1
81	2025-10-06 12:19:15.434943+00	0001-00000059	\N	48	3	1	4	[{"nombre": "Revanesse Contour+", "cantidad": 6, "subtotal": 1590000, "producto_id": 27, "promo_aplicada": "Promo Combinada", "precio_unitario": 265000}, {"nombre": "Revanesse Ultra+", "cantidad": 6, "subtotal": 1590000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 265000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 2, "subtotal": 210000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": 31, "promo_aplicada": null, "precio_unitario": 105000}]	3600000	{"days": "Martes", "hours": "10 a 12 Hs.", "full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	martes  13 a 16 hs		\N	f	0	7	Pendiente	deposito_principal	2025-10-07	f	f	DOMICILIO	1
98	2025-11-02 19:01:47.127049+00	0001-00000078	\N	121	13	1	7	[{"nombre": "MINT FINE Pre-cannulated (1 caja x 5 pouches)", "cantidad": 1, "subtotal": 1150000, "lote_numero": "CARGA-INICIAL-2025", "producto_id": 49, "promo_aplicada": null, "precio_unitario": 1150000, "fecha_vencimiento": "2029-12-31", "lote_seleccionado_id": 32}]	1150000	{"days": "Lunes", "hours": "9 a 16", "full_address": "Sarmiento 113, Rivadavia, Mendoza"}	Lunes 9 a 16	\N	\N	f	0	5	Pendiente	deposito_principal	2025-11-04	f	f	DOMICILIO	1
36	2025-09-16 15:44:59.544626+00	0001-00000004	\N	215	3	1	4	[{"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "producto_id": "33", "promo_aplicada": null, "precio_unitario": 6600}, {"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": "3", "promo_aplicada": null, "precio_unitario": 105000}]	111600	{"zip": "C1425", "city": "Buenos Aires", "days": null, "hours": null, "street": "Tagle 2520", "province": "Ciudad Autónoma de Buenos Aires"}	10 a 16 hs		\N	f	0	5	Pendiente	stock_vendedor	2025-09-24	f	f	DOMICILIO	1
39	2025-09-17 12:23:55.727802+00	0001-00000010	\N	39	3	1	4	[{"nombre": "Revanesse Shape+", "cantidad": 6, "subtotal": 1440000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Ultra+", "cantidad": 5, "subtotal": 1200000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Kiss+", "cantidad": 1, "subtotal": 240000, "producto_id": "25", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}]	2880000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	1	Pendiente	stock_vendedor	2025-08-06	f	f	DOMICILIO	1
56	2025-09-29 14:33:48.004272+00	0001-00000034	\N	217	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "1864", "city": "ALEJANDRO KORN", "days": null, "hours": null, "street": "Bassi 141", "province": "Buenos Aires"}			\N	f	0	6	Pendiente	deposito_principal	2025-10-01	f	f	DOMICILIO	1
62	2025-09-30 03:28:45.797886+00	0001-00000040	\N	39	3	1	7	[{"nombre": "Revanesse Shape+", "cantidad": 1, "subtotal": 310000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000, "lote_seleccionado_id": null}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
58	2025-09-29 19:15:33.777586+00	0001-00000036	\N	217	3	1	7	[{"nombre": "Revanesse Shape+", "cantidad": 2, "subtotal": 460000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 230000}]	460000	{"zip": "1864", "city": "ALEJANDRO KORN", "days": null, "hours": null, "street": "Bassi 141", "province": "Buenos Aires"}			\N	f	0	6	Pendiente	stock_vendedor	\N	f	f	DOMICILIO	1
68	2025-09-30 19:33:55.903992+00	0001-00000046	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
73	2025-10-02 18:14:01.217117+00	0001-00000051	\N	219	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 285000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Olidia", "cantidad": 5, "subtotal": 1425000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	1710000	{"zip": "", "city": "", "street": "", "province": ""}		Se entrega en sucursal	\N	f	0	7	Pendiente	deposito_principal	2025-10-03	f	f	DOMICILIO	1
75	2025-10-02 20:57:18.057931+00	0001-00000054	\N	219	3	1	7	[{"nombre": "Olidia", "cantidad": 5, "subtotal": 1425000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 285000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	1710000	{"isSucursal": true}			\N	f	0	7	Pendiente	deposito_principal	2025-10-15	f	f	DOMICILIO	1
72	2025-10-01 18:34:08.363883+00	0001-00000050	\N	121	13	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 5, "subtotal": 1375000, "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 275000, "lote_seleccionado_id": 13}]	1375000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}	9 a 18		\N	f	0	5	Pendiente	deposito_principal	2025-10-01	f	f	DOMICILIO	1
76	2025-10-02 20:57:18.067243+00	0001-00000053	\N	219	3	1	4	[{"nombre": "Olidia", "cantidad": 5, "subtotal": 1425000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 285000, "producto_id": 26, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}]	1710000	\N	11 a 16 hs.		\N	f	0	7	Pendiente	deposito_principal	2025-10-15	f	f	OFICINA_COMERCIAL	1
41	2025-09-17 12:33:43.85258+00	0001-00000012	\N	66	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": "3", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": "31", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "producto_id": "33", "promo_aplicada": null, "precio_unitario": 6600}]	216600	{"zip": "C1429", "city": "C1429BTG", "days": "Lunes a viernes", "hours": "12 a 19", "street": "Crisólogo Larralde 2627", "province": "Ciudad Autónoma de Buenos Aires"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	5	Pendiente	stock_vendedor	2025-08-25	f	f	DOMICILIO	1
57	2025-09-29 15:40:19.504169+00	0001-00000035	\N	217	3	1	7	[{"nombre": "Revanesse Shape+", "cantidad": 1, "subtotal": 310000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "1864", "city": "ALEJANDRO KORN", "days": null, "hours": null, "street": "Bassi 141", "province": "Buenos Aires"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	6	Pendiente	deposito_principal	2025-09-30	f	f	DOMICILIO	1
40	2025-09-17 12:25:32.644451+00	0001-00000011	\N	39	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 2, "subtotal": 210000, "producto_id": "3", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 2, "subtotal": 210000, "producto_id": "2", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 2, "subtotal": 210000, "producto_id": "31", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "Envio al Interior", "cantidad": 1, "subtotal": 9000, "producto_id": "36", "promo_aplicada": null, "precio_unitario": 9000}]	639000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	5	Pendiente	stock_vendedor	2025-08-07	f	f	DOMICILIO	1
35	2025-09-15 13:58:58.624732+00	0001-00000003	\N	99	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 2, "subtotal": 210000, "producto_id": "3", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 2, "subtotal": 210000, "producto_id": "2", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 2, "subtotal": 210000, "producto_id": "31", "promo_aplicada": null, "precio_unitario": 105000}]	630000	{"zip": "W3450", "city": "Goya", "days": "Lunes a viernes", "hours": "9 a 18 hs", "street": "Mariano I. Loza 930", "province": "Corrientes"}	9 a 16		\N	f	0	5	Pendiente	stock_vendedor	2025-09-16	f	f	DOMICILIO	1
37	2025-09-17 12:08:06.072388+00	0001-00000005	\N	48	3	1	4	[{"nombre": "Revanesse Contour+", "cantidad": 6, "subtotal": 1440000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Ultra+", "cantidad": 6, "subtotal": 1440000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}]	2880000	{"zip": "C1429", "city": "Buenos Aires", "days": "Martes", "hours": "10 a 12 Hs.", "street": "Vuelta de Obligado 3352", "province": "Ciudad Autónoma de Buenos Aires"}			\N	f	0	7	Pendiente	stock_vendedor	2025-08-11	f	f	DOMICILIO	1
61	2025-09-30 03:28:45.77881+00	0001-00000039	\N	39	3	1	7	[{"nombre": "Revanesse Shape+", "cantidad": 1, "subtotal": 310000, "producto_id": "28", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000, "lote_seleccionado_id": null}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
66	2025-09-30 19:33:45.942697+00	0001-00000044	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
69	2025-09-30 22:45:08.801563+00	0001-00000047	\N	39	3	1	7	[{"nombre": "Olidia", "cantidad": 1, "subtotal": 210000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 210000, "lote_seleccionado_id": 1}]	210000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
71	2025-10-01 18:34:08.352788+00	0001-00000049	\N	121	13	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 5, "subtotal": 1375000, "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 275000, "lote_seleccionado_id": 13}]	1375000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}	9 a 18		\N	f	0	5	Pendiente	deposito_principal	2025-10-01	f	f	DOMICILIO	1
65	2025-09-30 19:33:45.93185+00	0001-00000043	\N	39	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
60	2025-09-30 03:13:24.841851+00	0001-00000037	\N	39	3	1	7	[{"nombre": "Olidia", "cantidad": 1, "subtotal": 310000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000, "lote_seleccionado_id": null}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
38	2025-09-17 12:18:18.402592+00	0001-00000009	\N	40	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 1v", "cantidad": 4, "subtotal": 140000, "producto_id": "4", "promo_aplicada": null, "precio_unitario": 35000}, {"nombre": "Envio al Interior", "cantidad": 1, "subtotal": 9000, "producto_id": "36", "promo_aplicada": null, "precio_unitario": 9000}]	149000	{"zip": "G4200", "city": "Santiago del Estero", "days": "Piso 3", "hours": "9:00 a 21:00 hs.", "street": "Sarmiento 65", "province": "Santiago del Estero"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	5	Pendiente	stock_vendedor	2025-08-07	f	f	DOMICILIO	1
29	2025-09-02 19:19:22.439005+00	0001-00000002	\N	74	3	1	4	[{"nombre": "Revanesse Contour+", "cantidad": 5, "subtotal": 1200000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Ultra+", "cantidad": 3, "subtotal": 720000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "Revanesse Revise +", "cantidad": 4, "subtotal": 960000, "producto_id": "35", "promo_aplicada": "Promo Combinada", "precio_unitario": 240000}, {"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 2, "subtotal": 210000, "producto_id": "3", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 2, "subtotal": 210000, "producto_id": "2", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 2, "subtotal": 210000, "producto_id": "31", "promo_aplicada": null, "precio_unitario": 105000}, {"nombre": "Envío a caba Bonificado", "cantidad": 1, "subtotal": 0, "producto_id": "32", "promo_aplicada": null, "precio_unitario": 0}]	3510000	{"zip": "C1425", "city": "Buenos Aires", "days": "lunes y martes ", "hours": "13 a 16 hs", "street": "Arenales 3457", "province": "Ciudad Autónoma de Buenos Aires"}	11 a 16 hs.		\N	f	0	7	Pendiente	stock_vendedor	2025-09-05	f	f	DOMICILIO	1
43	2025-09-17 14:23:16.822723+00	0001-00000018	\N	39	3	1	7	[{"nombre": "Revanesse Contour+", "cantidad": 1, "subtotal": 310000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
44	2025-09-17 15:10:37.004151+00	0001-00000019	\N	39	3	1	7	[{"nombre": "Envio al Interior", "cantidad": 1, "subtotal": 9000, "producto_id": "36", "promo_aplicada": null, "precio_unitario": 9000}]	9000	{"zip": "K4700", "city": "San Fernando del Valle de Catamarca", "days": null, "hours": "11 A 18", "street": "Gregorio Juárez de Babiano 322", "province": "Catamarca"}			\N	f	0	5	Pendiente	stock_vendedor	\N	f	f	DOMICILIO	1
49	2025-09-19 19:26:41.246815+00	0001-00000024	\N	48	3	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "C1429", "city": "Buenos Aires", "days": "Martes", "hours": "10 a 12 Hs.", "street": "Vuelta de Obligado 3352", "province": "Ciudad Autónoma de Buenos Aires"}			\N	f	0	7	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
46	2025-09-18 20:54:46.278188+00	0001-00000021	\N	48	3	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 310000, "producto_id": "35", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "C1429", "city": "Buenos Aires", "days": "Martes", "hours": "10 a 12 Hs.", "street": "Vuelta de Obligado 3352", "province": "Ciudad Autónoma de Buenos Aires"}	Lunes y miercoles y viernes 9 a 18 hs		\N	f	0	7	Pendiente	deposito_principal	2025-09-03	f	f	DOMICILIO	1
47	2025-09-18 22:11:54.351093+00	0001-00000022	\N	121	13	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}	Lunes y miercoles 9 a 18 hs		\N	f	0	5	Pendiente	deposito_principal	2025-09-19	f	f	DOMICILIO	1
48	2025-09-19 19:16:59.538518+00	0001-00000023	\N	48	3	1	7	[{"nombre": "Revanesse Kiss+", "cantidad": 1, "subtotal": 310000, "producto_id": "25", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "C1429", "city": "Buenos Aires", "days": "Martes", "hours": "10 a 12 Hs.", "street": "Vuelta de Obligado 3352", "province": "Ciudad Autónoma de Buenos Aires"}			\N	f	0	7	Pendiente	stock_vendedor	2025-09-19	f	f	DOMICILIO	1
52	2025-09-23 19:05:11.782228+00	0001-00000030	\N	121	13	1	7	[{"nombre": "Revanesse Contour+", "cantidad": 1, "subtotal": 310000, "producto_id": "27", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
51	2025-09-23 18:22:01.2657+00	0001-00000029	\N	121	13	1	7	[{"nombre": "Revanesse Ultra+", "cantidad": 1, "subtotal": 310000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 310000}]	310000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}			\N	f	0	5	Pendiente	deposito_principal	2025-09-17	f	f	DOMICILIO	1
53	2025-09-26 19:26:29.883101+00	0001-00000031	28	121	13	1	7	[{"nombre": "Revanesse Kiss+", "cantidad": 13, "subtotal": 2990000, "producto_id": "25", "promo_aplicada": "Precio Aprobado", "precio_unitario": 230000}]	2990000	{"zip": "1836", "city": "LLavallol", "days": null, "hours": null, "street": "Argerich 151", "province": "Buenos Aires"}			\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
80	2025-10-05 21:37:05.742387+00	0001-00000058	\N	220	3	1	4	[{"nombre": "Olidia", "cantidad": 4, "subtotal": 920000, "producto_id": 34, "promo_aplicada": "Precio Manual", "precio_unitario": 230000}, {"nombre": "Revanesse Ultra+", "cantidad": 10, "subtotal": 2400000, "producto_id": 26, "promo_aplicada": "Precio Manual", "precio_unitario": 240000}, {"nombre": "Revanesse Shape+", "cantidad": 2, "subtotal": 480000, "producto_id": 28, "promo_aplicada": "Precio Manual", "precio_unitario": 240000}]	3800000	{"days": "Lunes a viernes", "hours": "12 a 18hs", "full_address": "ZELAYA DE GONZALEZ 726 - BARRIO : LOS TRONCOS RESISTENCIA  3500-CHACO"}			\N	f	0	6	Pendiente	deposito_principal	2025-10-07	f	f	DOMICILIO	1
82	2025-10-06 12:29:33.444018+00	0001-00000060	\N	217	3	1	7	[{"nombre": "Revanesse Contour+", "cantidad": 1, "subtotal": 330000, "producto_id": 27, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000, "lote_seleccionado_id": 6}]	330000	{"full_address": "Junín 3035 piso 6, Santa Fe Capital, Santa Fe"}	Lunes y miercoles 9 a 18 hs		\N	f	0	6	Pendiente	deposito_principal	2025-10-06	f	f	DOMICILIO	1
79	2025-10-03 16:36:13.472799+00	0001-00000057	\N	221	3	1	4	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 3}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 1, "subtotal": 105000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 4}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": 31, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 5}]	315000	{"days": "Lunes a viernes", "hours": "12 a 18hs", "full_address": " Hipólito Yrigoyen 3737, piso 13 depto F, Almagro, caba"}	24 hs	dejar en porteria	\N	f	0	5	Pendiente	deposito_principal	2025-10-06	f	f	DOMICILIO	1
84	2025-10-07 16:21:54.258751+00	0001-00000062	39	222	3	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 330000, "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000, "lote_seleccionado_id": 13}, {"nombre": "Envio a caba", "cantidad": 1, "subtotal": 6600, "producto_id": 33, "promo_aplicada": null, "precio_unitario": 6600, "lote_seleccionado_id": 10}]	336600	{"days": "Lunes a viernes", "hours": " 9 a 12  o  de 17 a 20", "full_address": "Avenida General Las Heras 2881, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	de 9a 12hs o de 17 a 20hs		\N	f	0	1	Pendiente	deposito_principal	2025-10-08	f	f	DOMICILIO	1
83	2025-10-07 14:38:16.472695+00	0001-00000061	\N	121	13	1	7	[{"nombre": "Revanesse Shape+", "cantidad": 10, "subtotal": 2850000, "producto_id": 28, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000, "lote_seleccionado_id": 8}]	2850000	{"days": "Lunes", "hours": "9 a 16", "full_address": "Sarmiento 113, Rivadavia, Mendoza"}	12		\N	f	0	5	Pendiente	deposito_principal	2025-10-08	f	f	DOMICILIO	1
85	2025-10-09 15:46:51.917556+00	0001-00000063	\N	48	16	1	7	[{"nombre": "Olidia", "cantidad": 1, "subtotal": 330000, "producto_id": 34, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000, "lote_seleccionado_id": 1}, {"nombre": "Revanesse Contour+", "cantidad": 1, "subtotal": 330000, "producto_id": 27, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000, "lote_seleccionado_id": 6}]	660000	{"days": "Martes", "hours": "10 a 12 Hs.", "full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}			\N	f	0	6	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
28	2025-09-02 19:04:05.225082+00	0001-00000001	\N	67	3	1	4	[{"nombre": "Olidia", "cantidad": 3, "subtotal": 825000, "producto_id": "34", "promo_aplicada": "Promo Combinada", "precio_unitario": 275000}, {"nombre": "Envío a caba Bonificado", "cantidad": 1, "subtotal": 0, "producto_id": "32", "promo_aplicada": null, "precio_unitario": 0}]	825000	{"zip": "C1001", "city": "Buenos Aires", "days": "Lunes, Martes, Jueves y Viernes", "hours": "12 a 18hs", "street": "Avenida del Libertador 672", "province": "Ciudad Autónoma de Buenos Aires"}	Jueves 12 a 18hs	Dejar a nombre de Fabio Uribe	\N	f	0	6	Pendiente	stock_vendedor	2025-09-04	f	f	DOMICILIO	1
54	2025-09-26 19:27:58.024776+00	0001-00000032	27	121	13	1	7	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 1v", "cantidad": 35, "subtotal": 1015000, "producto_id": "4", "promo_aplicada": "Precio Aprobado", "precio_unitario": 29000}]	1015000	{"days": "Lunes", "hours": "9 a 16", "full_address": "Sarmiento 113, Rivadavia, Mendoza"}	Lunes 9 a 16		\N	f	0	5	Pendiente	deposito_principal	2025-09-26	f	f	DOMICILIO	1
99	2025-11-02 23:24:24.916116+00	0001-00000080	\N	121	13	1	7	[{"nombre": "DRAIN+ Hialuronidasa", "cantidad": 1, "subtotal": 105000, "lote_numero": "CARGA-INICIAL-2025", "producto_id": 54, "promo_aplicada": null, "precio_unitario": 105000, "fecha_vencimiento": "2029-12-31", "lote_seleccionado_id": 37}]	105000	{"zip": "B1836", "days": "Lunes", "piso": "", "depto": "", "hours": "9 a 16", "full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	Lunes 9 a 16	\N	\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
87	2025-10-14 14:47:21.326374+00	0001-00000065	\N	39	3	1	7	[{"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 3}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 3, "subtotal": 315000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 4}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": 31, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 5}]	525000	{"days": "Martes", "hours": "10 a 12 Hs.", "full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	15:30 a 18:00	Cobrar 1.800.000 en efectivo	\N	f	0	7	Pendiente	deposito_principal	2025-10-15	f	f	DOMICILIO	1
89	2025-10-15 15:33:58.820701+00	0001-00000067	\N	224	3	1	4	[{"nombre": "Smartker FIRMNESS", "cantidad": 1, "subtotal": 105000, "producto_id": 57, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 40}, {"nombre": "Smartker MULTIVIT", "cantidad": 1, "subtotal": 105000, "producto_id": 59, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 42}, {"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 3}, {"nombre": "Envio al Interior", "cantidad": 1, "subtotal": 9000, "producto_id": 36, "promo_aplicada": null, "precio_unitario": 9000, "lote_seleccionado_id": 17}]	324000	{"days": "Martes a Viernes", "hours": "9 a 18 hs", "full_address": "Doctor Pedro José Agrelo 2362, Rosario, Santa Fe"}	9 a 18hs		\N	f	0	5	Pendiente	deposito_principal	2025-10-16	f	f	DOMICILIO	1
86	2025-10-13 16:41:14.737883+00	0001-00000064	\N	39	3	1	4	[{"nombre": "Revanesse Shape+", "cantidad": 3, "subtotal": 855000, "producto_id": 28, "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "Revanesse Ultra+", "cantidad": 3, "subtotal": 855000, "producto_id": "26", "promo_aplicada": "Promo Combinada", "precio_unitario": 285000}, {"nombre": "PBS 1.5 Medium", "cantidad": 1, "subtotal": 360000, "producto_id": "37", "promo_aplicada": "Promo Combinada", "precio_unitario": 360000}]	2070000	{"days": null, "hours": "11 A 18", "full_address": "Gregorio Juárez de Babiano 322 San Fernando del Valle de Catamarca"}			\N	f	0	6	Pendiente	deposito_principal	2025-10-13	f	f	DOMICILIO	1
88	2025-10-14 14:55:51.267133+00	0001-00000066	\N	48	3	1	4	[{"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 3, "subtotal": 315000, "producto_id": 2, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 4}, {"nombre": "PBSerum DRAIN+ Hialuronidasa PB3000 4v", "cantidad": 1, "subtotal": 105000, "producto_id": 3, "promo_aplicada": null, "precio_unitario": 105000, "lote_seleccionado_id": 3}, {"nombre": "PBSerum SMOOTH + Colagenasa GH PB220", "cantidad": 1, "subtotal": 105000, "producto_id": 31, "promo_aplicada": "Precio x1", "precio_unitario": 105000, "lote_seleccionado_id": 5}, {"nombre": "Envío a caba Bonificado", "cantidad": 1, "subtotal": 0, "producto_id": 32, "promo_aplicada": null, "precio_unitario": 0, "lote_seleccionado_id": 16}]	525000	{"days": "Martes", "hours": "10 a 12 Hs.", "full_address": "Vuelta de Obligado 3352, Buenos Aires, Ciudad Autónoma de Buenos Aires"}	15:30 a 18:00	Cobrar en efectivo 1.800.000 2	\N	f	0	7	Pendiente	deposito_principal	2025-10-15	f	f	DOMICILIO	1
100	2025-11-03 17:51:10.074606+00	0001-00000082	\N	121	13	1	7	[{"nombre": "Revanesse Revise +", "cantidad": 1, "subtotal": 330000, "lote_numero": "0000-1", "producto_id": 35, "promo_aplicada": "Promo Combinada", "precio_unitario": 330000, "fecha_vencimiento": "0008-02-01", "lote_seleccionado_id": 13}]	339000	{"zip": "B1836", "days": "Lunes", "piso": "", "depto": "", "hours": "9 a 16", "full_address": "Argerich 151, Llavallol, Provincia de Buenos Aires"}	Lunes 9 a 16	\N	\N	f	0	5	Pendiente	deposito_principal	\N	f	f	DOMICILIO	1
\.


--
-- Data for Name: auditoria_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditoria_pedidos (id, pedido_id, fecha_modificacion, usuario_modificacion, campo_modificado, valor_anterior, valor_nuevo, descripcion) FROM stdin;
1	29	2025-09-02 22:36:55.677162+00	sistema	dia_hora_entrega	11 a 16 hs.	PROBANDO EL GUARDADO	Cambio de franja horaria
2	29	2025-09-02 22:51:57.189212+00	sistema	dia_hora_entrega	PROBANDO EL GUARDADO	11 a 16 hs.	Cambio de franja horaria
3	28	2025-09-02 23:27:37.375464+00	sistema	dia_hora_entrega	Lunes, Martes, Jueves y Viernes 12 a 18hs	Jueves 12 a 18hs	Cambio de franja horaria
4	29	2025-09-08 12:02:14.547313+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
5	28	2025-09-08 12:02:14.552428+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
6	28	2025-09-08 14:06:09.245147+00	Hernan Maldacena	estado	Entregado	Despachado	Cambio de estado
7	28	2025-09-08 14:06:21.003355+00	Hernan Maldacena	estado	Despachado	Entregado	Cambio de estado
8	35	2025-09-15 13:58:58.624732+00	Hernan Maldacena	pedido	\N	0001-00000003	Pedido Creado
9	35	2025-09-15 14:09:45.629873+00	Hernan Maldacena	estado	En Preparación	Pendiente	Cambio de estado
10	35	2025-09-15 14:11:02.605745+00	Hernan Maldacena	dia_hora_entrega		9 a 16	Cambio de franja horaria
11	35	2025-09-15 16:24:47.564613+00	Hernan Maldacena	estado	Pendiente	En Preparación	Cambio de estado
12	35	2025-09-15 17:00:47.751339+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
13	36	2025-09-16 15:44:59.544626+00	Ignacio Silva Montaner	pedido	\N	0001-00000004	Pedido Creado
14	36	2025-09-17 11:56:25.836916+00	Hernan Maldacena	fecha_entrega_prevista	2025-09-26	2025-09-24	Cambio de fecha de entrega
15	37	2025-09-17 12:08:06.072388+00	Hernan Maldacena	pedido	\N	0001-00000001	Pedido Creado
16	37	2025-09-17 12:13:40.24178+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
17	38	2025-09-17 12:18:18.402592+00	Hernan Maldacena	pedido	\N	0001-00000009	Pedido Creado
18	38	2025-09-17 12:18:37.739251+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
19	39	2025-09-17 12:23:55.727802+00	Hernan Maldacena	pedido	\N	0001-00000010	Pedido Creado
20	40	2025-09-17 12:25:32.644451+00	Hernan Maldacena	pedido	\N	0001-00000011	Pedido Creado
21	41	2025-09-17 12:33:43.85258+00	Hernan Maldacena	pedido	\N	0001-00000012	Pedido Creado
22	42	2025-09-17 13:56:46.864329+00	Hernan Maldacena	pedido	\N	0001-00000017	Pedido Creado
23	42	2025-09-17 13:56:54.750832+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado
24	36	2025-09-17 14:02:46.528182+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
25	39	2025-09-17 14:02:46.52686+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
26	40	2025-09-17 14:02:46.54702+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
27	41	2025-09-17 14:02:46.61271+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado
28	43	2025-09-17 14:23:16.822723+00	Hernan Maldacena	pedido	\N	0001-00000018	Pedido Creado
29	43	2025-09-17 14:23:29.574433+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado
30	44	2025-09-17 15:10:37.004151+00	Hernan Maldacena	pedido	\N	0001-00000019	Pedido Creado
31	44	2025-09-17 15:10:52.61811+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado
32	46	2025-09-18 20:54:46.278188+00	Hernan Maldacena	pedido	\N	0001-00000021	Pedido Creado
33	46	2025-09-18 20:54:46.504241+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado
34	46	2025-09-18 21:37:27.487203+00	Conrado Iturria	estado	En Preparación	Anulado	Cambio de estado
35	47	2025-09-18 22:11:54.351093+00	Conrado Iturria	pedido	\N	0001-00000022	Pedido Creado
36	47	2025-09-18 22:11:54.467144+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado
37	36	2025-09-19 12:11:51.915466+00	Conrado Iturria	estado	Entregado	En Preparación	Cambio de estado
38	48	2025-09-19 19:16:59.538518+00	Ezequiel Urdiñez	pedido	\N	0001-00000023	Pedido Creado
39	48	2025-09-19 19:16:59.938041+00	Ezequiel Urdiñez	estado	Borrador	En Preparación	Cambio de estado
40	48	2025-09-19 19:17:25.503315+00	Ezequiel Urdiñez	estado	En Preparación	Entregado	Cambio de estado
41	49	2025-09-19 19:26:41.246815+00	Ezequiel Urdiñez	pedido	\N	0001-00000024	Pedido Creado
42	49	2025-09-19 19:26:41.447807+00	Ezequiel Urdiñez	estado	Borrador	En Preparación	Cambio de estado
43	50	2025-09-22 14:45:22.212679+00	Hernan Maldacena	pedido	\N	0001-00000025	Pedido Creado
44	50	2025-09-22 14:45:22.406749+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado
45	50	2025-09-22 18:50:21.929067+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado
46	48	2025-09-22 18:50:35.579835+00	Hernan Maldacena	estado	Entregado	Anulado	Cambio de estado
47	49	2025-09-22 18:50:38.969709+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado
48	47	2025-09-23 13:08:52.497497+00	Conrado Iturria	estado	En Preparación	Anulado	Cambio de estado del pedido
49	47	2025-09-23 13:08:52.497497+00	Conrado Iturria	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
50	51	2025-09-23 18:22:01.2657+00	Hernan Maldacena	pedido	\N	0001-00000029	Pedido Creado
51	51	2025-09-23 19:04:27.1967+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
52	52	2025-09-23 19:05:11.782228+00	Hernan Maldacena	pedido	\N	0001-00000030	Pedido Creado
53	52	2025-09-24 12:20:35.153164+00	Hernan Maldacena	estado	En Preparación	Despachado	Cambio de estado del pedido
54	52	2025-09-24 12:21:54.196282+00	Hernan Maldacena	estado	Despachado	Anulado	Cambio de estado del pedido
55	52	2025-09-24 12:21:54.196282+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
56	51	2025-09-24 12:21:58.965199+00	Hernan Maldacena	estado	Entregado	Anulado	Cambio de estado del pedido
57	51	2025-09-24 12:21:58.965199+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
58	53	2025-09-26 19:26:29.883101+00	Hernan Maldacena	pedido	\N	0001-00000031	Pedido Creado
59	54	2025-09-26 19:27:58.024776+00	Conrado Iturria	pedido	\N	0001-00000032	Pedido Creado
60	55	2025-09-26 19:44:23.332686+00	Conrado Iturria	pedido	\N	0001-00000033	Pedido Creado
61	56	2025-09-29 14:33:48.004272+00	Hernan Maldacena	pedido	\N	0001-00000034	Pedido Creado
62	57	2025-09-29 15:40:19.504169+00	Hernan Maldacena	pedido	\N	0001-00000035	Pedido Creado
63	57	2025-09-29 15:47:07.411322+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
64	57	2025-09-29 15:47:07.411322+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
65	56	2025-09-29 15:47:26.395539+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
66	56	2025-09-29 15:47:26.395539+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
67	58	2025-09-29 19:15:33.777586+00	Hernan Maldacena	pedido	\N	0001-00000036	Pedido Creado
68	58	2025-09-29 19:16:18.64445+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
69	58	2025-09-29 19:16:18.64445+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
70	59	2025-09-30 03:13:24.846242+00	Hernan Maldacena	pedido	\N	0001-00000038	Pedido Creado
71	60	2025-09-30 03:13:24.841851+00	Hernan Maldacena	pedido	\N	0001-00000037	Pedido Creado
72	59	2025-09-30 03:13:25.025631+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
73	60	2025-09-30 03:13:25.026382+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
74	61	2025-09-30 03:28:45.77881+00	Hernan Maldacena	pedido	\N	0001-00000039	Pedido Creado
75	62	2025-09-30 03:28:45.797886+00	Hernan Maldacena	pedido	\N	0001-00000040	Pedido Creado
76	61	2025-09-30 03:28:45.912118+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
77	62	2025-09-30 03:28:45.916059+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
78	63	2025-09-30 18:46:02.667987+00	Hernan Maldacena	pedido	\N	0001-00000042	Pedido Creado
79	64	2025-09-30 18:46:02.6744+00	Hernan Maldacena	pedido	\N	0001-00000041	Pedido Creado
80	63	2025-09-30 18:46:02.856579+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
81	64	2025-09-30 18:46:02.863999+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
82	65	2025-09-30 19:33:45.93185+00	Hernan Maldacena	pedido	\N	0001-00000043	Pedido Creado
83	66	2025-09-30 19:33:45.942697+00	Hernan Maldacena	pedido	\N	0001-00000044	Pedido Creado
84	67	2025-09-30 19:33:55.896378+00	Hernan Maldacena	pedido	\N	0001-00000045	Pedido Creado
85	68	2025-09-30 19:33:55.903992+00	Hernan Maldacena	pedido	\N	0001-00000046	Pedido Creado
86	70	2025-09-30 22:45:08.80412+00	Hernan Maldacena	pedido	\N	0001-00000048	Pedido Creado
87	69	2025-09-30 22:45:08.801563+00	Hernan Maldacena	pedido	\N	0001-00000047	Pedido Creado
88	70	2025-09-30 22:45:08.948715+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
89	69	2025-09-30 22:45:08.975065+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
90	68	2025-10-01 18:22:25.204516+00	Hernan Maldacena	estado	Borrador	Anulado	Cambio de estado del pedido
91	68	2025-10-01 18:22:25.204516+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
92	71	2025-10-01 18:34:08.352788+00	Conrado Iturria	pedido	\N	0001-00000049	Pedido Creado
93	72	2025-10-01 18:34:08.363883+00	Conrado Iturria	pedido	\N	0001-00000050	Pedido Creado
94	72	2025-10-01 18:34:08.541513+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
95	71	2025-10-01 18:34:08.55751+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
96	72	2025-10-01 18:35:56.88645+00	Conrado Iturria	estado	En Preparación	Entregado	Cambio de estado del pedido
97	73	2025-10-02 18:14:01.217117+00	Hernan Maldacena	pedido	\N	0001-00000051	Pedido Creado
98	74	2025-10-02 18:14:01.220433+00	Hernan Maldacena	pedido	\N	0001-00000052	Pedido Creado
99	73	2025-10-02 18:14:01.415482+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
100	74	2025-10-02 18:14:01.41583+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
101	74	2025-10-02 18:19:16.391623+00	Hernan Maldacena	fecha_entrega	\N	2025-10-03	Cambio de fecha de entrega
102	73	2025-10-02 19:17:13.696261+00	Hernan Maldacena	fecha_entrega	\N	2025-10-03	Cambio de fecha de entrega
103	75	2025-10-02 20:57:18.057931+00	Hernan Maldacena	pedido	\N	0001-00000054	Pedido Creado
104	76	2025-10-02 20:57:18.067243+00	Hernan Maldacena	pedido	\N	0001-00000053	Pedido Creado
105	75	2025-10-02 20:57:18.216927+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
106	76	2025-10-02 20:57:18.218114+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
107	75	2025-10-03 04:03:49.156956+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
108	75	2025-10-03 04:03:49.156956+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
109	74	2025-10-03 04:03:57.931761+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
110	74	2025-10-03 04:03:57.931761+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
111	73	2025-10-03 04:04:07.262659+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
112	73	2025-10-03 04:04:07.262659+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
113	72	2025-10-03 04:04:12.477154+00	Hernan Maldacena	estado	Entregado	Anulado	Cambio de estado del pedido
114	72	2025-10-03 04:04:12.477154+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
115	71	2025-10-03 04:04:19.255358+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
116	71	2025-10-03 04:04:19.255358+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
117	70	2025-10-03 04:04:24.676339+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
118	70	2025-10-03 04:04:24.676339+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
119	69	2025-10-03 04:04:29.128966+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
120	69	2025-10-03 04:04:29.128966+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
121	67	2025-10-03 04:04:33.928996+00	Hernan Maldacena	estado	Borrador	Anulado	Cambio de estado del pedido
122	67	2025-10-03 04:04:33.928996+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
123	66	2025-10-03 04:04:38.485021+00	Hernan Maldacena	estado	Borrador	Anulado	Cambio de estado del pedido
124	66	2025-10-03 04:04:38.485021+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
125	65	2025-10-03 04:04:43.32796+00	Hernan Maldacena	estado	Borrador	Anulado	Cambio de estado del pedido
126	65	2025-10-03 04:04:43.32796+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
127	64	2025-10-03 04:04:46.880368+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
128	64	2025-10-03 04:04:46.880368+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
129	63	2025-10-03 04:04:50.474025+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
130	63	2025-10-03 04:04:50.474025+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
131	53	2025-10-03 04:05:02.680368+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
132	53	2025-10-03 04:05:02.680368+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
133	54	2025-10-03 04:05:13.352695+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
134	54	2025-10-03 04:05:13.352695+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
135	55	2025-10-03 04:05:17.667869+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
136	55	2025-10-03 04:05:17.667869+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
137	60	2025-10-03 04:05:33.103562+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
138	60	2025-10-03 04:05:33.103562+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
139	59	2025-10-03 04:05:38.798471+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
140	59	2025-10-03 04:05:38.798471+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
141	61	2025-10-03 04:05:42.363689+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
142	61	2025-10-03 04:05:42.363689+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
143	62	2025-10-03 04:05:47.385577+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
144	62	2025-10-03 04:05:47.385577+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
145	36	2025-10-03 04:06:07.700366+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
146	77	2025-10-03 12:11:26.998864+00	Conrado Iturria	pedido	\N	0001-00000056	Pedido Creado
147	78	2025-10-03 12:11:27.004844+00	Conrado Iturria	pedido	\N	0001-00000055	Pedido Creado
148	78	2025-10-03 12:11:27.133141+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
149	77	2025-10-03 12:11:27.135361+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
150	78	2025-10-03 12:11:46.653834+00	Conrado Iturria	estado	En Preparación	Entregado	Cambio de estado del pedido
151	78	2025-10-03 12:13:26.942193+00	Conrado Iturria	estado	Entregado	En Preparación	Cambio de estado del pedido
152	79	2025-10-03 16:36:13.472799+00	Hernan Maldacena	pedido	\N	0001-00000057	Pedido Creado
153	79	2025-10-03 16:36:13.626787+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
154	78	2025-10-05 19:54:44.915339+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
155	78	2025-10-05 19:54:44.915339+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
156	80	2025-10-05 21:37:05.742387+00	Hernan Maldacena	pedido	\N	0001-00000058	Pedido Creado
157	80	2025-10-05 21:37:05.916935+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
158	77	2025-10-05 21:43:46.193254+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
159	77	2025-10-05 21:43:46.193254+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
160	81	2025-10-06 12:19:15.434943+00	Hernan Maldacena	pedido	\N	0001-00000059	Pedido Creado
161	81	2025-10-06 12:19:15.57961+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
162	82	2025-10-06 12:29:33.444018+00	Hernan Maldacena	pedido	\N	0001-00000060	Pedido Creado
163	82	2025-10-06 12:29:33.558199+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
164	82	2025-10-06 12:32:05.803497+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
165	82	2025-10-06 12:32:05.803497+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
166	76	2025-10-06 18:54:23.092449+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
167	79	2025-10-06 18:54:23.104205+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
168	83	2025-10-07 14:38:16.472695+00	Conrado Iturria	pedido	\N	0001-00000061	Pedido Creado
169	83	2025-10-07 14:38:16.688096+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
170	83	2025-10-07 14:39:45.555497+00	Conrado Iturria	estado	En Preparación	Entregado	Cambio de estado del pedido
171	83	2025-10-07 16:07:06.764706+00	Hernan Maldacena	estado	Entregado	En Preparación	Cambio de estado del pedido
172	84	2025-10-07 16:21:54.258751+00	Hernan Maldacena	pedido	\N	0001-00000062	Pedido Creado
173	84	2025-10-07 16:21:54.399685+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
174	84	2025-10-07 18:12:55.214877+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
175	84	2025-10-07 18:12:55.214877+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
176	83	2025-10-07 18:13:04.764194+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
177	83	2025-10-07 18:13:04.764194+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
178	80	2025-10-08 13:22:11.604029+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
179	81	2025-10-08 13:22:41.132032+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
180	85	2025-10-09 15:46:51.917556+00	Ezequiel Urdiñez	pedido	\N	0001-00000063	Pedido Creado
181	85	2025-10-09 15:46:52.229948+00	Ezequiel Urdiñez	estado	Borrador	En Preparación	Cambio de estado del pedido
182	85	2025-10-09 15:47:28.303458+00	Ezequiel Urdiñez	estado	En Preparación	Anulado	Cambio de estado del pedido
183	85	2025-10-09 15:47:28.303458+00	Ezequiel Urdiñez	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
184	86	2025-10-13 16:41:14.737883+00	Hernan Maldacena	pedido	\N	0001-00000064	Pedido Creado
185	86	2025-10-13 16:41:14.901621+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
186	87	2025-10-14 14:47:21.326374+00	Hernan Maldacena	pedido	\N	0001-00000065	Pedido Creado
187	87	2025-10-14 14:47:21.53826+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
188	88	2025-10-14 14:55:51.267133+00	Hernan Maldacena	pedido	\N	0001-00000066	Pedido Creado
189	88	2025-10-14 14:55:51.38978+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
190	87	2025-10-14 14:56:54.392407+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
191	87	2025-10-14 14:56:54.392407+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
192	89	2025-10-15 15:33:58.820701+00	Hernan Maldacena	pedido	\N	0001-00000067	Pedido Creado
193	89	2025-10-15 15:33:59.027077+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
194	28	2025-10-22 12:48:02.809624+00	Pepe mujica	estado	Entregado	Cancelado	Cambio de estado del pedido
195	28	2025-10-22 12:48:05.070114+00	Pepe mujica	estado	Cancelado	Entregado	Cambio de estado del pedido
196	28	2025-10-22 13:23:37.37481+00	Pepe mujica	estado	Entregado	Cancelado	Cambio de estado del pedido
197	28	2025-10-22 13:23:39.0511+00	Pepe mujica	estado	Cancelado	Preparado	Cambio de estado del pedido
198	28	2025-10-22 13:23:41.76657+00	Pepe mujica	estado	Preparado	Cancelado	Cambio de estado del pedido
199	28	2025-10-22 13:23:42.652248+00	Pepe mujica	estado	Cancelado	Entregado	Cambio de estado del pedido
200	36	2025-10-22 14:59:17.250932+00	Pepe mujica	estado	Entregado	Cancelado	Cambio de estado del pedido
201	36	2025-10-22 14:59:19.286186+00	Pepe mujica	estado	Cancelado	Preparado	Cambio de estado del pedido
202	36	2025-10-22 14:59:21.068669+00	Pepe mujica	estado	Preparado	Entregado	Cambio de estado del pedido
203	28	2025-10-23 19:15:45.233586+00	Hernan Maldacena	estado	Entregado	Cancelado	Cambio de estado del pedido
204	28	2025-10-23 19:15:48.968165+00	Hernan Maldacena	estado	Cancelado	Preparado	Cambio de estado del pedido
205	28	2025-10-23 19:16:06.496438+00	Hernan Maldacena	estado	Preparado	Entregado	Cambio de estado del pedido
206	90	2025-10-24 16:58:08.644901+00	Hernan Maldacena	pedido	\N	0001-00000068	Pedido Creado
207	90	2025-10-24 16:58:08.842522+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
208	91	2025-10-24 17:18:04.701245+00	Hernan Maldacena	pedido	\N	0001-00000069	Pedido Creado
209	91	2025-10-24 17:18:04.853983+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
210	28	2025-10-26 20:16:05.840977+00	Hernan Maldacena	estado	Entregado	Cancelado	Cambio de estado del pedido
211	28	2025-10-26 20:16:07.532775+00	Hernan Maldacena	estado	Cancelado	Entregado	Cambio de estado del pedido
212	92	2025-10-27 16:44:22.034793+00	Hernan Maldacena	pedido	\N	0001-00000070	Pedido Creado
213	92	2025-10-27 16:44:22.232639+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
214	92	2025-10-27 18:35:41.965204+00	Hernan Maldacena	fecha_entrega	2025-10-28	2025-10-04	Cambio de fecha de entrega
215	94	2025-10-31 15:22:40.954644+00	Hernan Maldacena	pedido	\N	0001-00000072	Pedido Creado
216	94	2025-10-31 15:43:46.624334+00	Hernan Maldacena	estado	Entregado	En Preparación	Cambio de estado del pedido
217	95	2025-10-31 17:53:53.79581+00	Hernan Maldacena	pedido	\N	0001-00000073	Pedido Creado
218	95	2025-10-31 17:54:49.060033+00	Hernan Maldacena	fecha_entrega	\N	2025-11-03	Cambio de fecha de entrega
219	95	2025-10-31 18:10:11.84456+00	Hernan Maldacena	estado	Entregado	En Preparación	Cambio de estado del pedido
220	89	2025-10-31 18:10:27.559458+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
221	96	2025-10-31 18:13:17.757353+00	Conrado Iturria	pedido	\N	0001-00000074	Pedido Creado
222	96	2025-10-31 18:13:17.871732+00	Conrado Iturria	estado	Borrador	En Preparación	Cambio de estado del pedido
223	96	2025-10-31 18:13:32.290656+00	Conrado Iturria	fecha_entrega	\N	2025-11-01	Cambio de fecha de entrega
229	97	2025-10-31 18:52:54.133333+00	Hernan Maldacena	pedido	\N	0001-00000077	Pedido Creado
230	97	2025-10-31 18:52:54.329861+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
231	97	2025-10-31 19:02:29.794091+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
232	97	2025-10-31 19:02:32.73552+00	Hernan Maldacena	estado	Entregado	En Preparación	Cambio de estado del pedido
235	86	2025-10-31 19:03:39.264851+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
236	88	2025-10-31 19:03:45.848365+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
237	90	2025-10-31 19:03:51.878662+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
238	91	2025-10-31 19:03:55.713043+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
239	92	2025-10-31 19:03:59.997925+00	Hernan Maldacena	estado	En Preparación	Entregado	Cambio de estado del pedido
240	92	2025-10-31 19:04:04.509343+00	Hernan Maldacena	estado	Entregado	En Preparación	Cambio de estado del pedido
243	98	2025-11-02 19:01:47.127049+00	Hernan Maldacena	pedido	\N	0001-00000078	Pedido Creado
244	98	2025-11-02 19:01:47.380524+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
245	99	2025-11-02 23:24:24.916116+00	Hernan Maldacena	pedido	\N	0001-00000080	Pedido Creado
246	99	2025-11-02 23:24:25.385504+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
247	97	2025-11-02 23:57:20.512961+00	Hernan Maldacena	estado	En Preparación	Preparado	Cambio de estado del pedido
248	96	2025-11-03 02:07:20.401474+00	Hernan Maldacena	estado	En Preparación	Preparado	Cambio de estado del pedido
249	97	2025-11-03 12:58:50.913959+00	Hernan Maldacena	estado	Preparado	En Preparación	Cambio de estado del pedido
250	96	2025-11-03 12:58:52.237029+00	Hernan Maldacena	estado	Preparado	En Preparación	Cambio de estado del pedido
251	100	2025-11-03 17:51:10.074606+00	Hernan Maldacena	pedido	\N	0001-00000082	Pedido Creado
252	100	2025-11-03 17:51:10.244881+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
253	99	2025-11-03 18:41:32.75764+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
254	99	2025-11-03 18:41:32.75764+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
255	98	2025-11-03 18:43:12.540893+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
256	98	2025-11-03 18:43:12.540893+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
257	100	2025-11-03 18:43:19.656175+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
258	100	2025-11-03 18:43:19.656175+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
259	94	2025-11-03 18:43:57.843186+00	Hernan Maldacena	estado	En Preparación	Preparado	Cambio de estado del pedido
260	97	2025-11-03 18:44:53.516039+00	Hernan Maldacena	estado	En Preparación	Anulado	Cambio de estado del pedido
261	97	2025-11-03 18:44:53.516039+00	Hernan Maldacena	stock	\N	revertido	Anulación de pedido: Se inició la reversión de stock y deuda asociada.
263	101	2025-11-04 11:09:00.038853+00	Hernan Maldacena	pedido	\N	0001-00000083	Pedido Creado
264	101	2025-11-04 11:09:00.551971+00	Hernan Maldacena	estado	Borrador	En Preparación	Cambio de estado del pedido
265	102	2025-11-04 19:47:45.033825+00	Erika Valker	pedido	\N	0001-00000084	Pedido Creado
266	102	2025-11-04 19:47:45.253568+00	Erika Valker	estado	Borrador	En Preparación	Cambio de estado del pedido
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, created_at, nombre, linea_marca, categoria, sku, origen, composicion, presentacion, especificaciones_adicionales, precio_base, precios_escalonados, permite_combinacion, documentos, deposito_default_id, peso_gr, dimensiones_cm) FROM stdin;
32	2025-08-25 18:16:20.812901+00	Envío a caba Bonificado	\N	\N	\N	\N	\N	\N	\N	0	[]	f	\N	\N	\N	\N
25	2025-08-05 16:59:45.630633+00	Revanesse Kiss+	Revanesse	Relleno	PN40113	Canadá	\N	Caja con 2 Jeringas x 1,2 ml.	\N	330000	[{"precio": 330000, "cantidad": 1}, {"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	1	\N	\N
26	2025-08-05 17:03:43.581425+00	Revanesse Ultra+	Revanesse	Relleno	PN40103	Canadá	\N	Caja con 2 Jeringas x 1,2 ml.	\N	330000	[{"precio": 330000, "cantidad": 1}, {"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	1	\N	\N
37	2025-10-14 14:09:59.034173+00	PBS 1.5 Medium	PBSerum Medical	Enzimas	\N	España	\N	1 caja x 1 jeringa + 2 viales	\N	410000	[{"precio": 410000, "cantidad": 1}, {"precio": 390000, "cantidad": 3}, {"precio": 360000, "cantidad": 6}, {"precio": 340000, "cantidad": 12}]	t	\N	1	\N	\N
38	2025-10-15 14:42:55.003751+00	Revanesse Ultra+	REVANESSE	\N	\N	\N	\N	1 caja con 2 jeringas de 1,2 ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	\N	\N	\N
4	2025-07-25 03:27:00.669437+00	PBSerum DRAIN+ Hialuronidasa PB3000 1v	pbserum	Enzimas biológicas inyectables	\N	España	Hialuronidasa PB3000	1 caja c/1 vial	\N	35000	[]	f	\N	1	\N	\N
3	2025-07-25 03:27:00.669437+00	PBSerum DRAIN+ Hialuronidasa PB3000 4v	pbserum	Enzimas biológicas inyectables	\N	España	Hialuronidasa PB3000	4 viales	\N	105000	[]	f	\N	\N	\N	\N
2	2025-07-25 03:27:00.669437+00	PBSerum SLIM+ Lipasa PB500	pbserum	Enzimas biológicas inyectables	\N	España	Lipasa PB500	1 caja c/4 viales	\N	105000	[]	f	\N	\N	\N	\N
31	2025-08-25 17:29:50.937765+00	PBSerum SMOOTH + Colagenasa GH PB220	PBSerum	Enzimas	222	España	\N	4 Viales	\N	105000	[{"precio": 105000, "cantidad": 1}]	f	\N	1	\N	\N
39	2025-10-15 14:42:55.003751+00	Revanesse Revise+	REVANESSE	\N	\N	\N	\N	1 caja con 2 jeringas de 1,2 ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	\N	\N	\N
40	2025-10-15 14:42:55.003751+00	Revanesse Kiss+	REVANESSE	\N	\N	\N	\N	1 caja con 2 jeringas de 1,2 ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	\N	\N	\N
41	2025-10-15 14:42:55.003751+00	Revanesse Contour+	REVANESSE	\N	\N	\N	\N	1 caja con 2 jeringas de 1,2 ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	\N	\N	\N
42	2025-10-15 14:42:55.003751+00	Revanesse Shape+	REVANESSE	\N	\N	\N	\N	1 caja con 2 jeringas de 1,2 ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	\N	\N	\N
33	2025-08-25 18:34:25.212945+00	Envio a caba	\N	\N	\N	\N	\N	\N	\N	6600	[]	f	\N	\N	\N	\N
36	2025-09-16 19:13:46.254003+00	Envio al Interior	Logistica	\N	\N	\N	\N	\N	\N	9000	[]	f	\N	1	\N	\N
27	2025-08-05 17:05:54.497102+00	Revanesse Contour+	Revanesse	Relleno	PN40111	Canadá	\N	Caja con 2 Jeringas x 1,2 ml.	\N	330000	[{"precio": 330000, "cantidad": 1}, {"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	1	\N	\N
35	2025-09-02 18:57:13.166889+00	Revanesse Revise +	Revanesse	Relleno	PN40114	Canadá	\N	Caja con 2 Jeringas x 1,2 ml.	\N	330000	[{"precio": 330000, "cantidad": 1}, {"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}]	t	\N	1	\N	\N
28	2025-08-05 17:08:25.182864+00	Revanesse Shape+	Revanesse	\N	PN40096	\N	\N	\N	\N	330000	[{"precio": 330000, "cantidad": 1}, {"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}]	t	\N	1	\N	\N
43	2025-10-15 14:42:55.003751+00	Olidia (Bioestimulador PLLA)	Olidia	\N	\N	\N	\N	1 vial x 365mg 5ml	\N	330000	[{"precio": 300000, "cantidad": 3}, {"precio": 285000, "cantidad": 6}, {"precio": 265000, "cantidad": 12}, {"precio": 255000, "cantidad": 15}]	t	\N	\N	\N	\N
44	2025-10-15 14:42:55.003751+00	PBSerum Medical Low	pbserum MEDICAL	\N	\N	\N	\N	1 caja x 1 jeringa + 2 viales	\N	410000	[{"precio": 390000, "cantidad": 3}, {"precio": 360000, "cantidad": 6}, {"precio": 340000, "cantidad": 12}]	t	\N	\N	\N	\N
45	2025-10-15 14:42:55.003751+00	PBSerum Medical Medium	pbserum MEDICAL	\N	\N	\N	\N	1 caja x 1 jeringa + 2 viales	\N	410000	[{"precio": 390000, "cantidad": 3}, {"precio": 360000, "cantidad": 6}, {"precio": 340000, "cantidad": 12}]	t	\N	\N	\N	\N
46	2025-10-15 14:42:55.003751+00	PBSerum Medical High	pbserum MEDICAL	\N	\N	\N	\N	1 caja x 1 jeringa + 2 viales	\N	410000	[{"precio": 390000, "cantidad": 3}, {"precio": 360000, "cantidad": 6}, {"precio": 340000, "cantidad": 12}]	t	\N	\N	\N	\N
47	2025-10-15 14:42:55.003751+00	MINT EASY Double Needle	MINT	\N	\N	\N	\N	1 pouch x 2 hilos	\N	260000	[]	f	\N	\N	\N	\N
48	2025-10-15 14:42:55.003751+00	MINT FINE Pre-cannulated (1 pouch x 4 hilos)	MINT	\N	\N	\N	\N	1 pouch x 4 hilos	\N	260000	[]	f	\N	\N	\N	\N
49	2025-10-15 14:42:55.003751+00	MINT FINE Pre-cannulated (1 caja x 5 pouches)	MINT	\N	\N	\N	\N	1 caja x 5 pouches	\N	1150000	[]	f	\N	\N	\N	\N
50	2025-10-15 14:42:55.003751+00	MINT FIX	MINT	\N	\N	\N	\N	1 pouch x 4 hilos	\N	205000	[]	f	\N	\N	\N	\N
51	2025-10-15 14:42:55.003751+00	MINT PETIT	MINT	\N	\N	\N	\N	1 pouch x 4 hilos	\N	205000	[]	f	\N	\N	\N	\N
52	2025-10-15 14:42:55.003751+00	SLIM+ Lipasa	pbserum PLUS	\N	\N	\N	\N	1 caja x 4 viales	\N	105000	[]	f	\N	\N	\N	\N
53	2025-10-15 14:42:55.003751+00	SMOOTH+ Colagenasa	pbserum PLUS	\N	\N	\N	\N	1 caja x 4 viales	\N	105000	[]	f	\N	\N	\N	\N
54	2025-10-15 14:42:55.003751+00	DRAIN+ Hialuronidasa	pbserum PLUS	\N	\N	\N	\N	1 caja x 4 viales	\N	105000	[]	f	\N	\N	\N	\N
55	2025-10-15 14:42:55.003751+00	DRAIN+ Hialuronidasa (1 vial)	pbserum PLUS	\N	\N	\N	\N	1 caja x 1 vial	\N	35000	[]	f	\N	\N	\N	\N
56	2025-10-15 14:42:55.003751+00	Smartker RADIANT	pbserum COSMETICA	\N	\N	\N	\N	5 viales + 5 buffers	\N	105000	[]	f	\N	\N	\N	\N
57	2025-10-15 14:42:55.003751+00	Smartker FIRMNESS	pbserum COSMETICA	\N	\N	\N	\N	5 viales + 5 buffers	\N	105000	[]	f	\N	\N	\N	\N
58	2025-10-15 14:42:55.003751+00	Smartker WRINKLE HY	pbserum COSMETICA	\N	\N	\N	\N	5 viales + 5 buffers	\N	105000	[]	f	\N	\N	\N	\N
59	2025-10-15 14:42:55.003751+00	Smartker MULTIVIT	pbserum COSMETICA	\N	\N	\N	\N	5 viales + 5 buffers	\N	105000	[]	f	\N	\N	\N	\N
60	2025-10-15 14:42:55.003751+00	Smartker EQUILIBRIUM	pbserum COSMETICA	\N	\N	\N	\N	5 viales + 5 buffers	\N	105000	[]	f	\N	\N	\N	\N
61	2025-10-15 14:42:55.003751+00	PBSerum SMOOTH	pbserum COSMETICA	\N	\N	\N	\N	4 viales de 20 ml	\N	65000	[]	f	\N	\N	\N	\N
62	2025-10-15 14:42:55.003751+00	NOVACTIVE C20 y EAA	pbserum COSMETICA	\N	\N	\N	\N	15 ml x 1	\N	15000	[]	f	\N	\N	\N	\N
63	2025-10-15 14:42:55.003751+00	Polyactive SRT y HYA-T (30 ml)	novactive	\N	\N	\N	\N	30 ml x 1	\N	15000	[]	f	\N	\N	\N	\N
64	2025-10-15 14:42:55.003751+00	Polyactive SRT y HYA-T (50 ml)	novactive	\N	\N	\N	\N	50 ml x 1	\N	15000	[]	f	\N	\N	\N	\N
65	2025-10-15 14:42:55.003751+00	Polyactive PA (30 ml)	novactive	\N	\N	\N	\N	30 ml x 1	\N	15000	[]	f	\N	\N	\N	\N
66	2025-10-15 14:42:55.003751+00	Polyactive PA (50 ml)	novactive	\N	\N	\N	\N	50 ml x 1	\N	15000	[]	f	\N	\N	\N	\N
\.


--
-- Data for Name: auditoria_precios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditoria_precios (id, created_at, usuario_id, usuario_nombre, entidad_tipo, entidad_id, producto_id, precio_anterior, precio_nuevo, justificacion) FROM stdin;
3	2025-09-29 19:15:43.085887+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	58	28	310000	230000	Cambio de precio manual por gerente en pedido.
4	2025-09-29 19:15:56.734375+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	58	28	230000	230000	Cambio de precio manual por gerente en pedido.
13	2025-10-02 19:17:11.397972+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	73	26	300000	285000	Cambio de precio manual por gerente en pedido.
14	2025-10-02 19:17:11.417685+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	73	26	285000	285000	Cambio de precio manual por gerente en pedido.
15	2025-10-02 19:25:45.783826+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	74	26	300000	285000	Cambio de precio manual por gerente en pedido.
16	2025-10-02 19:25:45.791049+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Pedido	74	26	285000	285000	Cambio de precio manual por gerente en pedido.
17	2025-10-14 14:11:56.614012+00	c145694f-77b3-4baf-90c0-c7ebeee69cd6	Hernan Maldacena	Producto	37	37	0	410000	Cambio de precio de lista del producto.
\.


--
-- Data for Name: comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comisiones (id, pedido_id, vendedor_id, monto_comision, porcentaje_aplicado, estado, fecha_generacion, pago_comision_id) FROM stdin;
2	28	3	49500.00000000000000000000	6	pendiente	2025-09-08 00:00:00+00	\N
3	35	3	37800.00000000000000000000	6	pendiente	2025-09-15 00:00:00+00	\N
4	37	3	172800.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
5	38	3	8940.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
6	39	3	172800.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
7	40	3	38340.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
8	41	3	12996.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
9	29	3	210600.00000000000000000000	6	pendiente	2025-09-17 00:00:00+00	\N
10	36	3	6696.00000000000000000000	6	pendiente	2025-09-18 00:00:00+00	\N
11	79	3	18900.00000000000000000000	6	pendiente	2025-10-06 00:00:00+00	\N
12	80	3	228000.00000000000000000000	6	pendiente	2025-10-22 00:00:00+00	\N
13	81	3	216000.00000000000000000000	6	pendiente	2025-10-27 00:00:00+00	\N
14	89	3	19440.00000000000000000000	6	pendiente	2025-10-31 00:00:00+00	\N
15	88	3	31500.00000000000000000000	6	pendiente	2025-10-31 00:00:00+00	\N
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, created_at, nombre, cuit, telefono, email, condicion_pago_id, direccion, deuda_actual) FROM stdin;
d258436c-6586-460d-970a-fef74e51451a	2025-09-12 02:20:21.700619+00	Nordesnova	221111111111151	\N	\N	6	{"zip": "", "city": "", "street": "", "province": ""}	0.00
38b66d75-3003-4be0-a5df-51dcb4dc4232	2025-08-17 00:58:46.926689+00	BiosPlus	221111111111151	\N	\N	6	{"zip": "3610", "city": "clorinda", "street": "Sarmiento 708", "province": "Formosa"}	27550000.00
\.


--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id, created_at, proveedor_id, fecha_emision, fecha_recepcion_prevista, estado, total_compra, productos, deposito_id, factura_proveedor_nro, organizacion_id) FROM stdin;
1	2025-09-05 13:36:39.36972+00	38b66d75-3003-4be0-a5df-51dcb4dc4232	2025-09-05	2025-09-05	Recibida	27550000	[{"nombre": "Revanesse Revise +", "cantidad": 20, "producto_id": "35", "costo_unitario": 190000}, {"nombre": "Revanesse Kiss+", "cantidad": 10, "producto_id": "25", "costo_unitario": 190000}, {"nombre": "Revanesse Ultra+", "cantidad": 115, "producto_id": "26", "costo_unitario": 190000}]	1	\N	1
2	2025-09-23 15:08:10.39634+00	38b66d75-3003-4be0-a5df-51dcb4dc4232	2025-09-23	\N	Recibida	\N	\N	1	REGULARIZACION_STOCK_INICIAL	1
4	2025-10-15 14:42:55.003751+00	d258436c-6586-460d-970a-fef74e51451a	2025-10-15	\N	Recibida	0	\N	1	\N	1
3	2025-10-01 14:46:43.17124+00	38b66d75-3003-4be0-a5df-51dcb4dc4232	2025-10-01	2025-10-03	Borrador	21140000	[{"nombre": "Olidia", "cantidad": 100, "producto_id": "34", "costo_unitario": 210000}, {"nombre": "PBSerum SLIM+ Lipasa PB500", "cantidad": 4, "producto_id": 2, "costo_unitario": 35000}]	1	0001-00000008	1
\.


--
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracion (id, clave, valor) FROM stdin;
27	gerente_whatsapp	5491164783312
1	logo_url	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/assets/public/logo_laboratorio.png
4	empresa_rubro	Soluciones estéticas
5	empresa_direccion	Bernardo de Irigoyen 428 piso 9, B6000FNJ, Ciudad Autónoma de Buenos Aires, Argentina
3	empresa_cuit	30-71622188-8
2	empresa_nombre	BiosPlus Argentina S.A.
6	logistica_whatsapp	11320298055
22	oca_epak_user	admbiosplus@gmail.com
23	oca_epak_password	Godinez01+
24	oca_epak_cuit	30-71622188-8
25	oca_epak_nrocuenta	405767
26	reserva_stock_horas_expiracion	72
\.


--
-- Data for Name: lotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lotes (id, created_at, producto_id, numero_lote, fecha_vencimiento, cantidad_inicial, stock_disponible, fecha_ingreso, compra_id, stock_reservado) FROM stdin;
20	2025-10-14 14:09:59.175591+00	37	8888	2028-02-20	100	100	2025-10-14 14:09:59.175591+00	\N	0
17	2025-09-16 19:13:46.393845+00	36	8888	2029-02-20	100	99	2025-09-16 19:13:46.393845+00	2	0
16	2025-09-08 12:39:07.436539+00	32	8888	2028-07-08	100	96	2025-09-08 12:39:07.436539+00	2	3
13	2025-09-05 13:37:31.513559+00	35	0000-1	0008-02-01	20	84	2025-09-05 13:37:31.513559+00	1	0
8	2025-09-01 18:40:52.123447+00	28	8987	2028-02-02	100	136	2025-09-01 18:40:52.123447+00	2	12
18	2025-09-18 18:42:55.129857+00	35	2181651	2028-02-02	100	100	2025-09-18 18:42:55.129857+00	2	0
11	2025-09-01 18:42:30.228444+00	32	100	2099-05-02	100	150	2025-09-01 18:42:30.228444+00	2	0
2	2025-09-01 18:38:46.686458+00	4	8888	2027-02-03	100	150	2025-09-01 18:38:46.686458+00	2	0
7	2025-09-01 18:40:35.237443+00	25	8987	2028-02-01	100	150	2025-09-01 18:40:35.237443+00	2	0
12	2025-09-02 18:57:13.320993+00	35	8955	2028-10-02	100	150	2025-09-02 18:57:13.320993+00	2	0
14	2025-09-05 13:37:31.513559+00	25	0000-2	2028-02-21	10	8	2025-09-05 13:37:31.513559+00	1	0
15	2025-09-05 13:37:31.513559+00	26	0000-3	2028-02-21	115	115	2025-09-05 13:37:31.513559+00	1	0
10	2025-09-01 18:42:11.137767+00	33	8988	2029-08-02	100	145	2025-09-01 18:42:11.137767+00	2	0
9	2025-09-01 18:41:07.974706+00	26	8955	2028-02-02	100	162	2025-09-01 18:41:07.974706+00	2	13
3	2025-09-01 18:39:07.91708+00	3	8988	2027-02-03	100	145	2025-09-01 18:39:07.91708+00	2	9
5	2025-09-01 18:39:46.51429+00	31	8987	2028-02-03	100	146	2025-09-01 18:39:46.51429+00	2	9
4	2025-09-01 18:39:24.872742+00	2	8955	2028-02-02	100	140	2025-09-01 18:39:24.872742+00	2	15
22	2025-10-15 14:42:55.003751+00	39	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
23	2025-10-15 14:42:55.003751+00	40	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
24	2025-10-15 14:42:55.003751+00	41	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
25	2025-10-15 14:42:55.003751+00	42	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
27	2025-10-15 14:42:55.003751+00	44	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
6	2025-09-01 18:40:07.531642+00	27	8988	2028-05-02	100	166	2025-09-01 18:40:07.531642+00	2	0
37	2025-10-15 14:42:55.003751+00	54	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
32	2025-10-15 14:42:55.003751+00	49	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
21	2025-10-15 14:42:55.003751+00	38	CARGA-INICIAL-2025	2029-12-31	200	188	2025-10-15 14:42:55.003751+00	4	12
26	2025-10-15 14:42:55.003751+00	43	CARGA-INICIAL-2025	2029-12-31	200	196	2025-10-15 14:42:55.003751+00	4	4
28	2025-10-15 14:42:55.003751+00	45	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
30	2025-10-15 14:42:55.003751+00	47	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
31	2025-10-15 14:42:55.003751+00	48	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
33	2025-10-15 14:42:55.003751+00	50	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
34	2025-10-15 14:42:55.003751+00	51	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
35	2025-10-15 14:42:55.003751+00	52	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
36	2025-10-15 14:42:55.003751+00	53	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
38	2025-10-15 14:42:55.003751+00	55	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
39	2025-10-15 14:42:55.003751+00	56	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
41	2025-10-15 14:42:55.003751+00	58	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
43	2025-10-15 14:42:55.003751+00	60	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
44	2025-10-15 14:42:55.003751+00	61	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
45	2025-10-15 14:42:55.003751+00	62	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
46	2025-10-15 14:42:55.003751+00	63	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
47	2025-10-15 14:42:55.003751+00	64	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
48	2025-10-15 14:42:55.003751+00	65	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
49	2025-10-15 14:42:55.003751+00	66	CARGA-INICIAL-2025	2029-12-31	200	200	2025-10-15 14:42:55.003751+00	4	0
29	2025-10-15 14:42:55.003751+00	46	CARGA-INICIAL-2025	2029-12-31	200	198	2025-10-15 14:42:55.003751+00	4	2
40	2025-10-15 14:42:55.003751+00	57	CARGA-INICIAL-2025	2029-12-31	200	199	2025-10-15 14:42:55.003751+00	4	0
42	2025-10-15 14:42:55.003751+00	59	CARGA-INICIAL-2025	2029-12-31	200	199	2025-10-15 14:42:55.003751+00	4	0
\.


--
-- Data for Name: stock_vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_vendedores (id, created_at, vendedor_id, lote_id, cantidad_asignada) FROM stdin;
69	2025-09-02 19:00:22.298075+00	3	4	44
70	2025-09-02 19:00:22.298075+00	3	5	43
83	2025-09-17 01:14:53.264726+00	3	17	46
74	2025-09-02 19:00:22.298075+00	3	8	49
89	2025-09-18 18:39:06.637173+00	3	13	5
73	2025-09-02 19:00:22.298075+00	3	12	46
71	2025-09-02 19:00:22.298075+00	3	6	44
64	2025-09-02 19:00:22.298075+00	3	10	47
65	2025-09-02 19:00:22.298075+00	3	11	48
72	2025-09-02 19:00:22.298075+00	3	7	53
67	2025-09-02 19:00:22.298075+00	3	2	56
68	2025-09-02 19:00:22.298075+00	3	3	49
75	2025-09-02 19:00:22.298075+00	3	9	40
\.


--
-- Data for Name: confirmaciones_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confirmaciones_stock (id, created_at, vendedor_id, asignacion_id, token, estado, fecha_confirmacion) FROM stdin;
\.


--
-- Data for Name: facturas_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturas_venta (id, created_at, pedido_id, contacto_id, numero_factura, fecha_emision, fecha_vencimiento, subtotal, monto_iva_21, monto_iva_10_5, monto_percepcion_iibb, monto_percepcion_iva, total_facturado, estado, cae, cae_vencimiento, productos_facturados) FROM stdin;
\.


--
-- Data for Name: interacciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacciones (id, created_at, contacto_id, tipo, resumen, user_id, fecha_proximo_seguimiento) FROM stdin;
1	2025-10-15 02:04:20.496506+00	48	WhatsApp	Se hablo por enzimas de primera generacion y realizo un pedido	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-21
2	2025-10-21 15:16:49.688307+00	255	WhatsApp	Se muda de consultorio, recontactar en noviembre	c39967c6-cf8a-4546-a65d-168e43b4b1c3	\N
3	2025-11-04 19:43:42.358739+00	275	WhatsApp	Revanesse 12 cajas	bab1e667-f842-4ebc-9f5f-6039ebd1d526	2025-11-11
\.


--
-- Data for Name: logistica_embalajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logistica_embalajes (id, nombre, tipo, dimensiones_cm, peso_gr, created_at) FROM stdin;
1	Bolsa E-commerce Chica	Bolsa	{"alto": 2, "ancho": 30, "largo": 20}	10	2025-09-18 18:14:57.319865+00
2	Caja Chica OCA	Caja	{"alto": 10, "ancho": 15, "largo": 20}	50	2025-09-18 18:14:57.319865+00
3	Caja Mediana OCA	Caja	{"alto": 15, "ancho": 20, "largo": 30}	120	2025-09-18 18:14:57.319865+00
4	Caja Grande	Caja	{"alto": 25, "ancho": 30, "largo": 40}	250	2025-09-18 18:14:57.319865+00
\.


--
-- Data for Name: logistica_transportistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logistica_transportistas (id, nombre, tipo, api_endpoint, created_at) FROM stdin;
1	OCA	api_integrada	https://api.oca.com.ar/	2025-09-18 18:06:24.921648+00
2	Correo Argentino	api_integrada	https://api.correoargentino.com.ar/	2025-09-18 18:06:24.921648+00
3	Cadetería Propia	manual	\N	2025-09-18 18:06:24.921648+00
4	Cadetería Tercerizada	manual	\N	2025-09-18 18:06:24.921648+00
\.


--
-- Data for Name: logistica_envios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logistica_envios (id, pedido_id, transportista_id, estado, tracking_number, costo_envio, etiqueta_url, datos_api_respuesta, created_at, despachado_at, updated_at, cliente_confirmado_recepcion, token_confirmacion_recepcion) FROM stdin;
1	80	1	Por Preparar	\N	\N	\N	\N	2025-10-07 18:13:33.840987+00	\N	2025-10-08 13:39:55.317681+00	f	\N
2	81	3	Entregado		6600.00	\N	\N	2025-10-08 12:06:32.903879+00	\N	2025-10-08 15:31:54.855325+00	f	\N
3	86	1	En Tránsito	8507300000000000711	\N	\N	\N	2025-10-14 03:33:00.079273+00	\N	2025-10-14 17:40:56.492706+00	f	0ec7efb8-e49c-48bb-a5f1-37af3d72b850
4	36	\N	Por Preparar	52625656256	\N	\N	\N	2025-10-22 14:52:25.740535+00	\N	2025-10-22 14:52:25.740535+00	f	60426c1a-7e41-4a70-b614-f37845c43f5b
6	39	\N	Por Preparar	55566	\N	\N	\N	2025-10-22 14:56:20.536958+00	\N	2025-10-22 14:56:20.536958+00	f	ad478c29-3b07-4134-b4c4-6dab4fe0bd83
5	28	1	Por Preparar	5262655256	\N	\N	\N	2025-10-22 14:56:15.273019+00	\N	2025-10-23 19:15:33.43001+00	f	34732b7c-4f2a-44f9-b278-4f1d4d29dc9b
7	98	\N	Por Preparar	\N	6000.00	\N	\N	2025-11-02 23:03:43.521421+00	\N	2025-11-02 23:21:28.00323+00	f	b47c13c5-0e00-4e34-b246-6df0cb801ea0
8	99	\N	Por Preparar	\N	7000.00	\N	\N	2025-11-02 23:24:25.243655+00	\N	2025-11-02 23:24:25.243655+00	f	29aeb8a2-17da-42a3-ab55-150856796206
9	91	4	Por Preparar	\N	\N	\N	\N	2025-11-03 19:24:14.990992+00	\N	2025-11-03 19:24:14.990992+00	f	a3f1d152-d6fe-479e-a62d-60e12d0eb734
\.


--
-- Data for Name: movimientos_cuenta_corriente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos_cuenta_corriente (id, created_at, cliente_id, pedido_id, pago_id, fecha, concepto, debe, haber) FROM stdin;
158	2025-10-03 04:32:28.365798+00	67	28	\N	2025-09-02	Deuda por Pedido N°0001-00000001	825000.00	0.00
159	2025-10-03 04:32:28.365798+00	215	36	\N	2025-09-16	Deuda por Pedido N°0001-00000004	111600.00	0.00
160	2025-10-03 04:32:28.365798+00	39	39	\N	2025-09-17	Deuda por Pedido N°0001-00000010	2880000.00	0.00
161	2025-10-03 04:32:28.365798+00	219	76	\N	2025-10-02	Deuda por Pedido N°0001-00000053	1710000.00	0.00
162	2025-10-03 04:32:28.365798+00	66	41	\N	2025-09-17	Deuda por Pedido N°0001-00000012	216600.00	0.00
163	2025-10-03 04:32:28.365798+00	39	40	\N	2025-09-17	Deuda por Pedido N°0001-00000011	639000.00	0.00
164	2025-10-03 04:32:28.365798+00	99	35	\N	2025-09-15	Deuda por Pedido N°0001-00000003	630000.00	0.00
165	2025-10-03 04:32:28.365798+00	48	37	\N	2025-09-17	Deuda por Pedido N°0001-00000005	2880000.00	0.00
166	2025-10-03 04:32:28.365798+00	40	38	\N	2025-09-17	Deuda por Pedido N°0001-00000009	149000.00	0.00
167	2025-10-03 04:32:28.365798+00	74	29	\N	2025-09-02	Deuda por Pedido N°0001-00000002	3510000.00	0.00
168	2025-10-03 04:32:28.365798+00	67	\N	23	2025-09-05	Pago recibido (Transferencia)	0.00	825000.00
169	2025-10-03 04:32:28.365798+00	99	\N	24	2025-09-11	Pago recibido (Transferencia)	0.00	630000.00
170	2025-10-03 04:32:28.365798+00	74	\N	25	2025-09-17	Pago recibido (Transferencia)	0.00	255000.00
171	2025-10-03 04:32:28.365798+00	48	\N	26	2025-09-17	Pago recibido (Efectivo)	0.00	2880000.00
172	2025-10-03 04:32:28.365798+00	40	\N	27	2025-09-17	Pago recibido (Transferencia)	0.00	149000.00
173	2025-10-03 04:32:28.365798+00	39	\N	28	2025-08-11	Pago recibido (Echeq)	0.00	2880000.00
174	2025-10-03 04:32:28.365798+00	39	\N	29	2025-08-11	Pago recibido (Transferencia)	0.00	319500.00
175	2025-10-03 04:32:28.365798+00	39	\N	30	2025-09-04	Pago recibido (Transferencia)	0.00	310500.00
176	2025-10-03 04:32:28.365798+00	39	\N	31	2025-09-17	Pago recibido (Efectivo)	0.00	9000.00
177	2025-10-03 04:32:28.365798+00	66	\N	32	2025-09-17	Pago recibido (Transferencia)	0.00	216600.00
178	2025-10-03 04:32:28.365798+00	74	\N	34	2025-09-17	Pago recibido (Transferencia)	0.00	1500000.00
179	2025-10-03 04:32:28.365798+00	74	\N	35	2025-09-18	Pago recibido (Efectivo)	0.00	1755000.00
180	2025-10-03 04:32:28.365798+00	215	\N	37	2025-09-19	Pago recibido (Transferencia)	0.00	111600.00
183	2025-10-03 12:11:27.135361+00	121	77	\N	2025-10-03	Deuda por Pedido N°0001-00000056	330000.00	0.00
191	2025-10-06 12:29:33.558199+00	217	82	\N	2025-10-06	Deuda por Pedido N°0001-00000060	330000.00	0.00
193	2025-10-06 18:50:36.876095+00	219	\N	38	2025-10-02	Pago aplicado al Doc: 0001-00000053	0.00	855000.00
195	2025-10-07 16:07:06.764706+00	121	83	\N	2025-10-07	Deuda por Pedido N°0001-00000061	2850000.00	0.00
187	2025-10-05 19:54:44.915339+00	121	78	40	2025-10-05	Anulación de Pedido N°0001-00000055	0.00	330000.00
189	2025-10-05 21:43:46.193254+00	121	77	41	2025-10-05	Anulación de Pedido N°0001-00000056	0.00	330000.00
197	2025-10-07 18:12:55.214877+00	222	84	42	2025-10-07	Anulación de Pedido N°0001-00000062	0.00	336600.00
198	2025-10-07 18:13:04.764194+00	121	83	43	2025-10-07	Anulación de Pedido N°0001-00000061	0.00	2850000.00
200	2025-10-09 15:47:28.303458+00	48	85	44	2025-10-09	Anulación de Pedido N°0001-00000063	0.00	660000.00
202	2025-10-14 14:47:21.53826+00	39	87	\N	2025-10-14	Deuda por Pedido N°0001-00000065	525000.00	0.00
204	2025-10-14 14:56:54.392407+00	39	87	\N	2025-10-14	Anulación de Pedido N°0001-00000065	0.00	525000.00
206	2025-10-15 15:40:12.960722+00	48	\N	46	2025-10-15	Pago aplicado al Doc: 0001-00000059	0.00	1800000.00
208	2025-10-20 13:04:53.563523+00	220	\N	48	2025-10-17	Pago aplicado al Doc: 0001-00000058	0.00	2000000.00
210	2025-10-24 16:58:08.842522+00	272	90	\N	2025-10-24	Deuda por Pedido N°0001-00000068	900000.00	0.00
212	2025-10-27 16:19:15.520258+00	48	\N	50	2025-10-27	Pago aplicado al Doc: 0001-00000059	0.00	1800000.00
214	2025-10-28 15:58:54.712156+00	48	\N	51	2025-10-27	Pago aplicado al Doc: 0001-00000066	0.00	525000.00
215	2025-10-31 18:13:17.871732+00	121	96	\N	2025-10-31	Deuda por Pedido N°0001-00000074	35000.00	0.00
217	2025-11-02 17:58:23.206233+00	121	\N	52	2025-11-02	Pago aplicado al Doc: 0001-00000074	0.00	41600.00
219	2025-11-02 23:24:25.385504+00	121	99	\N	2025-11-02	Deuda por Pedido N°0001-00000080	105000.00	0.00
221	2025-11-03 18:41:32.75764+00	121	99	\N	2025-11-03	Anulación de Pedido N°0001-00000080	0.00	105000.00
224	2025-11-03 18:44:53.516039+00	222	97	\N	2025-11-03	Anulación de Pedido N°0001-00000077	0.00	1710000.00
226	2025-11-04 19:47:45.253568+00	275	102	\N	2025-11-04	Deuda por Pedido N°0001-00000084	2723000.00	0.00
181	2025-10-03 12:11:27.133141+00	121	78	\N	2025-10-03	Deuda por Pedido N°0001-00000055	330000.00	0.00
185	2025-10-03 16:36:13.626787+00	221	79	\N	2025-10-03	Deuda por Pedido N°0001-00000057	315000.00	0.00
188	2025-10-05 21:37:05.916935+00	220	80	\N	2025-10-05	Deuda por Pedido N°0001-00000058	3800000.00	0.00
190	2025-10-06 12:19:15.57961+00	48	81	\N	2025-10-06	Deuda por Pedido N°0001-00000059	3600000.00	0.00
194	2025-10-06 18:53:09.436257+00	221	\N	39	2025-10-06	Pago aplicado al Doc: 0001-00000057	0.00	315000.00
196	2025-10-07 16:21:54.399685+00	222	84	\N	2025-10-07	Deuda por Pedido N°0001-00000062	336600.00	0.00
199	2025-10-09 15:46:52.229948+00	48	85	\N	2025-10-09	Deuda por Pedido N°0001-00000063	660000.00	0.00
201	2025-10-13 16:41:14.901621+00	39	86	\N	2025-10-13	Deuda por Pedido N°0001-00000064	2025000.00	0.00
192	2025-10-06 12:32:05.803497+00	217	82	45	2025-10-06	Anulación de Pedido N°0001-00000060	0.00	330000.00
203	2025-10-14 14:55:51.38978+00	48	88	\N	2025-10-14	Deuda por Pedido N°0001-00000066	525000.00	0.00
205	2025-10-15 15:33:59.027077+00	224	89	\N	2025-10-15	Deuda por Pedido N°0001-00000067	324000.00	0.00
207	2025-10-20 13:01:30.370123+00	224	\N	47	2025-10-18	Pago aplicado al Doc: 0001-00000067	0.00	324000.00
209	2025-10-22 15:49:24.969702+00	220	\N	49	2025-10-22	Pago aplicado al Doc: 0001-00000058	0.00	1800000.00
211	2025-10-24 17:18:04.853983+00	74	91	\N	2025-10-24	Deuda por Pedido N°0001-00000069	630000.00	0.00
213	2025-10-27 16:44:22.232639+00	273	92	\N	2025-10-27	Deuda por Pedido N°0001-00000070	315000.00	0.00
216	2025-10-31 18:52:54.329861+00	222	97	\N	2025-10-31	Deuda por Pedido N°0001-00000077	1710000.00	0.00
218	2025-11-02 19:01:47.380524+00	121	98	\N	2025-11-02	Deuda por Pedido N°0001-00000078	1150000.00	0.00
220	2025-11-03 17:51:10.244881+00	121	100	\N	2025-11-03	Deuda por Pedido N°0001-00000082	330000.00	0.00
222	2025-11-03 18:43:12.540893+00	121	98	\N	2025-11-03	Anulación de Pedido N°0001-00000078	0.00	1150000.00
223	2025-11-03 18:43:19.656175+00	121	100	\N	2025-11-03	Anulación de Pedido N°0001-00000082	0.00	339000.00
225	2025-11-04 11:09:00.551971+00	220	101	\N	2025-11-04	Deuda por Pedido N°0001-00000083	4200000.00	0.00
\.


--
-- Data for Name: movimientos_cuenta_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos_cuenta_proveedor (id, created_at, proveedor_id, compra_id, pago_id, fecha, concepto, debe, haber) FROM stdin;
1	2025-09-05 13:37:31.65888+00	38b66d75-3003-4be0-a5df-51dcb4dc4232	1	\N	2025-09-05	Deuda por OC-00001	27550000.00	0.00
\.


--
-- Data for Name: pagos_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos_comisiones (id, created_at, fecha_pago, vendedor_id, monto_total, concepto, comprobante_url) FROM stdin;
1	2025-08-25 02:19:47.083359+00	2025-08-25	3	841200.00000000000000000000	Liquidación Comisiones Agosto 2025	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/recibos_comisiones/public/3-1756088386736.pdf
\.


--
-- Data for Name: perfiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfiles (id, vendedor_id, nombre, email, telefono, foto_url, created_at, organizacion_id) FROM stdin;
fcd336ee-71b2-4cc9-8573-bab798216501	17	IPE Shop	ipemercadoshop@gmail.com		\N	2025-10-05 21:47:29.587184+00	1
c03591f7-1edf-412b-bcc6-89124e6ff1c9	\N	Enrique Barbeito	barbeito.enrique@gmail.com	\N	\N	2025-10-12 16:20:36.502751+00	1
e7b46826-8126-47da-a3ea-ed10eb69d068	4	Ignacio Silva Montaner	isilvamontaner02@gmail.com	1151480357	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/perfiles/vendedores/4-1755716278197.jpg	2025-09-09 17:53:32.39028+00	1
b8d511d8-60c5-4e45-85d6-84382495eadd	18	Pepe mujica	yoreparolomas@gmail.com		\N	2025-10-20 14:59:03.478227+00	1
c39967c6-cf8a-4546-a65d-168e43b4b1c3	15	Call Center Biosplus	ventasbiosplus@gmail.com	+54 9 11 3475-1301	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/perfiles/public/c39967c6-cf8a-4546-a65d-168e43b4b1c3-1758717235858.jpg	2025-09-15 20:21:29.506898+00	1
5e803c44-a3c6-430d-9ae1-7a025651555e	\N	\N	gemini.dev.assistant.g@gmail.com	\N	\N	2025-09-24 16:10:12.24716+00	1
0cd44ec8-1243-41c3-baea-e61dc19de624	13	Conrado Iturria	conra.iturria@gmail.com	1128237482	\N	2025-09-09 17:53:32.39028+00	1
c145694f-77b3-4baf-90c0-c7ebeee69cd6	3	Hernan Maldacena	maldacenah@gmail.com	1132029805	https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/perfiles/public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1759258186216.jpg	2025-09-09 17:53:32.39028+00	1
0a3c12de-5dbc-4ff7-83ae-7de315b392f3	\N	Alejandro Schipani	alejandroschipani@gmail.com	\N	\N	2025-09-18 18:26:50.128039+00	1
485fd993-8102-472e-94d4-803e80bc4d9a	\N	Enrique Gabriel	egb.labot@gmail.com	\N	\N	2025-09-20 15:08:34.509068+00	1
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	16	Ezequiel Urdiñez	eurdinez@gmail.com		https://jsbgutbsckwintsnhnno.supabase.co/storage/v1/object/public/perfiles/public/b6037848-7408-4c5e-b8e5-9a4bb378f9ac-1758034627246.jpg	2025-09-16 14:23:52.41971+00	1
8874606b-f5c7-41cb-83b0-93cb368e5f9e	\N	Conrado Muriñigo	comprasalimentia@gmail.com	\N	\N	2025-11-04 15:51:50.917204+00	1
bab1e667-f842-4ebc-9f5f-6039ebd1d526	19	Erika Valker	erikabiosplus@gmail.com	+54 9 11 5715-4102	\N	2025-11-04 19:11:40.29778+00	1
\.


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permisos (id, nombre_permiso, descripcion) FROM stdin;
1	configuracion:ver	Acceder a la sección de Configuración
2	configuracion:editar:roles	Asignar y modificar roles y permisos de usuarios
3	contactos:ver:propios	Ver solo los contactos asignados al usuario
4	contactos:ver:todos	Ver todos los contactos de todos los vendedores
5	contactos:crear	Crear nuevos contactos
6	contactos:editar	Editar la ficha de cualquier contacto
7	contactos:eliminar	Eliminar o archivar contactos
8	pedidos:ver:propios	Ver solo los pedidos del usuario
9	pedidos:ver:todos	Ver todos los pedidos de todos los vendedores
10	pedidos:crear	Crear nuevos pedidos
11	pedidos:editar	Editar pedidos existentes
12	pedidos:cambiar_estado	Modificar el estado de un pedido (ej: a Despachado)
13	pedidos:ver:precios	Ver los precios y valores en los pedidos
14	analisis:ver:gerencial	Acceder al dashboard gerencial y análisis de ventas
15	comisiones:ver:propias	Ver el estado de las comisiones propias
16	comisiones:ver:todas	Ver las comisiones de todos los vendedores
17	comisiones:liquidar	Acceder a la liquidación y pago de comisiones
18	pedidos:anular	Permite anular un pedido.
19	pedidos:descargar:pdf	Permite descargar el remito/PDF de un pedido.
20	ctacte_clientes:ver	Permite ver la cuenta corriente de los clientes.
21	ctacte_clientes:crear_pago	Permite registrar pagos de clientes.
22	ctacte_proveedores:ver	Permite ver la cuenta corriente de los proveedores.
23	ctacte_proveedores:crear_pago	Permite registrar pagos a proveedores.
24	contactos:asignar_vendedor	Permite cambiar el vendedor asignado a un contacto
25	compras:crear	Permite crear nuevas Órdenes de Compra
26	compras:editar	Permite editar Órdenes de Compra en estado Borrador
27	compras:recepcionar	Permite marcar una OC como Recibida y registrar lotes
28	compras:reversar	Permite anular la recepción de una OC, devolviendo el stock
29	productos:crear	Permite crear nuevos productos en el catálogo
30	productos:editar	Permite editar la ficha de cualquier producto
31	stock:asignar	Permite asignar stock del depósito principal a los vendedores
32	stock:ajustar	Permite realizar ajustes manuales de stock en los lotes
39	configuracion:editar:empresa	\N
45	oportunidades:ver:propias	\N
46	oportunidades:ver:todas	\N
47	oportunidades:crear	\N
48	oportunidades:editar	\N
1101	ctacte_clientes:ver:propios	Ver Cta. Cte. solo de clientes propios
1102	ctacte_clientes:ver:todos	Ver Cta. Cte. de todos los clientes
1997	dashboard:ver:propio	Ver el dashboard personal del vendedor
1998	dashboard:ver:todos	Ver el dashboard de cualquier vendedor (supervisión)
1999	vista360:acceder	Permite acceder a la vista 360 de un cliente
4844	dashboard:ver:gerencial	\N
9547	productos:ver	\N
9550	stock:ver:general	\N
9553	compras:ver	\N
15246	configuracion:editar:etapas	Permite crear, editar y eliminar las etapas del embudo de ventas.
26817	analisis:ver:propios	Ver análisis de ventas solo de su propia gestión
26818	analisis:ver:todos	Ver análisis de ventas de todos los vendedores
26947	stock:ver:propios	Ver solo el stock asignado al propio vendedor
27038	pedidos:anular:propios	Anular pedidos creados por el propio vendedor
29705	solicitudes:resolver	Acceder a la vista de aprobaciones y resolver solicitudes de precio.
39760	oportunidades:ver:propios	\N
39761	oportunidades:ver:todos	\N
39764	oportunidades:eliminar	\N
39765	oportunidades:editar:precio	Permite editar precios directamente en presupuestos y pedidos.
\.


--
-- Data for Name: proveedor_contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor_contactos (id, proveedor_id, tipo, nombre, telefono, created_at) FROM stdin;
35	38b66d75-3003-4be0-a5df-51dcb4dc4232	Ventas	Hernan	1164783312	2025-08-17 00:58:47.270221+00
36	38b66d75-3003-4be0-a5df-51dcb4dc4232	Pagos	Ezequier	1125225445	2025-08-17 00:58:47.270221+00
\.


--
-- Data for Name: proveedor_cuentas_bancarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor_cuentas_bancarias (id, proveedor_id, banco, alias, cbu, numero_cuenta, sucursal, created_at) FROM stdin;
\.


--
-- Data for Name: reglas_alertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reglas_alertas (id, nombre_regla, descripcion, entidad, condicion_sql, mensaje_alerta, activa, mensaje_whatsapp) FROM stdin;
1	Oportunidades por Vencer	Alerta sobre oportunidades cuya fecha de cierre prevista es en menos de 7 días.	oportunidades	fecha_cierre_prevista <= CURRENT_DATE + INTERVAL '7 days' AND fecha_cierre_prevista >= CURRENT_DATE	Oportunidad a punto de vencer: {nombre_entidad}	t	\N
9	Seguimiento Programado	Alerta para contactar a un cliente en la fecha agendada.	interacciones	e.fecha_proximo_seguimiento <= CURRENT_DATE	Contactar a {nombre_entidad} (Seguimiento programado).	t	Hola Dr/a. {nombre_entidad}, ¿cómo estás? Te escribo como acordamos para seguir con nuestra conversación. Quedo a tu disposición.
2	Contactos Inactivos	Alerta sobre contactos sin nuevas interacciones en los últimos 30 días.	contactos	fecha_ultimo_contacto < CURRENT_DATE - INTERVAL '30 days'	Realizar seguimiento a: {nombre_entidad}	t	\N
5	Predicción de Recompra (AH)	Sugiere contactar a un médico que compró rellenos de AH hace más de 60 días.	contactos	ultima_compra <= CURRENT_DATE - INTERVAL '60 days' AND productos_habituales ILIKE '%Revanesse%'	Posible necesidad de reponer stock de Rellenos de AH para el Dr/a. {nombre_entidad}.	t	Hola Dr/a. {nombre_entidad}, ¿cómo estás? Te escribo porque noté que tu última compra de Rellenos fue hace un tiempo. Quería saber si necesitas reponer stock o si podemos coordinar para mostrarte las novedades.
6	Oportunidad de Cross-Selling (Bioestimulador)	Identifica médicos que compran rellenos pero nunca bioestimuladores.	contactos	productos_habituales ILIKE '%Revanesse%' AND (productos_habituales NOT ILIKE '%Olidia%' OR productos_habituales IS NULL)	Ofrecer Olidia (Bioestimulador) al Dr/a. {nombre_entidad}, ya que es comprador recurrente de rellenos.	t	Hola Dr/a. {nombre_entidad}, espero que estés muy bien. Viendo que eres un usuario frecuente de nuestros rellenos, pensé que podría interesarte nuestro bioestimulador Olidia. ¿Te gustaría que te envíe información o coordinemos una breve llamada para comentarte sus beneficios?
7	Seguimiento de Presupuesto	Alerta si un presupuesto enviado no tiene un pedido asociado después de 15 días.	oportunidades	etapa_id = (SELECT id FROM etapas_venta WHERE nombre = 'Propuesta Enviada') AND created_at < CURRENT_DATE - INTERVAL '15 days' AND id NOT IN (SELECT oportunidad_id FROM pedidos WHERE oportunidad_id IS NOT NULL)	Realizar seguimiento del presupuesto "{nombre_entidad}".	t	Hola Dr/a. {nombre_entidad}, ¿cómo va todo? Te contacto para hacer seguimiento sobre el presupuesto "{nombre_entidad}" que te envié. Quedo a tu disposición por si tienes alguna duda o si quieres que lo revisemos juntos.
8	Contacto Inactivo	Alerta si no ha habido ninguna compra o presupuesto en los últimos 90 días.	contactos	ultima_compra < CURRENT_DATE - INTERVAL '90 days' AND id NOT IN (SELECT contacto_id FROM oportunidades WHERE created_at > CURRENT_DATE - INTERVAL '90 days')	Contactar a {nombre_entidad} para reactivar la relación comercial.	t	Hola Dr/a. {nombre_entidad}, ¿cómo estás? Hace un tiempo que no conversamos. Quería ponerme a tu disposición y contarte sobre las nuevas promociones que tenemos disponibles. ¡Espero que estés muy bien!
\.


--
-- Data for Name: reportes_usabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reportes_usabilidad (id, created_at, area_crm, descripcion, estado, reportado_por, prioridad, prompt_generado) FROM stdin;
1	2025-09-05 13:04:44.010752+00	Contactos	Con mí usuario puedo ver los contactos de todos los usuarios. Lo que debería pasar es que vea sólo los míos.\n	Resuelto	Ignacio Silva Montaner	Alta	\N
2	2025-09-05 13:34:48.937886+00	Otro	En cuentas corrientes clientes cuando quiero adjuntar el comprobante de un pago aparece esta leyenda Error al registrar el pago: Error al subir el comprobante: new row violates row-level security policy. y no puedo hacerlo	Resuelto	Hernan Maldacena	Alta	\N
4	2025-09-17 12:45:09.456131+00	Otro	en el centro de mando para agregar un pedido a un cliente el sistema me frena diciendo que debo agregar un cliente para cargar el pedido, el problema es que el cliente ya fue seleccionado por ende no deberia frenarme	Resuelto	Hernan Maldacena	Media	\N
3	2025-09-17 12:41:04.823802+00	Contactos	intentaba modificar un contacto y al salir el boton cruz no funcionaba por lo que solamente podia apretar el boton cancelar o recargar el crm para salir de ese modulo	Resuelto	Hernan Maldacena	Baja	\N
5	2025-09-18 17:30:51.239415+00	Otro	centro de analisis de ventas no funciona\n	Resuelto	Hernan Maldacena	Alta	\N
10	2025-10-01 00:53:23.733318+00	Otro	Modulo compras, no funciona el boton de editar y el de crear una nueva OC. consolacompras.js:200 Uncaught (in promise) TypeError: Cannot read properties of null (reading 'reset')\n    at openPOModal (compras.js:200:39)\n    at HTMLElement.<anonymous> (compras.js:396:13)\nopenPOModal\t@\tcompras.js:200\n(anonymous)\t@\tcompras.js:396\n\n	Resuelto	Hernan Maldacena	Crítica	\N
9	2025-10-01 00:51:44.648543+00	Contactos	FAB solo se mueve no da opciones. Boton de modificar contacto no funciona y boton de editar tampoco. No da error de consola	Resuelto	Hernan Maldacena	Crítica	\N
8	2025-10-01 00:48:14.381413+00	Pedidos	Si intento modificar el precio de un pedido por uno distinto siendo gerente de ventas. lo modifico pero cuando guardo el pedido vuelve al precio anterior da este error pedidos.js:747 Error al guardar el pedido: Error: Debe seleccionar un cliente para el pedido.\n    at handleSavePedido (pedidos.js:677:19)\n    at HTMLButtonElement.<anonymous> (pedidos.js:1034:13)\nhandleSavePedido\t@\tpedidos.js:747\n(anonymous)\t@\tpedidos.js:1034\n\npedidos.js:747 Error al guardar el pedido: Error: Debe seleccionar un cliente para el pedido.\n    at handleSavePedido (pedidos.js:677:19)\n    at HTMLButtonElement.<anonymous> (pedidos.js:1138:9)\nhandleSavePedido\t@\tpedidos.js:747\n(anonymous)\t@\tpedidos.js:1138\n	Resuelto	Hernan Maldacena	Alta	\N
7	2025-10-01 00:40:31.043072+00	Pedidos	pedidos.js:1054 Uncaught (in promise) ReferenceError: handleSendToLogistics is not defined\n    at attachEventListeners (pedidos.js:1054:82)\n    at Object.initializePedidosModule [as fn] (pedidos.js:1405:5)\n    at async handleNavigation (main.js:139:21)\nattachEventListeners\t@\tpedidos.js:1054\ninitializePedidosModule\t@\tpedidos.js:1405\nawait in initializePedidosModule\t\t\nhandleNavigation\t@\tmain.js:139	Resuelto	Hernan Maldacena	Crítica	\N
6	2025-10-01 00:39:15.28843+00	Pedidos	Intento entrar a pedidos por primera vez y no se ve nada, salgo y cuando vuelvo a entrar se ven.	Resuelto	Hernan Maldacena	Crítica	\N
11	2025-10-07 17:34:03.803995+00	Contactos	´pnñbb{í	Pendiente	Conrado Iturria	Media	\N
12	2025-11-03 19:12:48.681173+00	Dashboard	Buscador no funciona	Pendiente	Hernan Maldacena	Media	\N
13	2025-11-03 19:17:38.936787+00	Dashboard	analisis de compra no funciona\n	Pendiente	Hernan Maldacena	Media	\N
14	2025-11-03 19:32:56.06048+00	Aprobaciones	modulo de aprobaciones no sirve	Pendiente	Hernan Maldacena	Media	\N
\.


--
-- Data for Name: reservas_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas_pedido (id, pedido_id, producto_id, lote_id, cantidad, confirmado, created_at) FROM stdin;
\.


--
-- Data for Name: reservas_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas_stock (id, pedido_id, lote_id, cantidad_reservada, fecha_expiracion, created_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, nombre_rol) FROM stdin;
1	Superadministrador
2	Administracion
3	Logística
4	Vendedor
5	Gerente de Ventas
\.


--
-- Data for Name: rol_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_permisos (rol_id, permiso_id) FROM stdin;
2	13
2	26818
1	26818
2	20
2	21
2	22
2	23
2	7
2	24
2	5
2	6
2	25
2	26
2	27
2	28
3	27
3	28
2	29
2	30
2	31
2	32
3	31
3	32
2	17
4	3
4	5
4	6
4	8
4	10
4	11
4	15
2	9550
3	9550
4	18
4	19
4	45
4	47
4	48
4	1101
4	1997
4	1999
4	9547
4	26817
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
4	26947
4	27038
4	29705
4	39760
5	39761
1	39760
1	39761
1	32
1	39
1	45
1	46
1	47
1	48
1	1101
2	15246
1	39764
1	1102
1	4844
1	9547
1	9550
1	9553
1	39765
5	39765
5	4
5	5
5	6
5	24
5	46
5	47
5	48
5	9
5	10
5	11
5	12
5	13
5	26818
5	1102
5	16
5	29705
\.


--
-- Data for Name: stock_ajustes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_ajustes (id, created_at, producto_id, lote_id, tipo_ajuste, cantidad, justificacion, operador) FROM stdin;
1	2025-09-14 01:04:02.486655+00	35	13	Entrada	10	Ajuste de prueba por corrección de sistema	Sistema (Debug)
2	2025-09-14 01:04:02.486655+00	25	14	Salida	2	Ajuste de prueba por rotura	Sistema (Debug)
3	2025-09-14 03:18:39.378076+00	4	2	Entrada	5	jjjj	Hernan Maldacena
4	2025-09-15 02:51:11.324016+00	33	10	Devolución a Depósito	5	error humano	Desde Vendedor: Hernan Maldacena
5	2025-09-15 17:25:23.768534+00	3	3	Entrada a Vendedor	2	Corrección de stock por inconsistencia histórica detectada en auditoría.	Sistema (Admin) -> Hernan Maldacena
6	2025-09-15 17:25:23.768534+00	2	4	Entrada a Vendedor	2	Corrección de stock por inconsistencia histórica detectada en auditoría.	Sistema (Admin) -> Hernan Maldacena
7	2025-09-15 17:25:23.768534+00	31	5	Entrada a Vendedor	2	Corrección de stock por inconsistencia histórica detectada en auditoría.	Sistema (Admin) -> Hernan Maldacena
8	2025-09-17 01:14:53.264726+00	36	17	Salida por Asignación	50	Asignado a vendedor: Hernan Maldacena	Hernan Maldacena
9	2025-09-17 01:22:01.095738+00	36	17	Devolución a Depósito	50	devo	Desde Vendedor: Hernan Maldacena
10	2025-09-17 01:26:21.919814+00	36	17	Salida por Asignación	50	Asignado a vendedor: Hernan Maldacena	Hernan Maldacena
11	2025-09-18 18:39:06.637173+00	26	9	Salida por Asignación	10	Asignado a vendedor: Hernan Maldacena	Alejandro Schipani
12	2025-09-18 18:39:06.637173+00	28	8	Salida por Asignación	5	Asignado a vendedor: Hernan Maldacena	Alejandro Schipani
13	2025-09-18 18:39:06.637173+00	35	13	Salida por Asignación	5	Asignado a vendedor: Hernan Maldacena	Alejandro Schipani
14	2025-09-18 18:39:06.637173+00	25	7	Salida por Asignación	5	Asignado a vendedor: Hernan Maldacena	Alejandro Schipani
15	2025-09-18 18:39:06.637173+00	27	6	Salida por Asignación	5	Asignado a vendedor: Hernan Maldacena	Alejandro Schipani
16	2025-09-19 19:39:44.537356+00	4	2	Salida por Asignación	10	Asignado a vendedor: Hernan Maldacena	Ezequiel Urdiñez
17	2025-09-19 19:39:44.537356+00	3	3	Salida por Asignación	8	Asignado a vendedor: Hernan Maldacena	Ezequiel Urdiñez
20	2025-10-03 04:38:44.135101+00	28	8	Entrada	55	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
21	2025-10-03 04:38:44.135101+00	31	5	Entrada	50	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
23	2025-10-03 04:38:44.135101+00	33	10	Entrada	40	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
24	2025-10-03 04:38:44.135101+00	35	13	Entrada	21	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
25	2025-10-03 04:38:44.135101+00	26	9	Entrada	70	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
26	2025-10-03 04:38:44.135101+00	25	7	Entrada	55	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
27	2025-10-03 04:38:44.135101+00	2	4	Entrada	50	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
28	2025-10-03 04:38:44.135101+00	35	12	Entrada	50	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
29	2025-10-03 04:38:44.135101+00	4	2	Entrada	55	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
30	2025-10-03 04:38:44.135101+00	32	11	Entrada	50	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
31	2025-10-03 04:38:44.135101+00	36	17	Entrada	50	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
32	2025-10-03 04:38:44.135101+00	3	3	Entrada	58	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
33	2025-10-03 04:38:44.135101+00	27	6	Entrada	56	Corrección masiva de stock por anulaciones fallidas	Sistema (Admin)
34	2025-10-05 21:43:46.193254+00	35	\N	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000056	Hernan Maldacena
35	2025-10-06 12:32:05.803497+00	27	6	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000060	Hernan Maldacena
41	2025-10-06 16:21:31.147685+00	35	13	Entrada	19	Saneamiento automático por auditoría para corregir faltante de 19 unidades.	Sistema (Saneamiento por Auditoría)
42	2025-10-06 16:21:31.147685+00	26	9	Entrada	14	Saneamiento automático por auditoría para corregir faltante de 14 unidades.	Sistema (Saneamiento por Auditoría)
43	2025-10-06 16:21:31.147685+00	27	6	Entrada	7	Saneamiento automático por auditoría para corregir faltante de 7 unidades.	Sistema (Saneamiento por Auditoría)
44	2025-10-06 16:21:31.147685+00	2	4	Entrada	4	Saneamiento automático por auditoría para corregir faltante de 4 unidades.	Sistema (Saneamiento por Auditoría)
45	2025-10-06 16:21:31.147685+00	3	3	Entrada	3	Saneamiento automático por auditoría para corregir faltante de 3 unidades.	Sistema (Saneamiento por Auditoría)
46	2025-10-06 16:21:31.147685+00	31	5	Entrada	3	Saneamiento automático por auditoría para corregir faltante de 3 unidades.	Sistema (Saneamiento por Auditoría)
47	2025-10-06 16:51:10.679123+00	2	4	Entrada	4	Saneamiento automático para corregir faltante histórico de 4 unidades.	Sistema (Saneamiento por Auditoría)
48	2025-10-06 16:51:10.679123+00	3	3	Entrada	3	Saneamiento automático para corregir faltante histórico de 3 unidades.	Sistema (Saneamiento por Auditoría)
49	2025-10-06 16:51:10.679123+00	26	9	Entrada	14	Saneamiento automático para corregir faltante histórico de 14 unidades.	Sistema (Saneamiento por Auditoría)
50	2025-10-06 16:51:10.679123+00	35	13	Entrada	19	Saneamiento automático para corregir faltante histórico de 19 unidades.	Sistema (Saneamiento por Auditoría)
52	2025-10-06 16:51:10.679123+00	31	5	Entrada	3	Saneamiento automático para corregir faltante histórico de 3 unidades.	Sistema (Saneamiento por Auditoría)
53	2025-10-06 16:51:10.679123+00	27	6	Entrada	7	Saneamiento automático para corregir faltante histórico de 7 unidades.	Sistema (Saneamiento por Auditoría)
54	2025-10-07 18:12:55.214877+00	35	13	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000062	Sistema (Anulación)
55	2025-10-07 18:12:55.214877+00	33	10	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000062	Sistema (Anulación)
56	2025-10-07 18:13:04.764194+00	28	8	DEVOLUCIÓN POR ANULACIÓN	10	Reversión por anulación del Pedido N°0001-00000061	Sistema (Anulación)
58	2025-10-09 15:47:28.303458+00	27	6	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000063	Sistema (Anulación)
59	2025-10-14 14:56:54.392407+00	3	3	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000065	Sistema (Anulación)
60	2025-10-14 14:56:54.392407+00	2	4	DEVOLUCIÓN POR ANULACIÓN	3	Reversión por anulación del Pedido N°0001-00000065	Sistema (Anulación)
61	2025-10-14 14:56:54.392407+00	31	5	DEVOLUCIÓN POR ANULACIÓN	1	Reversión por anulación del Pedido N°0001-00000065	Sistema (Anulación)
\.


--
-- Data for Name: tipos_de_cambio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_de_cambio (fecha, moneda, valor_venta, created_at) FROM stdin;
2025-08-26	USD	1370.00	2025-08-29 14:01:46.286297+00
2025-08-27	USD	1330.50	2025-08-29 14:21:26.15466+00
2025-08-28	USD	1332.00	2025-08-29 14:21:26.15466+00
2025-08-29	USD	1334.75	2025-08-29 14:21:26.15466+00
2025-08-09	USD	1320.50	2025-08-29 14:54:49.373662+00
2025-08-19	USD	1325.00	2025-08-29 14:54:49.373662+00
2025-08-24	USD	1330.75	2025-08-29 14:54:49.373662+00
\.


--
-- Data for Name: tipos_documento_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_documento_pago (id, nombre) FROM stdin;
1	Pedido
2	Factura
\.


--
-- Data for Name: usuario_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_roles (usuario_id, rol_id) FROM stdin;
b8d511d8-60c5-4e45-85d6-84382495eadd	1
b8d511d8-60c5-4e45-85d6-84382495eadd	4
b8d511d8-60c5-4e45-85d6-84382495eadd	5
5e803c44-a3c6-430d-9ae1-7a025651555e	4
8874606b-f5c7-41cb-83b0-93cb368e5f9e	4
bab1e667-f842-4ebc-9f5f-6039ebd1d526	4
e7b46826-8126-47da-a3ea-ed10eb69d068	1
c39967c6-cf8a-4546-a65d-168e43b4b1c3	1
0a3c12de-5dbc-4ff7-83ae-7de315b392f3	1
485fd993-8102-472e-94d4-803e80bc4d9a	1
c145694f-77b3-4baf-90c0-c7ebeee69cd6	1
c145694f-77b3-4baf-90c0-c7ebeee69cd6	2
c145694f-77b3-4baf-90c0-c7ebeee69cd6	4
c145694f-77b3-4baf-90c0-c7ebeee69cd6	5
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	1
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	2
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	3
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	4
b6037848-7408-4c5e-b8e5-9a4bb378f9ac	5
fcd336ee-71b2-4cc9-8573-bab798216501	4
c03591f7-1edf-412b-bcc6-89124e6ff1c9	1
c03591f7-1edf-412b-bcc6-89124e6ff1c9	2
c03591f7-1edf-412b-bcc6-89124e6ff1c9	3
c03591f7-1edf-412b-bcc6-89124e6ff1c9	4
c03591f7-1edf-412b-bcc6-89124e6ff1c9	5
0cd44ec8-1243-41c3-baea-e61dc19de624	4
\.


--
-- Data for Name: zonas_envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zonas_envio (id, nombre, costo, monto_minimo_bonificacion, organizacion_id, created_at, geometria) FROM stdin;
8	Amplia	20000	\N	1	2025-11-03 15:56:47.628744+00	0103000020E61000000100000004000000AB13481D0F404DC0EB7D39D73A3F41C0AB13481DF45A4DC0AA03A8CDA46041C0AB13481D301F4DC0E680FDBEEE6041C0AB13481D0F404DC0EB7D39D73A3F41C0
9	GBA Sur	9000	500000	1	2025-11-03 17:07:34.190225+00	\N
10	CABA	6600	315000	1	2025-11-03 17:23:28.41301+00	\N
11	GBA Norte	0	\N	1	2025-11-04 02:37:18.391477+00	0103000020E6100000010000000500000052B81E85EB514DC033333333333341C09A99999999394DC0CDCCCCCCCC2C41C0713D0AD7A3304DC0C3F5285C8F4241C06666666666464DC00AD7A3703D4A41C052B81E85EB514DC033333333333341C0
12	CABA (Capital Federal)	0	\N	1	2025-11-04 02:37:32.924104+00	0103000020E610000001000000050000006ABC749318444DC0F853E3A59B4441C04260E5D0222B4DC04C378941604541C021B07268912D4DC00AD7A3703D5A41C0A4703D0AD7434DC046B6F3FDD45841C06ABC749318444DC0F853E3A59B4441C0
13	CABA (Capital Federal)	0	\N	1	2025-11-04 02:37:34.27046+00	0103000020E610000001000000050000006ABC749318444DC0F853E3A59B4441C04260E5D0222B4DC04C378941604541C021B07268912D4DC00AD7A3703D5A41C0A4703D0AD7434DC046B6F3FDD45841C06ABC749318444DC0F853E3A59B4441C0
14	CABA (Capital Federal)	0	\N	1	2025-11-04 02:37:35.804169+00	0103000020E610000001000000050000006ABC749318444DC0F853E3A59B4441C04260E5D0222B4DC04C378941604541C021B07268912D4DC00AD7A3703D5A41C0A4703D0AD7434DC046B6F3FDD45841C06ABC749318444DC0F853E3A59B4441C0
15	CABA (Capital Federal)	0	\N	1	2025-11-04 03:02:19.924893+00	0103000020E610000001000000050000006ABC749318444DC0F853E3A59B4441C04260E5D0222B4DC04C378941604541C021B07268912D4DC00AD7A3703D5A41C0A4703D0AD7434DC046B6F3FDD45841C06ABC749318444DC0F853E3A59B4441C0
16	GBA Norte	0	\N	1	2025-11-04 03:02:21.230043+00	0103000020E6100000010000000500000052B81E85EB514DC033333333333341C09A99999999394DC0CDCCCCCCCC2C41C0713D0AD7A3304DC0C3F5285C8F4241C06666666666464DC00AD7A3703D4A41C052B81E85EB514DC033333333333341C0
17	Rosario (Centro)	0	\N	1	2025-11-04 03:02:22.230511+00	0103000020E61000000100000005000000F6285C8FC2554EC0D7A3703D0A7740C0713D0AD7A3504EC0F6285C8FC27540C08FC2F5285C4F4EC07B14AE47E17A40C014AE47E17A544EC05C8FC2F5287C40C0F6285C8FC2554EC0D7A3703D0A7740C0
18	Nueva Zona	0	0	1	2025-11-04 15:09:45.057234+00	0103000020E61000000100000006000000AB130C31B04E4DC00E539169FE3D41C0AB130C31D15A4DC09F230EDC134441C0AB130C315E554DC0F2F40D51DE4941C0AB130C3132454DC08611E80A7C4241C0AB130C31864B4DC0B2C2AB43413C41C0AB130C31B04E4DC00E539169FE3D41C0
\.


--
-- Data for Name: messages_2025_08_25; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_25 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_26; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_26 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_27; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_27 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_28; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_28 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_29; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_29 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_30; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_30 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_08_31; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_08_31 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-07-21 03:49:53
20211116045059	2025-07-21 03:49:57
20211116050929	2025-07-21 03:50:01
20211116051442	2025-07-21 03:50:04
20211116212300	2025-07-21 03:50:08
20211116213355	2025-07-21 03:50:12
20211116213934	2025-07-21 03:50:15
20211116214523	2025-07-21 03:50:20
20211122062447	2025-07-21 03:50:23
20211124070109	2025-07-21 03:50:26
20211202204204	2025-07-21 03:50:30
20211202204605	2025-07-21 03:50:33
20211210212804	2025-07-21 03:50:44
20211228014915	2025-07-21 03:50:47
20220107221237	2025-07-21 03:50:50
20220228202821	2025-07-21 03:50:54
20220312004840	2025-07-21 03:50:57
20220603231003	2025-07-21 03:51:02
20220603232444	2025-07-21 03:51:06
20220615214548	2025-07-21 03:51:10
20220712093339	2025-07-21 03:51:13
20220908172859	2025-07-21 03:51:16
20220916233421	2025-07-21 03:51:20
20230119133233	2025-07-21 03:51:23
20230128025114	2025-07-21 03:51:28
20230128025212	2025-07-21 03:51:31
20230227211149	2025-07-21 03:51:34
20230228184745	2025-07-21 03:51:38
20230308225145	2025-07-21 03:51:41
20230328144023	2025-07-21 03:51:44
20231018144023	2025-07-21 03:51:48
20231204144023	2025-07-21 03:51:54
20231204144024	2025-07-21 03:51:57
20231204144025	2025-07-21 03:52:00
20240108234812	2025-07-21 03:52:03
20240109165339	2025-07-21 03:52:07
20240227174441	2025-07-21 03:52:13
20240311171622	2025-07-21 03:52:17
20240321100241	2025-07-21 03:52:25
20240401105812	2025-07-21 03:52:34
20240418121054	2025-07-21 03:52:39
20240523004032	2025-07-21 03:52:51
20240618124746	2025-07-21 03:52:54
20240801235015	2025-07-21 03:52:57
20240805133720	2025-07-21 03:53:01
20240827160934	2025-07-21 03:53:04
20240919163303	2025-07-21 03:53:09
20240919163305	2025-07-21 03:53:12
20241019105805	2025-07-21 03:53:15
20241030150047	2025-07-21 03:53:28
20241108114728	2025-07-21 03:53:32
20241121104152	2025-07-21 03:53:36
20241130184212	2025-07-21 03:53:40
20241220035512	2025-07-21 03:53:43
20241220123912	2025-07-21 03:53:46
20241224161212	2025-07-21 03:53:50
20250107150512	2025-07-21 03:53:53
20250110162412	2025-07-21 03:53:56
20250123174212	2025-07-21 03:54:00
20250128220012	2025-07-21 03:54:03
20250506224012	2025-07-21 03:54:06
20250523164012	2025-07-21 03:54:09
20250714121412	2025-07-21 03:54:12
20250905041441	2025-09-24 01:48:53
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
propuestas	propuestas	\N	2025-07-26 06:21:54.450185+00	2025-07-26 06:21:54.450185+00	t	f	\N	\N	\N	STANDARD
remitos	remitos	\N	2025-08-05 17:57:26.058746+00	2025-08-05 17:57:26.058746+00	t	f	\N	\N	\N	STANDARD
assets	assets	\N	2025-08-10 01:01:29.439502+00	2025-08-10 01:01:29.439502+00	t	f	\N	\N	\N	STANDARD
perfiles	perfiles	\N	2025-08-16 21:14:16.676082+00	2025-08-16 21:14:16.676082+00	t	f	\N	\N	\N	STANDARD
recibos_comisiones	recibos_comisiones	\N	2025-08-25 00:45:10.216595+00	2025-08-25 00:45:10.216595+00	t	f	\N	\N	\N	STANDARD
comprobantes_pago_clientes	comprobantes_pago_clientes	\N	2025-08-25 18:45:49.144578+00	2025-08-25 18:45:49.144578+00	t	f	\N	\N	\N	STANDARD
comprobantes_pago_vendedores	comprobantes_pago_vendedores	\N	2025-08-25 02:23:14.764357+00	2025-08-25 02:23:14.764357+00	t	f	\N	\N	\N	STANDARD
public-assets	public-assets	\N	2025-10-05 23:23:16.820052+00	2025-10-05 23:23:16.820052+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-07-21 03:49:48.218179
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-07-21 03:49:48.235587
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-07-21 03:49:48.243433
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-07-21 03:49:48.26714
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-07-21 03:49:48.284278
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-07-21 03:49:48.292392
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-07-21 03:49:48.302916
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-07-21 03:49:48.31181
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-07-21 03:49:48.320238
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-07-21 03:49:48.328226
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-07-21 03:49:48.337083
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-07-21 03:49:48.346169
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-07-21 03:49:48.359279
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-07-21 03:49:48.368112
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-07-21 03:49:48.377253
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-07-21 03:49:48.40449
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-07-21 03:49:48.413685
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-07-21 03:49:48.421976
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-07-21 03:49:48.430598
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-07-21 03:49:48.441064
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-07-21 03:49:48.449129
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-07-21 03:49:48.460168
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-07-21 03:49:48.480247
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-07-21 03:49:48.495845
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-07-21 03:49:48.504814
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-07-21 03:49:48.517374
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-08-26 14:58:43.062901
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-08-26 14:58:43.668445
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-08-26 14:58:44.760005
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-08-26 14:58:44.854156
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-08-26 14:58:44.954213
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-08-26 14:58:45.052976
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-08-26 14:58:45.149947
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-08-26 14:58:45.259921
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-08-26 14:58:45.354368
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-08-26 14:58:45.366685
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-08-26 14:58:45.459243
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-08-26 14:58:45.558347
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-08-26 14:58:45.648611
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-09-23 12:34:53.960709
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-09-23 12:34:53.988405
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-09-25 11:26:25.823543
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-09-25 11:26:25.898878
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-09-25 11:26:25.927661
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
c739b7cc-afae-4ffd-8db3-f5784bb6abbb	comprobantes_pago_clientes	cliente_48/cobranza_2025-08-26_candelaria_bertuzzi_monto_245000.jpg	\N	2025-08-26 18:20:49.386197+00	2025-08-26 18:20:49.386197+00	2025-08-26 18:20:49.386197+00	{"eTag": "\\"cefcc40e5fb27ee66a5f9325329cc5af\\"", "size": 95284, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-26T18:20:50.000Z", "contentLength": 95284, "httpStatusCode": 200}	a504c6f2-8bac-46ef-a087-9c048fbbb18a	\N	{}	2
2de9a2d7-4826-4cae-a250-f8f88e96d4a9	propuestas	.emptyFolderPlaceholder	\N	2025-10-06 11:16:34.441045+00	2025-10-06 11:16:34.441045+00	2025-10-06 11:16:34.441045+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T11:16:34.443Z", "contentLength": 0, "httpStatusCode": 200}	2d9c0143-ef35-4926-a8e7-f02d450932c7	\N	{}	1
84d5300e-d18e-4c38-ab70-9fe396d795f2	comprobantes_pago_clientes	cliente_220/cobranza_2025-10-22_paula_zalazar_monto_1800000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-22 15:49:24.782168+00	2025-10-22 15:49:24.782168+00	2025-10-22 15:49:24.782168+00	{"eTag": "\\"d64598111714fd75ea7407329cd4ed41\\"", "size": 141251, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-10-22T15:49:25.000Z", "contentLength": 141251, "httpStatusCode": 200}	89011721-5397-4509-96a8-83005a6b1365	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
2c8adeb3-6778-4af5-8226-fa927f5cb174	comprobantes_pago_clientes	cliente_48/cobranza_2025-09-17_candelaria_bertuzzi_monto_2880000.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:15:02.365653+00	2025-09-17 12:15:02.365653+00	2025-09-17 12:15:02.365653+00	{"eTag": "\\"d6bca7a70859b432907d02530cc7f719\\"", "size": 92039, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:15:03.000Z", "contentLength": 92039, "httpStatusCode": 200}	1d73d7d6-b7d0-4dae-b3ce-70c2b5b2b145	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
807d5b11-8998-46f9-a7a9-952f0b721f2b	comprobantes_pago_clientes	cliente_40/cobranza_2025-09-17_jose_pablo_cardenas_monto_149000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:19:57.328701+00	2025-09-17 12:19:57.328701+00	2025-09-17 12:19:57.328701+00	{"eTag": "\\"bd43dfbaf3a6946a0bed45a3a890e12f\\"", "size": 40606, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:19:58.000Z", "contentLength": 40606, "httpStatusCode": 200}	bf1feeac-b405-4203-b9be-28b57700898b	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
fd87ef0a-5ef9-4aef-b3bc-aeafdb27eca3	comprobantes_pago_clientes	cliente_39/cobranza_2025-09-17_anabela_vallica_monto_2880000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:29:02.807132+00	2025-09-17 12:29:02.807132+00	2025-09-17 12:29:02.807132+00	{"eTag": "\\"83d30126eda3e1b0f3d317a90b76fd1e\\"", "size": 151503, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:29:03.000Z", "contentLength": 151503, "httpStatusCode": 200}	fa735749-5846-4e22-9f50-242a0ed1ffd7	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
c21783f9-d208-4034-9cd2-16f4dfee97b7	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1758035018559.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 15:03:37.234467+00	2025-09-16 15:03:37.234467+00	2025-09-16 15:03:37.234467+00	{"eTag": "\\"0545f97103e1cadde58fd3f1900cf8f0\\"", "size": 102212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T15:03:38.000Z", "contentLength": 102212, "httpStatusCode": 200}	f3a8451f-0cb7-4d1e-bc7b-7053ef0dfcc5	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
224c867a-e66b-4f43-985e-58af2c9efb36	comprobantes_pago_clientes	cliente_39/cobranza_2025-09-17_anabela_vallica_monto_319500.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:29:29.509098+00	2025-09-17 12:29:29.509098+00	2025-09-17 12:29:29.509098+00	{"eTag": "\\"e075e5f47fb0a620d2f6980ab5294b28\\"", "size": 62877, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:29:30.000Z", "contentLength": 62877, "httpStatusCode": 200}	70d023a5-92f4-4899-92a8-858886d242ca	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
6ac90b53-ca7d-4ea6-b325-aaf597fcfd36	comprobantes_pago_clientes	cliente_39/cobranza_2025-09-17_anabela_vallica_monto_310500.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:29:51.05871+00	2025-09-17 12:29:51.05871+00	2025-09-17 12:29:51.05871+00	{"eTag": "\\"954a1f7a2e00e2b101ad26c5d402a2e3\\"", "size": 63266, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:29:51.000Z", "contentLength": 63266, "httpStatusCode": 200}	d1862696-3c91-450d-8cc2-e418f8461c22	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
17bac795-7803-43c4-9b8b-5fa9afe5ed74	comprobantes_pago_clientes	cliente_66/cobranza_2025-09-17_gabarini_mar_a_eugenia_monto_216600.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 12:34:19.530122+00	2025-09-17 12:34:19.530122+00	2025-09-17 12:34:19.530122+00	{"eTag": "\\"c942fe4dfc3ce555709202fe1e728df9\\"", "size": 63549, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T12:34:20.000Z", "contentLength": 63549, "httpStatusCode": 200}	5c7e5f58-7d94-479f-b66d-00e08b72fe4c	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
1577aa1e-ca8d-4290-ab21-4a045480e472	remitos	.emptyFolderPlaceholder	\N	2025-08-05 21:50:33.534658+00	2025-08-26 14:58:44.864212+00	2025-08-05 21:50:33.534658+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-08-05T21:50:34.000Z", "contentLength": 0, "httpStatusCode": 200}	a3593561-5354-4d36-a565-f50e419dc436	\N	{}	1
accb85bf-29fc-4f51-9092-de9eb392e584	comprobantes_pago_clientes	cliente_66/cobranza_2025-08-26_gabarini_mar_a_eugenia_monto_1375000.jpg	\N	2025-08-26 18:35:54.27824+00	2025-08-26 18:35:54.27824+00	2025-08-26 18:35:54.27824+00	{"eTag": "\\"7dce4bae25ac1aa6c8ba9551e3b8731b\\"", "size": 78304, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-26T18:35:55.000Z", "contentLength": 78304, "httpStatusCode": 200}	ce16180b-c09c-46e8-8772-24bb8dc4c63e	\N	{}	2
2765a732-91b4-40f9-bf4f-f102f01f82f5	remitos	public/.emptyFolderPlaceholder	\N	2025-10-06 11:16:51.972114+00	2025-10-06 11:16:51.972114+00	2025-10-06 11:16:51.972114+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T11:16:51.975Z", "contentLength": 0, "httpStatusCode": 200}	f896027d-005e-4030-a8e3-fb01eeb335e0	\N	{}	2
58aa13fa-7d63-4bc2-8f79-53c2d9529587	assets	recibos_comisiones/.emptyFolderPlaceholder	\N	2025-10-06 11:17:32.760397+00	2025-10-06 11:17:32.760397+00	2025-10-06 11:17:32.760397+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T11:17:32.763Z", "contentLength": 0, "httpStatusCode": 200}	d143e6af-b01e-4d39-b099-499537f5dde2	\N	{}	2
66daf357-1d2d-449e-aa6b-dbf5a9473a60	perfiles	public/f429c232-076a-476f-8622-0c0d429c86c2-1757966115984.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 19:55:15.252478+00	2025-09-15 19:55:15.252478+00	2025-09-15 19:55:15.252478+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T19:55:16.000Z", "contentLength": 107558, "httpStatusCode": 200}	9940cf4a-c528-401f-815d-7c6b52b91201	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
c4442798-0cf0-4999-80b7-ed9cdc41b59d	perfiles	public/f429c232-076a-476f-8622-0c0d429c86c2-1757966656119.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 20:04:15.505654+00	2025-09-15 20:04:15.505654+00	2025-09-15 20:04:15.505654+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T20:04:16.000Z", "contentLength": 107558, "httpStatusCode": 200}	216527da-8de9-4cbb-94e7-b6924e30d581	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
9259ef23-679c-45ba-9c93-8a77443e77c7	comprobantes_pago_clientes	cliente_48/cobranza_2025-10-27_candelaria_bertuzzi_monto_1800000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-27 16:19:15.341979+00	2025-10-27 16:19:15.341979+00	2025-10-27 16:19:15.341979+00	{"eTag": "\\"27e45d18549d8d02ac9c58e01041556d\\"", "size": 55326, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-10-27T16:19:16.000Z", "contentLength": 55326, "httpStatusCode": 200}	df445fec-1e2e-477f-b776-cc207a5c5b74	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
f90223c4-d3fc-435b-a73d-262fda1f0f85	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1758036238549.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 15:23:57.697449+00	2025-09-16 15:23:57.697449+00	2025-09-16 15:23:57.697449+00	{"eTag": "\\"0545f97103e1cadde58fd3f1900cf8f0\\"", "size": 102212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T15:23:58.000Z", "contentLength": 102212, "httpStatusCode": 200}	65a5dd8c-ed94-45c2-8a6c-772db579adae	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
c7a48cef-6246-4db5-a991-4cc1db22d701	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1758036258312.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 15:24:17.028651+00	2025-09-16 15:24:17.028651+00	2025-09-16 15:24:17.028651+00	{"eTag": "\\"0545f97103e1cadde58fd3f1900cf8f0\\"", "size": 102212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T15:24:17.000Z", "contentLength": 102212, "httpStatusCode": 200}	cc202fad-1f1b-4106-b6b2-b6f2f4be9ed0	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
b5546bb4-a3e0-4293-948c-32c28f4e55db	perfiles	public/f429c232-076a-476f-8622-0c0d429c86c2-1757965410691.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 19:43:30.210346+00	2025-09-15 19:43:30.210346+00	2025-09-15 19:43:30.210346+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T19:43:31.000Z", "contentLength": 107558, "httpStatusCode": 200}	a927ec30-010d-44e9-a611-8114b888735f	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
415dd4b0-92c3-4924-8d5a-6c3b21d71e31	perfiles	public/f429c232-076a-476f-8622-0c0d429c86c2-1757965488260.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 19:44:47.559988+00	2025-09-15 19:44:47.559988+00	2025-09-15 19:44:47.559988+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T19:44:48.000Z", "contentLength": 107558, "httpStatusCode": 200}	155db091-d148-4c2b-a205-0c76caf89559	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
0ad953a6-2cba-47b2-b823-0ebafe2c83de	perfiles	public/f429c232-076a-476f-8622-0c0d429c86c2-1757965790463.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 19:49:49.729616+00	2025-09-15 19:49:49.729616+00	2025-09-15 19:49:49.729616+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T19:49:50.000Z", "contentLength": 107558, "httpStatusCode": 200}	77c11e09-cad9-4697-a370-a8699425341b	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
9f8da671-1af2-4d89-899d-25ce1f1de446	perfiles	public/c39967c6-cf8a-4546-a65d-168e43b4b1c3-1758716767804.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-24 12:26:08.204341+00	2025-09-24 12:26:08.204341+00	2025-09-24 12:26:08.204341+00	{"eTag": "\\"7dce4bae25ac1aa6c8ba9551e3b8731b\\"", "size": 78304, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-24T12:26:09.000Z", "contentLength": 78304, "httpStatusCode": 200}	e50849c2-ff17-4a68-9ed0-2fe853b501fd	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
357aa339-cfd4-4c46-a577-5076952d8453	perfiles	public/c39967c6-cf8a-4546-a65d-168e43b4b1c3-1758716791237.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-24 12:26:31.498498+00	2025-09-24 12:26:31.498498+00	2025-09-24 12:26:31.498498+00	{"eTag": "\\"7dce4bae25ac1aa6c8ba9551e3b8731b\\"", "size": 78304, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-24T12:26:32.000Z", "contentLength": 78304, "httpStatusCode": 200}	64b03664-2d5c-454b-b1cb-7a9fc3b91500	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
2d5ca5d2-d282-466f-8017-44107c102137	comprobantes_pago_clientes	cliente_57/cobranza_2025-08-27_roxina_barreto_monto_2600000.jpg	\N	2025-08-27 14:15:46.37286+00	2025-08-27 14:15:46.37286+00	2025-08-27 14:15:46.37286+00	{"eTag": "\\"d445c784fb832961d81ec749df943153\\"", "size": 64935, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-27T14:15:47.000Z", "contentLength": 64935, "httpStatusCode": 200}	c238e480-df27-4b60-8c92-3dcfd295bd2a	\N	{}	2
b8e32e07-d533-48e2-a4a8-43e2d18f2105	comprobantes_pago_clientes	cliente_219/cobranza_2025-10-06_soledad_pavon_monto_855000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-06 18:50:36.745035+00	2025-10-06 18:50:36.745035+00	2025-10-06 18:50:36.745035+00	{"eTag": "\\"5a2f62e1919972c4c1996ffe6dbb8b2d\\"", "size": 64356, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T18:50:37.000Z", "contentLength": 64356, "httpStatusCode": 200}	360f90ff-a968-48cd-b5a3-49def4d59478	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
331c7bea-de13-4e30-b24f-09982edb93be	comprobantes_pago_clientes	cliente_221/cobranza_2025-10-06_nadia_elizabeth_chmyzowski_monto_315000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-06 18:53:09.284828+00	2025-10-06 18:53:09.284828+00	2025-10-06 18:53:09.284828+00	{"eTag": "\\"c9612ea88750b9813be3be961413d434\\"", "size": 59283, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T18:53:10.000Z", "contentLength": 59283, "httpStatusCode": 200}	7dde45fc-9b55-4eb4-b627-17f8b39e0477	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
59bc586c-767e-46c9-b9cc-87b96d3f57cb	perfiles	public/b6037848-7408-4c5e-b8e5-9a4bb378f9ac-1758034627246.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 14:57:06.123305+00	2025-09-16 14:57:06.123305+00	2025-09-16 14:57:06.123305+00	{"eTag": "\\"2b445b00236995deaf92a3353f5a5de8\\"", "size": 107558, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T14:57:07.000Z", "contentLength": 107558, "httpStatusCode": 200}	a801d85c-c9e6-48a7-a9da-3d9d098a18b8	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
641f2606-719f-432c-811c-a8a4de692ef6	comprobantes_pago_clientes	cliente_74/cobranza_2025-09-17_maria_catalina_gomez_guevara__monto_255000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-17 01:31:54.585873+00	2025-09-17 01:31:54.585873+00	2025-09-17 01:31:54.585873+00	{"eTag": "\\"8212c04efdee4cbff4f36bed21989f31\\"", "size": 65306, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-17T01:31:55.000Z", "contentLength": 65306, "httpStatusCode": 200}	a88d9e91-3b94-4c57-b33f-24d6f069eb4f	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
0dc75c02-467f-42fb-b75e-0b9e2895c91d	comprobantes_pago_clientes	cliente_215/cobranza_2025-09-19_b_rbara_ferraro_monto_111600.jpeg	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-09-19 12:10:59.250153+00	2025-09-19 12:10:59.250153+00	2025-09-19 12:10:59.250153+00	{"eTag": "\\"4f34e07afc94c310ec320711b4b8e088\\"", "size": 52347, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-19T12:11:00.000Z", "contentLength": 52347, "httpStatusCode": 200}	7db26a3b-c27e-4f72-a6eb-81f608e42dec	0cd44ec8-1243-41c3-baea-e61dc19de624	{}	2
a0775be0-8371-4b37-9c7f-23734bdffea0	perfiles	public/c39967c6-cf8a-4546-a65d-168e43b4b1c3-1758717235858.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-24 12:33:56.45922+00	2025-09-24 12:33:56.45922+00	2025-09-24 12:33:56.45922+00	{"eTag": "\\"7dce4bae25ac1aa6c8ba9551e3b8731b\\"", "size": 78304, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-24T12:33:57.000Z", "contentLength": 78304, "httpStatusCode": 200}	696be842-49a8-4ab7-a959-868c24e17334	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
b2b22269-b05b-4d70-84ed-3dfe5519e5fe	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1759258186216.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-30 18:49:44.572229+00	2025-09-30 18:49:44.572229+00	2025-09-30 18:49:44.572229+00	{"eTag": "\\"70cce0b9eb65facca103e2d2cb82a0aa\\"", "size": 79724, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-30T18:49:45.000Z", "contentLength": 79724, "httpStatusCode": 200}	63f9bc0c-c53f-4f03-b0ac-3eae85a794a7	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
2ff4a51a-c68e-4ec1-a69d-b0116c376405	public-assets	.emptyFolderPlaceholder	\N	2025-10-06 00:55:02.3019+00	2025-10-06 00:55:02.3019+00	2025-10-06 00:55:02.3019+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T00:55:02.303Z", "contentLength": 0, "httpStatusCode": 200}	8dbe18ad-2aaf-48c5-a269-250e1e0e0e4e	\N	{}	1
4cc981aa-72de-4d3f-80f7-df9b3953c230	public-assets	aprobar-descuento.js	\N	2025-10-06 00:58:17.090719+00	2025-10-06 00:58:17.090719+00	2025-10-06 00:58:17.090719+00	{"eTag": "\\"2921eb208bfb67e0dcb9f336ae53c757-1\\"", "size": 3509, "mimetype": "text/javascript", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T00:58:17.000Z", "contentLength": 3509, "httpStatusCode": 200}	d3b0da32-d594-4371-975e-44eed69d3e63	\N	\N	1
104d3499-ca7a-4bce-a949-1362c901a21f	public-assets	aprobar-descuento.css	\N	2025-10-06 01:51:35.907438+00	2025-10-06 01:51:35.907438+00	2025-10-06 01:51:35.907438+00	{"eTag": "\\"ed57275ea1d92147523fea3ef0519836-1\\"", "size": 3828, "mimetype": "text/css", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T01:51:36.000Z", "contentLength": 3828, "httpStatusCode": 200}	2c2404dc-5ccb-4bfa-b4ff-4806005a5d82	\N	\N	1
7d963840-1455-4e2a-8084-832b7a7ab29c	public-assets	aprobar-descuento-template.html	\N	2025-10-06 01:53:00.064591+00	2025-10-06 01:53:00.064591+00	2025-10-06 01:53:00.064591+00	{"eTag": "\\"36ec8b1b946d41cacb9e4efffd764d55-1\\"", "size": 779, "mimetype": "text/html", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T01:53:00.000Z", "contentLength": 779, "httpStatusCode": 200}	bd38a4b7-f3d8-4a91-8868-1f0c3fc2cfdc	\N	\N	1
f196e34c-fe47-461c-a01d-de3c5dd2b9c5	public-assets	aprobar-descuento-loader.js	\N	2025-10-06 03:19:07.137996+00	2025-10-06 03:19:07.137996+00	2025-10-06 03:19:07.137996+00	{"eTag": "\\"d4b77b315a45c7e3f08385095545334d-1\\"", "size": 7365, "mimetype": "text/javascript", "cacheControl": "max-age=3600", "lastModified": "2025-10-06T03:19:07.000Z", "contentLength": 7365, "httpStatusCode": 200}	7a77e3c1-2758-4778-8ce8-e852fb55445e	\N	\N	1
2898b5e9-7b0c-46f8-bd05-3fa36b3ec677	remitos	public/remito-0001-00000059.pdf	b6037848-7408-4c5e-b8e5-9a4bb378f9ac	2025-10-09 15:28:23.905433+00	2025-10-09 15:28:23.905433+00	2025-10-09 15:28:23.905433+00	{"eTag": "\\"f0702fc9027d8bcdfbd2c5c117182421\\"", "size": 2112321, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-10-09T15:28:24.000Z", "contentLength": 2112321, "httpStatusCode": 200}	afd0a618-5089-4b4e-add1-747449611603	b6037848-7408-4c5e-b8e5-9a4bb378f9ac	{}	2
52b3d199-7179-4cb8-8d73-fca473375128	comprobantes_pago_clientes	cliente_66/cobranza_2025-08-25_gabarini_mar_a_eugenia_monto_216600.jpeg	\N	2025-08-25 21:30:28.869587+00	2025-08-26 14:58:44.864212+00	2025-08-25 21:30:28.869587+00	{"eTag": "\\"c942fe4dfc3ce555709202fe1e728df9\\"", "size": 63549, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T21:30:29.000Z", "contentLength": 63549, "httpStatusCode": 200}	7a793dff-38f6-4f3d-b8ac-a8f2529b773e	\N	{}	2
5dad26f7-a152-4a67-9555-f6bc2e594c92	assets	logo biosplus.jpg	\N	2025-08-10 01:12:11.105982+00	2025-08-26 14:58:44.864212+00	2025-08-10 01:12:11.105982+00	{"eTag": "\\"af5cdddd460497b8c5bf571ca2b5be61-1\\"", "size": 30540, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-10T01:12:11.000Z", "contentLength": 30540, "httpStatusCode": 200}	54229aae-547b-4fb2-ae42-d3359870e175	\N	\N	1
b910a552-227d-48a3-aaf2-b9d257ef5bfb	recibos_comisiones	public/3-1756086070326.pdf	\N	2025-08-25 01:41:10.767449+00	2025-08-26 14:58:44.864212+00	2025-08-25 01:41:10.767449+00	{"eTag": "\\"7716254a1d35c49febe853e27d5018da\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T01:41:11.000Z", "contentLength": 2806506, "httpStatusCode": 200}	483420d5-5199-4e56-bdd0-bc32512d8e7e	\N	{}	2
e87e98a0-d8b9-4305-9755-6b0d38fbe97f	recibos_comisiones	public/3-1756086345653.pdf	\N	2025-08-25 01:45:45.975303+00	2025-08-26 14:58:44.864212+00	2025-08-25 01:45:45.975303+00	{"eTag": "\\"a870c488eba1cd7acab9b67d4d7547f9\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T01:45:46.000Z", "contentLength": 2806506, "httpStatusCode": 200}	b722c9ae-1a29-43d9-91eb-e926037595f2	\N	{}	2
a06b2989-3ddd-4e6d-a9a0-95de7db6b5c6	recibos_comisiones	public/3-1756086874453.pdf	\N	2025-08-25 01:54:34.721605+00	2025-08-26 14:58:44.864212+00	2025-08-25 01:54:34.721605+00	{"eTag": "\\"8208bc49f454795972b12af7ca93c40a\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T01:54:35.000Z", "contentLength": 2806506, "httpStatusCode": 200}	7a5346d8-03cd-41ba-aa19-f8ddc5813957	\N	{}	2
17e452dd-d7db-4845-bb94-3364a36b9278	recibos_comisiones	public/3-1756087021526.pdf	\N	2025-08-25 01:57:01.897309+00	2025-08-26 14:58:44.864212+00	2025-08-25 01:57:01.897309+00	{"eTag": "\\"4eda1023ff5e2178b8fdab1e23cf1cd3\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T01:57:02.000Z", "contentLength": 2806506, "httpStatusCode": 200}	fa12fe5f-b507-42ac-8927-d5931cfdf5cb	\N	{}	2
dd61bcc6-2ae6-4b37-b792-dc0b0ff7d8fe	recibos_comisiones	public/3-1756087372346.pdf	\N	2025-08-25 02:02:53.048912+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:02:53.048912+00	{"eTag": "\\"ed215081313bc13c4f826da52d195717\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:02:53.000Z", "contentLength": 2806506, "httpStatusCode": 200}	9da96135-d272-4815-a008-19641598277e	\N	{}	2
64443399-b713-43c8-a274-e2f11c1f8ad5	comprobantes_pago_clientes	cliente_67/cobranza_2025-09-05_fabio_uribe_monto_825000.jpeg	0cd44ec8-1243-41c3-baea-e61dc19de624	2025-09-05 13:38:16.335013+00	2025-09-05 13:38:16.335013+00	2025-09-05 13:38:16.335013+00	{"eTag": "\\"485011b9248eeeb7f6599f08650b978d\\"", "size": 54577, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-05T13:38:17.000Z", "contentLength": 54577, "httpStatusCode": 200}	a8adebef-44e4-4ee9-919c-f6f51a275e0c	0cd44ec8-1243-41c3-baea-e61dc19de624	{}	2
50feb90a-5d0d-4543-a0ff-336625aa117a	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1758034825532.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 15:00:24.235991+00	2025-09-16 15:00:24.235991+00	2025-09-16 15:00:24.235991+00	{"eTag": "\\"0545f97103e1cadde58fd3f1900cf8f0\\"", "size": 102212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T15:00:25.000Z", "contentLength": 102212, "httpStatusCode": 200}	b75d1796-5d03-49b2-9960-e3b117d2c9f3	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
01944722-47da-4981-914d-3c6edc8b2034	recibos_comisiones	public/3-1756087569852.pdf	\N	2025-08-25 02:06:10.177878+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:06:10.177878+00	{"eTag": "\\"b8523455e7e1c222a2450ed51572092e\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:06:11.000Z", "contentLength": 2806506, "httpStatusCode": 200}	670f162d-c6b1-4b19-b254-5a21902551a6	\N	{}	2
1c67a887-1e33-4938-a44a-7917295990e8	recibos_comisiones	public/3-1756087700301.pdf	\N	2025-08-25 02:08:20.743564+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:08:20.743564+00	{"eTag": "\\"0fba7c336f0dc7e3c11fa2d1d3655e3b\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:08:21.000Z", "contentLength": 2806506, "httpStatusCode": 200}	499239b2-b45d-4836-82f3-64e13371da0c	\N	{}	2
97f692a4-407b-4695-ac5e-731c26d2d5b5	recibos_comisiones	public/3-1756087836467.pdf	\N	2025-08-25 02:10:37.043173+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:10:37.043173+00	{"eTag": "\\"4858eb2add92890272e29665593b7ccd\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:10:37.000Z", "contentLength": 2806506, "httpStatusCode": 200}	b1e35e71-6c2e-48cb-9ef5-e108bd15871e	\N	{}	2
544f1257-a565-4c55-8c97-6cd01d753397	recibos_comisiones	public/3-1756088227613.pdf	\N	2025-08-25 02:17:07.867289+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:17:07.867289+00	{"eTag": "\\"f3bb1343b44a84bfa0ef1180a2114b2a\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:17:08.000Z", "contentLength": 2806506, "httpStatusCode": 200}	57455eda-55d3-4e6f-bd27-666b4c01d5eb	\N	{}	2
ec41b016-752f-4a7d-a430-9340563581b8	recibos_comisiones	public/3-1756088386736.pdf	\N	2025-08-25 02:19:46.991072+00	2025-08-26 14:58:44.864212+00	2025-08-25 02:19:46.991072+00	{"eTag": "\\"0c46f5bbaf4f637c31482e10c8f782f9\\"", "size": 2806506, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-08-25T02:19:47.000Z", "contentLength": 2806506, "httpStatusCode": 200}	d1e1fc74-19e5-4a8f-95cf-a6dd6147aa04	\N	{}	2
4e63a0c4-b42c-475c-8a59-4afb191f00e9	assets	public/logo_laboratorio.png	\N	2025-08-10 01:14:23.777881+00	2025-08-26 14:58:44.864212+00	2025-08-10 01:14:23.777881+00	{"eTag": "\\"6e2acd4c550ab07ec48b0b567328e39d\\"", "size": 30540, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-10T15:38:20.000Z", "contentLength": 30540, "httpStatusCode": 200}	7e3e07d3-52e6-40f8-a95f-89eb062d7833	\N	{}	2
63184edc-bc06-4b3a-b79e-76af1a183c5a	comprobantes_pago_clientes	cliente_48/cobranza_2025-10-15_candelaria_bertuzzi_monto_1800000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-15 15:40:12.792136+00	2025-10-15 15:40:12.792136+00	2025-10-15 15:40:12.792136+00	{"eTag": "\\"cf9bc844fe5166d4a75bde7466d28fd1\\"", "size": 120080, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-10-15T15:40:13.000Z", "contentLength": 120080, "httpStatusCode": 200}	49cdff15-46c0-4eb3-8533-88758ba2f5d4	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
f33b7c1b-c2e9-4f9f-8aeb-23e433921ca9	perfiles	vendedores/1-1755381690595.jpg	\N	2025-08-16 22:01:31.148705+00	2025-08-26 14:58:44.864212+00	2025-08-16 22:01:31.148705+00	{"eTag": "\\"6e2acd4c550ab07ec48b0b567328e39d\\"", "size": 30540, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-16T22:01:32.000Z", "contentLength": 30540, "httpStatusCode": 200}	df62d74f-a001-473a-91f7-4f5c08c5ed63	\N	{}	2
a780cf2a-bde1-4cc4-b820-f3c06ba5aac9	perfiles	vendedores/1-1755638351415.jpg	\N	2025-08-19 21:19:11.521787+00	2025-08-26 14:58:44.864212+00	2025-08-19 21:19:11.521787+00	{"eTag": "\\"d445c784fb832961d81ec749df943153\\"", "size": 64935, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-19T21:19:12.000Z", "contentLength": 64935, "httpStatusCode": 200}	62614b04-4449-49ec-b345-3fbdc9a5a481	\N	{}	2
6b3ea5c6-4881-47a1-8656-c9dd5265531a	perfiles	vendedores/4-1755716278197.jpg	\N	2025-08-20 18:57:58.406483+00	2025-08-26 14:58:44.864212+00	2025-08-20 18:57:58.406483+00	{"eTag": "\\"41cb2663c170437028c3e0352959854d\\"", "size": 242591, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-20T18:57:59.000Z", "contentLength": 242591, "httpStatusCode": 200}	9d1a777b-22e4-4b5a-abb0-3b7eea402c0c	\N	{}	2
0f47b570-9037-40fa-a324-32cd47d2ab8f	comprobantes_pago_clientes	cliente_65/cobranza_2025-08-27_maria_fernanda_rodriguez_velazquez_monto_2860000.jpg	\N	2025-08-27 16:50:15.406882+00	2025-08-27 16:50:15.406882+00	2025-08-27 16:50:15.406882+00	{"eTag": "\\"cefcc40e5fb27ee66a5f9325329cc5af\\"", "size": 95284, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-08-27T16:50:16.000Z", "contentLength": 95284, "httpStatusCode": 200}	773f0273-87c2-4350-959d-80081d83189a	\N	{}	2
8556127b-2a3f-4afd-aa9c-3706a4ef3749	comprobantes_pago_clientes	cliente_99/cobranza_2025-09-15_fatima_ines_molina_monto_630000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-15 14:16:54.392752+00	2025-09-15 14:16:54.392752+00	2025-09-15 14:16:54.392752+00	{"eTag": "\\"70e74d17bb6c04262add847e142e31a4\\"", "size": 63632, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-15T14:16:55.000Z", "contentLength": 63632, "httpStatusCode": 200}	1c7e7b19-7fb3-4476-80b7-e08a6f98fbea	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
03cfc51b-cbc1-4d7e-885c-78725c1c8f0f	perfiles	public/c145694f-77b3-4baf-90c0-c7ebeee69cd6-1758034986030.jpg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-09-16 15:03:04.991316+00	2025-09-16 15:03:04.991316+00	2025-09-16 15:03:04.991316+00	{"eTag": "\\"0545f97103e1cadde58fd3f1900cf8f0\\"", "size": 102212, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-09-16T15:03:05.000Z", "contentLength": 102212, "httpStatusCode": 200}	8d69b8bb-95f7-431e-96cb-849ab08c6b9f	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
3b0219dc-476e-49ea-92af-c05c726f27b1	comprobantes_pago_clientes	cliente_224/cobranza_2025-10-20_agostina_dellafiore_monto_324000.jpeg	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-20 13:01:30.211504+00	2025-10-20 13:01:30.211504+00	2025-10-20 13:01:30.211504+00	{"eTag": "\\"e519e1dc8ddc9b9fe021c79d2445df5d\\"", "size": 45818, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-10-20T13:01:31.000Z", "contentLength": 45818, "httpStatusCode": 200}	f3f84143-244d-469b-bb5b-d0945afc540e	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
85a74973-cc5f-45c0-9518-5535b24e2011	comprobantes_pago_clientes	cliente_220/cobranza_2025-10-20_paula_zalazar_monto_2000000.pdf	c145694f-77b3-4baf-90c0-c7ebeee69cd6	2025-10-20 13:04:53.341788+00	2025-10-20 13:04:53.341788+00	2025-10-20 13:04:53.341788+00	{"eTag": "\\"fca93837cf108ff5acdbc623cb40b1c7\\"", "size": 131762, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2025-10-20T13:04:54.000Z", "contentLength": 131762, "httpStatusCode": 200}	4b8d63f8-67ba-48bf-a60c-0c93c74b30fc	c145694f-77b3-4baf-90c0-c7ebeee69cd6	{}	2
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
comprobantes_pago_clientes	cliente_66	2025-08-26 14:58:44.764915+00	2025-08-26 14:58:44.764915+00
recibos_comisiones	public	2025-08-26 14:58:44.764915+00	2025-08-26 14:58:44.764915+00
assets	public	2025-08-26 14:58:44.764915+00	2025-08-26 14:58:44.764915+00
perfiles	vendedores	2025-08-26 14:58:44.764915+00	2025-08-26 14:58:44.764915+00
comprobantes_pago_clientes	cliente_48	2025-08-26 18:20:49.386197+00	2025-08-26 18:20:49.386197+00
comprobantes_pago_clientes	cliente_57	2025-08-27 14:15:46.37286+00	2025-08-27 14:15:46.37286+00
comprobantes_pago_clientes	cliente_65	2025-08-27 16:50:15.406882+00	2025-08-27 16:50:15.406882+00
comprobantes_pago_clientes	cliente_67	2025-09-02 17:36:30.836532+00	2025-09-02 17:36:30.836532+00
comprobantes_pago_clientes	cliente_99	2025-09-15 14:16:54.392752+00	2025-09-15 14:16:54.392752+00
perfiles	public	2025-09-15 19:43:30.210346+00	2025-09-15 19:43:30.210346+00
comprobantes_pago_clientes	cliente_74	2025-09-17 01:31:54.585873+00	2025-09-17 01:31:54.585873+00
comprobantes_pago_clientes	cliente_40	2025-09-17 12:19:57.328701+00	2025-09-17 12:19:57.328701+00
comprobantes_pago_clientes	cliente_39	2025-09-17 12:29:02.807132+00	2025-09-17 12:29:02.807132+00
comprobantes_pago_clientes	cliente_215	2025-09-19 12:10:59.250153+00	2025-09-19 12:10:59.250153+00
remitos	public	2025-10-06 11:16:51.972114+00	2025-10-06 11:16:51.972114+00
assets	recibos_comisiones	2025-10-06 11:17:32.760397+00	2025-10-06 11:17:32.760397+00
comprobantes_pago_clientes	cliente_219	2025-10-06 18:50:36.745035+00	2025-10-06 18:50:36.745035+00
comprobantes_pago_clientes	cliente_221	2025-10-06 18:53:09.284828+00	2025-10-06 18:53:09.284828+00
comprobantes_pago_clientes	cliente_224	2025-10-20 13:01:30.211504+00	2025-10-20 13:01:30.211504+00
comprobantes_pago_clientes	cliente_220	2025-10-20 13:04:53.341788+00	2025-10-20 13:04:53.341788+00
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
\.


--
-- Data for Name: seed_files; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.seed_files (path, hash) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1005, true);


--
-- Name: jobid_seq; Type: SEQUENCE SET; Schema: cron; Owner: supabase_admin
--

SELECT pg_catalog.setval('cron.jobid_seq', 2, true);


--
-- Name: runid_seq; Type: SEQUENCE SET; Schema: cron; Owner: supabase_admin
--

SELECT pg_catalog.setval('cron.runid_seq', 142, true);


--
-- Name: aplicacion_pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aplicacion_pagos_id_seq', 31, true);


--
-- Name: auditoria_pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditoria_pedidos_id_seq', 266, true);


--
-- Name: auditoria_precios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditoria_precios_id_seq', 17, true);


--
-- Name: comisiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comisiones_id_seq', 15, true);


--
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_seq', 4, true);


--
-- Name: condiciones_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condiciones_pago_id_seq', 8, true);


--
-- Name: configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_id_seq', 39, true);


--
-- Name: confirmaciones_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.confirmaciones_stock_id_seq', 1, false);


--
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 275, true);


--
-- Name: cuentas_bancarias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_bancarias_id_seq', 4, true);


--
-- Name: depositos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depositos_id_seq', 2, true);


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_id_seq', 7, true);


--
-- Name: estados_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_pedido_id_seq', 8, true);


--
-- Name: etapas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etapas_venta_id_seq', 8, true);


--
-- Name: facturas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_venta_id_seq', 1, false);


--
-- Name: interacciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interacciones_id_seq', 3, true);


--
-- Name: logistica_embalajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logistica_embalajes_id_seq', 4, true);


--
-- Name: logistica_envios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logistica_envios_id_seq', 9, true);


--
-- Name: logistica_transportistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logistica_transportistas_id_seq', 4, true);


--
-- Name: lotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lotes_id_seq', 49, true);


--
-- Name: movimientos_cuenta_corriente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_cuenta_corriente_id_seq', 226, true);


--
-- Name: movimientos_cuenta_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_cuenta_proveedor_id_seq', 2, true);


--
-- Name: oportunidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oportunidades_id_seq', 42, true);


--
-- Name: oportunidades_numero_propuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oportunidades_numero_propuesta_seq', 22, true);


--
-- Name: organizaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizaciones_id_seq', 2, true);


--
-- Name: pagos_comisiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_comisiones_id_seq', 1, true);


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 52, true);


--
-- Name: pedido_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedido_numero_seq', 84, true);


--
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 102, true);


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permisos_id_seq', 39765, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 66, true);


--
-- Name: proveedor_contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_contactos_id_seq', 36, true);


--
-- Name: proveedor_cuentas_bancarias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_cuentas_bancarias_id_seq', 7, true);


--
-- Name: reglas_alertas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reglas_alertas_id_seq', 9, true);


--
-- Name: reportes_usabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reportes_usabilidad_id_seq', 14, true);


--
-- Name: reservas_pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_pedido_id_seq', 1, false);


--
-- Name: reservas_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_stock_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: stock_ajustes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_ajustes_id_seq', 61, true);


--
-- Name: stock_vendedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_vendedores_id_seq', 93, true);


--
-- Name: tipos_documento_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_documento_pago_id_seq', 2, true);


--
-- Name: vendedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedores_id_seq', 19, true);


--
-- Name: zonas_envio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zonas_envio_id_seq', 18, true);


--
-- Name: zonas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zonas_id_seq', 16, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict BmU9AhIiF7hj6O4GdBXPH8nMhWjJWuafb4WUNnnDEK7crC9rsGlDPIBPoL22N2e

