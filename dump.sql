--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (151, 'http://www.boticario.com.br', 'A5aec1a9', 1, 21);
INSERT INTO public.links VALUES (47, 'https://www.hub.driven.com.br/computacao', '8E815cd4', 2, 6);
INSERT INTO public.links VALUES (260, 'https://www.youtube.com/watch?v=taJCQ4IEpfQ', '1D5bA97c', 0, 25);
INSERT INTO public.links VALUES (261, 'https://www.youtube.com/watch?v=taJCQ4IEpfQ', '3F88649A', 0, 25);
INSERT INTO public.links VALUES (4, 'http://www.driven.com.br', 'bd8235a2', 108, 6);
INSERT INTO public.links VALUES (150, 'http://www.boticario.com.br', '12036070', 64, 21);
INSERT INTO public.links VALUES (136, 'http://www.boticario.com.br', 'B94D33a9', 0, 21);
INSERT INTO public.links VALUES (259, 'https://www.youtube.com/watch?v=taJCQ4IEpfQ', 'f4E6bb01', 13, 25);
INSERT INTO public.links VALUES (6, 'http://www.driven.com.br', 'ad8235a0', 2000, 1);
INSERT INTO public.links VALUES (7, 'http://www.driven.com.br', 'ad8235a1', 2000, 1);
INSERT INTO public.links VALUES (8, 'http://www.driven.com.br', 'ad8235a2', 2000, 1);
INSERT INTO public.links VALUES (9, 'http://www.driven.com.br', 'ad8235a4', 0, 2);
INSERT INTO public.links VALUES (137, 'http://www.boticario.com.br', 'B394f45c', 1, 21);
INSERT INTO public.links VALUES (148, 'http://www.boticario.com.br', '0dC3566c', 1, 21);
INSERT INTO public.links VALUES (107, 'http://www.livrariasaraiva.com.br', 'EFA391E4', 0, 6);
INSERT INTO public.links VALUES (108, 'http://www.driven.com.br', '02Dc0021', 0, 6);
INSERT INTO public.links VALUES (110, 'http://www.driven.com.br', '6AFAc2E2', 0, 6);
INSERT INTO public.links VALUES (111, 'http://www.driven.com.br', '49242C60', 0, 6);
INSERT INTO public.links VALUES (113, 'http://www.driven.com.br', '356e0B4E', 0, 6);
INSERT INTO public.links VALUES (115, 'http://www.driven.com.br', '952C993b', 0, 6);
INSERT INTO public.links VALUES (116, 'http://www.driven.com.br', '8881bb2d', 0, 6);
INSERT INTO public.links VALUES (117, 'http://www.driven.com.br', '38DD2372', 0, 6);
INSERT INTO public.links VALUES (118, 'http://www.driven.com.br', '99a8EAB4', 0, 6);
INSERT INTO public.links VALUES (119, 'http://www.driven.com.br', '8f7A1f7c', 0, 6);
INSERT INTO public.links VALUES (121, 'http://www.driven.com.br', 'aB58DCD6', 0, 6);
INSERT INTO public.links VALUES (5, 'http://www.driven.com.br', 'bd8235a1', 255, 6);
INSERT INTO public.links VALUES (74, 'http://www.driven.com.br', '491e0dCe', 0, 6);
INSERT INTO public.links VALUES (220, 'http://www.boticario.com.br', 'Cb220fc8', 0, 21);
INSERT INTO public.links VALUES (147, 'http://www.boticario.com.br', '63f42f14', 0, 21);
INSERT INTO public.links VALUES (12, 'http://www.driven.com.br', 'bd8235a0', 4, 11);
INSERT INTO public.links VALUES (13, 'http://www.driven.com.br', 'bd8235a0', 4, 10);
INSERT INTO public.links VALUES (14, 'http://www.driven.com.br', 'bd8235a0', 4, 12);
INSERT INTO public.links VALUES (15, 'http://www.driven.com.br', 'bd8235a0', 4, 13);
INSERT INTO public.links VALUES (16, 'http://www.driven.com.br', 'bd8235a0', 4, 14);
INSERT INTO public.links VALUES (17, 'http://www.driven.com.br', 'bd8235a0', 4, 15);
INSERT INTO public.links VALUES (18, 'http://www.driven.com.br', 'bd8235a0', 4, 16);
INSERT INTO public.links VALUES (19, 'http://www.driven.com.br', 'bd8235a0', 4, 17);
INSERT INTO public.links VALUES (152, 'http://www.boticario.com.br', '720a4773', 0, 21);
INSERT INTO public.links VALUES (146, 'http://www.boticario.com.br', '9a37577D', 2, 21);
INSERT INTO public.links VALUES (123, 'http://www.boticario.com.br', 'b6E4a8a7', 8, 21);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 6, 'dda95901-c604-4013-82c9-e229f46cc0e2');
INSERT INTO public.sessions VALUES (2, 6, 'c6910a38-f591-4fce-81dd-21af1ebcca6f');
INSERT INTO public.sessions VALUES (3, 6, '41289147-5469-4d18-877f-241e8ca058b9');
INSERT INTO public.sessions VALUES (4, 20, '19cd11a7-4729-40c3-bac9-91ec8d39e1f2');
INSERT INTO public.sessions VALUES (5, 20, 'a46a89fa-c69d-4235-b68a-c5c68d534c86');
INSERT INTO public.sessions VALUES (6, 20, '9354e8af-9abe-430c-84ba-0ed51901748c');
INSERT INTO public.sessions VALUES (7, 20, '8ce4273f-be47-4e0a-a4c4-dda0ef6f8ae3');
INSERT INTO public.sessions VALUES (8, 20, '90cb1b50-8772-4487-a044-134e6a2f4c2d');
INSERT INTO public.sessions VALUES (9, 20, '3854e088-16cf-43d1-a808-8cec45158aa9');
INSERT INTO public.sessions VALUES (10, 20, '1f6be5ea-38ff-4f20-994c-a950233f9283');
INSERT INTO public.sessions VALUES (11, 20, 'ea4a516a-e33e-49cd-9b28-1c7af1339cec');
INSERT INTO public.sessions VALUES (12, 20, '290d047d-a24f-4067-8a06-66e195d996c6');
INSERT INTO public.sessions VALUES (13, 20, 'c7775bfe-aa94-42c0-ad0a-31637dc70a5a');
INSERT INTO public.sessions VALUES (14, 20, '25abeba0-bdd3-4c36-ac31-4cc094357d45');
INSERT INTO public.sessions VALUES (15, 20, 'da803044-7799-4952-a6d7-55d86100a801');
INSERT INTO public.sessions VALUES (16, 20, '3a9c8496-dc28-410f-a4a0-507bd46acb6b');
INSERT INTO public.sessions VALUES (17, 20, '54b6cf71-bfcf-4a0b-9f9d-707d0e4dcac8');
INSERT INTO public.sessions VALUES (18, 20, '78772502-ed2e-4d3b-abb9-f3733349757f');
INSERT INTO public.sessions VALUES (19, 20, '27eae800-d6ae-4f7c-90b3-e956b91b33ea');
INSERT INTO public.sessions VALUES (20, 20, '03915c01-04c9-4b06-8471-80dabc330ad3');
INSERT INTO public.sessions VALUES (21, 20, 'da3860a3-a625-473a-a473-25bb4769f386');
INSERT INTO public.sessions VALUES (22, 20, '351f7406-ace5-4bf1-9169-1d240d40e62b');
INSERT INTO public.sessions VALUES (23, 20, '8d4b24a3-5f71-44ea-b834-f7c41392e794');
INSERT INTO public.sessions VALUES (24, 20, '0c698778-8164-4994-82d0-9783f09a27ea');
INSERT INTO public.sessions VALUES (25, 20, 'b6013033-b7d6-4f93-93b6-2add62496a95');
INSERT INTO public.sessions VALUES (26, 20, '5babe4f7-b30c-4e79-a1e9-8f45cd466f7f');
INSERT INTO public.sessions VALUES (27, 20, '8c469a9b-78b2-4ede-974a-63038738b9a4');
INSERT INTO public.sessions VALUES (28, 20, '867cd726-d055-475e-bb99-4232cf3dc5a0');
INSERT INTO public.sessions VALUES (29, 6, 'bd79e37e-e0d0-4880-b8a6-b26712437c13');
INSERT INTO public.sessions VALUES (30, 6, 'e05648af-0654-4842-9022-378a93f65dee');
INSERT INTO public.sessions VALUES (31, 6, '6337893d-c81a-48fd-96bc-5bb4508f5083');
INSERT INTO public.sessions VALUES (32, 6, 'bf112e81-6fdc-4797-ba8f-c62f2486871b');
INSERT INTO public.sessions VALUES (33, 6, '58dabcab-e95b-4bd4-9349-201b421b5815');
INSERT INTO public.sessions VALUES (34, 6, '1822e579-8b04-4b3b-9a09-09ebaa65f54d');
INSERT INTO public.sessions VALUES (35, 6, '9555275d-a376-4c59-b0de-121df381a0c2');
INSERT INTO public.sessions VALUES (36, 6, 'a825051c-cc82-4ff2-a1bb-e3f184f152d6');
INSERT INTO public.sessions VALUES (37, 6, '3e530a52-bb38-46a5-af6d-bdb49280e34f');
INSERT INTO public.sessions VALUES (38, 6, 'daff5bd2-6d94-407b-892f-102de9318744');
INSERT INTO public.sessions VALUES (39, 6, '197b112a-4b0d-45f4-9aa2-5682942682ef');
INSERT INTO public.sessions VALUES (40, 6, 'aca3d47b-cec7-4cc1-a50a-1f822fcae397');
INSERT INTO public.sessions VALUES (41, 6, '5fa52793-f818-4894-a990-ef12dfc6dfc3');
INSERT INTO public.sessions VALUES (42, 6, '575e3006-6dc1-44a2-8d6e-64a27b9063a9');
INSERT INTO public.sessions VALUES (43, 6, '1df9568f-8068-4ab5-9516-298796c165ca');
INSERT INTO public.sessions VALUES (44, 6, 'deac8515-7a42-43c9-8918-6479272dcea9');
INSERT INTO public.sessions VALUES (45, 6, 'ddb278bd-0eae-4b06-a509-8fd731235246');
INSERT INTO public.sessions VALUES (46, 6, 'b5dad45e-17c4-4d5c-86db-11fb147eb717');
INSERT INTO public.sessions VALUES (47, 6, '800c7c3a-5a04-44a8-9473-2126baff72bb');
INSERT INTO public.sessions VALUES (48, 6, '795cba1f-66c8-4c87-b812-032a4b961544');
INSERT INTO public.sessions VALUES (49, 6, '94927ac1-6ba3-4b8a-a5aa-1b08950e27ff');
INSERT INTO public.sessions VALUES (50, 6, '9d5a2559-c4ab-413d-a615-1bdc207c77ef');
INSERT INTO public.sessions VALUES (51, 6, '64a9df28-3537-4e71-85c9-100a998afb5e');
INSERT INTO public.sessions VALUES (52, 6, '8c48c810-e679-46f9-8cea-7f07af0f62e4');
INSERT INTO public.sessions VALUES (53, 6, 'e7b21bee-ecfb-4cc9-96ce-446c22aa6d3a');
INSERT INTO public.sessions VALUES (54, 6, 'a1fe293e-839f-44e7-808b-ac0308e3c088');
INSERT INTO public.sessions VALUES (55, 6, 'c2a44ebe-2381-4f82-b445-656ec8b7a1a1');
INSERT INTO public.sessions VALUES (56, 6, '778ab1f1-1a19-461f-9b39-25cb32f76b5c');
INSERT INTO public.sessions VALUES (57, 6, 'e85d3e95-dbf2-4bb0-a6c7-d71b4407a2ab');
INSERT INTO public.sessions VALUES (58, 6, '426de1b8-792b-4013-a2c2-43a26130d693');
INSERT INTO public.sessions VALUES (59, 6, '003a41de-c24f-43b6-aba8-f1929763c431');
INSERT INTO public.sessions VALUES (60, 6, '6cb68f7f-bc72-4fd7-943b-e1eaf71abdbb');
INSERT INTO public.sessions VALUES (61, 6, '608510f6-1486-47fd-9f5b-5b335c0076fa');
INSERT INTO public.sessions VALUES (62, 6, 'a52849f7-5116-4503-aea3-b70be821dfec');
INSERT INTO public.sessions VALUES (63, 6, '744db184-2a58-4fce-a583-37b0a37a079f');
INSERT INTO public.sessions VALUES (64, 6, '011ce523-30c0-4efc-adbf-ad950574b08c');
INSERT INTO public.sessions VALUES (65, 6, 'ecb7bc36-f30f-4cb0-934f-85ae8f4bac46');
INSERT INTO public.sessions VALUES (66, 6, 'fa125020-1a70-4e21-a136-dd8d3e830faa');
INSERT INTO public.sessions VALUES (67, 6, 'c932b902-4872-4b1f-9f03-8c85d555056b');
INSERT INTO public.sessions VALUES (68, 6, 'df898f78-0653-4fcd-a941-c0d9a0cddf1f');
INSERT INTO public.sessions VALUES (69, 23, '7324cd71-eb9b-48d6-b19e-1ab4cb2d01a4');
INSERT INTO public.sessions VALUES (70, 23, 'e5a9bcf3-be44-49ba-a069-ee0951df817e');
INSERT INTO public.sessions VALUES (71, 23, '7b2d9816-5c4f-46ba-9091-8b8dc640693d');
INSERT INTO public.sessions VALUES (72, 23, 'b110f0e5-39b0-415b-8c6d-1b88884e3938');
INSERT INTO public.sessions VALUES (73, 23, '7b60919b-ffde-417d-af56-63cd7cfc7423');
INSERT INTO public.sessions VALUES (74, 23, 'eba1fec4-fd06-4d26-82c5-a506efe61f7b');
INSERT INTO public.sessions VALUES (75, 21, '7a802f0b-4c9a-4753-bd89-127bb6f016c2');
INSERT INTO public.sessions VALUES (76, 21, 'fc97511c-808d-412b-876e-b31ef6b379ce');
INSERT INTO public.sessions VALUES (77, 21, '4663b8b7-fb47-4d7e-88b0-d616e4120834');
INSERT INTO public.sessions VALUES (78, 21, 'fe81ab98-d5b7-44a8-8d53-2ce22aaca219');
INSERT INTO public.sessions VALUES (79, 6, '82209c4b-e6da-4776-8d69-a35ffe9a3a55');
INSERT INTO public.sessions VALUES (80, 6, 'e770bd10-1331-44b9-b7e1-4c487cb5f9a0');
INSERT INTO public.sessions VALUES (81, 6, '52a4d863-d134-4964-b8ef-2629c59374cd');
INSERT INTO public.sessions VALUES (82, 6, '28965b8f-44c4-421b-b19a-982c89fe8ea9');
INSERT INTO public.sessions VALUES (83, 6, 'd5507411-6277-4714-8dcc-865fbacfda2e');
INSERT INTO public.sessions VALUES (84, 21, '22630038-4d73-40a9-855a-6555ad26036b');
INSERT INTO public.sessions VALUES (85, 21, 'beff074a-6abc-4733-9b73-82ef0bdf8624');
INSERT INTO public.sessions VALUES (86, 21, '12ec0188-865f-4c49-9a56-b2dcc0232b94');
INSERT INTO public.sessions VALUES (87, 21, 'bb6afa6b-9eef-4713-b808-b5552bde0e57');
INSERT INTO public.sessions VALUES (88, 6, '1b122059-05ce-4783-ae55-7425c2278158');
INSERT INTO public.sessions VALUES (89, 6, '17fca1b2-362f-4553-9907-d366acf508dd');
INSERT INTO public.sessions VALUES (90, 21, 'b73f1828-c48f-4ad2-ab4d-8f16448ee294');
INSERT INTO public.sessions VALUES (91, 21, 'a9387072-0ce5-43c7-a5e7-f7e5601ff227');
INSERT INTO public.sessions VALUES (92, 21, '420e77c3-d9e4-43a8-bbdb-1c68b89f38cb');
INSERT INTO public.sessions VALUES (93, 21, '914e8147-b26e-4a56-95b4-99a76df4cdd9');
INSERT INTO public.sessions VALUES (94, 6, '3ba337ee-6d8b-44ce-8f31-b6638bac17bd');
INSERT INTO public.sessions VALUES (95, 6, '9f5d6323-5135-46f4-a6f6-06d79421f80f');
INSERT INTO public.sessions VALUES (96, 6, 'd118d69b-4f69-4d24-919c-55b6970a7b4f');
INSERT INTO public.sessions VALUES (97, 6, '06302341-0631-497b-85bf-46f2d59f903f');
INSERT INTO public.sessions VALUES (98, 6, '47a6e544-687d-4b4d-813c-fcc4300d51bc');
INSERT INTO public.sessions VALUES (99, 6, 'fe7fcde3-9f17-44ef-a6b7-4060a427a2bc');
INSERT INTO public.sessions VALUES (100, 21, 'a10ed508-b4a2-42b2-a3bd-f6c50fb561df');
INSERT INTO public.sessions VALUES (101, 23, 'cd308a2d-1b5e-4b39-a66d-3cc111752718');
INSERT INTO public.sessions VALUES (102, 23, '28dec9aa-a1b3-490b-a227-fdc3da066800');
INSERT INTO public.sessions VALUES (103, 24, '481815a3-ab80-4893-a14c-89fc550c2e25');
INSERT INTO public.sessions VALUES (104, 6, '6562bdd7-1060-4249-9183-74125d8ff43d');
INSERT INTO public.sessions VALUES (105, 23, '191e5c64-058a-4c9d-998c-9ff2289cad6a');
INSERT INTO public.sessions VALUES (106, 24, 'f13b185a-38ee-40c2-aca8-466f0d844ca8');
INSERT INTO public.sessions VALUES (107, 24, '0a8149d1-b956-4b6b-a5b6-6b1460570f73');
INSERT INTO public.sessions VALUES (108, 6, 'ac014628-70d1-44af-bb21-f27a8cae73d0');
INSERT INTO public.sessions VALUES (109, 6, 'd524ffcf-43d4-413a-b4db-c7df03b9fd4a');
INSERT INTO public.sessions VALUES (110, 23, 'c525e9a0-c5ec-44d2-bd11-4f1ae9601328');
INSERT INTO public.sessions VALUES (111, 24, 'aae0f235-0191-4e1e-ab91-8eba7d00ff38');
INSERT INTO public.sessions VALUES (112, 24, '2a00a068-459f-4b48-9e05-1d7f59b4cf54');
INSERT INTO public.sessions VALUES (113, 6, '90b052bc-c766-45da-a477-ffc4d0063475');
INSERT INTO public.sessions VALUES (114, 6, '89450f9a-80fd-4c09-84a0-bf154c2f5f50');
INSERT INTO public.sessions VALUES (115, 6, 'da69e656-d139-49f9-9c60-35d21b94c3dc');
INSERT INTO public.sessions VALUES (116, 6, '79e283fa-56c7-464f-84d0-c29bb8dc296b');
INSERT INTO public.sessions VALUES (117, 21, 'f7827621-d500-4fe1-a54d-bb5e3d987e57');
INSERT INTO public.sessions VALUES (118, 21, 'c7a27793-b33d-41aa-869a-6129906dc50d');
INSERT INTO public.sessions VALUES (119, 21, 'fbed9ad4-dd58-48a1-b4d0-fc40ee6719f5');
INSERT INTO public.sessions VALUES (120, 21, '6866e995-9fd0-4222-b4bb-e449cb002c4f');
INSERT INTO public.sessions VALUES (121, 21, '674bb4d9-710b-4f09-bf43-9c7de29846e3');
INSERT INTO public.sessions VALUES (122, 21, 'd06b3693-c31e-4258-b3c7-0eee90e4bf9d');
INSERT INTO public.sessions VALUES (123, 21, '6e1be799-e6fb-4f9d-bf9d-911f1f66c013');
INSERT INTO public.sessions VALUES (124, 21, '8cfcea8b-2917-4a14-ac69-9beb6cdf0661');
INSERT INTO public.sessions VALUES (125, 21, '95dcd473-6a90-4726-a3d8-db3884262a01');
INSERT INTO public.sessions VALUES (126, 21, 'e854fadc-bdd6-4d45-b77f-4af661c96ac9');
INSERT INTO public.sessions VALUES (127, 6, '314f10e5-3f06-4996-bacd-24e7a5a955da');
INSERT INTO public.sessions VALUES (128, 21, 'cb23ca35-2d50-4a98-9e08-c661629fa663');
INSERT INTO public.sessions VALUES (129, 21, '6387acc8-02e0-4dfd-ac28-d09aa86f97ee');
INSERT INTO public.sessions VALUES (130, 21, '9724ec8f-de27-47cc-b0ee-8d544b81009b');
INSERT INTO public.sessions VALUES (131, 21, '030a4f48-b677-4fed-89c5-414488e34304');
INSERT INTO public.sessions VALUES (132, 25, '02102509-196b-4137-b247-558767576259');
INSERT INTO public.sessions VALUES (133, 25, '9ae800a0-f717-4eed-a4f3-f52153ea45fa');
INSERT INTO public.sessions VALUES (134, 25, 'e1680ac4-3b62-493b-9605-e0b9abd0b73b');
INSERT INTO public.sessions VALUES (135, 25, '1f70ac16-c2f5-4fef-a8a7-ca95ac3d6235');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'teste2', 'teste2@teste.com', 'pas');
INSERT INTO public.users VALUES (2, 'teste1', 'teste1@teste.com', 'asd');
INSERT INTO public.users VALUES (4, 'teste3', 'teste3@teste.com', '$2b$10$RygEuC6.2cOxXE47HQeJe.LOy8EI8X8qfNVZ2Af9yEizmu0eCvHAa');
INSERT INTO public.users VALUES (5, 't4', 't4@t.com', '$2b$10$OIf0JJZwQQwAd73AXuYTGO0ZNtpMGWamTZAWgxJeKo4H4/9m7q9Ni');
INSERT INTO public.users VALUES (6, 't1', 't1@t.com', '$2b$10$pyUEZsBBB0H9vHz3pmige.uI/A3TOOs9IpNSBmhN.qWSnwEFwTli2');
INSERT INTO public.users VALUES (10, 't2', 't2@t.com', '$2b$10$AeAEGuIhvb1SQWXBNgsrO.qbWUbLWEm8o7dmIPLj7kv/N00GO//mC');
INSERT INTO public.users VALUES (11, 't3', 't3@t.com', 'asd');
INSERT INTO public.users VALUES (12, 't5', 't5@t.com', 'asd');
INSERT INTO public.users VALUES (13, 't6', 't6@t.com', 'asd');
INSERT INTO public.users VALUES (14, 't7', 't7@t.com', 'asd');
INSERT INTO public.users VALUES (15, 't8', 't8@t.com', 'asd');
INSERT INTO public.users VALUES (16, 't9', 't9@t.com', 'asd');
INSERT INTO public.users VALUES (17, 't0', 't0@t.com', 'asd');
INSERT INTO public.users VALUES (20, 't10', 't10@t.com', '$2b$10$BpSZvoMutbwbgRi499gHeeY9P5QSQASElz9NbfHnMzLNZlJes/HyC');
INSERT INTO public.users VALUES (21, 't11', 't11@t.com', '$2b$10$Gz/fkV4e0OIzjK2iFRCj4eR3PyARj8Z6dVd.0TZqMAAkdcP.jGJOG');
INSERT INTO public.users VALUES (22, 'teste100', 'teste100@teste.com', '$2b$10$IACTD0Qhwze9hGvMMXESPO7O1u5vdLF9x.rIux2ZD4P.PZuMn8UOm');
INSERT INTO public.users VALUES (23, 't11', 't12@t.com', '$2b$10$OvZ8glWbFzofGZQWZYtxn.6hA5qO5s.z2DMxmyy43Ld79dM9iIL9S');
INSERT INTO public.users VALUES (24, 't13', 't13@t.com', '$2b$10$LdLljSffDDHi2/nq.iJ32ujRwWfyyqTW.JRIIF0jlaUZdAn7sWJGK');
INSERT INTO public.users VALUES (25, 't15', 't15@t.com', '$2b$10$5sONpf10GjHnpBQIsDcLYOa4drIKo90F2XrUwWYqrZhpnJkO7m2Pm');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 265, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 135, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

