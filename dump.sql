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
-- Name: shortly; Type: SCHEMA; Schema: -; Owner: -
--

-- CREATE SCHEMA shortly;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: links; Type: TABLE; Schema: shortly; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: shortly; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: shortly; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: shortly; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: shortly; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: shortly; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: shortly; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: shortly; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: shortly; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: shortly; Owner: -
--

INSERT INTO public.links VALUES (1, 'http://www.driven.com.br', 'bd8235a0', 27, 6);
INSERT INTO public.links VALUES (4, 'http://www.driven.com.br', 'bd8235a2', 100, 6);
INSERT INTO public.links VALUES (5, 'http://www.driven.com.br', 'bd8235a1', 200, 6);
INSERT INTO public.links VALUES (6, 'http://www.driven.com.br', 'ad8235a0', 2000, 1);
INSERT INTO public.links VALUES (7, 'http://www.driven.com.br', 'ad8235a1', 2000, 1);
INSERT INTO public.links VALUES (8, 'http://www.driven.com.br', 'ad8235a2', 2000, 1);
INSERT INTO public.links VALUES (9, 'http://www.driven.com.br', 'ad8235a4', 0, 2);
INSERT INTO public.links VALUES (10, 'http://www.driven.com.br', 'ad8235a5', 0, 6);
INSERT INTO public.links VALUES (11, 'http://www.driven.com.br', 'ad8235a5', 0, 6);
INSERT INTO public.links VALUES (12, 'http://www.driven.com.br', 'bd8235a0', 0, 11);
INSERT INTO public.links VALUES (13, 'http://www.driven.com.br', 'bd8235a0', 0, 10);
INSERT INTO public.links VALUES (14, 'http://www.driven.com.br', 'bd8235a0', 0, 12);
INSERT INTO public.links VALUES (15, 'http://www.driven.com.br', 'bd8235a0', 0, 13);
INSERT INTO public.links VALUES (16, 'http://www.driven.com.br', 'bd8235a0', 0, 14);
INSERT INTO public.links VALUES (17, 'http://www.driven.com.br', 'bd8235a0', 0, 15);
INSERT INTO public.links VALUES (18, 'http://www.driven.com.br', 'bd8235a0', 0, 16);
INSERT INTO public.links VALUES (19, 'http://www.driven.com.br', 'bd8235a0', 0, 17);
INSERT INTO public.links VALUES (20, 'https://www.driven.com.br', '5118389a', 0, 6);
INSERT INTO public.links VALUES (21, 'https://www.driven.com.br', 'e5CD7316', 0, 6);
INSERT INTO public.links VALUES (22, 'https://www.driven.com.br', '4E560e78', 0, 6);
INSERT INTO public.links VALUES (23, 'https://www.driven.com.br', 'A01fB698', 0, 6);
INSERT INTO public.links VALUES (24, 'https://www.driven.com.br', '62733b41', 0, 6);
INSERT INTO public.links VALUES (25, 'https://www.driven.com.br', '5f46182c', 0, 6);
INSERT INTO public.links VALUES (26, 'https://www.driven.com.br', 'CF2dc701', 0, 6);
INSERT INTO public.links VALUES (27, 'https://www.driven.com.br', '01cA252e', 0, 6);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: shortly; Owner: -
--

INSERT INTO public.sessions VALUES (1, 6, 'dda95901-c604-4013-82c9-e229f46cc0e2');
INSERT INTO public.sessions VALUES (2, 6, 'c6910a38-f591-4fce-81dd-21af1ebcca6f');


--
-- Data for Name: users; Type: TABLE DATA; Schema: shortly; Owner: -
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


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: shortly; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 27, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: shortly; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: shortly; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: shortly; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--
