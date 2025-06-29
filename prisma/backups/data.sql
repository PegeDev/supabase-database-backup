SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.4

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

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: ChatTemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."ChatTemplate" ("id", "name", "content", "category", "isActive", "createdAt", "updatedAt", "createdBy", "variables", "type") FROM stdin;
a7c94c4c-b32c-4183-a9e9-61b4769d5d97	OTP	Halo {name}!\n\n{otp_code} adalah kode OTP anda.\nDemi keamanan, jangan bagikan kode ini.\n\nTerimakasih telah menggunakan layanan kami.	\N	t	2025-06-05 07:22:16.783	2025-06-05 07:22:16.783	PegeDev	{name,otp_code}	otp_message
47abb984-fab5-4fde-aa21-d9d28208bee1	Notif Gagal Pengiriman	Halo {name} 👋!\n\nPesanan dengan Kode: {code}\n\n🚫 Pengiriman gagal\nStatus: {status}\n\nSilahkan hubungi admin untuk info lebih lanjut.	delivery_failed	t	2025-06-05 07:23:01.731	2025-06-05 07:26:02.638	PegeDev	{name,code,status}	transaction_update
590f757f-1bc6-4f87-99de-69527162642e	Notif Pakaian Telah diterima	Halo {name} 👋!\n\nPesanan dengan Kode: {code}\n\nStatus transaksi anda: {status}\n\n_Terima kasih telah menggunakan layanan kami._\n_Berikan penilaian pengalaman Anda!_	delivered	t	2025-06-05 07:23:47.809	2025-06-05 07:26:13.273	PegeDev	{name,code,status}	transaction_update
895c1b57-4507-4493-93d0-1e67677f605e	Notif Drying	Halo {name} 👋\n\nPesanan dengan Kode: {code}\n\nStatus transaksi Anda: {status}\n\n_Terimakasih telah menggunakan layanan kami!_	on_progress_drying	t	2025-06-05 07:27:04.738	2025-06-05 07:31:00.249	PegeDev	{name,code,status}	transaction_update
a2dfa75e-bbeb-4799-ae7a-0b7a5433d2ae	Notif Ironing	Halo {name} 👋\n\nPesanan dengan Kode: {code}\n\nStatus transaksi Anda: {status}\n\nTerimakasih telah menggunakan layanan kami!	on_progress_ironing	t	2025-06-05 07:31:52.637	2025-06-05 07:31:52.637	PegeDev	{name,code,status}	transaction_update
83a1e1f1-2db5-47ef-8a15-2004c091971a	Notif Delivering	Halo {name} 👋!\n\nPesanan dengan Kode: {code}\n\n🚚 Pakaian Anda sedang dalam perjalanan\nStatus transaksi anda: {status}\n\nPakaian anda akan segera sampai.	out_for_delivery	t	2025-06-05 07:32:30.996	2025-06-05 07:32:30.996	PegeDev	{name,code,status}	transaction_update
9882b623-b7e1-4607-9104-fb9431a946f2	Notif Gagal Pickup	Halo {name} 👋\n\nPesanan dengan Kode: {code}\n\n❌ Pesanan Anda gagal dijemput.\n\nSilakan hubungi kami jika ini sebuah kesalahan.	pickup_failed	t	2025-06-05 07:32:59.46	2025-06-05 07:32:59.46	PegeDev	{name,code}	transaction_update
bccd2354-f396-4f90-95f9-d5661d4ab84b	Notif Washing	Halo {name} 👋\n\nPesanan dengan Kode: {code}\n\n🧼 Status terbaru: {status}\n\nPakaian Anda sedang dalam tahap pencucian.	on_progress_washing	t	2025-06-05 07:33:31.291	2025-06-05 07:33:31.291	PegeDev	{name,code,status}	transaction_update
a95b670d-8668-4c1d-aa6c-8b164e81f7f3	Notif Schedulled Pickup	Halo {name} 👋!\nTerima kasih telah memilih layanan kami!\n\nOrder ID : {code}\n✅ Status: {status}\n✅ Cucian Anda sudah dijadwalkan untuk pickup.\n🕒 Jadwal: {date_pickup}\n📍 Alamat: {address}\nJika ingin ubah / batalkan jadwal, klik: \n\nhttps://www.laundryandchill.id/account/history\n\nTerima Kasih.	scheduled	t	2025-06-05 07:34:13.871	2025-06-12 05:53:06.269	PegeDev	{name,code,status,date_pickup,address}	transaction_update
584c6f09-fdde-4fcf-afec-a2a9cbc0f1ab	Notif Cancel	Halo {name}!\n\npesanan kamu dengan kode: {code}, berhasil dicancel!\n\n_Terimakasih sudah menggunakan layanan kami._	cancelled	t	2025-06-05 07:34:25.76	2025-06-05 08:34:57.993	PegeDev	{name,code}	transaction_update
e3f77a90-c23f-4917-abf5-b4879fa0ae76	Notif Pickup Berhasil	Halo {name} 👋\n\nPesanan dengan Kode: {code}\n✅ Pakaian Anda telah kami terima.\n\nPakaian akan segera diproses.	pickup_successful	t	2025-06-05 07:33:51.199	2025-06-25 07:28:57.255	PegeDev	{name,code}	transaction_update
7b9b4105-8d99-42a2-81c0-642eca6e59e7	Notif Schedulled Delivery	Halo {name} 👋.\n\nPesanan dengan Kode: {code} sudah selesai. \n\nLaundry anda Siap di antar atau di pickup di toko. \n\nKabari kami ya apakah mau di ambil atau kami bantu delivery ke rumah.\n\nTerima kasih! 	scheduled_for_delivery	t	2025-06-05 07:39:49.502	2025-06-26 07:05:15.109	PegeDev	{name,code}	transaction_update
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users" ("id", "username", "fullName", "password", "avatar", "phone", "role", "phoneVerified", "address", "createdAt") FROM stdin;
b3979e8c-301e-4975-acc5-02b918eea8e3	6285641298460	Leni	\N	\N	6285641298460	user	f	Cluster Aster 1 no 10	2025-06-22 06:07:20.706
7881b415-b461-43e9-80d5-9876dd94defd	EagerLion21	PegeDev	\N	\N	6285974781240	super_admin	t	Jl. Kesana Kemari	2025-06-05 07:07:49.089
6cf0f39d-1c83-46e5-871a-13ad7173ed22	6281310176309	Tania	\N	\N	6281310176309	user	f	Aster 1 no 11	2025-06-23 10:53:37.183
f3c9c1fa-7a20-433b-a45d-580c5eacce59	6285692219589	Ibu Fani	\N	\N	6285692219589	user	f	Warteg 	2025-06-20 12:30:54.024
8e9b73a3-dcac-42dd-8c29-910875bba5c4	6287889556949	Aurel	\N	\N	6287889556949	user	f	Aster 6 no 16	2025-06-25 12:01:15.199
c664e39d-231b-4e8d-b79b-9b2e818fab06	088289622276	Fariz	\N	\N	6288289622276	user	f	Cendana parc 12 no 32	2025-06-26 07:40:15.877
dcb35464-9275-4081-a5e2-8b7d47fd8093	62895404639469	Ayu	\N	\N	62895404639469	user	f	Jackkids	2025-06-24 03:11:30.24
04cf4dcc-bb43-4367-b980-55fe5f6d1506	BraveShark19	Ardi	\N	\N	6281519981811	super_admin	t	Gardenia Boulevard no 9999	2025-06-06 06:37:44.679
034ccd5d-8077-46ec-8872-31f64a1a2bfc	6281299071805	Jeannie	\N	\N	6281299071805	user	f	Gardenia 7 no 28	2025-06-21 08:33:34.188
26ec8c93-3732-4fd7-a29f-5d58525457b4	62895384501721	Kak Sefti	\N	\N	62895384501721	user	f	Walk in cust	2025-06-23 02:50:18.359
f208b19b-e5f7-4ef5-96f2-0b6d689c2857	6285710783767	Intan	\N	\N	6285710783767	user	f	Walk in Cust,non petals	2025-06-27 04:40:56.963
\.


--
-- Data for Name: PhoneChangeRequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."PhoneChangeRequest" ("id", "userId", "newPhone", "otp", "expiresAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: Service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."Service" ("id", "name", "description", "banner", "price", "unitType") FROM stdin;
8242abaa-8509-4718-a9dc-aca0fb672a3e	Cuci Kering Lipat Regular	Cuci kering lipat dengan detergent standard	https://utfs.io/f/iSlriPAgTrQNAAJ9t0f29TtghOoGxkuZlqL50wzBfCHJdvIF	8000	kg
1385480f-42f7-472b-bb9b-970e12d49b2f	Cuci Kering Lipat Organic	Cuci kering lipat dengan detergent ramah lingkungan	https://utfs.io/f/iSlriPAgTrQNPq53jLmGq5yQcN0SC4WTjEenKsAVrzMOFmDw	10000	kg
9dffe679-a323-4050-b3d7-a771c81ce3b2	Cuci Kering Lipat Baby Friendly	Cuci kering lipat menggunakan detergent khusus pakaian bayi.	https://utfs.io/f/iSlriPAgTrQNHvF1SRzvRtxfuI4sNEnWqSZpVGKY9Md2e08y	12000	kg
f86ff222-fe4d-466e-a8a9-cbec839909a1	Cuci + Setrika Organic	Cuci, kering + setrika dengan detergent ramah lingkungan	https://utfs.io/f/iSlriPAgTrQNP4beYymGq5yQcN0SC4WTjEenKsAVrzMOFmDw	14000	kg
907416f2-2be7-4491-9629-224be0151727	Cuci + Setrika Baby Friendly	Cuci, kering + setrika menggunakan detergent khusus pakaian bayi	https://utfs.io/f/iSlriPAgTrQNxVr4f7cLkeQmfIHEzi9SvWJlKpCNs5FyqZX2	16000	kg
d3f510f8-de2e-4c1b-920e-f30df1981bc3	Satuan Regular	Layanan laundry satuan untuk bedcover, selimut, comforter, duvet dan bed linen set (termasuk 2 sarung bantal dan guling) dengan detergent standard	https://utfs.io/f/iSlriPAgTrQNVsVct2y4tgl6wLzNcSaXfH2iChEK8pn37qJ5	35000	kg
5576779d-0ac2-4b02-99d1-80e75b3a78e9	Satuan Organic	Layanan laundry satuan untuk bedcover, selimut, comforter, duvet dan bed linen set (termasuk 2 sarung bantal dan guling) dengan detergent ramah lingkungan	https://utfs.io/f/iSlriPAgTrQNGJiasInBX25A7Q4Uvo8TlIDO3M0wLsqhySjg	40000	kg
8cbd3351-ed0b-4aae-aa55-6f81eefa39cd	Satuan Baby Friendly	Layanan laundry satuan untuk bedcover, selimut, comforter, duvet dan bed linen set (termasuk 2 sarung bantal dan guling) menggunakan detergent khusus pakaian bayi	https://utfs.io/f/iSlriPAgTrQNclIhfiGgz6JHsNlk9G81fd7eEhryToQqa42Z	45000	kg
737d1f76-0138-4e93-beb5-72ffcf6b689d	Spot Cleaning Kerah	Pembersihan khusus kerah bagian luar dan dalam	https://utfs.io/f/iSlriPAgTrQNT92k2SDQOgPj3Tf72xqchtDwbmavI4Kn9BzW	15000	kg
f77e9ad8-fcd2-4f7c-9027-9a59e5ada498	Spot cleaning underarm	Spot cleaning untuk bagian bawah lengan kiri dan kanan	https://utfs.io/f/iSlriPAgTrQN7klDqILrhXAtECUoHNpYvPk1awneODzMlxIJ	17500	kg
754e3d45-1add-4b47-83b8-c56f7d6df21f	Whole spot clean small	Pembersihan noda luntur di baju ukuran small	https://utfs.io/f/iSlriPAgTrQNpKnOS5HeDCXomcFwlzhZxTGLS1rKRgq64NPQ	20000	kg
ccc08a36-c269-46ae-a825-3857a119d369	Cuci + Setrika Regular	Cuci, kering + setrika dengan detergent standard	https://utfs.io/f/iSlriPAgTrQNpxw3b8HeDCXomcFwlzhZxTGLS1rKRgq64NPQ	11000	kg
1b60c06d-939e-4355-a5f3-39963020802b	Perlak Satuan small-med	Perlak kain ukuran max 80cm	https://utfs.io/f/iSlriPAgTrQNEimCWrhNui37H4UvOkd2rQKbclWfhaIw0SVB	10000	kg
7fc0d9f3-b9d9-4d32-a53b-35894908a447	Bantal / Guling	Bantal / guling ukuran standar	https://utfs.io/f/iSlriPAgTrQNkjjGZvLrgSkaGEW4HzyVjuv3CFimn1NdBp2e	15000	kg
def73899-5f1f-4ef8-a44f-11badf7a6315	Manual qty	For new unlisted item, contact us for pricing	https://utfs.io/f/iSlriPAgTrQNiY6nSVAgTrQNq2ceL4BnopMbZHJvK7RljUOi	1000	kg
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."_prisma_migrations" ("id", "checksum", "finished_at", "migration_name", "logs", "rolled_back_at", "started_at", "applied_steps_count") FROM stdin;
2d8fea46-1c14-40c6-8ac0-f980cc8661fc	328a2568baf5ff141c61aed4f593e7cc96a17abf10ee8f4e735c35bbb53a7c40	2025-06-05 06:55:56.285827+00	20250601181222_add_chat_template	\N	\N	2025-06-05 06:55:56.094793+00	1
19942683-bace-4c82-8644-0f94cea8df5b	459c8e3bdeff39445d059168aefdca5bea354682993b0b53e210283f584d7a7d	2025-06-05 06:55:49.677481+00	20250510061515_init	\N	\N	2025-06-05 06:55:49.423804+00	1
0d3d63f0-b9d5-47fc-b1a0-607c180ab45e	c86f9173bab606b95f8311a35f9d1650361989076e91dac781be1be0e0832f8a	2025-06-05 06:55:52.98504+00	20250515133158_change_schema_type_for_model_transaction	\N	\N	2025-06-05 06:55:52.78308+00	1
ef4837f1-0718-4691-bb9f-46d6c76b728f	c45070424de84f23272c8477bd6e104bc5ceb978fbfe53b437305d82bd288a81	2025-06-05 06:55:49.939544+00	20250510074852_init	\N	\N	2025-06-05 06:55:49.746838+00	1
7b51e7bd-bc4b-465a-8a39-08fb2a1977fb	c80c7b00ac30c4debba1fb6b07b1d4e434c4a6631c43c272a4f75341b3b68392	2025-06-05 06:55:50.193964+00	20250510075506_add_price_update_schema_services	\N	\N	2025-06-05 06:55:50.011924+00	1
d4cf72a7-b269-4bf6-8979-d770f59987e5	d1441dc1325c3bbe81abbeba922905baeb1fddd8b5f769418047d4ddac5bc387	2025-06-05 06:55:55.027459+00	20250516194148_add_created_at	\N	\N	2025-06-05 06:55:54.844816+00	1
316051bc-d0db-4364-8840-8e9535cb6425	12f1dd6791b181c82a97017c2ef9f47e0f9f4cc6713e83dba92a1ac32c502322	2025-06-05 06:55:50.442156+00	20250510075600_change_type_of_price_in_schema_services	\N	\N	2025-06-05 06:55:50.263937+00	1
76575dba-f3c0-457d-b8bb-5fbcfbcfc7dd	f2ab11877cdd836cd93f800a4746c154f65322c1c51a44be684884cd9177806b	2025-06-05 06:55:53.242643+00	20250515141217_update_and_add_status_history	\N	\N	2025-06-05 06:55:53.055404+00	1
e16aae21-0c26-422e-a0f5-34781b8a411b	4d70eb07501e780ef32400bbd5da83b4f921aa589cc35645bf91df2e999a1471	2025-06-05 06:55:50.686595+00	20250512120910_change_password_type_to_nullable	\N	\N	2025-06-05 06:55:50.511045+00	1
07c89641-e5d7-4905-8664-f1c760f8dd5d	9c3b01740406cfea005db57a3d3953e1c7c26675eac933b9688baf006a751f45	2025-06-05 06:55:50.939986+00	20250512174500_change_avatar_type_to_nullable	\N	\N	2025-06-05 06:55:50.755575+00	1
255798dd-05f3-4478-a45f-8c431fa2ffba	4062479ba05e97d9dee5e1ece97cb5443f38c283c704a8f65570968b2c1b8dc8	2025-06-05 06:55:51.184446+00	20250512182037_add_address_column_in_user	\N	\N	2025-06-05 06:55:51.009284+00	1
3d3d6ee2-d801-492d-920c-9f4be52540c1	efadc6b32e6efece1fb0471ce3b4edf0d190eead1b4a14b60ec36904870440d8	2025-06-05 06:55:53.515553+00	20250515144333_updating_transaction_status	\N	\N	2025-06-05 06:55:53.312282+00	1
2a58c23f-d9d7-4a3e-a50b-be5ca7bbf55e	833f4b6fb681367c18b4525a7c21ca8cf2334be10216d1a68618a617a2afc460	2025-06-05 06:55:51.443975+00	20250512182323_add_nullable_address	\N	\N	2025-06-05 06:55:51.253655+00	1
24a9570c-74c3-4b6b-98b9-910d4c2cc73a	957731e99772b03f12459c29b214fc087d5a689d8b3ba8c434a69ef8d0fb5951	2025-06-05 06:55:51.716504+00	20250513113042_add_phonechangerequest	\N	\N	2025-06-05 06:55:51.514419+00	1
8d6dec2c-99be-4f26-8436-a51e1dcbc4fc	b1e23895101325b94c90cd030847efcbd5af6fe4561422ce9a105fc7bd554878	2025-06-05 06:55:51.96427+00	20250515044040_add_weight	\N	\N	2025-06-05 06:55:51.785899+00	1
ee5b5005-8bfc-4184-b1fa-c9ae9f7c194e	5f269a0d67f48087728d5cc23be95731787ffcce6d83e423f2171fd0fc9b2000	2025-06-05 06:55:53.764223+00	20250516054846_add_created_at_on_model_status_history_and_delivery_proof	\N	\N	2025-06-05 06:55:53.588133+00	1
917eeb14-d8a9-4df2-8886-a6efe71c1dd2	08a657ba280516aa6ffdd6fd31f8b94f86ee37cf6dae9792ba3e4a0646be9b83	2025-06-05 06:55:52.210526+00	20250515070542_add_unit_type_in_service	\N	\N	2025-06-05 06:55:52.034685+00	1
b616b411-eb4f-47b0-b7d4-bf1a4b4cc1d4	afbbd96e513bdd529d3e580eabc9108c79f477e7a9ec606df378dc6964437c8b	2025-06-05 06:55:52.464281+00	20250515074516_change_model	\N	\N	2025-06-05 06:55:52.281264+00	1
a7f08c6a-3094-441a-9e8d-4e387368e067	7c3eee7d05a306662198eadd3cd040a77b3872e6c2b32b03e15ba52078bfaf48	2025-06-05 06:55:55.276017+00	20250520054027_change_model_schema_transaction	\N	\N	2025-06-05 06:55:55.096996+00	1
01c95dc7-d750-47ca-9904-603b5673c8e8	4600418d6bcd2db56d0e80064dad5df71c92053db7ea3c3713e539e96353dffb	2025-06-05 06:55:52.711727+00	20250515132637_change_model_transaction_schema	\N	\N	2025-06-05 06:55:52.534887+00	1
df168416-0c28-420f-853b-36f94667e489	1f1a1088a4e0042c688bf36e9fef6ab96862e2007e0017066d096039cc941a37	2025-06-05 06:55:54.02211+00	20250516093714_add_apiservice_model	\N	\N	2025-06-05 06:55:53.833976+00	1
56633fb5-6325-488f-8295-d48743fda131	bb57afe08df159180369a74ad6592bbe2efdb5e7a2048b4f17a439ddac6cfdce	2025-06-05 06:55:54.272328+00	20250516102250_set_on_delete_action	\N	\N	2025-06-05 06:55:54.091805+00	1
1034eaab-f53a-4b48-ac06-6a1ed36f6ea0	8d522dd511054163c46292c30bbb1a9766f5776337ebeab75bcaf1197e0f25ae	2025-06-05 06:55:58.115633+00	20250605065221_change_remove_auth_type_from_template_type	\N	\N	2025-06-05 06:55:57.919381+00	1
a009ebdd-14bb-468f-a36c-2cb6505f43e6	d948a70eb1503d065131241f08033bfe688e7c04ee0fda3587a22330b7a0bbf9	2025-06-05 06:55:54.517667+00	20250516181127_add_default_to_is_active	\N	\N	2025-06-05 06:55:54.342151+00	1
4fd5477d-1eb4-4f50-9527-363ccdefaf72	261fe4787042804227e14ac06f38035a15a78e8c62b91e0d0f04cdb412cfe0e7	2025-06-05 06:55:55.52215+00	20250520065607_add_pickup_failed	\N	\N	2025-06-05 06:55:55.34553+00	1
8efae32b-1ef5-433b-b464-c058f9eb138c	39f7a3d0824842571be26397e9ee9e8aab082c39d6d252d5176436293f4dbadd	2025-06-05 06:55:54.772836+00	20250516181601_remove_create_and_updateat	\N	\N	2025-06-05 06:55:54.587814+00	1
d76a7c3f-10f7-4888-be02-2ba1307e3e78	d9691a40a11141034c79b1479c0eb0efbf0b7d6d00fc1a38857e4c9e10809e23	2025-06-05 06:55:56.544584+00	20250602045400_add_model_whatsapp_config	\N	\N	2025-06-05 06:55:56.355262+00	1
c345c60c-0ec0-4e76-9d7e-68f08d4203ed	33db7512018ebeae4924e5f6402e750de7bd1ac2598dedf7111462e585da04d2	2025-06-05 06:55:55.768679+00	20250520072319_	\N	\N	2025-06-05 06:55:55.592859+00	1
1dee0cf5-fb88-49e9-968b-63d27269be6a	e4eea69ab421030cb02f9f144a0657aad643fd9792a539874ac2a731965a208e	2025-06-05 06:55:56.024678+00	20250525121652_add_reschedule_count	\N	\N	2025-06-05 06:55:55.846374+00	1
2b798c2f-b8fa-4b10-99bd-6476a1340d26	554c6f735e1c2e18e6b2e34ce2466a22e60937290138fa190a875805a9df389c	2025-06-05 06:55:57.34725+00	20250604085441_change_type_category_from_chat_template	\N	\N	2025-06-05 06:55:57.159375+00	1
bbd7e84d-66f1-4db0-a3bc-7487563647c8	a8d927ce37e63f511745854d9274edec5e254d99611b09c26ad56c88dd7a3af0	2025-06-05 06:55:56.839367+00	20250602052242_update_column_value_to_nullable	\N	\N	2025-06-05 06:55:56.623521+00	1
4768a05a-1ee3-4fbf-9d8c-199faa8588ff	e959f6ec5679498841b4f5647562574919915a7a0982cca5ec9b0b57b145ff84	2025-06-05 06:55:57.850245+00	20250605064403_remove_unique_type	\N	\N	2025-06-05 06:55:57.666385+00	1
8cea17bb-c4b5-4ad5-927f-d44c267c7dea	d67ce84e7c3d591783e39c8b91027dd90b5656d857917119f3bfb864adbcdce0	2025-06-05 06:55:57.088815+00	20250602122235_change_variables_type	\N	\N	2025-06-05 06:55:56.909507+00	1
8bdcc825-4c5d-4718-9319-f42ab68dcd40	4f09681b92555b53f8b1809c6b3aa3a6c709c2a4266e2f9fb2932130f2b8f336	2025-06-05 06:55:57.595515+00	20250605055720_add_type_message	\N	\N	2025-06-05 06:55:57.416734+00	1
e4eef715-af40-450e-aab2-54211db5e606	af17a8947c1f4fd6b18fe448ba35d69630ca3d81ecfc4e678a9810525c540f30	2025-06-05 06:57:09.993989+00	20250605065706_add_auth_type_template_enum	\N	\N	2025-06-05 06:57:09.809499+00	1
3ef2cf81-952e-4f09-b407-c78359335bb9	8d522dd511054163c46292c30bbb1a9766f5776337ebeab75bcaf1197e0f25ae	2025-06-05 07:02:27.380211+00	20250605070223_remove_authentication	\N	\N	2025-06-05 07:02:27.171375+00	1
\.


--
-- Data for Name: api_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."api_services" ("id", "type", "data", "isActive") FROM stdin;
07a1a69a-ab11-49e0-bd33-eb2546937a40	FONNTE	{"apiKey": "beVRB1LTZz2bzckCDGvZ"}	t
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."payment_methods" ("id", "name") FROM stdin;
54133119-effb-4601-9df0-98f4d1a56a4f	QRIS
172f7b84-6174-4c4a-b861-cc794e41e6d4	Cash / Tunai
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."transactions" ("id", "code", "service_id", "payment_id", "amount", "userId", "createdAt", "typeUnit", "actualUnit", "estimatedUnit", "schedulePickup", "currentStatus", "scheduleDelivery", "customer", "rescheduleCount") FROM stdin;
4a065461-fcae-4368-828a-14eca83ff273	INV-20250625-6870	d3f510f8-de2e-4c1b-920e-f30df1981bc3	172f7b84-6174-4c4a-b861-cc794e41e6d4	70000	8e9b73a3-dcac-42dd-8c29-910875bba5c4	2025-06-25 12:01:15.317	kg	2	2	2025-06-25 12:01:15.09	scheduled_for_delivery	2025-06-26 09:00:00	\N	0
32720486-354f-4600-a44e-1d9f3f3bbd44	INV-20250624-0914	ccc08a36-c269-46ae-a825-3857a119d369	172f7b84-6174-4c4a-b861-cc794e41e6d4	36300	dcb35464-9275-4081-a5e2-8b7d47fd8093	2025-06-24 03:11:30.358	kg	3.3	3	2025-06-24 03:11:29.97	delivered	2025-06-24 11:00:00	\N	0
588ff063-ab5b-4a8d-b21a-580d0b6967a8	INV-20250622-2094	8242abaa-8509-4718-a9dc-aca0fb672a3e	172f7b84-6174-4c4a-b861-cc794e41e6d4	70400	b3979e8c-301e-4975-acc5-02b918eea8e3	2025-06-22 06:07:20.817	kg	8.8	1	2025-06-22 06:07:20.602	delivered	2025-06-22 11:00:00	\N	0
48b99594-ce28-4197-9361-080749e6e0d4	INV-20250620-3405	ccc08a36-c269-46ae-a825-3857a119d369	172f7b84-6174-4c4a-b861-cc794e41e6d4	48000	f3c9c1fa-7a20-433b-a45d-580c5eacce59	2025-06-20 12:30:54.127	kg	4	4	2025-06-20 12:30:53.921	delivered	2025-06-21 07:00:00	\N	0
e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	INV-20250615-7076	ccc08a36-c269-46ae-a825-3857a119d369	172f7b84-6174-4c4a-b861-cc794e41e6d4	36000	\N	2025-06-15 11:34:32.582	kg	3	3	2025-06-15 11:34:32.097	delivered	2025-06-16 05:00:00	{"phone": "6285692219589", "address": "Warteg ", "fullName": "Ibu fani"}	0
d97dee3f-fd55-4e55-9c85-c77fad280d04	INV-20250614-1402	8242abaa-8509-4718-a9dc-aca0fb672a3e	\N	120000	\N	2025-06-14 07:42:48.998	kg	15	15	2025-06-14 07:42:48.715	delivered	2025-06-15 11:00:00	{"phone": "6285641298460", "address": "Aster 1 no 10\\n", "fullName": "Leni"}	0
daa92a85-95d6-465d-8bec-5e3ac33ce4c3	INV-20250619-2110	8242abaa-8509-4718-a9dc-aca0fb672a3e	172f7b84-6174-4c4a-b861-cc794e41e6d4	96000	\N	2025-06-19 03:03:34.859	kg	12	12	2025-06-19 03:03:34.265	delivered	2025-06-19 13:00:00	{"phone": "6285885545678", "address": "Bugel indah b7 no 5", "fullName": "Marlina "}	0
835105ed-99b7-4b5e-b48e-ca0216801a5c	INV-20250628-7055	def73899-5f1f-4ef8-a44f-11badf7a6315	\N	105000	f208b19b-e5f7-4ef5-96f2-0b6d689c2857	2025-06-28 04:12:38.51	kg	\N	105	2025-06-28 04:12:38.509	on_progress_ironing	\N	\N	0
ca8d9c81-31ff-4e85-99b1-62cb544abebb	INV-20250626-1112	d3f510f8-de2e-4c1b-920e-f30df1981bc3	172f7b84-6174-4c4a-b861-cc794e41e6d4	405300	c664e39d-231b-4e8d-b79b-9b2e818fab06	2025-06-26 07:40:15.978	kg	11.58	7	2025-06-26 07:40:15.776	delivered	2025-06-26 09:00:00	\N	0
cc682487-bc7a-48e7-a2ff-72a6048576e3	INV-20250623-0039	8242abaa-8509-4718-a9dc-aca0fb672a3e	172f7b84-6174-4c4a-b861-cc794e41e6d4	44000	6cf0f39d-1c83-46e5-871a-13ad7173ed22	2025-06-23 10:53:37.303	kg	5.5	5	2025-06-23 10:53:37.078	delivered	2025-06-23 15:00:00	\N	0
1d90125f-8e1f-4583-9413-77c5c27ec32c	INV-20250625-2574	ccc08a36-c269-46ae-a825-3857a119d369	172f7b84-6174-4c4a-b861-cc794e41e6d4	36300	f3c9c1fa-7a20-433b-a45d-580c5eacce59	2025-06-25 07:27:16.077	kg	3.3	3	2025-06-25 07:27:16.076	delivered	2025-06-26 03:00:00	\N	0
7fa88406-d72e-4da9-af8a-be3dd625c20f	INV-20250628-1039	7fc0d9f3-b9d9-4d32-a53b-35894908a447	\N	150000	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-06-28 09:36:59.198	kg	\N	10	2025-06-28 11:00:00	cancelled	\N	\N	0
22116826-fb23-4fc6-91ce-edbbb0e30e16	INV-20250627-2060	def73899-5f1f-4ef8-a44f-11badf7a6315	\N	25000	f208b19b-e5f7-4ef5-96f2-0b6d689c2857	2025-06-27 04:43:33.902	kg	\N	25	2025-06-27 04:43:33.898	delivered	2025-06-27 05:00:00	\N	0
4e00a583-c47c-4053-9b2e-3532b36a52f4	INV-20250621-1913	d3f510f8-de2e-4c1b-920e-f30df1981bc3	\N	35000	034ccd5d-8077-46ec-8872-31f64a1a2bfc	2025-06-21 08:33:34.296	kg	\N	1	2025-06-21 08:33:34.073	delivered	2025-06-27 13:00:00	\N	0
b8da1513-7285-430b-9def-cca46a0e336b	INV-20250626-3796	ccc08a36-c269-46ae-a825-3857a119d369	172f7b84-6174-4c4a-b861-cc794e41e6d4	33000	dcb35464-9275-4081-a5e2-8b7d47fd8093	2025-06-26 02:34:46.311	kg	3	3	2025-06-26 02:34:46.31	delivered	2025-06-26 09:00:00	\N	0
c422f4b8-1eb5-49aa-9197-e4ef42342457	INV-20250623-5779	754e3d45-1add-4b47-83b8-c56f7d6df21f	54133119-effb-4601-9df0-98f4d1a56a4f	20000	26ec8c93-3732-4fd7-a29f-5d58525457b4	2025-06-23 02:50:18.477	kg	1	1	2025-06-23 02:50:18.25	delivered	2025-06-28 05:00:00	\N	0
\.


--
-- Data for Name: delivery_proofs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."delivery_proofs" ("id", "transactionId", "image", "receivedBy", "receivedAt", "notes", "signature", "createdAt") FROM stdin;
919ced4b-ad39-4075-bbb4-8ab86652d19f	d97dee3f-fd55-4e55-9c85-c77fad280d04	https://utfs.io/f/iSlriPAgTrQNaSX1Yx4lNmHMjFZJv47yGnLexBu1Qo0VsO9k	Pelanggan	2025-06-15 09:35:00.601	Di dekat pintu utama rumah	\N	2025-06-15 09:35:00.602
5a0afdcb-e9e3-4b8b-ac04-00e7c2c94fdf	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	https://utfs.io/f/iSlriPAgTrQNTyt84XDQOgPj3Tf72xqchtDwbmavI4Kn9BzW	Ibu fani	2025-06-16 07:15:46.426	\N	\N	2025-06-16 07:15:46.427
513086d7-e481-4c68-83b9-e0f24c9f48fe	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	https://utfs.io/f/iSlriPAgTrQNGWFLZwlnBX25A7Q4Uvo8TlIDO3M0wLsqhySj	Marlina	2025-06-20 00:44:31.03	done	\N	2025-06-20 00:44:31.031
8eb43641-e995-40a2-bae0-69bfd4ee5a57	48b99594-ce28-4197-9361-080749e6e0d4	https://utfs.io/f/iSlriPAgTrQNQu9SROII80tmX3UoVPy4khsdwvnSg1iM7Ozq	Pelanggan	2025-06-21 07:21:21.422	\N	\N	2025-06-21 07:21:21.426
6b5e933b-9643-46a0-a9a9-19407c5d7891	588ff063-ab5b-4a8d-b21a-580d0b6967a8	https://utfs.io/f/iSlriPAgTrQNbT1YnfQJ9HA6EceRDQ0wBXL2FrSkfosl8P1K	Drop depan rumah	2025-06-22 11:02:19.151	\N	\N	2025-06-22 11:02:19.152
07870b23-54a1-426b-bc54-2141c8e0ba8b	cc682487-bc7a-48e7-a2ff-72a6048576e3	https://utfs.io/f/iSlriPAgTrQNq7VfgbtAwEucH0xPGBf5R8aWp3OQJ7Ke1DNr	Rumah	2025-06-24 02:19:12.176	\N	\N	2025-06-24 02:19:12.177
459e6076-7018-4368-9bc8-ebeace93ae08	32720486-354f-4600-a44e-1d9f3f3bbd44	https://utfs.io/f/iSlriPAgTrQNt92sUWPoeS5duFmhZRJwYbNiD8flx2C7jp4P	Ayu	2025-06-24 09:33:42.308	\N	\N	2025-06-24 09:33:42.309
1b01c011-3063-40ee-a0f9-7f572abff7b4	1d90125f-8e1f-4583-9413-77c5c27ec32c	https://utfs.io/f/iSlriPAgTrQNvBmZf9QGl0o3OqQP6iVnj9C4aUfswFLXupR8	Fani	2025-06-26 01:46:58.109	\N	\N	2025-06-26 01:46:58.11
3c39aa7b-37e6-4b5a-9f0c-78ff15d621e8	ca8d9c81-31ff-4e85-99b1-62cb544abebb	https://utfs.io/f/iSlriPAgTrQN5p72geOSdcy1Vmw960A5PzChJDxEe7XUMLpf	Fariz	2025-06-26 08:37:46.984	\N	\N	2025-06-26 08:37:46.985
12043e93-e6ff-4eaf-9bfe-233efc000db4	b8da1513-7285-430b-9def-cca46a0e336b	https://utfs.io/f/iSlriPAgTrQN4ss3ybwmIAzBXe2jwnS69tUFdpZqYi7EgfNV	Pelanggan	2025-06-26 08:44:55.76	\N	\N	2025-06-26 08:44:55.762
763640f6-0856-40ed-9944-655480c8712b	22116826-fb23-4fc6-91ce-edbbb0e30e16	https://utfs.io/f/iSlriPAgTrQNXiivnXsMxVDqPJwLptlcGdeQ9Zg6rS0FijoY	Intan	2025-06-27 04:44:46.433	\N	\N	2025-06-27 04:44:46.434
1a3d596b-8cb1-4f2b-8b01-795d0caf7dea	4e00a583-c47c-4053-9b2e-3532b36a52f4	https://utfs.io/f/iSlriPAgTrQNschqHKSq5a4LbKIRhMildtXvEZzxoYu9P76c	Dropoff	2025-06-27 11:35:13.933	\N	\N	2025-06-27 11:35:13.934
2a1523c7-e76b-4611-9d3a-3cbbee67e7fc	c422f4b8-1eb5-49aa-9197-e4ef42342457	https://utfs.io/f/iSlriPAgTrQNWxTGOyEaE98epjBr4sXlCSHOtv3dVg1UomFL	Sefti	2025-06-28 04:10:01.818	\N	\N	2025-06-28 04:10:01.822
\.


--
-- Data for Name: phone_verified_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."phone_verified_tokens" ("id", "userId", "token", "expiredAt") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."sessions" ("id", "userId", "expiresAt") FROM stdin;
okdjwiageaqkeepg5uhdv34hsa67dltratsn3mbv	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-05 08:52:13.989
wecqyz554eyr3towimvjf4yobjyonsn365eipw5z	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-05 09:24:21.324
lnsc7hruzrl3vphb7r6pbjgbgbwqrndqspu6rtik	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-07-06 06:38:10.057
ybfv36irthld7d7gfa77amrth6vjmwjq3lp44oqn	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-07-06 07:04:47.138
d3z7fnsldxclm4aiuymep7ed2assnxrpu27xhkok	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-09 04:59:16.581
usup25bfbhig56ub7rm6c5jaq3w5ndauv3o3hixv	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-09 12:46:37.004
s77yoejfglt6ahkyr3s2iyzbua5vhktqldml2zjc	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-10 06:14:23.002
uxo5ti6cz46ri6gleje7w2yoxj33kjla7m46ifan	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-10 06:27:18.97
3huaycoo4fown6nclaesyly33op3b2gg63tucrjp	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-12 05:57:37.621
4mkmp5zeudbvfxnhr7fis7xupfsqkfelfq256wwk	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-13 16:09:03.907
d4m57q7ldbfwsvyitmebb7k4ykiv7deesv6ejz6j	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-07-14 07:08:50.77
cv5eldbo4svrvoahcvrkhuf5pcrvc6yfw6rucmn7	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-16 05:49:52.002
j5nddfbtf3evetwrz4qbt2erowoqwes6epxlfqjt	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-20 07:10:49.285
ofgsay6evdydjcakh5thw3t47hnjfa44a2644mtn	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-07-21 07:00:22.388
d4opvzdbrkyi437n6hsq2tjvuep5xfnhwk5362w2	7881b415-b461-43e9-80d5-9876dd94defd	2025-07-22 07:41:55.921
nnntiacrroyqrfsx2n6qmvisgsulo5d72krqts45	04cf4dcc-bb43-4367-b980-55fe5f6d1506	2025-07-27 06:13:58.888
\.


--
-- Data for Name: status_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."status_histories" ("id", "transaction_id", "status", "notes", "changedBy", "metadata", "timestamp", "createdAt") FROM stdin;
a8fd784e-a8c5-4298-b207-7c5783d4b39d	d97dee3f-fd55-4e55-9c85-c77fad280d04	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-14 07:42:48.998	2025-06-14 07:42:48.998
12759c62-70ba-459a-a937-d72a72a444b7	d97dee3f-fd55-4e55-9c85-c77fad280d04	pickup_successful		\N	{"actualUnit": 15}	2025-06-14 07:43:33.164	2025-06-14 07:43:33.164
717db77f-666d-47c0-86c0-c7f15707a32e	d97dee3f-fd55-4e55-9c85-c77fad280d04	on_progress_washing		\N	{}	2025-06-14 07:55:52.923	2025-06-14 07:55:52.923
62d17bf9-e8ce-4349-9ed6-e24726266f6a	d97dee3f-fd55-4e55-9c85-c77fad280d04	on_progress_drying		\N	{}	2025-06-14 10:11:26.892	2025-06-14 10:11:26.892
a45a842a-df59-4985-8d15-c1f1533cd56a	d97dee3f-fd55-4e55-9c85-c77fad280d04	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-15T11:00:00.000Z"}	2025-06-15 09:23:52.23	2025-06-15 09:23:52.23
820fe800-114b-49e4-a7d7-a35ee9429a71	d97dee3f-fd55-4e55-9c85-c77fad280d04	out_for_delivery		\N	{}	2025-06-15 09:34:08.824	2025-06-15 09:34:08.824
4227ab1e-edbb-49d9-a79d-c70e100360df	d97dee3f-fd55-4e55-9c85-c77fad280d04	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNaSX1Yx4lNmHMjFZJv47yGnLexBu1Qo0VsO9k", "deliveryNotes": "Di dekat pintu utama rumah"}	2025-06-15 09:35:00.561	2025-06-15 09:35:00.561
9b51b547-635e-454a-9113-8a2755604614	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-15 11:34:32.582	2025-06-15 11:34:32.582
9c608432-4403-4cf5-87b4-1d58db1ef3bb	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	pickup_successful		\N	{"actualUnit": 3, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-15 11:34:54.055	2025-06-15 11:34:54.055
e9abbd4d-a949-40c7-b918-3900217397f6	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	on_progress_washing		\N	{}	2025-06-15 11:55:03.613	2025-06-15 11:55:03.613
864a4757-05be-4153-ac3b-6d641c87565c	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	on_progress_drying		\N	{}	2025-06-15 14:38:59.446	2025-06-15 14:38:59.446
22e452df-40df-4ba9-b79b-4b9a7732bdc4	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	on_progress_ironing		\N	{}	2025-06-16 04:05:54.161	2025-06-16 04:05:54.161
10bf4cc9-e1d7-4f5a-be18-ce4505fc671e	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-16T05:00:00.000Z"}	2025-06-16 04:50:11.112	2025-06-16 04:50:11.112
67598c1f-13ce-4874-8c1b-6877910183a1	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	out_for_delivery		\N	{}	2025-06-16 07:14:27.352	2025-06-16 07:14:27.352
2e0778c6-0685-458a-8a52-1c91f93da7d5	e4780ebe-3e1b-41c1-bfc2-43c916f9bf19	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNTyt84XDQOgPj3Tf72xqchtDwbmavI4Kn9BzW", "receivedBy": "Ibu fani"}	2025-06-16 07:15:46.382	2025-06-16 07:15:46.382
1ee06e20-6fb6-4182-93bd-d67c5c5b4117	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-19 03:03:34.859	2025-06-19 03:03:34.859
62214dbf-fdc0-46c7-8090-77cbc910faf8	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	pickup_successful		\N	{"actualUnit": 12, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-19 03:04:14.838	2025-06-19 03:04:14.838
c4f4f4a0-82dd-48d4-88c9-694581cd7e68	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	on_progress_washing	 	\N	{}	2025-06-19 03:20:32.621	2025-06-19 03:20:32.621
2a6e1de7-a2fe-487d-95d7-1c891a340f2a	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	on_progress_drying		\N	{}	2025-06-19 04:40:27.301	2025-06-19 04:40:27.301
0276be06-0558-4aed-8dff-e9da100cc51f	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-19T13:00:00.000Z"}	2025-06-19 09:26:08.41	2025-06-19 09:26:08.41
ca51438a-2bc9-4e46-938d-73d30b17479b	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	out_for_delivery		\N	{}	2025-06-20 00:43:41.366	2025-06-20 00:43:41.366
9a5c94fe-da34-418a-a01b-495c49a31af1	daa92a85-95d6-465d-8bec-5e3ac33ce4c3	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNGWFLZwlnBX25A7Q4Uvo8TlIDO3M0wLsqhySj", "receivedBy": "Marlina", "deliveryNotes": "done"}	2025-06-20 00:44:30.99	2025-06-20 00:44:30.99
986ad9e9-1392-440d-8e09-d88b0769ce58	48b99594-ce28-4197-9361-080749e6e0d4	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-20 12:30:54.127	2025-06-20 12:30:54.127
0f154e50-e41b-4b26-aa9f-e118fb47b2ca	48b99594-ce28-4197-9361-080749e6e0d4	pickup_successful		\N	{"actualUnit": 4, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-20 12:31:18.133	2025-06-20 12:31:18.133
7f484269-3132-4649-9890-f3e1e4a97117	48b99594-ce28-4197-9361-080749e6e0d4	on_progress_washing		\N	{}	2025-06-20 12:31:24.97	2025-06-20 12:31:24.97
7604457c-3177-457f-bdbe-77cfb1a08823	48b99594-ce28-4197-9361-080749e6e0d4	on_progress_drying		\N	{}	2025-06-20 15:27:28.631	2025-06-20 15:27:28.631
bafe8c5c-2060-4d27-9653-78f6026b266a	48b99594-ce28-4197-9361-080749e6e0d4	on_progress_ironing		\N	{}	2025-06-21 05:06:51.786	2025-06-21 05:06:51.786
42edd279-4ae8-45b2-8028-d5b967e8d412	48b99594-ce28-4197-9361-080749e6e0d4	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-21T07:00:00.000Z"}	2025-06-21 06:23:40.451	2025-06-21 06:23:40.451
38c641c8-6c97-4f45-b0ee-829b0974f22f	48b99594-ce28-4197-9361-080749e6e0d4	out_for_delivery	R	\N	{}	2025-06-21 07:05:33.217	2025-06-21 07:05:33.217
88a2267c-ca82-43bc-bbbd-21908d142930	48b99594-ce28-4197-9361-080749e6e0d4	delivered	asdasd	\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNQu9SROII80tmX3UoVPy4khsdwvnSg1iM7Ozq"}	2025-06-21 07:21:21.373	2025-06-21 07:21:21.373
a87939d3-dd8f-40b5-81f0-98506094a49d	4e00a583-c47c-4053-9b2e-3532b36a52f4	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-21 08:33:34.296	2025-06-21 08:33:34.296
de2aba71-0905-4977-bd57-ce1373feb6ae	4e00a583-c47c-4053-9b2e-3532b36a52f4	pickup_successful		\N	{}	2025-06-21 08:33:46.315	2025-06-21 08:33:46.315
90808e71-7a2c-42ad-a036-acf6ef734f08	588ff063-ab5b-4a8d-b21a-580d0b6967a8	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-22 06:07:20.817	2025-06-22 06:07:20.817
1650b89d-e72d-412a-8f22-cbe63fc9e655	588ff063-ab5b-4a8d-b21a-580d0b6967a8	pickup_successful		\N	{"actualUnit": 8.8, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-22 06:26:40.597	2025-06-22 06:26:40.597
db011162-d175-4985-8fd0-ddc3969bbcd4	588ff063-ab5b-4a8d-b21a-580d0b6967a8	on_progress_washing		\N	{}	2025-06-22 06:27:23.967	2025-06-22 06:27:23.967
dc3b877f-d214-473b-a4b4-8aea7808bd7d	588ff063-ab5b-4a8d-b21a-580d0b6967a8	on_progress_drying		\N	{}	2025-06-22 08:33:25.377	2025-06-22 08:33:25.377
c72b12cc-0496-430d-977a-2a7c9c346096	588ff063-ab5b-4a8d-b21a-580d0b6967a8	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-22T11:00:00.000Z"}	2025-06-22 10:28:05.144	2025-06-22 10:28:05.144
f128d2cc-8898-43f4-8606-349cf2f3b559	588ff063-ab5b-4a8d-b21a-580d0b6967a8	out_for_delivery		\N	{}	2025-06-22 10:58:37.061	2025-06-22 10:58:37.061
1071f4ac-f4a6-4415-b76b-f6b4fcbf4769	588ff063-ab5b-4a8d-b21a-580d0b6967a8	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNbT1YnfQJ9HA6EceRDQ0wBXL2FrSkfosl8P1K", "receivedBy": "Drop depan rumah"}	2025-06-22 11:02:19.108	2025-06-22 11:02:19.108
b9120cbc-6fdb-4c39-82c6-5fdd525df04c	c422f4b8-1eb5-49aa-9197-e4ef42342457	scheduled	Pickup kamis	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-23 02:50:18.477	2025-06-23 02:50:18.477
2c276e48-bae5-464f-88cf-21f73cd32729	c422f4b8-1eb5-49aa-9197-e4ef42342457	pickup_successful		\N	{"actualUnit": 1, "paymentMethod": "54133119-effb-4601-9df0-98f4d1a56a4f"}	2025-06-23 02:50:57.072	2025-06-23 02:50:57.072
8670e70d-4cf5-401c-8eb9-eb57a96c2e86	cc682487-bc7a-48e7-a2ff-72a6048576e3	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-23 10:53:37.303	2025-06-23 10:53:37.303
5cdea9b8-b919-468c-822a-505faf24a07e	cc682487-bc7a-48e7-a2ff-72a6048576e3	pickup_successful		\N	{"actualUnit": 5.5, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-23 10:53:54.46	2025-06-23 10:53:54.46
6e4a1a01-0346-41aa-a610-c718fcb4b032	cc682487-bc7a-48e7-a2ff-72a6048576e3	on_progress_washing		\N	{}	2025-06-23 11:05:53.739	2025-06-23 11:05:53.739
21ba718b-9252-47b0-a49c-48429e001727	cc682487-bc7a-48e7-a2ff-72a6048576e3	on_progress_drying		\N	{}	2025-06-23 12:46:47.241	2025-06-23 12:46:47.241
cbb0410a-a417-4a4e-a02e-367537cbdeba	cc682487-bc7a-48e7-a2ff-72a6048576e3	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-23T15:00:00.000Z"}	2025-06-23 13:56:43.465	2025-06-23 13:56:43.465
ffe38a22-4d37-4765-8ca6-fdc5b7c5f9e0	cc682487-bc7a-48e7-a2ff-72a6048576e3	out_for_delivery		\N	{}	2025-06-24 02:18:13.622	2025-06-24 02:18:13.622
5281139c-a201-47e0-be19-0f2f895349e4	cc682487-bc7a-48e7-a2ff-72a6048576e3	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNq7VfgbtAwEucH0xPGBf5R8aWp3OQJ7Ke1DNr", "receivedBy": "Rumah"}	2025-06-24 02:19:12.13	2025-06-24 02:19:12.13
e90037f1-18c8-4160-a626-43f52d93b922	32720486-354f-4600-a44e-1d9f3f3bbd44	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-24 03:11:30.358	2025-06-24 03:11:30.358
5868ff6e-6446-47b6-acca-24f97a156fb7	32720486-354f-4600-a44e-1d9f3f3bbd44	pickup_successful		\N	{"actualUnit": 3.3, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-24 03:11:49.372	2025-06-24 03:11:49.372
34531a63-08d5-4634-b8ce-556fc2505158	c422f4b8-1eb5-49aa-9197-e4ef42342457	on_progress_washing		\N	{}	2025-06-24 05:01:18.011	2025-06-24 05:01:18.011
ab24e3cb-c48f-4f73-98a5-171888351ed8	32720486-354f-4600-a44e-1d9f3f3bbd44	on_progress_washing		\N	{}	2025-06-24 05:01:59.974	2025-06-24 05:01:59.974
fde96cb7-435f-439f-a349-5ac844058cda	32720486-354f-4600-a44e-1d9f3f3bbd44	on_progress_drying		\N	{}	2025-06-24 05:02:06.472	2025-06-24 05:02:06.472
1c451c78-de47-4b00-aa1b-5e468263a385	4e00a583-c47c-4053-9b2e-3532b36a52f4	on_progress_washing		\N	{}	2025-06-24 05:03:53.014	2025-06-24 05:03:53.014
64d8eabe-9d65-46fc-a608-84a1176f98dc	c422f4b8-1eb5-49aa-9197-e4ef42342457	on_progress_drying		\N	{}	2025-06-24 05:57:48.271	2025-06-24 05:57:48.271
a7a2afa5-b39a-4665-9423-c072235ca1c4	32720486-354f-4600-a44e-1d9f3f3bbd44	on_progress_ironing		\N	{}	2025-06-24 08:34:44.569	2025-06-24 08:34:44.569
9506f359-5998-4b69-bdbe-a534a6b1e2b3	32720486-354f-4600-a44e-1d9f3f3bbd44	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-24T11:00:00.000Z"}	2025-06-24 09:30:44.107	2025-06-24 09:30:44.107
6e0971a2-795e-4048-86b5-110406f33b84	32720486-354f-4600-a44e-1d9f3f3bbd44	out_for_delivery		\N	{}	2025-06-24 09:30:49.752	2025-06-24 09:30:49.752
b10de898-96e9-441b-b32d-f65fb3643980	32720486-354f-4600-a44e-1d9f3f3bbd44	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNt92sUWPoeS5duFmhZRJwYbNiD8flx2C7jp4P", "receivedBy": "Ayu"}	2025-06-24 09:33:42.268	2025-06-24 09:33:42.268
46a9ca39-4b7c-4523-bed6-e30c1dff691c	4e00a583-c47c-4053-9b2e-3532b36a52f4	on_progress_drying		\N	{}	2025-06-24 09:36:58.566	2025-06-24 09:36:58.566
b95426e9-19db-41fe-bdc6-9779cc6aeb99	1d90125f-8e1f-4583-9413-77c5c27ec32c	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-25 07:27:16.077	2025-06-25 07:27:16.077
0e8ddda2-7a6a-4d7a-904a-71b2fb52c301	1d90125f-8e1f-4583-9413-77c5c27ec32c	pickup_successful		\N	{"actualUnit": 3.3, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-25 07:27:33.697	2025-06-25 07:27:33.697
0e8c210d-5645-47d4-862f-aacd84bd4ad3	4a065461-fcae-4368-828a-14eca83ff273	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-25 12:01:15.317	2025-06-25 12:01:15.317
ddcea96e-6713-4fdf-bf6b-35fd671d7999	1d90125f-8e1f-4583-9413-77c5c27ec32c	on_progress_washing		\N	{}	2025-06-26 01:45:22.26	2025-06-26 01:45:22.26
333f3a6a-aae4-4afe-bad3-0f882b701cd8	1d90125f-8e1f-4583-9413-77c5c27ec32c	on_progress_drying		\N	{}	2025-06-26 01:45:50.061	2025-06-26 01:45:50.061
a1e4ba4e-3069-4b8d-9eae-2e1b62343880	1d90125f-8e1f-4583-9413-77c5c27ec32c	on_progress_ironing		\N	{}	2025-06-26 01:45:53.609	2025-06-26 01:45:53.609
6a2f48ee-f181-4a0c-aecd-228f06eb51d6	1d90125f-8e1f-4583-9413-77c5c27ec32c	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-26T03:00:00.000Z"}	2025-06-26 01:45:56.686	2025-06-26 01:45:56.686
2eab634a-8e80-4399-8aae-0900296d8562	1d90125f-8e1f-4583-9413-77c5c27ec32c	out_for_delivery		\N	{}	2025-06-26 01:45:59.955	2025-06-26 01:45:59.955
f4494446-f219-437b-a245-ba6eb1f3c0f8	1d90125f-8e1f-4583-9413-77c5c27ec32c	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNvBmZf9QGl0o3OqQP6iVnj9C4aUfswFLXupR8", "receivedBy": "Fani"}	2025-06-26 01:46:58.066	2025-06-26 01:46:58.066
08f9f3c0-8c37-498f-aa6a-6e837a416c8e	b8da1513-7285-430b-9def-cca46a0e336b	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-26 02:34:46.311	2025-06-26 02:34:46.311
49aa19b9-46ea-460e-9518-9afcddea6148	b8da1513-7285-430b-9def-cca46a0e336b	pickup_successful		\N	{"actualUnit": 3, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-26 02:35:44.45	2025-06-26 02:35:44.45
fc4c69d8-23ae-4830-8465-4171e6ba29fd	4a065461-fcae-4368-828a-14eca83ff273	pickup_successful		\N	{"actualUnit": 2, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-26 07:01:06.177	2025-06-26 07:01:06.177
be4bc1c4-fb0e-416d-9e49-6e7cef25d331	4a065461-fcae-4368-828a-14eca83ff273	on_progress_washing		\N	{}	2025-06-26 07:01:31.189	2025-06-26 07:01:31.189
6b70050e-f4d1-4b8b-b63e-b6f34e1b2c0f	4a065461-fcae-4368-828a-14eca83ff273	on_progress_drying		\N	{}	2025-06-26 07:01:35.261	2025-06-26 07:01:35.261
551745ec-5f3e-4512-beec-41fdaa939368	4a065461-fcae-4368-828a-14eca83ff273	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-26T09:00:00.000Z"}	2025-06-26 07:06:24.233	2025-06-26 07:06:24.233
01a2434c-3dc8-4dd2-9256-43f625576a99	ca8d9c81-31ff-4e85-99b1-62cb544abebb	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-26 07:40:15.978	2025-06-26 07:40:15.978
47e03bd2-31cb-44d4-bfaa-747562c00ede	ca8d9c81-31ff-4e85-99b1-62cb544abebb	pickup_successful		\N	{"actualUnit": 11.58, "paymentMethod": "172f7b84-6174-4c4a-b861-cc794e41e6d4"}	2025-06-26 07:42:28.794	2025-06-26 07:42:28.794
73f3fd9e-60f6-48ed-bac9-a27440c26efc	ca8d9c81-31ff-4e85-99b1-62cb544abebb	on_progress_washing		\N	{}	2025-06-26 07:42:34.153	2025-06-26 07:42:34.153
f18a5a4d-ae5a-4db2-b260-596659f922ea	ca8d9c81-31ff-4e85-99b1-62cb544abebb	on_progress_drying		\N	{}	2025-06-26 07:42:37.728	2025-06-26 07:42:37.728
bf30868d-ba70-4d78-9855-396399959f52	ca8d9c81-31ff-4e85-99b1-62cb544abebb	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-26T09:00:00.000Z"}	2025-06-26 07:42:46.237	2025-06-26 07:42:46.237
c20da269-7f32-4032-a8b6-9825c49dced1	ca8d9c81-31ff-4e85-99b1-62cb544abebb	out_for_delivery		\N	{}	2025-06-26 07:43:46.881	2025-06-26 07:43:46.881
d540b25b-0584-49ba-9a48-acab9030a4a4	ca8d9c81-31ff-4e85-99b1-62cb544abebb	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQN5p72geOSdcy1Vmw960A5PzChJDxEe7XUMLpf", "receivedBy": "Fariz"}	2025-06-26 08:37:46.939	2025-06-26 08:37:46.939
777fef2e-9ae5-428a-8096-61518b8279f0	b8da1513-7285-430b-9def-cca46a0e336b	on_progress_washing		\N	{}	2025-06-26 08:43:45.599	2025-06-26 08:43:45.599
471a0faa-dd9a-4cf7-8186-c7d6918f7ddf	b8da1513-7285-430b-9def-cca46a0e336b	on_progress_drying		\N	{}	2025-06-26 08:43:49.331	2025-06-26 08:43:49.331
5bcb89a0-e3df-4488-94aa-5626bb0189b3	b8da1513-7285-430b-9def-cca46a0e336b	on_progress_ironing		\N	{}	2025-06-26 08:43:52.939	2025-06-26 08:43:52.939
916fe6b8-1c76-43a5-a6d8-2393d59349ac	b8da1513-7285-430b-9def-cca46a0e336b	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-26T09:00:00.000Z"}	2025-06-26 08:43:57.181	2025-06-26 08:43:57.181
cf2d1817-a257-49ce-897a-ce81707b47c3	b8da1513-7285-430b-9def-cca46a0e336b	out_for_delivery		\N	{}	2025-06-26 08:44:01.078	2025-06-26 08:44:01.078
e6bed1ad-4c76-4c7d-b285-0b6e20cbe339	b8da1513-7285-430b-9def-cca46a0e336b	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQN4ss3ybwmIAzBXe2jwnS69tUFdpZqYi7EgfNV"}	2025-06-26 08:44:55.722	2025-06-26 08:44:55.722
a7957b93-dc4e-43b2-b758-bae96e132d88	22116826-fb23-4fc6-91ce-edbbb0e30e16	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-27 04:43:33.902	2025-06-27 04:43:33.902
83d8da96-1810-413b-a376-874afeb24717	22116826-fb23-4fc6-91ce-edbbb0e30e16	pickup_successful		\N	{}	2025-06-27 04:43:47.28	2025-06-27 04:43:47.28
47603a5c-811a-46cf-b2a4-68028b9af5bf	22116826-fb23-4fc6-91ce-edbbb0e30e16	on_progress_washing		\N	{}	2025-06-27 04:43:54.354	2025-06-27 04:43:54.354
a8183d73-3b4a-41af-98b9-69ed939843bf	22116826-fb23-4fc6-91ce-edbbb0e30e16	on_progress_drying		\N	{}	2025-06-27 04:43:58.116	2025-06-27 04:43:58.116
c4a13766-6cbf-4b76-8343-81d16f236d3a	22116826-fb23-4fc6-91ce-edbbb0e30e16	on_progress_ironing		\N	{}	2025-06-27 04:44:04.862	2025-06-27 04:44:04.862
4a1ca559-6979-4710-9983-0044661579a9	22116826-fb23-4fc6-91ce-edbbb0e30e16	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-27T05:00:00.000Z"}	2025-06-27 04:44:10.734	2025-06-27 04:44:10.734
d6351463-b4d7-42ca-b65b-d1e0dfbb98e5	22116826-fb23-4fc6-91ce-edbbb0e30e16	out_for_delivery		\N	{}	2025-06-27 04:44:14.895	2025-06-27 04:44:14.895
a4e18960-b533-4b53-ad59-9d878a1f9ece	22116826-fb23-4fc6-91ce-edbbb0e30e16	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNXiivnXsMxVDqPJwLptlcGdeQ9Zg6rS0FijoY", "receivedBy": "Intan"}	2025-06-27 04:44:46.391	2025-06-27 04:44:46.391
3132b108-32a7-4373-b838-791d973521c4	4e00a583-c47c-4053-9b2e-3532b36a52f4	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-27T13:00:00.000Z"}	2025-06-27 11:33:37	2025-06-27 11:33:37
2ad6ec5c-95fe-4f1a-81a6-954f2688fa42	4e00a583-c47c-4053-9b2e-3532b36a52f4	out_for_delivery		\N	{}	2025-06-27 11:33:44.842	2025-06-27 11:33:44.842
c6436c61-6912-4456-8940-5a8cb6ef7142	4e00a583-c47c-4053-9b2e-3532b36a52f4	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNschqHKSq5a4LbKIRhMildtXvEZzxoYu9P76c", "receivedBy": "Dropoff"}	2025-06-27 11:35:13.893	2025-06-27 11:35:13.893
d780c413-9afc-4e15-a287-10db93c8dc9a	c422f4b8-1eb5-49aa-9197-e4ef42342457	scheduled_for_delivery		\N	{"scheduleDelivery": "2025-06-28T05:00:00.000Z"}	2025-06-28 04:09:15.665	2025-06-28 04:09:15.665
f7cf1198-0d4b-4def-bf12-6f9a5e5a259a	c422f4b8-1eb5-49aa-9197-e4ef42342457	out_for_delivery		\N	{}	2025-06-28 04:09:23.675	2025-06-28 04:09:23.675
f1a0bbd6-29a2-4976-9cc0-ed8fce6d3164	c422f4b8-1eb5-49aa-9197-e4ef42342457	delivered		\N	{"podImg": "https://utfs.io/f/iSlriPAgTrQNWxTGOyEaE98epjBr4sXlCSHOtv3dVg1UomFL", "receivedBy": "Sefti"}	2025-06-28 04:10:01.772	2025-06-28 04:10:01.772
25c460af-da30-4752-afac-15dbeca851d5	835105ed-99b7-4b5e-b48e-ca0216801a5c	scheduled	Transaction created manually by admin	04cf4dcc-bb43-4367-b980-55fe5f6d1506	\N	2025-06-28 04:12:38.51	2025-06-28 04:12:38.51
0c743d3f-cd9a-44c8-b55e-f9eeb64a036f	835105ed-99b7-4b5e-b48e-ca0216801a5c	pickup_successful		\N	{}	2025-06-28 04:12:48.646	2025-06-28 04:12:48.646
ae6d867d-9ed6-4856-9b78-ed9477434992	835105ed-99b7-4b5e-b48e-ca0216801a5c	on_progress_washing		\N	{}	2025-06-28 04:12:57.72	2025-06-28 04:12:57.72
5eff0f56-5438-43b4-b689-6d60b392fd54	835105ed-99b7-4b5e-b48e-ca0216801a5c	on_progress_drying		\N	{}	2025-06-28 04:13:01.678	2025-06-28 04:13:01.678
3310c73b-ee7b-49a5-9f93-66b0b29ed705	835105ed-99b7-4b5e-b48e-ca0216801a5c	on_progress_ironing		\N	{}	2025-06-28 04:13:55.007	2025-06-28 04:13:55.007
fd196bca-9284-42ce-9ac1-581748d740e5	7fa88406-d72e-4da9-af8a-be3dd625c20f	cancelled	Pesanan dibatalkan oleh super_admin (Ardi)	\N	\N	2025-06-28 09:37:38.162	2025-06-28 09:37:38.162
7067ffa8-fc69-4e83-9552-cb729a7596b9	7fa88406-d72e-4da9-af8a-be3dd625c20f	cancelled	Pesanan dibatalkan oleh super_admin (Ardi)	\N	\N	2025-06-28 09:39:49.088	2025-06-28 09:39:49.088
\.


--
-- Data for Name: whatsapp_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."whatsapp_configs" ("id", "name", "value", "valueJson", "valueArray", "isActive") FROM stdin;
7639fabc-b08b-46fd-95b1-ef2205eeaf03	manual_session	Official lnc	\N	\N	t
740315ec-41a5-4586-9654-5f2ae150af3a	auto_session	\N	\N	\N	f
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
