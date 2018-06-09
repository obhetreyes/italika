--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articulos; Type: TABLE; Schema: public; Owner: proyecto; Tablespace: 
--

CREATE TABLE articulos (
    id bigint NOT NULL,
    idtipo bigint NOT NULL,
    nombre text NOT NULL,
    precio text NOT NULL,
    marca text NOT NULL,
    modelo text NOT NULL,
    foto character varying(300)
);


ALTER TABLE public.articulos OWNER TO proyecto;

--
-- Name: articulos_id_seq; Type: SEQUENCE; Schema: public; Owner: proyecto
--

CREATE SEQUENCE articulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articulos_id_seq OWNER TO proyecto;

--
-- Name: articulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyecto
--

ALTER SEQUENCE articulos_id_seq OWNED BY articulos.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: proyecto; Tablespace: 
--

CREATE TABLE categoria (
    id bigint NOT NULL,
    tipo text NOT NULL
);


ALTER TABLE public.categoria OWNER TO proyecto;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: proyecto
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO proyecto;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyecto
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: proyecto; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO proyecto;

--
-- Name: user; Type: TABLE; Schema: public; Owner: proyecto; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL
);


ALTER TABLE public."user" OWNER TO proyecto;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: proyecto
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO proyecto;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyecto
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proyecto
--

ALTER TABLE ONLY articulos ALTER COLUMN id SET DEFAULT nextval('articulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proyecto
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proyecto
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: articulos; Type: TABLE DATA; Schema: public; Owner: proyecto
--

COPY articulos (id, idtipo, nombre, precio, marca, modelo, foto) FROM stdin;
\.


--
-- Name: articulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyecto
--

SELECT pg_catalog.setval('articulos_id_seq', 1, false);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: proyecto
--

COPY categoria (id, tipo) FROM stdin;
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyecto
--

SELECT pg_catalog.setval('categoria_id_seq', 1, false);


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: proyecto
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1526878219
m170626_010728_init_user	1526878222
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: proyecto
--

COPY "user" (id, username, auth_key, password_hash, status, created_at, updated_at) FROM stdin;
1	italika	9TCrihVTgcZ0O_PXRm87GgeYPIZcpMza	$2y$13$DDMIpt4LJMtj8sdcCMhMduq4NCHqTbiuWJu8GKL5NCubVa6/maqtq	10	1526879493	1526879493
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyecto
--

SELECT pg_catalog.setval('user_id_seq', 1, true);


--
-- Name: articulos_pkey; Type: CONSTRAINT; Schema: public; Owner: proyecto; Tablespace: 
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: proyecto; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: proyecto; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: proyecto; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: proyecto; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: articulos_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: proyecto
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES categoria(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

