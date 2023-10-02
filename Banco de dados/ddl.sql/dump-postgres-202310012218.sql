--
-- PostgreSQL database cluster dump
--

-- Started on 2023-10-01 22:18:46

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE postgres2;
ALTER ROLE postgres2 WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:46

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

-- Completed on 2023-10-01 22:18:48

--
-- PostgreSQL database dump complete
--

--
-- Database "apirest-springboot" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:48

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
-- TOC entry 5734 (class 1262 OID 16394)
-- Name: apirest-springboot; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "apirest-springboot" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "apirest-springboot" OWNER TO postgres;

\connect -reuse-previous=on "dbname='apirest-springboot'"

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
-- TOC entry 5735 (class 0 OID 0)
-- Name: apirest-springboot; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE "apirest-springboot" SET search_path TO '$user', 'public', 'topology', 'tiger';


\connect -reuse-previous=on "dbname='apirest-springboot'"

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
-- TOC entry 15 (class 2615 OID 18593)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 17 (class 2615 OID 18849)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 18282)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 19
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 6 (class 3079 OID 18443)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 11 (class 3079 OID 18582)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 10 (class 3079 OID 18576)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 2 (class 3079 OID 16395)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 4 (class 3079 OID 17983)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 8 (class 3079 OID 18470)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 5742 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 9 (class 3079 OID 18565)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 5743 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 3 (class 3079 OID 17426)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 5744 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 7 (class 3079 OID 18450)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 5745 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 12 (class 3079 OID 18594)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 5 (class 3079 OID 18283)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 5747 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- TOC entry 5386 (class 0 OID 18472)
-- Dependencies: 245
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.


--
-- TOC entry 5383 (class 0 OID 16705)
-- Dependencies: 224
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5387 (class 0 OID 18600)
-- Dependencies: 248
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 5388 (class 0 OID 18932)
-- Dependencies: 293
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5389 (class 0 OID 18942)
-- Dependencies: 295
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5390 (class 0 OID 18952)
-- Dependencies: 297
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 5384 (class 0 OID 18285)
-- Dependencies: 239
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 5385 (class 0 OID 18297)
-- Dependencies: 240
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


-- Completed on 2023-10-01 22:18:52

--
-- PostgreSQL database dump complete
--

--
-- Database "deticdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:52

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
-- TOC entry 3326 (class 1262 OID 19008)
-- Name: deticdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE deticdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE deticdb OWNER TO postgres;

\connect deticdb

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 19055)
-- Name: tarefas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefas (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    duedate date NOT NULL,
    status boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "idUsuario" integer
);


ALTER TABLE public.tarefas OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 19054)
-- Name: tarefas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarefas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarefas_id_seq OWNER TO postgres;

--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: tarefas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarefas_id_seq OWNED BY public.tarefas.id;


--
-- TOC entry 210 (class 1259 OID 19044)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(6) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19043)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3170 (class 2604 OID 19058)
-- Name: tarefas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefas ALTER COLUMN id SET DEFAULT nextval('public.tarefas_id_seq'::regclass);


--
-- TOC entry 3169 (class 2604 OID 19047)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3320 (class 0 OID 19055)
-- Dependencies: 212
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarefas (id, title, description, duedate, status, "createdAt", "updatedAt", "idUsuario") FROM stdin;
\.


--
-- TOC entry 3318 (class 0 OID 19044)
-- Dependencies: 210
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, name, email, password, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 211
-- Name: tarefas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarefas_id_seq', 1, false);


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 3176 (class 2606 OID 19062)
-- Name: tarefas tarefas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT tarefas_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 19053)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3174 (class 2606 OID 19051)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3177 (class 2606 OID 19063)
-- Name: tarefas tarefas_idUsuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT "tarefas_idUsuario_fkey" FOREIGN KEY ("idUsuario") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-10-01 22:18:54

--
-- PostgreSQL database dump complete
--

--
-- Database "emissaorg" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:54

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
-- TOC entry 3966 (class 1262 OID 27207)
-- Name: emissaorg; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE emissaorg WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE emissaorg OWNER TO postgres;

\connect emissaorg

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
-- TOC entry 4 (class 2615 OID 27210)
-- Name: emissaorg; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA emissaorg;


ALTER SCHEMA emissaorg OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 27212)
-- Name: emissaorg_historico; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA emissaorg_historico;


ALTER SCHEMA emissaorg_historico OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 27211)
-- Name: emissaorg_test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA emissaorg_test;


ALTER SCHEMA emissaorg_test OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 27213)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA emissaorg;


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 27224)
-- Name: acompanhamento_legado; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.acompanhamento_legado (
    id_acompanhamento_legado bigint NOT NULL,
    estado_atual smallint,
    data_acompanhamento timestamp without time zone,
    id_pedido character varying(255),
    id_usuario character varying(255),
    estado_anterior smallint
);


ALTER TABLE emissaorg.acompanhamento_legado OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 27223)
-- Name: acompanhamento_legado_id_acompanhamento_legado_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.acompanhamento_legado_id_acompanhamento_legado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.acompanhamento_legado_id_acompanhamento_legado_seq OWNER TO postgres;

--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 215
-- Name: acompanhamento_legado_id_acompanhamento_legado_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.acompanhamento_legado_id_acompanhamento_legado_seq OWNED BY emissaorg.acompanhamento_legado.id_acompanhamento_legado;


--
-- TOC entry 288 (class 1259 OID 27546)
-- Name: acompanhamento_legado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.acompanhamento_legado_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.acompanhamento_legado_id_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27233)
-- Name: agendamento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.agendamento (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60) NOT NULL,
    observacao character varying(200),
    horario_disponivel_id bigint NOT NULL,
    solicitationrg_id bigint NOT NULL,
    usuario_terceirizado_id bigint
);


ALTER TABLE emissaorg.agendamento OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 27232)
-- Name: agendamento_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.agendamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.agendamento_id_seq OWNER TO postgres;

--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 217
-- Name: agendamento_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.agendamento_id_seq OWNED BY emissaorg.agendamento.id;


--
-- TOC entry 220 (class 1259 OID 27240)
-- Name: autenticacao_documento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.autenticacao_documento (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    external_id character varying(60),
    justificativa character varying(255),
    status smallint,
    tipo_documento smallint
);


ALTER TABLE emissaorg.autenticacao_documento OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27239)
-- Name: autenticacao_documento_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.autenticacao_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.autenticacao_documento_id_seq OWNER TO postgres;

--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 219
-- Name: autenticacao_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.autenticacao_documento_id_seq OWNED BY emissaorg.autenticacao_documento.id;


--
-- TOC entry 222 (class 1259 OID 27247)
-- Name: captura_presencial; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.captura_presencial (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    ausente boolean,
    captura_tipo smallint NOT NULL,
    terc_id_externo character varying(60) NOT NULL,
    justificativa_captura smallint,
    score double precision,
    tamanho_arquivo bigint,
    usuario_legado_id character varying(200),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.captura_presencial OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 27254)
-- Name: captura_presencial_comparacao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.captura_presencial_comparacao (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    ausente boolean,
    captura_tipo smallint NOT NULL,
    id_externo_pedido character varying(60) NOT NULL,
    numero_de_protocolo character varying(36) NOT NULL
);


ALTER TABLE emissaorg.captura_presencial_comparacao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 27253)
-- Name: captura_presencial_comparacao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.captura_presencial_comparacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.captura_presencial_comparacao_id_seq OWNER TO postgres;

--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 223
-- Name: captura_presencial_comparacao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.captura_presencial_comparacao_id_seq OWNED BY emissaorg.captura_presencial_comparacao.id;


--
-- TOC entry 221 (class 1259 OID 27246)
-- Name: captura_presencial_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.captura_presencial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.captura_presencial_id_seq OWNER TO postgres;

--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 221
-- Name: captura_presencial_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.captura_presencial_id_seq OWNED BY emissaorg.captura_presencial.id;


--
-- TOC entry 226 (class 1259 OID 27261)
-- Name: dados_anomalia; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.dados_anomalia (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    anomalia smallint,
    dedo smallint,
    mao smallint,
    anthropometric_id bigint
);


ALTER TABLE emissaorg.dados_anomalia OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 27260)
-- Name: dados_anomalia_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.dados_anomalia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.dados_anomalia_id_seq OWNER TO postgres;

--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 225
-- Name: dados_anomalia_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.dados_anomalia_id_seq OWNED BY emissaorg.dados_anomalia.id;


--
-- TOC entry 228 (class 1259 OID 27268)
-- Name: dados_antropometricos; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.dados_antropometricos (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cor_do_olho smallint,
    tipo_do_olho smallint,
    func_id_externo character varying(60),
    cor_do_cabelo smallint,
    tipo_de_cabelo smallint,
    altura double precision,
    observacao text,
    cor_da_pele smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.dados_antropometricos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27267)
-- Name: dados_antropometricos_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.dados_antropometricos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.dados_antropometricos_id_seq OWNER TO postgres;

--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 227
-- Name: dados_antropometricos_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.dados_antropometricos_id_seq OWNED BY emissaorg.dados_antropometricos.id;


--
-- TOC entry 230 (class 1259 OID 27277)
-- Name: dados_biograficos_comparacao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.dados_biograficos_comparacao (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    outra_identidade character varying(255),
    cert_livro character varying(255),
    cert_circunscricao character varying(255),
    cert_cidade character varying(255),
    cert_cartorio character varying(255),
    cert_folha character varying(255),
    cert_matricula_certidao character varying(255),
    cert_termo character varying(255),
    cert_estado character varying(255),
    cidade_de_nascimento character varying(255),
    pais character varying(255),
    cpf character varying(255),
    data_de_nascimento character varying(255),
    digito_rg character varying(255),
    id_externo_pedido character varying(60) NOT NULL,
    filiacao_1 character varying(255),
    filiacao_2 character varying(255),
    filiacao_3 character varying(255),
    filiacao_4 character varying(255),
    genero_sexual character varying(255),
    portatia_ministerial character varying(255),
    nome character varying(255),
    nacionalidade character varying(255),
    numero_de_protocolo character varying(255) NOT NULL,
    rg character varying(255),
    tipo_de_documento character varying(255),
    estado_de_nascimento character varying(255),
    portatia_ministerial_ano character varying(255)
);


ALTER TABLE emissaorg.dados_biograficos_comparacao OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27276)
-- Name: dados_biograficos_comparacao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.dados_biograficos_comparacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.dados_biograficos_comparacao_id_seq OWNER TO postgres;

--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 229
-- Name: dados_biograficos_comparacao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.dados_biograficos_comparacao_id_seq OWNED BY emissaorg.dados_biograficos_comparacao.id;


--
-- TOC entry 232 (class 1259 OID 27286)
-- Name: disponibilidade; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.disponibilidade (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    ativo boolean NOT NULL,
    dia date NOT NULL,
    hora_fim time without time zone,
    id_externo character varying(60) NOT NULL,
    observacao character varying(150),
    hora_inicio time without time zone,
    local_agendamento_id bigint NOT NULL
);


ALTER TABLE emissaorg.disponibilidade OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 27285)
-- Name: disponibilidade_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.disponibilidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.disponibilidade_id_seq OWNER TO postgres;

--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 231
-- Name: disponibilidade_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.disponibilidade_id_seq OWNED BY emissaorg.disponibilidade.id;


--
-- TOC entry 234 (class 1259 OID 27293)
-- Name: entrega_recebedor; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.entrega_recebedor (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60) NOT NULL,
    recebedor character varying(100),
    impressao_posto_id bigint
);


ALTER TABLE emissaorg.entrega_recebedor OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 27292)
-- Name: entrega_recebedor_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.entrega_recebedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.entrega_recebedor_id_seq OWNER TO postgres;

--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 233
-- Name: entrega_recebedor_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.entrega_recebedor_id_seq OWNED BY emissaorg.entrega_recebedor.id;


--
-- TOC entry 236 (class 1259 OID 27300)
-- Name: espelho_rg; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.espelho_rg (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    filiacao1 character varying(60),
    filiacao2 character varying(60),
    filiacao3 character varying(60),
    filiacao4 character varying(60),
    func_id_externo character varying(60),
    nome character varying(70) NOT NULL,
    observacao character varying(18),
    nome_social character varying(70),
    solicitationrg_id bigint NOT NULL
);


ALTER TABLE emissaorg.espelho_rg OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 27299)
-- Name: espelho_rg_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.espelho_rg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.espelho_rg_id_seq OWNER TO postgres;

--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 235
-- Name: espelho_rg_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.espelho_rg_id_seq OWNED BY emissaorg.espelho_rg.id;


--
-- TOC entry 238 (class 1259 OID 27307)
-- Name: funcionario_legado; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.funcionario_legado (
    id_funcionario bigint NOT NULL,
    cpf character varying(255),
    id_externo character varying(255),
    login character varying(255),
    nome character varying(255),
    tipo_funcionario character varying(255)
);


ALTER TABLE emissaorg.funcionario_legado OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 27306)
-- Name: funcionario_legado_id_funcionario_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.funcionario_legado_id_funcionario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.funcionario_legado_id_funcionario_seq OWNER TO postgres;

--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 237
-- Name: funcionario_legado_id_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.funcionario_legado_id_funcionario_seq OWNED BY emissaorg.funcionario_legado.id_funcionario;


--
-- TOC entry 212 (class 1259 OID 27220)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 27316)
-- Name: historico_status; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.historico_status (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    data_do_status timestamp without time zone,
    status smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.historico_status OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 27315)
-- Name: historico_status_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.historico_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.historico_status_id_seq OWNER TO postgres;

--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 239
-- Name: historico_status_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.historico_status_id_seq OWNED BY emissaorg.historico_status.id;


--
-- TOC entry 242 (class 1259 OID 27323)
-- Name: horario_disponivel; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.horario_disponivel (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60) NOT NULL,
    quantidade integer NOT NULL,
    hora_disponivel time without time zone,
    quantidade_total integer NOT NULL,
    disponibilidade_id bigint NOT NULL
);


ALTER TABLE emissaorg.horario_disponivel OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 27322)
-- Name: horario_disponivel_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.horario_disponivel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.horario_disponivel_id_seq OWNER TO postgres;

--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 241
-- Name: horario_disponivel_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.horario_disponivel_id_seq OWNED BY emissaorg.horario_disponivel.id;


--
-- TOC entry 244 (class 1259 OID 27330)
-- Name: impressao_posto; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.impressao_posto (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60) NOT NULL,
    posto character varying(20)
);


ALTER TABLE emissaorg.impressao_posto OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 27329)
-- Name: impressao_posto_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.impressao_posto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.impressao_posto_id_seq OWNER TO postgres;

--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 243
-- Name: impressao_posto_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.impressao_posto_id_seq OWNED BY emissaorg.impressao_posto.id;


--
-- TOC entry 246 (class 1259 OID 27337)
-- Name: justificativas_analise; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.justificativas_analise (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    external_id character varying(60),
    justificativa character varying(255),
    status smallint,
    tipo_documento smallint
);


ALTER TABLE emissaorg.justificativas_analise OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 27336)
-- Name: justificativas_analise_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.justificativas_analise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.justificativas_analise_id_seq OWNER TO postgres;

--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 245
-- Name: justificativas_analise_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.justificativas_analise_id_seq OWNED BY emissaorg.justificativas_analise.id;


--
-- TOC entry 247 (class 1259 OID 27343)
-- Name: legado_pedido_acompanhamento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_acompanhamento (
    id bigint NOT NULL,
    estado_atual character varying(1),
    data_acompanhamento timestamp without time zone,
    observacao character varying(300),
    estado_anterior character varying(1),
    id_usuario bigint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.legado_pedido_acompanhamento OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 27348)
-- Name: legado_pedido_atendimento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_atendimento (
    id bigint NOT NULL,
    data_final timestamp without time zone,
    operacao character varying(1),
    data_atendimento timestamp without time zone,
    etapa character varying(1),
    id_usuario bigint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.legado_pedido_atendimento OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 27354)
-- Name: legado_pedido_dados_impressao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_dados_impressao (
    id bigint NOT NULL,
    nome_social_abreviado character varying(60),
    filiacao_1_adicional_abreviada character varying(60),
    filiacao_2_adicional_abreviada character varying(60),
    data_validade timestamp without time zone,
    pai_abreviado character varying(60),
    mae_abreviado character varying(60),
    observacao character varying(60),
    maior_65_anos character varying(1),
    nome_abreviado character varying(70),
    tipo_assinatura integer,
    documento_origem character varying(98),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.legado_pedido_dados_impressao OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 27353)
-- Name: legado_pedido_dados_impressao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.legado_pedido_dados_impressao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.legado_pedido_dados_impressao_id_seq OWNER TO postgres;

--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 249
-- Name: legado_pedido_dados_impressao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.legado_pedido_dados_impressao_id_seq OWNED BY emissaorg.legado_pedido_dados_impressao.id;


--
-- TOC entry 252 (class 1259 OID 27363)
-- Name: legado_pedido_impressao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_impressao (
    id bigint NOT NULL,
    data_impressao timestamp without time zone,
    espelho integer,
    tipo_operacao character varying(1),
    impressao_lote_id bigint,
    impressao_posto_id bigint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.legado_pedido_impressao OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 27362)
-- Name: legado_pedido_impressao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.legado_pedido_impressao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.legado_pedido_impressao_id_seq OWNER TO postgres;

--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 251
-- Name: legado_pedido_impressao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.legado_pedido_impressao_id_seq OWNED BY emissaorg.legado_pedido_impressao.id;


--
-- TOC entry 253 (class 1259 OID 27369)
-- Name: legado_pedido_pagamento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_pagamento (
    id bigint NOT NULL,
    ativo character varying(1),
    dt_nascimento timestamp without time zone,
    dt_pagto timestamp without time zone,
    dt_pagto_sefaz timestamp without time zone,
    data_pg timestamp without time zone,
    tipo_isencao smallint,
    nome character varying(255),
    nosso_numero character varying(15),
    rg character varying(20),
    status smallint,
    tipo smallint,
    id_usuario smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.legado_pedido_pagamento OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 27374)
-- Name: legado_pedido_rg_excluido; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.legado_pedido_rg_excluido (
    id bigint NOT NULL,
    data_exclusao timestamp without time zone,
    observacao character varying(300),
    id_pedido bigint,
    rg character varying(20),
    id_usuario bigint
);


ALTER TABLE emissaorg.legado_pedido_rg_excluido OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 27380)
-- Name: local_agendamento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.local_agendamento (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    endereco character varying(150) NOT NULL,
    cidade character varying(80) NOT NULL,
    habilitado boolean,
    id_externo character varying(60) NOT NULL,
    nome_local character varying(150) NOT NULL,
    usuario_coord_id bigint
);


ALTER TABLE emissaorg.local_agendamento OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 27379)
-- Name: local_agendamento_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.local_agendamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.local_agendamento_id_seq OWNER TO postgres;

--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 255
-- Name: local_agendamento_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.local_agendamento_id_seq OWNED BY emissaorg.local_agendamento.id;


--
-- TOC entry 257 (class 1259 OID 27386)
-- Name: local_agendamento_terceirizado; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.local_agendamento_terceirizado (
    local_agendamento_id bigint NOT NULL,
    usuario_terceirizado_id bigint NOT NULL
);


ALTER TABLE emissaorg.local_agendamento_terceirizado OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 27392)
-- Name: local_disponibilidade; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.local_disponibilidade (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    data_fim date NOT NULL,
    id_externo character varying(60) NOT NULL,
    vaga integer NOT NULL,
    vaga_total integer NOT NULL,
    data_inicio date NOT NULL,
    local_agendamento_id bigint
);


ALTER TABLE emissaorg.local_disponibilidade OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 27391)
-- Name: local_disponibilidade_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.local_disponibilidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.local_disponibilidade_id_seq OWNER TO postgres;

--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 258
-- Name: local_disponibilidade_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.local_disponibilidade_id_seq OWNED BY emissaorg.local_disponibilidade.id;


--
-- TOC entry 261 (class 1259 OID 27399)
-- Name: localizacao_cidade; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.localizacao_cidade (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_ibge bigint,
    nome character varying(200),
    estado_id bigint NOT NULL
);


ALTER TABLE emissaorg.localizacao_cidade OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 27398)
-- Name: localizacao_cidade_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.localizacao_cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.localizacao_cidade_id_seq OWNER TO postgres;

--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 260
-- Name: localizacao_cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.localizacao_cidade_id_seq OWNED BY emissaorg.localizacao_cidade.id;


--
-- TOC entry 263 (class 1259 OID 27406)
-- Name: localizacao_estado; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.localizacao_estado (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    sigla character varying(3) NOT NULL,
    id_ibge bigint,
    nome character varying(100) NOT NULL
);


ALTER TABLE emissaorg.localizacao_estado OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 27405)
-- Name: localizacao_estado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.localizacao_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.localizacao_estado_id_seq OWNER TO postgres;

--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 262
-- Name: localizacao_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.localizacao_estado_id_seq OWNED BY emissaorg.localizacao_estado.id;


--
-- TOC entry 265 (class 1259 OID 27413)
-- Name: lote; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.lote (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    numero_lote character varying(6),
    id_externo character varying(60) NOT NULL,
    margem_esquerda character varying(255),
    lote_status smallint,
    margem_superior character varying(255),
    impressao_posto_id bigint
);


ALTER TABLE emissaorg.lote OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 27412)
-- Name: lote_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.lote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.lote_id_seq OWNER TO postgres;

--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 264
-- Name: lote_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.lote_id_seq OWNED BY emissaorg.lote.id;


--
-- TOC entry 267 (class 1259 OID 27422)
-- Name: observacao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.observacao (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    perito_id_externo character varying(60),
    texto text,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.observacao OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 27421)
-- Name: observacao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.observacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.observacao_id_seq OWNER TO postgres;

--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 266
-- Name: observacao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.observacao_id_seq OWNED BY emissaorg.observacao.id;


--
-- TOC entry 269 (class 1259 OID 27431)
-- Name: pedido_anterior_associado; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_anterior_associado (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo_pedido character varying(60) NOT NULL,
    func_id_externo character varying(60),
    numero_pedido character varying(36) NOT NULL
);


ALTER TABLE emissaorg.pedido_anterior_associado OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 27430)
-- Name: pedido_anterior_associado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_anterior_associado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_anterior_associado_id_seq OWNER TO postgres;

--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 268
-- Name: pedido_anterior_associado_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_anterior_associado_id_seq OWNED BY emissaorg.pedido_anterior_associado.id;


--
-- TOC entry 289 (class 1259 OID 27547)
-- Name: pedido_atendimento_legado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_atendimento_legado_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_atendimento_legado_id_seq OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 27438)
-- Name: pedido_dados_pessoais; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_dados_pessoais (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cidade_de_nascimento character varying(120),
    pais_de_nascimento character varying(80),
    data_de_nascimento date NOT NULL,
    escolaridade smallint NOT NULL,
    email character varying(180),
    filiacao1 character varying(180),
    filiacao2 character varying(180),
    filiacao3 character varying(180),
    filiacao4 character varying(180),
    genero smallint NOT NULL,
    estado_civil smallint NOT NULL,
    nome character varying(180) NOT NULL,
    nacionalidade smallint NOT NULL,
    notifica_email boolean,
    notifica_sms boolean,
    id_telefone character varying(18),
    nome_social character varying(180),
    uniao_estavel boolean,
    estado_de_nascimento character varying(60),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.pedido_dados_pessoais OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 27437)
-- Name: pedido_dados_pessoais_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_dados_pessoais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_dados_pessoais_id_seq OWNER TO postgres;

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 270
-- Name: pedido_dados_pessoais_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_dados_pessoais_id_seq OWNED BY emissaorg.pedido_dados_pessoais.id;


--
-- TOC entry 273 (class 1259 OID 27447)
-- Name: pedido_endereco; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_endereco (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cidade character varying(80),
    complemento character varying(100),
    bairro character varying(100),
    numero character varying(10),
    estado character varying(30),
    rua character varying(80),
    codigo_postal character varying(8),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.pedido_endereco OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 27446)
-- Name: pedido_endereco_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_endereco_id_seq OWNER TO postgres;

--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_endereco_id_seq OWNED BY emissaorg.pedido_endereco.id;


--
-- TOC entry 275 (class 1259 OID 27454)
-- Name: pedido_limite_utilizacao; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_limite_utilizacao (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cancelamento_contagem integer NOT NULL,
    perda_agendamento_contagem integer NOT NULL,
    solicitationrg_id bigint NOT NULL
);


ALTER TABLE emissaorg.pedido_limite_utilizacao OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 27453)
-- Name: pedido_limite_utilizacao_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_limite_utilizacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_limite_utilizacao_id_seq OWNER TO postgres;

--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 274
-- Name: pedido_limite_utilizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_limite_utilizacao_id_seq OWNED BY emissaorg.pedido_limite_utilizacao.id;


--
-- TOC entry 290 (class 1259 OID 27548)
-- Name: pedido_pagamento_legado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_pagamento_legado_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_pagamento_legado_id_seq OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 27461)
-- Name: pedido_rg; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_rg (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    criacao_offline boolean,
    data_emissao timestamp without time zone,
    data_do_status timestamp without time zone,
    autenticacao_de_documento boolean,
    emergencial boolean,
    id_externo character varying(60) NOT NULL,
    disponibilidade_id_externo character varying(60),
    local_id_externo character varying(60),
    usuario_qualidade_id_externo character varying(60),
    usuario_id_externo character varying(60),
    func_id_externo character varying(60),
    registro_geral character varying(17),
    migracao boolean,
    documentos_extras boolean,
    captura_presencial boolean,
    numero_de_protocolo character varying(36),
    numero_do_pedido character varying(16),
    rg_antigo character varying(255),
    tipo_pedido smallint NOT NULL,
    pedido_status smallint,
    proximo_passo_da_tela smallint,
    boleto_pago boolean,
    tipo_usuario smallint,
    lote_id bigint,
    impressao_posto_id bigint,
    entrega_recebedor_id bigint
);


ALTER TABLE emissaorg.pedido_rg OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 27470)
-- Name: pedido_rg_condicao_saude; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_rg_condicao_saude (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    transtorno_espectro_autista boolean NOT NULL,
    doenca_auditiva boolean NOT NULL,
    doenca_mental boolean NOT NULL,
    ostomia boolean NOT NULL,
    deficiencia_fisica boolean NOT NULL,
    doenca_visual boolean NOT NULL,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.pedido_rg_condicao_saude OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 27469)
-- Name: pedido_rg_condicao_saude_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_rg_condicao_saude_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_rg_condicao_saude_id_seq OWNER TO postgres;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 278
-- Name: pedido_rg_condicao_saude_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_rg_condicao_saude_id_seq OWNED BY emissaorg.pedido_rg_condicao_saude.id;


--
-- TOC entry 281 (class 1259 OID 27477)
-- Name: pedido_rg_documentos; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.pedido_rg_documentos (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    tipo_sanguineo character varying(3),
    cert_livro character varying(50),
    cert_circunscricao character varying(30),
    cert_cidade character varying(120),
    cert_data_emissao date,
    cert_cartorio character varying(200),
    cert_folha character varying(10),
    cert_matricula_certidao character varying(32),
    cert_uf character varying(30),
    cert_termo character varying(30),
    cert_tipo smallint,
    cnh character varying(20),
    cns character varying(20),
    cpf character varying(11),
    dni character varying(20),
    identidade_profissional_1 character varying(20),
    identidade_profissional_2 character varying(20),
    identidade_profissional_3 character varying(20),
    certificado_militar character varying(20),
    nis character varying(20),
    numero_ctps character varying(15),
    pasep character varying(20),
    pis character varying(20),
    identidade_sec_orgao character varying(10),
    identidade_sec_num character varying(15),
    identidade_sec_uf character varying(2),
    serie_ctps character varying(6),
    uf_ctps character varying(2),
    titulo_de_eleitor character varying(20),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.pedido_rg_documentos OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 27476)
-- Name: pedido_rg_documentos_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_rg_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_rg_documentos_id_seq OWNER TO postgres;

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 280
-- Name: pedido_rg_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_rg_documentos_id_seq OWNED BY emissaorg.pedido_rg_documentos.id;


--
-- TOC entry 291 (class 1259 OID 27549)
-- Name: pedido_rg_excluido_legado_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_rg_excluido_legado_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_rg_excluido_legado_id_seq OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 27460)
-- Name: pedido_rg_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.pedido_rg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.pedido_rg_id_seq OWNER TO postgres;

--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 276
-- Name: pedido_rg_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.pedido_rg_id_seq OWNED BY emissaorg.pedido_rg.id;


--
-- TOC entry 283 (class 1259 OID 27486)
-- Name: requerimento; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.requerimento (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    perito_id_externo character varying(60),
    id_externo character varying(60),
    observacao character varying(600),
    status smallint,
    tipo integer NOT NULL,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.requerimento OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 27485)
-- Name: requerimento_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.requerimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.requerimento_id_seq OWNER TO postgres;

--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 282
-- Name: requerimento_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.requerimento_id_seq OWNED BY emissaorg.requerimento.id;


--
-- TOC entry 285 (class 1259 OID 27495)
-- Name: rg_representante_legal; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.rg_representante_legal (
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    documento_numero character varying(30),
    documento_parte character varying(30),
    documento_uf character varying(30),
    nome character varying(180),
    documento_responsabilidade_disp boolean,
    assina smallint,
    origem_do_form smallint,
    tipo smallint,
    tipo_de_documento smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg.rg_representante_legal OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 27494)
-- Name: rg_representante_legal_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.rg_representante_legal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.rg_representante_legal_id_seq OWNER TO postgres;

--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 284
-- Name: rg_representante_legal_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.rg_representante_legal_id_seq OWNED BY emissaorg.rg_representante_legal.id;


--
-- TOC entry 287 (class 1259 OID 27502)
-- Name: usuario_sistema; Type: TABLE; Schema: emissaorg; Owner: postgres
--

CREATE TABLE emissaorg.usuario_sistema (
    papel integer NOT NULL,
    id bigint NOT NULL,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60) NOT NULL,
    nome character varying(100),
    matricula character varying(20)
);


ALTER TABLE emissaorg.usuario_sistema OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 27501)
-- Name: usuario_sistema_id_seq; Type: SEQUENCE; Schema: emissaorg; Owner: postgres
--

CREATE SEQUENCE emissaorg.usuario_sistema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg.usuario_sistema_id_seq OWNER TO postgres;

--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 286
-- Name: usuario_sistema_id_seq; Type: SEQUENCE OWNED BY; Schema: emissaorg; Owner: postgres
--

ALTER SEQUENCE emissaorg.usuario_sistema_id_seq OWNED BY emissaorg.usuario_sistema.id;


--
-- TOC entry 292 (class 1259 OID 27550)
-- Name: agendamento_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.agendamento_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60),
    observacao character varying(200),
    horario_disponivel_id bigint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.agendamento_historico OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 27555)
-- Name: autenticacao_documento_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.autenticacao_documento_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    external_id character varying(60),
    justificativa character varying(255),
    status smallint,
    tipo_documento smallint
);


ALTER TABLE emissaorg_historico.autenticacao_documento_historico OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 27560)
-- Name: captura_presencial_comparacao_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.captura_presencial_comparacao_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    ausente boolean,
    captura_tipo smallint,
    id_externo_pedido character varying(60),
    numero_de_protocolo character varying(36)
);


ALTER TABLE emissaorg_historico.captura_presencial_comparacao_historico OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 27565)
-- Name: captura_presencial_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.captura_presencial_historico (
    rev bigint NOT NULL,
    data_criacao timestamp without time zone,
    terc_id_externo character varying(255),
    id bigint NOT NULL,
    data_atualizacao timestamp without time zone,
    solicitationrg_id bigint,
    revtype smallint,
    ausente boolean,
    captura_tipo smallint,
    justificativa_captura smallint,
    score double precision,
    tamanho_arquivo bigint,
    usuario_legado_id character varying(200)
);


ALTER TABLE emissaorg_historico.captura_presencial_historico OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 27570)
-- Name: dados_anomalia_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.dados_anomalia_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    anomalia smallint,
    dedo smallint,
    mao smallint,
    anthropometric_id bigint
);


ALTER TABLE emissaorg_historico.dados_anomalia_historico OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 27575)
-- Name: dados_antropometricos_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.dados_antropometricos_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cor_do_olho smallint,
    tipo_do_olho smallint,
    func_id_externo character varying(60),
    cor_do_cabelo smallint,
    tipo_de_cabelo smallint,
    altura double precision,
    observacao text,
    cor_da_pele smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.dados_antropometricos_historico OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 27582)
-- Name: dados_biograficos_comparacao_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.dados_biograficos_comparacao_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    outra_identidade character varying(255),
    cert_livro character varying(255),
    cert_circunscricao character varying(255),
    cert_cidade character varying(255),
    cert_cartorio character varying(255),
    cert_folha character varying(255),
    cert_matricula_certidao character varying(255),
    cert_termo character varying(255),
    cert_estado character varying(255),
    cidade_de_nascimento character varying(255),
    pais character varying(255),
    cpf character varying(255),
    data_de_nascimento character varying(255),
    digito_rg character varying(255),
    id_externo_pedido character varying(60),
    filiacao_1 character varying(255),
    filiacao_2 character varying(255),
    filiacao_3 character varying(255),
    filiacao_4 character varying(255),
    genero_sexual character varying(255),
    portatia_ministerial character varying(255),
    nome character varying(255),
    nacionalidade character varying(255),
    numero_de_protocolo character varying(255),
    rg character varying(255),
    tipo_de_documento character varying(255),
    estado_de_nascimento character varying(255),
    portatia_ministerial_ano character varying(255)
);


ALTER TABLE emissaorg_historico.dados_biograficos_comparacao_historico OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 27589)
-- Name: disponibilidade_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.disponibilidade_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    ativo boolean,
    dia date,
    hora_fim time without time zone,
    id_externo character varying(60),
    observacao character varying(150),
    hora_inicio time without time zone,
    local_agendamento_id bigint
);


ALTER TABLE emissaorg_historico.disponibilidade_historico OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 27594)
-- Name: espelho_rg_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.espelho_rg_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    filiacao1 character varying(60),
    filiacao2 character varying(60),
    filiacao3 character varying(60),
    filiacao4 character varying(60),
    func_id_externo character varying(60),
    nome character varying(70),
    observacao character varying(18),
    nome_social character varying(70),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.espelho_rg_historico OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27222)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: emissaorg_historico; Owner: postgres
--

CREATE SEQUENCE emissaorg_historico.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg_historico.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 27599)
-- Name: horario_disponivel_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.horario_disponivel_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60),
    quantidade integer,
    hora_disponivel time without time zone,
    quantidade_total integer,
    disponibilidade_id bigint
);


ALTER TABLE emissaorg_historico.horario_disponivel_historico OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 27604)
-- Name: justificativas_analise_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.justificativas_analise_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    external_id character varying(60),
    justificativa character varying(255),
    status smallint,
    tipo_documento smallint
);


ALTER TABLE emissaorg_historico.justificativas_analise_historico OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 27609)
-- Name: local_agendamento_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.local_agendamento_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    endereco character varying(150),
    cidade character varying(80),
    habilitado boolean,
    id_externo character varying(60),
    nome_local character varying(150)
);


ALTER TABLE emissaorg_historico.local_agendamento_historico OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 27614)
-- Name: lote_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.lote_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    lote_status smallint
);


ALTER TABLE emissaorg_historico.lote_historico OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 27619)
-- Name: observacao_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.observacao_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    perito_id_externo character varying(60),
    texto text,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.observacao_historico OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 27626)
-- Name: pedido_anterior_associado_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_anterior_associado_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo_pedido character varying(60),
    func_id_externo character varying(60),
    numero_pedido character varying(36)
);


ALTER TABLE emissaorg_historico.pedido_anterior_associado_historico OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 27631)
-- Name: pedido_dados_pessoais_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_dados_pessoais_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cidade_de_nascimento character varying(120),
    pais_de_nascimento character varying(80),
    data_de_nascimento date,
    escolaridade smallint,
    email character varying(180),
    filiacao1 character varying(180),
    filiacao2 character varying(180),
    filiacao3 character varying(180),
    filiacao4 character varying(180),
    genero smallint,
    estado_civil smallint,
    nome character varying(180),
    nacionalidade smallint,
    notifica_email boolean,
    notifica_sms boolean,
    id_telefone character varying(18),
    nome_social character varying(180),
    uniao_estavel boolean,
    estado_de_nascimento character varying(60),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.pedido_dados_pessoais_historico OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 27638)
-- Name: pedido_endereco_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_endereco_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    cidade character varying(80),
    complemento character varying(100),
    bairro character varying(100),
    numero character varying(10),
    estado character varying(30),
    rua character varying(80),
    codigo_postal character varying(8),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.pedido_endereco_historico OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 27643)
-- Name: pedido_rg_condicao_saude_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_rg_condicao_saude_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    transtorno_espectro_autista boolean,
    doenca_auditiva boolean,
    doenca_mental boolean,
    ostomia boolean,
    deficiencia_fisica boolean,
    doenca_visual boolean,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.pedido_rg_condicao_saude_historico OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 27648)
-- Name: pedido_rg_documentos_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_rg_documentos_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    tipo_sanguineo character varying(3),
    cert_livro character varying(50),
    cert_circunscricao character varying(30),
    cert_cidade character varying(120),
    cert_data_emissao date,
    cert_cartorio character varying(200),
    cert_folha character varying(10),
    cert_matricula_certidao character varying(32),
    cert_uf character varying(30),
    cert_termo character varying(30),
    cert_tipo smallint,
    cnh character varying(20),
    cns character varying(20),
    cpf character varying(11),
    dni character varying(20),
    identidade_profissional_1 character varying(20),
    identidade_profissional_2 character varying(20),
    identidade_profissional_3 character varying(20),
    certificado_militar character varying(20),
    nis character varying(20),
    numero_ctps character varying(15),
    pasep character varying(20),
    pis character varying(20),
    identidade_sec_orgao character varying(10),
    identidade_sec_num character varying(15),
    identidade_sec_uf character varying(2),
    serie_ctps character varying(6),
    uf_ctps character varying(2),
    titulo_de_eleitor character varying(20),
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.pedido_rg_documentos_historico OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 27655)
-- Name: pedido_rg_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.pedido_rg_historico (
    rev bigint NOT NULL,
    data_criacao timestamp without time zone,
    id_externo character varying(255),
    func_id_externo character varying(255),
    id bigint NOT NULL,
    pedido_status smallint,
    data_atualizacao timestamp without time zone,
    revtype smallint,
    criacao_offline boolean,
    data_emissao timestamp without time zone,
    data_do_status timestamp without time zone,
    autenticacao_de_documento boolean,
    emergencial boolean,
    disponibilidade_id_externo character varying(60),
    local_id_externo character varying(60),
    usuario_qualidade_id_externo character varying(60),
    usuario_id_externo character varying(60),
    registro_geral character varying(17),
    migracao boolean,
    documentos_extras boolean,
    captura_presencial boolean,
    numero_de_protocolo character varying(36),
    numero_do_pedido character varying(16),
    rg_antigo character varying(255),
    tipo_pedido smallint,
    boleto_pago boolean,
    tipo_usuario smallint
);


ALTER TABLE emissaorg_historico.pedido_rg_historico OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 27662)
-- Name: requerimento_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.requerimento_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    perito_id_externo character varying(60),
    id_externo character varying(60),
    observacao character varying(600),
    status smallint,
    tipo integer,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.requerimento_historico OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 27669)
-- Name: revinfo; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE emissaorg_historico.revinfo OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 27674)
-- Name: rg_representante_legal_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.rg_representante_legal_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    documento_numero character varying(30),
    documento_parte character varying(30),
    documento_uf character varying(30),
    nome character varying(180),
    documento_responsabilidade_disp boolean,
    assina smallint,
    origem_do_form smallint,
    tipo smallint,
    tipo_de_documento smallint,
    solicitationrg_id bigint
);


ALTER TABLE emissaorg_historico.rg_representante_legal_historico OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 27679)
-- Name: usuario_sistema_historico; Type: TABLE; Schema: emissaorg_historico; Owner: postgres
--

CREATE TABLE emissaorg_historico.usuario_sistema_historico (
    id bigint NOT NULL,
    rev integer NOT NULL,
    papel integer NOT NULL,
    revtype smallint,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    id_externo character varying(60),
    nome character varying(100),
    matricula character varying(20)
);


ALTER TABLE emissaorg_historico.usuario_sistema_historico OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 27221)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: emissaorg_test; Owner: postgres
--

CREATE SEQUENCE emissaorg_test.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE emissaorg_test.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 3461 (class 2604 OID 27227)
-- Name: acompanhamento_legado id_acompanhamento_legado; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.acompanhamento_legado ALTER COLUMN id_acompanhamento_legado SET DEFAULT nextval('emissaorg.acompanhamento_legado_id_acompanhamento_legado_seq'::regclass);


--
-- TOC entry 3462 (class 2604 OID 27236)
-- Name: agendamento id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento ALTER COLUMN id SET DEFAULT nextval('emissaorg.agendamento_id_seq'::regclass);


--
-- TOC entry 3463 (class 2604 OID 27243)
-- Name: autenticacao_documento id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.autenticacao_documento ALTER COLUMN id SET DEFAULT nextval('emissaorg.autenticacao_documento_id_seq'::regclass);


--
-- TOC entry 3464 (class 2604 OID 27250)
-- Name: captura_presencial id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.captura_presencial ALTER COLUMN id SET DEFAULT nextval('emissaorg.captura_presencial_id_seq'::regclass);


--
-- TOC entry 3465 (class 2604 OID 27257)
-- Name: captura_presencial_comparacao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.captura_presencial_comparacao ALTER COLUMN id SET DEFAULT nextval('emissaorg.captura_presencial_comparacao_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 27264)
-- Name: dados_anomalia id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_anomalia ALTER COLUMN id SET DEFAULT nextval('emissaorg.dados_anomalia_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 27271)
-- Name: dados_antropometricos id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_antropometricos ALTER COLUMN id SET DEFAULT nextval('emissaorg.dados_antropometricos_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 27280)
-- Name: dados_biograficos_comparacao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_biograficos_comparacao ALTER COLUMN id SET DEFAULT nextval('emissaorg.dados_biograficos_comparacao_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 27289)
-- Name: disponibilidade id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.disponibilidade ALTER COLUMN id SET DEFAULT nextval('emissaorg.disponibilidade_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 27296)
-- Name: entrega_recebedor id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.entrega_recebedor ALTER COLUMN id SET DEFAULT nextval('emissaorg.entrega_recebedor_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 27303)
-- Name: espelho_rg id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.espelho_rg ALTER COLUMN id SET DEFAULT nextval('emissaorg.espelho_rg_id_seq'::regclass);


--
-- TOC entry 3472 (class 2604 OID 27310)
-- Name: funcionario_legado id_funcionario; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.funcionario_legado ALTER COLUMN id_funcionario SET DEFAULT nextval('emissaorg.funcionario_legado_id_funcionario_seq'::regclass);


--
-- TOC entry 3473 (class 2604 OID 27319)
-- Name: historico_status id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.historico_status ALTER COLUMN id SET DEFAULT nextval('emissaorg.historico_status_id_seq'::regclass);


--
-- TOC entry 3474 (class 2604 OID 27326)
-- Name: horario_disponivel id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.horario_disponivel ALTER COLUMN id SET DEFAULT nextval('emissaorg.horario_disponivel_id_seq'::regclass);


--
-- TOC entry 3475 (class 2604 OID 27333)
-- Name: impressao_posto id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.impressao_posto ALTER COLUMN id SET DEFAULT nextval('emissaorg.impressao_posto_id_seq'::regclass);


--
-- TOC entry 3476 (class 2604 OID 27340)
-- Name: justificativas_analise id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.justificativas_analise ALTER COLUMN id SET DEFAULT nextval('emissaorg.justificativas_analise_id_seq'::regclass);


--
-- TOC entry 3477 (class 2604 OID 27357)
-- Name: legado_pedido_dados_impressao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_dados_impressao ALTER COLUMN id SET DEFAULT nextval('emissaorg.legado_pedido_dados_impressao_id_seq'::regclass);


--
-- TOC entry 3478 (class 2604 OID 27366)
-- Name: legado_pedido_impressao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_impressao ALTER COLUMN id SET DEFAULT nextval('emissaorg.legado_pedido_impressao_id_seq'::regclass);


--
-- TOC entry 3479 (class 2604 OID 27383)
-- Name: local_agendamento id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento ALTER COLUMN id SET DEFAULT nextval('emissaorg.local_agendamento_id_seq'::regclass);


--
-- TOC entry 3480 (class 2604 OID 27395)
-- Name: local_disponibilidade id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_disponibilidade ALTER COLUMN id SET DEFAULT nextval('emissaorg.local_disponibilidade_id_seq'::regclass);


--
-- TOC entry 3481 (class 2604 OID 27402)
-- Name: localizacao_cidade id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_cidade ALTER COLUMN id SET DEFAULT nextval('emissaorg.localizacao_cidade_id_seq'::regclass);


--
-- TOC entry 3482 (class 2604 OID 27409)
-- Name: localizacao_estado id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_estado ALTER COLUMN id SET DEFAULT nextval('emissaorg.localizacao_estado_id_seq'::regclass);


--
-- TOC entry 3483 (class 2604 OID 27416)
-- Name: lote id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.lote ALTER COLUMN id SET DEFAULT nextval('emissaorg.lote_id_seq'::regclass);


--
-- TOC entry 3484 (class 2604 OID 27425)
-- Name: observacao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.observacao ALTER COLUMN id SET DEFAULT nextval('emissaorg.observacao_id_seq'::regclass);


--
-- TOC entry 3485 (class 2604 OID 27434)
-- Name: pedido_anterior_associado id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_anterior_associado ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_anterior_associado_id_seq'::regclass);


--
-- TOC entry 3486 (class 2604 OID 27441)
-- Name: pedido_dados_pessoais id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_dados_pessoais ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_dados_pessoais_id_seq'::regclass);


--
-- TOC entry 3487 (class 2604 OID 27450)
-- Name: pedido_endereco id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_endereco ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_endereco_id_seq'::regclass);


--
-- TOC entry 3488 (class 2604 OID 27457)
-- Name: pedido_limite_utilizacao id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_limite_utilizacao ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_limite_utilizacao_id_seq'::regclass);


--
-- TOC entry 3489 (class 2604 OID 27464)
-- Name: pedido_rg id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_rg_id_seq'::regclass);


--
-- TOC entry 3490 (class 2604 OID 27473)
-- Name: pedido_rg_condicao_saude id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_condicao_saude ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_rg_condicao_saude_id_seq'::regclass);


--
-- TOC entry 3491 (class 2604 OID 27480)
-- Name: pedido_rg_documentos id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_documentos ALTER COLUMN id SET DEFAULT nextval('emissaorg.pedido_rg_documentos_id_seq'::regclass);


--
-- TOC entry 3492 (class 2604 OID 27489)
-- Name: requerimento id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.requerimento ALTER COLUMN id SET DEFAULT nextval('emissaorg.requerimento_id_seq'::regclass);


--
-- TOC entry 3493 (class 2604 OID 27498)
-- Name: rg_representante_legal id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.rg_representante_legal ALTER COLUMN id SET DEFAULT nextval('emissaorg.rg_representante_legal_id_seq'::regclass);


--
-- TOC entry 3494 (class 2604 OID 27505)
-- Name: usuario_sistema id; Type: DEFAULT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.usuario_sistema ALTER COLUMN id SET DEFAULT nextval('emissaorg.usuario_sistema_id_seq'::regclass);


--
-- TOC entry 3861 (class 0 OID 27224)
-- Dependencies: 216
-- Data for Name: acompanhamento_legado; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.acompanhamento_legado (id_acompanhamento_legado, estado_atual, data_acompanhamento, id_pedido, id_usuario, estado_anterior) FROM stdin;
\.


--
-- TOC entry 3863 (class 0 OID 27233)
-- Dependencies: 218
-- Data for Name: agendamento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.agendamento (id, data_criacao, data_atualizacao, id_externo, observacao, horario_disponivel_id, solicitationrg_id, usuario_terceirizado_id) FROM stdin;
\.


--
-- TOC entry 3865 (class 0 OID 27240)
-- Dependencies: 220
-- Data for Name: autenticacao_documento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.autenticacao_documento (id, data_criacao, data_atualizacao, external_id, justificativa, status, tipo_documento) FROM stdin;
\.


--
-- TOC entry 3867 (class 0 OID 27247)
-- Dependencies: 222
-- Data for Name: captura_presencial; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.captura_presencial (id, data_criacao, data_atualizacao, ausente, captura_tipo, terc_id_externo, justificativa_captura, score, tamanho_arquivo, usuario_legado_id, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3869 (class 0 OID 27254)
-- Dependencies: 224
-- Data for Name: captura_presencial_comparacao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.captura_presencial_comparacao (id, data_criacao, data_atualizacao, ausente, captura_tipo, id_externo_pedido, numero_de_protocolo) FROM stdin;
\.


--
-- TOC entry 3871 (class 0 OID 27261)
-- Dependencies: 226
-- Data for Name: dados_anomalia; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.dados_anomalia (id, data_criacao, data_atualizacao, anomalia, dedo, mao, anthropometric_id) FROM stdin;
\.


--
-- TOC entry 3873 (class 0 OID 27268)
-- Dependencies: 228
-- Data for Name: dados_antropometricos; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.dados_antropometricos (id, data_criacao, data_atualizacao, cor_do_olho, tipo_do_olho, func_id_externo, cor_do_cabelo, tipo_de_cabelo, altura, observacao, cor_da_pele, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3875 (class 0 OID 27277)
-- Dependencies: 230
-- Data for Name: dados_biograficos_comparacao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.dados_biograficos_comparacao (id, data_criacao, data_atualizacao, outra_identidade, cert_livro, cert_circunscricao, cert_cidade, cert_cartorio, cert_folha, cert_matricula_certidao, cert_termo, cert_estado, cidade_de_nascimento, pais, cpf, data_de_nascimento, digito_rg, id_externo_pedido, filiacao_1, filiacao_2, filiacao_3, filiacao_4, genero_sexual, portatia_ministerial, nome, nacionalidade, numero_de_protocolo, rg, tipo_de_documento, estado_de_nascimento, portatia_ministerial_ano) FROM stdin;
\.


--
-- TOC entry 3877 (class 0 OID 27286)
-- Dependencies: 232
-- Data for Name: disponibilidade; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.disponibilidade (id, data_criacao, data_atualizacao, ativo, dia, hora_fim, id_externo, observacao, hora_inicio, local_agendamento_id) FROM stdin;
1	2020-07-29 08:00:00	2020-07-29 08:00:00	t	2020-11-12	15:00:00	a57ae308cb27cabc2d0aa85fa21841511531c64d647dffb18b541e23	Funcionamento normal	08:00:00	1
2	2020-07-29 08:00:00	2020-07-29 08:00:00	t	2020-11-13	17:00:00	1511531c64d64a57ae308cb27cabc2d0aa85fa21847dffb18b541e23	Funcionamento normal	10:00:00	1
3	2020-07-29 08:00:00	2020-07-29 08:00:00	t	2020-11-16	12:00:00	cabc2d0aa85fa2184151a57ae308cb271531c64d647dffb18b541e23	Funcionamento normal	08:00:00	1
\.


--
-- TOC entry 3879 (class 0 OID 27293)
-- Dependencies: 234
-- Data for Name: entrega_recebedor; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.entrega_recebedor (id, data_criacao, data_atualizacao, id_externo, recebedor, impressao_posto_id) FROM stdin;
\.


--
-- TOC entry 3881 (class 0 OID 27300)
-- Dependencies: 236
-- Data for Name: espelho_rg; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.espelho_rg (id, data_criacao, data_atualizacao, filiacao1, filiacao2, filiacao3, filiacao4, func_id_externo, nome, observacao, nome_social, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3883 (class 0 OID 27307)
-- Dependencies: 238
-- Data for Name: funcionario_legado; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.funcionario_legado (id_funcionario, cpf, id_externo, login, nome, tipo_funcionario) FROM stdin;
\.


--
-- TOC entry 3885 (class 0 OID 27316)
-- Dependencies: 240
-- Data for Name: historico_status; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.historico_status (id, data_criacao, data_atualizacao, data_do_status, status, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3887 (class 0 OID 27323)
-- Dependencies: 242
-- Data for Name: horario_disponivel; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.horario_disponivel (id, data_criacao, data_atualizacao, id_externo, quantidade, hora_disponivel, quantidade_total, disponibilidade_id) FROM stdin;
1	2020-07-29 08:00:00	2020-07-29 08:00:00	bc2d0aa85fa57a841511531c64d647dffb18b541e23e308cb27caa21	10	08:00:00	10	1
2	2020-07-29 08:00:00	2020-07-29 08:00:00	bd0aa85fa57a841511531cc264d1e23e308cb27caa21647dffb18b54	10	08:15:00	10	1
3	2020-07-29 08:00:00	2020-07-29 08:00:00	1531cc264d1e2dffb13e308cb27caa21647bd0aa85fa57a841518b54	20	14:00:00	20	1
4	2020-07-29 08:00:00	2020-07-29 08:00:00	1aa85fa57a84e308cb27c511531cc264d1e23bd0aa21647dffb18b54	20	14:30:00	20	1
5	2020-07-29 08:00:00	2020-07-29 08:00:00	1c64d647dffb18b541e23e308cbc2d0aa85fa57a84151153b27caa21	10	08:00:00	10	2
6	2020-07-29 08:00:00	2020-07-29 08:00:00	a57a841511531cc264bd0aa85fd1e23e308cb27caa21647dffb18b54	10	08:15:00	10	2
7	2020-07-29 08:00:00	2020-07-29 08:00:00	a85fa57a841511531cc2643e308cb27caa21647bd0ad1e2dffb18b54	20	11:00:00	20	2
8	2020-07-29 08:00:00	2020-07-29 08:00:00	1e23bd0aa85fa57a84e308cb1511531cc264d27caa21647dffb18b54	20	11:30:00	20	2
\.


--
-- TOC entry 3889 (class 0 OID 27330)
-- Dependencies: 244
-- Data for Name: impressao_posto; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.impressao_posto (id, data_criacao, data_atualizacao, id_externo, posto) FROM stdin;
\.


--
-- TOC entry 3891 (class 0 OID 27337)
-- Dependencies: 246
-- Data for Name: justificativas_analise; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.justificativas_analise (id, data_criacao, data_atualizacao, external_id, justificativa, status, tipo_documento) FROM stdin;
\.


--
-- TOC entry 3892 (class 0 OID 27343)
-- Dependencies: 247
-- Data for Name: legado_pedido_acompanhamento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_acompanhamento (id, estado_atual, data_acompanhamento, observacao, estado_anterior, id_usuario, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3893 (class 0 OID 27348)
-- Dependencies: 248
-- Data for Name: legado_pedido_atendimento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_atendimento (id, data_final, operacao, data_atendimento, etapa, id_usuario, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3895 (class 0 OID 27354)
-- Dependencies: 250
-- Data for Name: legado_pedido_dados_impressao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_dados_impressao (id, nome_social_abreviado, filiacao_1_adicional_abreviada, filiacao_2_adicional_abreviada, data_validade, pai_abreviado, mae_abreviado, observacao, maior_65_anos, nome_abreviado, tipo_assinatura, documento_origem, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3897 (class 0 OID 27363)
-- Dependencies: 252
-- Data for Name: legado_pedido_impressao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_impressao (id, data_impressao, espelho, tipo_operacao, impressao_lote_id, impressao_posto_id, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3898 (class 0 OID 27369)
-- Dependencies: 253
-- Data for Name: legado_pedido_pagamento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_pagamento (id, ativo, dt_nascimento, dt_pagto, dt_pagto_sefaz, data_pg, tipo_isencao, nome, nosso_numero, rg, status, tipo, id_usuario, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3899 (class 0 OID 27374)
-- Dependencies: 254
-- Data for Name: legado_pedido_rg_excluido; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.legado_pedido_rg_excluido (id, data_exclusao, observacao, id_pedido, rg, id_usuario) FROM stdin;
\.


--
-- TOC entry 3901 (class 0 OID 27380)
-- Dependencies: 256
-- Data for Name: local_agendamento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.local_agendamento (id, data_criacao, data_atualizacao, endereco, cidade, habilitado, id_externo, nome_local, usuario_coord_id) FROM stdin;
1	2020-07-29 08:00:00	2020-07-29 08:00:00	Rua Demétrio de Meneses, 3750, Antônio Bezerra	Fortaleza	\N	bc2df41511531c64d6a57ae308cb27caa21847dffb0aa8518b541e23	Vapt Vupt Antônio Bezerra	2
2	2020-07-29 08:00:00	2020-07-29 08:00:00	Rua My Localtion, 50, Meireles	Fortaleza	\N	aa21847dffb0aa851bc2df41511531c64d6a57ae308cb27c8b541e23	Vapt Vupt Meireles	2
3	2020-07-29 08:00:00	2020-07-29 08:00:00	Avenida X, 1713, Praia do Futuro	Fortaleza	\N	64d6a57ae308cb27caa218bc2df41511531c47dffb0aa8518b541e23	Vapt Vupt Praia do Futuro	2
\.


--
-- TOC entry 3902 (class 0 OID 27386)
-- Dependencies: 257
-- Data for Name: local_agendamento_terceirizado; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.local_agendamento_terceirizado (local_agendamento_id, usuario_terceirizado_id) FROM stdin;
1	1
2	1
3	1
1	3
3	3
\.


--
-- TOC entry 3904 (class 0 OID 27392)
-- Dependencies: 259
-- Data for Name: local_disponibilidade; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.local_disponibilidade (id, data_criacao, data_atualizacao, data_fim, id_externo, vaga, vaga_total, data_inicio, local_agendamento_id) FROM stdin;
1	2022-01-07 16:38:00	2022-01-17 14:33:17.351317	2022-01-15	48106be20301cb1f047989c28bbc23c5d34d80a4c90001fb141b2a51	100	100	2022-01-09	1
2	2022-01-07 16:38:00	2022-01-18 16:25:30.379359	2022-01-22	607b69308f1fc1ae0b468a079becdc8a1050bd0d75bc54622c85b090	100	100	2022-01-16	2
3	2022-01-07 16:38:00	2022-01-18 16:25:50.323218	2022-01-22	feeb1f6c913a1abeb37117b479fdf437f3a99ac48055bd700f998675	100	100	2022-01-16	3
4	2022-01-07 16:38:00	2022-01-18 16:25:50.321324	2022-01-22	1c5b1989aa0aa54516535d117b4e58a97c478dda5d225a7253e05475	100	100	2022-01-16	1
\.


--
-- TOC entry 3906 (class 0 OID 27399)
-- Dependencies: 261
-- Data for Name: localizacao_cidade; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.localizacao_cidade (id, data_criacao, data_atualizacao, id_ibge, nome, estado_id) FROM stdin;
1	2020-10-21 10:10:16.312683	\N	2100055	Açailândia	8
2	2020-10-21 10:10:16.314101	\N	2100105	Afonso Cunha	8
3	2020-10-21 10:10:16.315118	\N	2100154	Água Doce do Maranhão	8
4	2020-10-21 10:10:16.316049	\N	2100204	Alcântara	8
5	2020-10-21 10:10:16.316822	\N	2100303	Aldeias Altas	8
6	2020-10-21 10:10:16.317529	\N	2100402	Altamira do Maranhão	8
7	2020-10-21 10:10:16.318201	\N	2100436	Alto Alegre do Maranhão	8
8	2020-10-21 10:10:16.318932	\N	2100477	Alto Alegre do Pindaré	8
9	2020-10-21 10:10:16.319553	\N	2100501	Alto Parnaíba	8
10	2020-10-21 10:10:16.320431	\N	2100550	Amapá do Maranhão	8
11	2020-10-21 10:10:16.320857	\N	2100600	Amarante do Maranhão	8
12	2020-10-21 10:10:16.321396	\N	2100709	Anajatuba	8
13	2020-10-21 10:10:16.32195	\N	2100808	Anapurus	8
14	2020-10-21 10:10:16.322657	\N	2100832	Apicum-Açu	8
15	2020-10-21 10:10:16.323339	\N	2100873	Araguanã	8
16	2020-10-21 10:10:16.323995	\N	2100907	Araioses	8
17	2020-10-21 10:10:16.324703	\N	2100956	Arame	8
18	2020-10-21 10:10:16.32528	\N	2101004	Arari	8
19	2020-10-21 10:10:16.32615	\N	2101103	Axixá	8
20	2020-10-21 10:10:16.326857	\N	2101202	Bacabal	8
21	2020-10-21 10:10:16.453976	\N	2111953	Sucupira do Riachão	8
22	2020-10-21 10:10:16.454511	\N	2112001	Tasso Fragoso	8
23	2020-10-21 10:10:16.455002	\N	2112100	Timbiras	8
24	2020-10-21 10:10:16.455602	\N	2112209	Timon	8
25	2020-10-21 10:10:16.456154	\N	2112233	Trizidela do Vale	8
26	2020-10-21 10:10:16.456703	\N	2112274	Tufilândia	8
27	2020-10-21 10:10:16.45724	\N	2112308	Tuntum	8
28	2020-10-21 10:10:16.457822	\N	2112407	Turiaçu	8
29	2020-10-21 10:10:16.458282	\N	2112456	Turilândia	8
30	2020-10-21 10:10:16.458745	\N	2112506	Tutóia	8
31	2020-10-21 10:10:16.459394	\N	2112605	Urbano Santos	8
32	2020-10-21 10:10:16.459856	\N	2112704	Vargem Grande	8
33	2020-10-21 10:10:16.460275	\N	2112803	Viana	8
34	2020-10-21 10:10:16.460673	\N	2112852	Vila Nova dos Martírios	8
35	2020-10-21 10:10:16.461069	\N	2112902	Vitória do Mearim	8
36	2020-10-21 10:10:16.461484	\N	2113009	Vitorino Freire	8
37	2020-10-21 10:10:16.461901	\N	2114007	Zé Doca	8
38	2020-10-21 10:10:17.231728	\N	2200053	Acauã	9
39	2020-10-21 10:10:17.232942	\N	2200103	Agricolândia	9
40	2020-10-21 10:10:17.233805	\N	2200202	Água Branca	9
41	2020-10-21 10:10:17.234545	\N	2200251	Alagoinha do Piauí	9
42	2020-10-21 10:10:17.235238	\N	2200277	Alegrete do Piauí	9
43	2020-10-21 10:10:17.235726	\N	2200301	Alto Longá	9
44	2020-10-21 10:10:17.236163	\N	2200400	Altos	9
45	2020-10-21 10:10:17.236653	\N	2200459	Alvorada do Gurguéia	9
46	2020-10-21 10:10:17.237025	\N	2200509	Amarante	9
47	2020-10-21 10:10:17.237401	\N	2200608	Angical do Piauí	9
48	2020-10-21 10:10:17.237763	\N	2200707	Anísio de Abreu	9
49	2020-10-21 10:10:17.238219	\N	2200806	Antônio Almeida	9
50	2020-10-21 10:10:17.239239	\N	2200905	Aroazes	9
51	2020-10-21 10:10:17.240025	\N	2200954	Aroeiras do Itaim	9
52	2020-10-21 10:10:17.240645	\N	2201002	Arraial	9
53	2020-10-21 10:10:17.241188	\N	2201051	Assunção do Piauí	9
54	2020-10-21 10:10:17.241637	\N	2201101	Avelino Lopes	9
55	2020-10-21 10:10:17.242918	\N	2201150	Baixa Grande do Ribeiro	9
56	2020-10-21 10:10:17.243517	\N	2201176	Barra D'Alcântara	9
57	2020-10-21 10:10:17.244165	\N	2201200	Barras	9
58	2020-10-21 10:10:17.244569	\N	2201309	Barreiras do Piauí	9
59	2020-10-21 10:10:17.244935	\N	2201408	Barro Duro	9
60	2020-10-21 10:10:17.245258	\N	2201507	Batalha	9
61	2020-10-21 10:10:17.245587	\N	2201556	Bela Vista do Piauí	9
62	2020-10-21 10:10:17.245913	\N	2201572	Belém do Piauí	9
63	2020-10-21 10:10:17.246275	\N	2201606	Beneditinos	9
64	2020-10-21 10:10:17.246721	\N	2201705	Bertolínia	9
65	2020-10-21 10:10:17.247043	\N	2201739	Betânia do Piauí	9
66	2020-10-21 10:10:17.24737	\N	2201770	Boa Hora	9
67	2020-10-21 10:10:17.247847	\N	2201804	Bocaina	9
68	2020-10-21 10:10:17.24822	\N	2201903	Bom Jesus	9
69	2020-10-21 10:10:17.248731	\N	2201919	Bom Princípio do Piauí	9
70	2020-10-21 10:10:17.249161	\N	2201929	Bonfim do Piauí	9
71	2020-10-21 10:10:17.249846	\N	2201945	Boqueirão do Piauí	9
72	2020-10-21 10:10:17.250289	\N	2201960	Brasileira	9
73	2020-10-21 10:10:17.250739	\N	2201988	Brejo do Piauí	9
74	2020-10-21 10:10:17.251157	\N	2202000	Buriti dos Lopes	9
75	2020-10-21 10:10:17.251544	\N	2202026	Buriti dos Montes	9
76	2020-10-21 10:10:17.251855	\N	2202059	Cabeceiras do Piauí	9
77	2020-10-21 10:10:17.252169	\N	2202075	Cajazeiras do Piauí	9
78	2020-10-21 10:10:17.252566	\N	2202083	Cajueiro da Praia	9
79	2020-10-21 10:10:17.25291	\N	2202091	Caldeirão Grande do Piauí	9
80	2020-10-21 10:10:17.25328	\N	2202109	Campinas do Piauí	9
81	2020-10-21 10:10:17.253649	\N	2202117	Campo Alegre do Fidalgo	9
82	2020-10-21 10:10:17.253982	\N	2202133	Campo Grande do Piauí	9
83	2020-10-21 10:10:17.254332	\N	2202174	Campo Largo do Piauí	9
84	2020-10-21 10:10:17.254694	\N	2202208	Campo Maior	9
85	2020-10-21 10:10:17.25508	\N	2202251	Canavieira	9
86	2020-10-21 10:10:17.255658	\N	2202307	Canto do Buriti	9
87	2020-10-21 10:10:17.256136	\N	2202406	Capitão de Campos	9
88	2020-10-21 10:10:17.256637	\N	2202455	Capitão Gervásio Oliveira	9
89	2020-10-21 10:10:17.257104	\N	2202505	Caracol	9
90	2020-10-21 10:10:17.257486	\N	2202539	Caraúbas do Piauí	9
91	2020-10-21 10:10:17.257938	\N	2202554	Caridade do Piauí	9
92	2020-10-21 10:10:17.25841	\N	2202604	Castelo do Piauí	9
93	2020-10-21 10:10:17.258865	\N	2202653	Caxingó	9
94	2020-10-21 10:10:17.259281	\N	2202703	Cocal	9
95	2020-10-21 10:10:17.259872	\N	2202711	Cocal de Telha	9
96	2020-10-21 10:10:17.260699	\N	2202729	Cocal dos Alves	9
97	2020-10-21 10:10:17.261361	\N	2202737	Coivaras	9
98	2020-10-21 10:10:17.261977	\N	2202752	Colônia do Gurguéia	9
99	2020-10-21 10:10:17.262589	\N	2202778	Colônia do Piauí	9
100	2020-10-21 10:10:17.263024	\N	2202802	Conceição do Canindé	9
101	2020-10-21 10:10:17.340374	\N	2210938	Sussuapara	9
102	2020-10-21 10:10:17.340799	\N	2210953	Tamboril do Piauí	9
103	2020-10-21 10:10:17.341177	\N	2210979	Tanque do Piauí	9
104	2020-10-21 10:10:17.341563	\N	2211001	Teresina	9
105	2020-10-21 10:10:17.341949	\N	2211100	União	9
106	2020-10-21 10:10:17.342424	\N	2211209	Uruçuí	9
107	2020-10-21 10:10:17.342844	\N	2211308	Valença do Piauí	9
108	2020-10-21 10:10:17.343275	\N	2211357	Várzea Branca	9
109	2020-10-21 10:10:17.343783	\N	2211407	Várzea Grande	9
110	2020-10-21 10:10:17.3442	\N	2211506	Vera Mendes	9
111	2020-10-21 10:10:17.344582	\N	2211605	Vila Nova do Piauí	9
112	2020-10-21 10:10:17.344991	\N	2211704	Wall Ferraz	9
113	2020-10-21 10:10:18.097878	\N	2300101	Abaiara	10
114	2020-10-21 10:10:18.098853	\N	2300150	Acarape	10
115	2020-10-21 10:10:18.099314	\N	2300200	Acaraú	10
116	2020-10-21 10:10:18.099765	\N	2300309	Acopiara	10
117	2020-10-21 10:10:18.100158	\N	2300408	Aiuaba	10
118	2020-10-21 10:10:18.100511	\N	2300507	Alcântaras	10
119	2020-10-21 10:10:18.100848	\N	2300606	Altaneira	10
120	2020-10-21 10:10:18.101248	\N	2300705	Alto Santo	10
121	2020-10-21 10:10:18.101637	\N	2300754	Amontada	10
122	2020-10-21 10:10:18.101991	\N	2300804	Antonina do Norte	10
123	2020-10-21 10:10:18.102331	\N	2300903	Apuiarés	10
124	2020-10-21 10:10:18.102646	\N	2301000	Aquiraz	10
125	2020-10-21 10:10:18.102951	\N	2301109	Aracati	10
126	2020-10-21 10:10:18.103246	\N	2301208	Aracoiaba	10
127	2020-10-21 10:10:18.103647	\N	2301257	Ararendá	10
128	2020-10-21 10:10:18.103939	\N	2301307	Araripe	10
129	2020-10-21 10:10:18.104329	\N	2301406	Aratuba	10
130	2020-10-21 10:10:18.1047	\N	2301505	Arneiroz	10
131	2020-10-21 10:10:18.105732	\N	2301604	Assaré	10
132	2020-10-21 10:10:18.106441	\N	2301703	Aurora	10
133	2020-10-21 10:10:18.107936	\N	2301802	Baixio	10
134	2020-10-21 10:10:18.108733	\N	2301851	Banabuiú	10
135	2020-10-21 10:10:18.109265	\N	2301901	Barbalha	10
136	2020-10-21 10:10:18.109687	\N	2301950	Barreira	10
137	2020-10-21 10:10:18.110309	\N	2302008	Barro	10
138	2020-10-21 10:10:18.110873	\N	2302057	Barroquinha	10
139	2020-10-21 10:10:18.111443	\N	2302107	Baturité	10
140	2020-10-21 10:10:18.111963	\N	2302206	Beberibe	10
141	2020-10-21 10:10:18.112499	\N	2302305	Bela Cruz	10
142	2020-10-21 10:10:18.113104	\N	2302404	Boa Viagem	10
143	2020-10-21 10:10:18.113725	\N	2302503	Brejo Santo	10
144	2020-10-21 10:10:18.114269	\N	2302602	Camocim	10
145	2020-10-21 10:10:18.114916	\N	2302701	Campos Sales	10
146	2020-10-21 10:10:18.115436	\N	2302800	Canindé	10
147	2020-10-21 10:10:18.115794	\N	2302909	Capistrano	10
148	2020-10-21 10:10:18.116094	\N	2303006	Caridade	10
149	2020-10-21 10:10:18.116372	\N	2303105	Cariré	10
150	2020-10-21 10:10:18.116654	\N	2303204	Caririaçu	10
151	2020-10-21 10:10:18.116951	\N	2303303	Cariús	10
152	2020-10-21 10:10:18.117256	\N	2303402	Carnaubal	10
153	2020-10-21 10:10:18.117653	\N	2303501	Cascavel	10
154	2020-10-21 10:10:18.117944	\N	2303600	Catarina	10
155	2020-10-21 10:10:18.11825	\N	2303659	Catunda	10
156	2020-10-21 10:10:18.118542	\N	2303709	Caucaia	10
157	2020-10-21 10:10:18.118852	\N	2303808	Cedro	10
158	2020-10-21 10:10:18.119145	\N	2303907	Chaval	10
159	2020-10-21 10:10:18.119431	\N	2303931	Choró	10
160	2020-10-21 10:10:18.119766	\N	2303956	Chorozinho	10
161	2020-10-21 10:10:18.120118	\N	2304004	Coreaú	10
162	2020-10-21 10:10:18.120509	\N	2304103	Crateús	10
163	2020-10-21 10:10:18.120832	\N	2304202	Crato	10
164	2020-10-21 10:10:18.12116	\N	2304236	Croatá	10
165	2020-10-21 10:10:18.121516	\N	2304251	Cruz	10
166	2020-10-21 10:10:18.123948	\N	2304269	Deputado Irapuan Pinheiro	10
167	2020-10-21 10:10:18.124617	\N	2304277	Ereré	10
168	2020-10-21 10:10:18.12509	\N	2304285	Eusébio	10
169	2020-10-21 10:10:18.125481	\N	2304301	Farias Brito	10
170	2020-10-21 10:10:18.126612	\N	2304350	Forquilha	10
171	2020-10-21 10:10:18.12721	\N	2304400	Fortaleza	10
172	2020-10-21 10:10:18.127698	\N	2304459	Fortim	10
173	2020-10-21 10:10:18.128128	\N	2304509	Frecheirinha	10
174	2020-10-21 10:10:18.128637	\N	2304608	General Sampaio	10
175	2020-10-21 10:10:18.129212	\N	2304657	Graça	10
176	2020-10-21 10:10:18.129827	\N	2304707	Granja	10
177	2020-10-21 10:10:18.130463	\N	2304806	Granjeiro	10
178	2020-10-21 10:10:18.131029	\N	2304905	Groaíras	10
179	2020-10-21 10:10:18.131361	\N	2304954	Guaiúba	10
180	2020-10-21 10:10:18.131676	\N	2305001	Guaraciaba do Norte	10
181	2020-10-21 10:10:18.131968	\N	2305100	Guaramiranga	10
182	2020-10-21 10:10:18.132261	\N	2305209	Hidrolândia	10
183	2020-10-21 10:10:18.132677	\N	2305233	Horizonte	10
184	2020-10-21 10:10:18.133039	\N	2305266	Ibaretama	10
185	2020-10-21 10:10:18.133372	\N	2305308	Ibiapina	10
186	2020-10-21 10:10:18.133758	\N	2305332	Ibicuitinga	10
187	2020-10-21 10:10:18.134045	\N	2305357	Icapuí	10
188	2020-10-21 10:10:18.134343	\N	2305407	Icó	10
189	2020-10-21 10:10:18.134644	\N	2305506	Iguatu	10
190	2020-10-21 10:10:18.134933	\N	2305605	Independência	10
191	2020-10-21 10:10:18.135233	\N	2305654	Ipaporanga	10
192	2020-10-21 10:10:18.135522	\N	2305704	Ipaumirim	10
193	2020-10-21 10:10:18.135879	\N	2305803	Ipu	10
194	2020-10-21 10:10:18.136194	\N	2305902	Ipueiras	10
195	2020-10-21 10:10:18.136513	\N	2306009	Iracema	10
196	2020-10-21 10:10:18.136828	\N	2306108	Irauçuba	10
197	2020-10-21 10:10:18.137163	\N	2306207	Itaiçaba	10
198	2020-10-21 10:10:18.137454	\N	2306256	Itaitinga	10
199	2020-10-21 10:10:18.137739	\N	2306306	Itapajé	10
200	2020-10-21 10:10:18.138714	\N	2306405	Itapipoca	10
201	2020-10-21 10:10:18.13974	\N	2306504	Itapiúna	10
202	2020-10-21 10:10:18.140517	\N	2306553	Itarema	10
203	2020-10-21 10:10:18.140944	\N	2306603	Itatira	10
204	2020-10-21 10:10:18.141464	\N	2306702	Jaguaretama	10
205	2020-10-21 10:10:18.142274	\N	2306801	Jaguaribara	10
206	2020-10-21 10:10:18.142817	\N	2306900	Jaguaribe	10
207	2020-10-21 10:10:18.143188	\N	2307007	Jaguaruana	10
208	2020-10-21 10:10:18.143822	\N	2307106	Jardim	10
209	2020-10-21 10:10:18.144285	\N	2307205	Jati	10
210	2020-10-21 10:10:18.144695	\N	2307254	Jijoca de Jericoacoara	10
211	2020-10-21 10:10:18.145214	\N	2307304	Juazeiro do Norte	10
212	2020-10-21 10:10:18.145547	\N	2307403	Jucás	10
213	2020-10-21 10:10:18.145871	\N	2307502	Lavras da Mangabeira	10
214	2020-10-21 10:10:18.14617	\N	2307601	Limoeiro do Norte	10
215	2020-10-21 10:10:18.146489	\N	2307635	Madalena	10
216	2020-10-21 10:10:18.146778	\N	2307650	Maracanaú	10
217	2020-10-21 10:10:18.147117	\N	2307700	Maranguape	10
218	2020-10-21 10:10:18.147473	\N	2307809	Marco	10
219	2020-10-21 10:10:18.147847	\N	2307908	Martinópole	10
220	2020-10-21 10:10:18.148228	\N	2308005	Massapê	10
221	2020-10-21 10:10:18.148578	\N	2308104	Mauriti	10
222	2020-10-21 10:10:18.148987	\N	2308203	Meruoca	10
223	2020-10-21 10:10:18.14933	\N	2308302	Milagres	10
224	2020-10-21 10:10:18.149768	\N	2308351	Milhã	10
225	2020-10-21 10:10:18.150151	\N	2308377	Miraíma	10
226	2020-10-21 10:10:18.150534	\N	2308401	Missão Velha	10
227	2020-10-21 10:10:18.150981	\N	2308500	Mombaça	10
228	2020-10-21 10:10:18.151306	\N	2308609	Monsenhor Tabosa	10
229	2020-10-21 10:10:18.151686	\N	2308708	Morada Nova	10
230	2020-10-21 10:10:18.151987	\N	2308807	Moraújo	10
231	2020-10-21 10:10:18.152274	\N	2308906	Morrinhos	10
232	2020-10-21 10:10:18.152558	\N	2309003	Mucambo	10
233	2020-10-21 10:10:18.152863	\N	2309102	Mulungu	10
234	2020-10-21 10:10:18.153143	\N	2309201	Nova Olinda	10
235	2020-10-21 10:10:18.153438	\N	2309300	Nova Russas	10
236	2020-10-21 10:10:18.15383	\N	2309409	Novo Oriente	10
237	2020-10-21 10:10:18.15417	\N	2309458	Ocara	10
238	2020-10-21 10:10:18.154526	\N	2309508	Orós	10
239	2020-10-21 10:10:18.155542	\N	2309607	Pacajus	10
240	2020-10-21 10:10:18.156496	\N	2309706	Pacatuba	10
241	2020-10-21 10:10:18.157098	\N	2309805	Pacoti	10
242	2020-10-21 10:10:18.157491	\N	2309904	Pacujá	10
243	2020-10-21 10:10:18.15784	\N	2310001	Palhano	10
244	2020-10-21 10:10:18.158192	\N	2310100	Palmácia	10
245	2020-10-21 10:10:18.158548	\N	2310209	Paracuru	10
246	2020-10-21 10:10:18.159298	\N	2310258	Paraipaba	10
247	2020-10-21 10:10:18.159884	\N	2310308	Parambu	10
248	2020-10-21 10:10:18.160362	\N	2310407	Paramoti	10
249	2020-10-21 10:10:18.160856	\N	2310506	Pedra Branca	10
250	2020-10-21 10:10:18.161251	\N	2310605	Penaforte	10
251	2020-10-21 10:10:18.161595	\N	2310704	Pentecoste	10
252	2020-10-21 10:10:18.161925	\N	2310803	Pereiro	10
253	2020-10-21 10:10:18.162257	\N	2310852	Pindoretama	10
254	2020-10-21 10:10:18.162587	\N	2310902	Piquet Carneiro	10
255	2020-10-21 10:10:18.162939	\N	2310951	Pires Ferreira	10
256	2020-10-21 10:10:18.163257	\N	2311009	Poranga	10
257	2020-10-21 10:10:18.163562	\N	2311108	Porteiras	10
258	2020-10-21 10:10:18.163862	\N	2311207	Potengi	10
259	2020-10-21 10:10:18.164229	\N	2311231	Potiretama	10
260	2020-10-21 10:10:18.164573	\N	2311264	Quiterianópolis	10
261	2020-10-21 10:10:18.164967	\N	2311306	Quixadá	10
262	2020-10-21 10:10:18.165324	\N	2311355	Quixelô	10
263	2020-10-21 10:10:18.165646	\N	2311405	Quixeramobim	10
264	2020-10-21 10:10:18.165978	\N	2311504	Quixeré	10
265	2020-10-21 10:10:18.16632	\N	2311603	Redenção	10
266	2020-10-21 10:10:18.166686	\N	2311702	Reriutaba	10
267	2020-10-21 10:10:18.168041	\N	2311801	Russas	10
268	2020-10-21 10:10:18.168845	\N	2311900	Saboeiro	10
269	2020-10-21 10:10:18.169321	\N	2311959	Salitre	10
270	2020-10-21 10:10:18.169754	\N	2312007	Santana do Acaraú	10
271	2020-10-21 10:10:18.170216	\N	2312106	Santana do Cariri	10
272	2020-10-21 10:10:18.170745	\N	2312205	Santa Quitéria	10
273	2020-10-21 10:10:18.171168	\N	2312304	São Benedito	10
274	2020-10-21 10:10:18.171996	\N	2312403	São Gonçalo do Amarante	10
275	2020-10-21 10:10:18.172948	\N	2312502	São João do Jaguaribe	10
276	2020-10-21 10:10:18.173721	\N	2312601	São Luís do Curu	10
277	2020-10-21 10:10:18.17446	\N	2312700	Senador Pompeu	10
278	2020-10-21 10:10:18.177458	\N	2312809	Senador Sá	10
279	2020-10-21 10:10:18.178476	\N	2312908	Sobral	10
280	2020-10-21 10:10:18.179104	\N	2313005	Solonópole	10
281	2020-10-21 10:10:18.179619	\N	2313104	Tabuleiro do Norte	10
282	2020-10-21 10:10:18.180151	\N	2313203	Tamboril	10
283	2020-10-21 10:10:18.180614	\N	2313252	Tarrafas	10
284	2020-10-21 10:10:18.181105	\N	2313302	Tauá	10
285	2020-10-21 10:10:18.181592	\N	2313351	Tejuçuoca	10
286	2020-10-21 10:10:18.182152	\N	2313401	Tianguá	10
287	2020-10-21 10:10:18.182658	\N	2313500	Trairi	10
288	2020-10-21 10:10:18.183097	\N	2313559	Tururu	10
289	2020-10-21 10:10:18.183534	\N	2313609	Ubajara	10
290	2020-10-21 10:10:18.183941	\N	2313708	Umari	10
291	2020-10-21 10:10:18.184328	\N	2313757	Umirim	10
292	2020-10-21 10:10:18.184718	\N	2313807	Uruburetama	10
293	2020-10-21 10:10:18.185092	\N	2313906	Uruoca	10
294	2020-10-21 10:10:18.185515	\N	2313955	Varjota	10
295	2020-10-21 10:10:18.185834	\N	2314003	Várzea Alegre	10
296	2020-10-21 10:10:18.186148	\N	2314102	Viçosa do Ceará	10
\.


--
-- TOC entry 3908 (class 0 OID 27406)
-- Dependencies: 263
-- Data for Name: localizacao_estado; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.localizacao_estado (id, data_criacao, data_atualizacao, sigla, id_ibge, nome) FROM stdin;
8	2020-10-21 10:10:15.780637	\N	MA	21	Maranhão
9	2020-10-21 10:10:16.480712	\N	PI	22	Piauí
10	2020-10-21 10:10:17.373296	\N	CE	23	Ceará
\.


--
-- TOC entry 3910 (class 0 OID 27413)
-- Dependencies: 265
-- Data for Name: lote; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.lote (id, data_criacao, data_atualizacao, numero_lote, id_externo, margem_esquerda, lote_status, margem_superior, impressao_posto_id) FROM stdin;
\.


--
-- TOC entry 3912 (class 0 OID 27422)
-- Dependencies: 267
-- Data for Name: observacao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.observacao (id, data_criacao, data_atualizacao, perito_id_externo, texto, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3914 (class 0 OID 27431)
-- Dependencies: 269
-- Data for Name: pedido_anterior_associado; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_anterior_associado (id, data_criacao, data_atualizacao, id_externo_pedido, func_id_externo, numero_pedido) FROM stdin;
\.


--
-- TOC entry 3916 (class 0 OID 27438)
-- Dependencies: 271
-- Data for Name: pedido_dados_pessoais; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_dados_pessoais (id, data_criacao, data_atualizacao, cidade_de_nascimento, pais_de_nascimento, data_de_nascimento, escolaridade, email, filiacao1, filiacao2, filiacao3, filiacao4, genero, estado_civil, nome, nacionalidade, notifica_email, notifica_sms, id_telefone, nome_social, uniao_estavel, estado_de_nascimento, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3918 (class 0 OID 27447)
-- Dependencies: 273
-- Data for Name: pedido_endereco; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_endereco (id, data_criacao, data_atualizacao, cidade, complemento, bairro, numero, estado, rua, codigo_postal, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3920 (class 0 OID 27454)
-- Dependencies: 275
-- Data for Name: pedido_limite_utilizacao; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_limite_utilizacao (id, data_criacao, data_atualizacao, cancelamento_contagem, perda_agendamento_contagem, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3922 (class 0 OID 27461)
-- Dependencies: 277
-- Data for Name: pedido_rg; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_rg (id, data_criacao, data_atualizacao, criacao_offline, data_emissao, data_do_status, autenticacao_de_documento, emergencial, id_externo, disponibilidade_id_externo, local_id_externo, usuario_qualidade_id_externo, usuario_id_externo, func_id_externo, registro_geral, migracao, documentos_extras, captura_presencial, numero_de_protocolo, numero_do_pedido, rg_antigo, tipo_pedido, pedido_status, proximo_passo_da_tela, boleto_pago, tipo_usuario, lote_id, impressao_posto_id, entrega_recebedor_id) FROM stdin;
1	2023-09-29 01:38:00	\N	t	\N	\N	\N	\N	b7bdf6fb9dc2df4249465c1fd023171fc3b0474ef8af46114f3fe0dd	\N	\N	\N	\N	\N	\N	\N	\N	\N	string	36820985707	\N	6	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3924 (class 0 OID 27470)
-- Dependencies: 279
-- Data for Name: pedido_rg_condicao_saude; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_rg_condicao_saude (id, data_criacao, data_atualizacao, transtorno_espectro_autista, doenca_auditiva, doenca_mental, ostomia, deficiencia_fisica, doenca_visual, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3926 (class 0 OID 27477)
-- Dependencies: 281
-- Data for Name: pedido_rg_documentos; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.pedido_rg_documentos (id, data_criacao, data_atualizacao, tipo_sanguineo, cert_livro, cert_circunscricao, cert_cidade, cert_data_emissao, cert_cartorio, cert_folha, cert_matricula_certidao, cert_uf, cert_termo, cert_tipo, cnh, cns, cpf, dni, identidade_profissional_1, identidade_profissional_2, identidade_profissional_3, certificado_militar, nis, numero_ctps, pasep, pis, identidade_sec_orgao, identidade_sec_num, identidade_sec_uf, serie_ctps, uf_ctps, titulo_de_eleitor, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3928 (class 0 OID 27486)
-- Dependencies: 283
-- Data for Name: requerimento; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.requerimento (id, data_criacao, data_atualizacao, perito_id_externo, id_externo, observacao, status, tipo, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3930 (class 0 OID 27495)
-- Dependencies: 285
-- Data for Name: rg_representante_legal; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.rg_representante_legal (id, data_criacao, data_atualizacao, documento_numero, documento_parte, documento_uf, nome, documento_responsabilidade_disp, assina, origem_do_form, tipo, tipo_de_documento, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3932 (class 0 OID 27502)
-- Dependencies: 287
-- Data for Name: usuario_sistema; Type: TABLE DATA; Schema: emissaorg; Owner: postgres
--

COPY emissaorg.usuario_sistema (papel, id, data_criacao, data_atualizacao, id_externo, nome, matricula) FROM stdin;
1	1	2020-10-26 08:00:00	2020-10-26 08:00:00	08cf41511531c518b27caa21847dffb0bc2daa8b541e2364d6a57ae3	\N	\N
7	2	2020-10-30 08:00:00	2020-10-30 08:00:00	7caa21847dffb2364d6a5c2daa8b541e518b20b7ae308cf41511531c	\N	\N
1	3	2020-10-26 08:00:00	2020-10-26 08:00:00	6698a7f74a107930ed1ba32756800234180f8f727a0fac4bc32f3149	\N	\N
\.


--
-- TOC entry 3937 (class 0 OID 27550)
-- Dependencies: 292
-- Data for Name: agendamento_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.agendamento_historico (id, rev, revtype, data_criacao, data_atualizacao, id_externo, observacao, horario_disponivel_id, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3938 (class 0 OID 27555)
-- Dependencies: 293
-- Data for Name: autenticacao_documento_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.autenticacao_documento_historico (id, rev, revtype, data_criacao, data_atualizacao, external_id, justificativa, status, tipo_documento) FROM stdin;
\.


--
-- TOC entry 3939 (class 0 OID 27560)
-- Dependencies: 294
-- Data for Name: captura_presencial_comparacao_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.captura_presencial_comparacao_historico (id, rev, revtype, data_criacao, data_atualizacao, ausente, captura_tipo, id_externo_pedido, numero_de_protocolo) FROM stdin;
\.


--
-- TOC entry 3940 (class 0 OID 27565)
-- Dependencies: 295
-- Data for Name: captura_presencial_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.captura_presencial_historico (rev, data_criacao, terc_id_externo, id, data_atualizacao, solicitationrg_id, revtype, ausente, captura_tipo, justificativa_captura, score, tamanho_arquivo, usuario_legado_id) FROM stdin;
\.


--
-- TOC entry 3941 (class 0 OID 27570)
-- Dependencies: 296
-- Data for Name: dados_anomalia_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.dados_anomalia_historico (id, rev, revtype, data_criacao, data_atualizacao, anomalia, dedo, mao, anthropometric_id) FROM stdin;
\.


--
-- TOC entry 3942 (class 0 OID 27575)
-- Dependencies: 297
-- Data for Name: dados_antropometricos_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.dados_antropometricos_historico (id, rev, revtype, data_criacao, data_atualizacao, cor_do_olho, tipo_do_olho, func_id_externo, cor_do_cabelo, tipo_de_cabelo, altura, observacao, cor_da_pele, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3943 (class 0 OID 27582)
-- Dependencies: 298
-- Data for Name: dados_biograficos_comparacao_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.dados_biograficos_comparacao_historico (id, rev, revtype, data_criacao, data_atualizacao, outra_identidade, cert_livro, cert_circunscricao, cert_cidade, cert_cartorio, cert_folha, cert_matricula_certidao, cert_termo, cert_estado, cidade_de_nascimento, pais, cpf, data_de_nascimento, digito_rg, id_externo_pedido, filiacao_1, filiacao_2, filiacao_3, filiacao_4, genero_sexual, portatia_ministerial, nome, nacionalidade, numero_de_protocolo, rg, tipo_de_documento, estado_de_nascimento, portatia_ministerial_ano) FROM stdin;
\.


--
-- TOC entry 3944 (class 0 OID 27589)
-- Dependencies: 299
-- Data for Name: disponibilidade_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.disponibilidade_historico (id, rev, revtype, data_criacao, data_atualizacao, ativo, dia, hora_fim, id_externo, observacao, hora_inicio, local_agendamento_id) FROM stdin;
\.


--
-- TOC entry 3945 (class 0 OID 27594)
-- Dependencies: 300
-- Data for Name: espelho_rg_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.espelho_rg_historico (id, rev, revtype, data_criacao, data_atualizacao, filiacao1, filiacao2, filiacao3, filiacao4, func_id_externo, nome, observacao, nome_social, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3946 (class 0 OID 27599)
-- Dependencies: 301
-- Data for Name: horario_disponivel_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.horario_disponivel_historico (id, rev, revtype, data_criacao, data_atualizacao, id_externo, quantidade, hora_disponivel, quantidade_total, disponibilidade_id) FROM stdin;
\.


--
-- TOC entry 3947 (class 0 OID 27604)
-- Dependencies: 302
-- Data for Name: justificativas_analise_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.justificativas_analise_historico (id, rev, revtype, data_criacao, data_atualizacao, external_id, justificativa, status, tipo_documento) FROM stdin;
\.


--
-- TOC entry 3948 (class 0 OID 27609)
-- Dependencies: 303
-- Data for Name: local_agendamento_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.local_agendamento_historico (id, rev, revtype, data_criacao, data_atualizacao, endereco, cidade, habilitado, id_externo, nome_local) FROM stdin;
\.


--
-- TOC entry 3949 (class 0 OID 27614)
-- Dependencies: 304
-- Data for Name: lote_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.lote_historico (id, rev, revtype, data_criacao, data_atualizacao, lote_status) FROM stdin;
\.


--
-- TOC entry 3950 (class 0 OID 27619)
-- Dependencies: 305
-- Data for Name: observacao_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.observacao_historico (id, rev, revtype, data_criacao, data_atualizacao, perito_id_externo, texto, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3951 (class 0 OID 27626)
-- Dependencies: 306
-- Data for Name: pedido_anterior_associado_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_anterior_associado_historico (id, rev, revtype, data_criacao, data_atualizacao, id_externo_pedido, func_id_externo, numero_pedido) FROM stdin;
\.


--
-- TOC entry 3952 (class 0 OID 27631)
-- Dependencies: 307
-- Data for Name: pedido_dados_pessoais_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_dados_pessoais_historico (id, rev, revtype, data_criacao, data_atualizacao, cidade_de_nascimento, pais_de_nascimento, data_de_nascimento, escolaridade, email, filiacao1, filiacao2, filiacao3, filiacao4, genero, estado_civil, nome, nacionalidade, notifica_email, notifica_sms, id_telefone, nome_social, uniao_estavel, estado_de_nascimento, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3953 (class 0 OID 27638)
-- Dependencies: 308
-- Data for Name: pedido_endereco_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_endereco_historico (id, rev, revtype, data_criacao, data_atualizacao, cidade, complemento, bairro, numero, estado, rua, codigo_postal, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3954 (class 0 OID 27643)
-- Dependencies: 309
-- Data for Name: pedido_rg_condicao_saude_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_rg_condicao_saude_historico (id, rev, revtype, data_criacao, data_atualizacao, transtorno_espectro_autista, doenca_auditiva, doenca_mental, ostomia, deficiencia_fisica, doenca_visual, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3955 (class 0 OID 27648)
-- Dependencies: 310
-- Data for Name: pedido_rg_documentos_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_rg_documentos_historico (id, rev, revtype, data_criacao, data_atualizacao, tipo_sanguineo, cert_livro, cert_circunscricao, cert_cidade, cert_data_emissao, cert_cartorio, cert_folha, cert_matricula_certidao, cert_uf, cert_termo, cert_tipo, cnh, cns, cpf, dni, identidade_profissional_1, identidade_profissional_2, identidade_profissional_3, certificado_militar, nis, numero_ctps, pasep, pis, identidade_sec_orgao, identidade_sec_num, identidade_sec_uf, serie_ctps, uf_ctps, titulo_de_eleitor, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3956 (class 0 OID 27655)
-- Dependencies: 311
-- Data for Name: pedido_rg_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.pedido_rg_historico (rev, data_criacao, id_externo, func_id_externo, id, pedido_status, data_atualizacao, revtype, criacao_offline, data_emissao, data_do_status, autenticacao_de_documento, emergencial, disponibilidade_id_externo, local_id_externo, usuario_qualidade_id_externo, usuario_id_externo, registro_geral, migracao, documentos_extras, captura_presencial, numero_de_protocolo, numero_do_pedido, rg_antigo, tipo_pedido, boleto_pago, tipo_usuario) FROM stdin;
1	2023-09-29 01:38:00	b7bdf6fb9dc2df4249465c1fd023171fc3b0474ef8af46114f3fe0dd	\N	1	\N	\N	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	string	36820985707	\N	6	\N	\N
\.


--
-- TOC entry 3957 (class 0 OID 27662)
-- Dependencies: 312
-- Data for Name: requerimento_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.requerimento_historico (id, rev, revtype, data_criacao, data_atualizacao, perito_id_externo, id_externo, observacao, status, tipo, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3958 (class 0 OID 27669)
-- Dependencies: 313
-- Data for Name: revinfo; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.revinfo (rev, revtstmp) FROM stdin;
1	1695962328517
\.


--
-- TOC entry 3959 (class 0 OID 27674)
-- Dependencies: 314
-- Data for Name: rg_representante_legal_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.rg_representante_legal_historico (id, rev, revtype, data_criacao, data_atualizacao, documento_numero, documento_parte, documento_uf, nome, documento_responsabilidade_disp, assina, origem_do_form, tipo, tipo_de_documento, solicitationrg_id) FROM stdin;
\.


--
-- TOC entry 3960 (class 0 OID 27679)
-- Dependencies: 315
-- Data for Name: usuario_sistema_historico; Type: TABLE DATA; Schema: emissaorg_historico; Owner: postgres
--

COPY emissaorg_historico.usuario_sistema_historico (id, rev, papel, revtype, data_criacao, data_atualizacao, id_externo, nome, matricula) FROM stdin;
\.


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 215
-- Name: acompanhamento_legado_id_acompanhamento_legado_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.acompanhamento_legado_id_acompanhamento_legado_seq', 1, false);


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 288
-- Name: acompanhamento_legado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.acompanhamento_legado_id_seq', 1, false);


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 217
-- Name: agendamento_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.agendamento_id_seq', 1, false);


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 219
-- Name: autenticacao_documento_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.autenticacao_documento_id_seq', 1, false);


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 223
-- Name: captura_presencial_comparacao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.captura_presencial_comparacao_id_seq', 1, false);


--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 221
-- Name: captura_presencial_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.captura_presencial_id_seq', 1, false);


--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 225
-- Name: dados_anomalia_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.dados_anomalia_id_seq', 1, false);


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 227
-- Name: dados_antropometricos_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.dados_antropometricos_id_seq', 1, false);


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 229
-- Name: dados_biograficos_comparacao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.dados_biograficos_comparacao_id_seq', 1, false);


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 231
-- Name: disponibilidade_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.disponibilidade_id_seq', 3, true);


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 233
-- Name: entrega_recebedor_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.entrega_recebedor_id_seq', 1, false);


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 235
-- Name: espelho_rg_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.espelho_rg_id_seq', 1, false);


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 237
-- Name: funcionario_legado_id_funcionario_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.funcionario_legado_id_funcionario_seq', 1, false);


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 212
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.hibernate_sequence', 1, true);


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 239
-- Name: historico_status_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.historico_status_id_seq', 1, false);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 241
-- Name: horario_disponivel_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.horario_disponivel_id_seq', 8, true);


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 243
-- Name: impressao_posto_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.impressao_posto_id_seq', 1, false);


--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 245
-- Name: justificativas_analise_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.justificativas_analise_id_seq', 1, false);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 249
-- Name: legado_pedido_dados_impressao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.legado_pedido_dados_impressao_id_seq', 1, false);


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 251
-- Name: legado_pedido_impressao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.legado_pedido_impressao_id_seq', 1, false);


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 255
-- Name: local_agendamento_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.local_agendamento_id_seq', 3, true);


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 258
-- Name: local_disponibilidade_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.local_disponibilidade_id_seq', 4, true);


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 260
-- Name: localizacao_cidade_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.localizacao_cidade_id_seq', 296, true);


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 262
-- Name: localizacao_estado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.localizacao_estado_id_seq', 1, false);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 264
-- Name: lote_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.lote_id_seq', 1, false);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 266
-- Name: observacao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.observacao_id_seq', 1, false);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 268
-- Name: pedido_anterior_associado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_anterior_associado_id_seq', 1, false);


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 289
-- Name: pedido_atendimento_legado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_atendimento_legado_id_seq', 1, false);


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 270
-- Name: pedido_dados_pessoais_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_dados_pessoais_id_seq', 1, false);


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 272
-- Name: pedido_endereco_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_endereco_id_seq', 1, false);


--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 274
-- Name: pedido_limite_utilizacao_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_limite_utilizacao_id_seq', 1, false);


--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 290
-- Name: pedido_pagamento_legado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_pagamento_legado_id_seq', 1, false);


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 278
-- Name: pedido_rg_condicao_saude_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_rg_condicao_saude_id_seq', 1, false);


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 280
-- Name: pedido_rg_documentos_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_rg_documentos_id_seq', 1, false);


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 291
-- Name: pedido_rg_excluido_legado_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_rg_excluido_legado_id_seq', 1, false);


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 276
-- Name: pedido_rg_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.pedido_rg_id_seq', 1, true);


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 282
-- Name: requerimento_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.requerimento_id_seq', 1, false);


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 284
-- Name: rg_representante_legal_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.rg_representante_legal_id_seq', 1, false);


--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 286
-- Name: usuario_sistema_id_seq; Type: SEQUENCE SET; Schema: emissaorg; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg.usuario_sistema_id_seq', 3, true);


--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 214
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: emissaorg_historico; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg_historico.hibernate_sequence', 1, false);


--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 213
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: emissaorg_test; Owner: postgres
--

SELECT pg_catalog.setval('emissaorg_test.hibernate_sequence', 1, false);


--
-- TOC entry 3496 (class 2606 OID 27231)
-- Name: acompanhamento_legado acompanhamento_legado_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.acompanhamento_legado
    ADD CONSTRAINT acompanhamento_legado_pkey PRIMARY KEY (id_acompanhamento_legado);


--
-- TOC entry 3498 (class 2606 OID 27238)
-- Name: agendamento agendamento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento
    ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 27245)
-- Name: autenticacao_documento autenticacao_documento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.autenticacao_documento
    ADD CONSTRAINT autenticacao_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 27259)
-- Name: captura_presencial_comparacao captura_presencial_comparacao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.captura_presencial_comparacao
    ADD CONSTRAINT captura_presencial_comparacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 27252)
-- Name: captura_presencial captura_presencial_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.captura_presencial
    ADD CONSTRAINT captura_presencial_pkey PRIMARY KEY (id);


--
-- TOC entry 3509 (class 2606 OID 27266)
-- Name: dados_anomalia dados_anomalia_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_anomalia
    ADD CONSTRAINT dados_anomalia_pkey PRIMARY KEY (id);


--
-- TOC entry 3511 (class 2606 OID 27275)
-- Name: dados_antropometricos dados_antropometricos_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_antropometricos
    ADD CONSTRAINT dados_antropometricos_pkey PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 27284)
-- Name: dados_biograficos_comparacao dados_biograficos_comparacao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_biograficos_comparacao
    ADD CONSTRAINT dados_biograficos_comparacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 27291)
-- Name: disponibilidade disponibilidade_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.disponibilidade
    ADD CONSTRAINT disponibilidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3520 (class 2606 OID 27298)
-- Name: entrega_recebedor entrega_recebedor_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.entrega_recebedor
    ADD CONSTRAINT entrega_recebedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3524 (class 2606 OID 27305)
-- Name: espelho_rg espelho_rg_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.espelho_rg
    ADD CONSTRAINT espelho_rg_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 27314)
-- Name: funcionario_legado funcionario_legado_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.funcionario_legado
    ADD CONSTRAINT funcionario_legado_pkey PRIMARY KEY (id_funcionario);


--
-- TOC entry 3528 (class 2606 OID 27321)
-- Name: historico_status historico_status_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.historico_status
    ADD CONSTRAINT historico_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3530 (class 2606 OID 27328)
-- Name: horario_disponivel horario_disponivel_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.horario_disponivel
    ADD CONSTRAINT horario_disponivel_pkey PRIMARY KEY (id);


--
-- TOC entry 3534 (class 2606 OID 27335)
-- Name: impressao_posto impressao_posto_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.impressao_posto
    ADD CONSTRAINT impressao_posto_pkey PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 27342)
-- Name: justificativas_analise justificativas_analise_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.justificativas_analise
    ADD CONSTRAINT justificativas_analise_pkey PRIMARY KEY (id);


--
-- TOC entry 3540 (class 2606 OID 27347)
-- Name: legado_pedido_acompanhamento legado_pedido_acompanhamento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_acompanhamento
    ADD CONSTRAINT legado_pedido_acompanhamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 27352)
-- Name: legado_pedido_atendimento legado_pedido_atendimento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_atendimento
    ADD CONSTRAINT legado_pedido_atendimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3544 (class 2606 OID 27361)
-- Name: legado_pedido_dados_impressao legado_pedido_dados_impressao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_dados_impressao
    ADD CONSTRAINT legado_pedido_dados_impressao_pkey PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 27368)
-- Name: legado_pedido_impressao legado_pedido_impressao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_impressao
    ADD CONSTRAINT legado_pedido_impressao_pkey PRIMARY KEY (id);


--
-- TOC entry 3548 (class 2606 OID 27373)
-- Name: legado_pedido_pagamento legado_pedido_pagamento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_pagamento
    ADD CONSTRAINT legado_pedido_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3550 (class 2606 OID 27378)
-- Name: legado_pedido_rg_excluido legado_pedido_rg_excluido_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_rg_excluido
    ADD CONSTRAINT legado_pedido_rg_excluido_pkey PRIMARY KEY (id);


--
-- TOC entry 3552 (class 2606 OID 27385)
-- Name: local_agendamento local_agendamento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento
    ADD CONSTRAINT local_agendamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3556 (class 2606 OID 27390)
-- Name: local_agendamento_terceirizado local_agendamento_terceirizado_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento_terceirizado
    ADD CONSTRAINT local_agendamento_terceirizado_pkey PRIMARY KEY (local_agendamento_id, usuario_terceirizado_id);


--
-- TOC entry 3559 (class 2606 OID 27397)
-- Name: local_disponibilidade local_disponibilidade_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_disponibilidade
    ADD CONSTRAINT local_disponibilidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3563 (class 2606 OID 27404)
-- Name: localizacao_cidade localizacao_cidade_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_cidade
    ADD CONSTRAINT localizacao_cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 27411)
-- Name: localizacao_estado localizacao_estado_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_estado
    ADD CONSTRAINT localizacao_estado_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 27420)
-- Name: lote lote_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (id);


--
-- TOC entry 3577 (class 2606 OID 27429)
-- Name: observacao observacao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.observacao
    ADD CONSTRAINT observacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 27436)
-- Name: pedido_anterior_associado pedido_anterior_associado_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_anterior_associado
    ADD CONSTRAINT pedido_anterior_associado_pkey PRIMARY KEY (id);


--
-- TOC entry 3582 (class 2606 OID 27445)
-- Name: pedido_dados_pessoais pedido_dados_pessoais_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_dados_pessoais
    ADD CONSTRAINT pedido_dados_pessoais_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 27452)
-- Name: pedido_endereco pedido_endereco_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_endereco
    ADD CONSTRAINT pedido_endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 27459)
-- Name: pedido_limite_utilizacao pedido_limite_utilizacao_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_limite_utilizacao
    ADD CONSTRAINT pedido_limite_utilizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 27475)
-- Name: pedido_rg_condicao_saude pedido_rg_condicao_saude_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_condicao_saude
    ADD CONSTRAINT pedido_rg_condicao_saude_pkey PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 27484)
-- Name: pedido_rg_documentos pedido_rg_documentos_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_documentos
    ADD CONSTRAINT pedido_rg_documentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 27468)
-- Name: pedido_rg pedido_rg_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT pedido_rg_pkey PRIMARY KEY (id);


--
-- TOC entry 3602 (class 2606 OID 27493)
-- Name: requerimento requerimento_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.requerimento
    ADD CONSTRAINT requerimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3606 (class 2606 OID 27500)
-- Name: rg_representante_legal rg_representante_legal_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.rg_representante_legal
    ADD CONSTRAINT rg_representante_legal_pkey PRIMARY KEY (id);


--
-- TOC entry 3565 (class 2606 OID 27526)
-- Name: localizacao_cidade uk_1weqf5v67eoj6rk1iwc5lyp1q; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_cidade
    ADD CONSTRAINT uk_1weqf5v67eoj6rk1iwc5lyp1q UNIQUE (id_ibge);


--
-- TOC entry 3500 (class 2606 OID 27509)
-- Name: agendamento uk_5wdwr8mp4ie504b2wkfxxj81y; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento
    ADD CONSTRAINT uk_5wdwr8mp4ie504b2wkfxxj81y UNIQUE (id_externo);


--
-- TOC entry 3573 (class 2606 OID 27530)
-- Name: lote uk_68ki158d54u397lpnnk887ild; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.lote
    ADD CONSTRAINT uk_68ki158d54u397lpnnk887ild UNIQUE (numero_lote);


--
-- TOC entry 3561 (class 2606 OID 27524)
-- Name: local_disponibilidade uk_69qgh06ge792ghio0p8mw2ghf; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_disponibilidade
    ADD CONSTRAINT uk_69qgh06ge792ghio0p8mw2ghf UNIQUE (id_externo);


--
-- TOC entry 3590 (class 2606 OID 27535)
-- Name: pedido_rg uk_7mg8bsuhdkn93ebjffr363yed; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT uk_7mg8bsuhdkn93ebjffr363yed UNIQUE (id_externo);


--
-- TOC entry 3592 (class 2606 OID 27537)
-- Name: pedido_rg uk_eqnp35b1tkrvk2368ksxw2jlw; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT uk_eqnp35b1tkrvk2368ksxw2jlw UNIQUE (numero_de_protocolo);


--
-- TOC entry 3522 (class 2606 OID 27515)
-- Name: entrega_recebedor uk_i6lno6v18unha3sm6t1sfusca; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.entrega_recebedor
    ADD CONSTRAINT uk_i6lno6v18unha3sm6t1sfusca UNIQUE (id_externo);


--
-- TOC entry 3532 (class 2606 OID 27517)
-- Name: horario_disponivel uk_k9oouyb9lexsof35geb44d8uy; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.horario_disponivel
    ADD CONSTRAINT uk_k9oouyb9lexsof35geb44d8uy UNIQUE (id_externo);


--
-- TOC entry 3575 (class 2606 OID 27532)
-- Name: lote uk_li3k7m65sg3di422reeh2v52k; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.lote
    ADD CONSTRAINT uk_li3k7m65sg3di422reeh2v52k UNIQUE (id_externo);


--
-- TOC entry 3569 (class 2606 OID 27528)
-- Name: localizacao_estado uk_m1qegv10evbo5vxntwv1w7423; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_estado
    ADD CONSTRAINT uk_m1qegv10evbo5vxntwv1w7423 UNIQUE (sigla);


--
-- TOC entry 3608 (class 2606 OID 27545)
-- Name: usuario_sistema uk_opkk1lophajj6hcr6v7lgm36c; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.usuario_sistema
    ADD CONSTRAINT uk_opkk1lophajj6hcr6v7lgm36c UNIQUE (id_externo);


--
-- TOC entry 3604 (class 2606 OID 27543)
-- Name: requerimento uk_otkjldc3g3gkocrr0tk8r6lln; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.requerimento
    ADD CONSTRAINT uk_otkjldc3g3gkocrr0tk8r6lln UNIQUE (id_externo);


--
-- TOC entry 3598 (class 2606 OID 27541)
-- Name: pedido_rg_condicao_saude uk_r0cgp1rf1y2ndda5cith8aka2; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_condicao_saude
    ADD CONSTRAINT uk_r0cgp1rf1y2ndda5cith8aka2 UNIQUE (solicitationrg_id);


--
-- TOC entry 3518 (class 2606 OID 27513)
-- Name: disponibilidade uk_re8igh5n09oy6fdgnenx7rbmc; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.disponibilidade
    ADD CONSTRAINT uk_re8igh5n09oy6fdgnenx7rbmc UNIQUE (id_externo);


--
-- TOC entry 3536 (class 2606 OID 27519)
-- Name: impressao_posto uk_rjjloaox5tkvl2vmoxsqx5wba; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.impressao_posto
    ADD CONSTRAINT uk_rjjloaox5tkvl2vmoxsqx5wba UNIQUE (id_externo);


--
-- TOC entry 3594 (class 2606 OID 27539)
-- Name: pedido_rg uk_si46v88cobjkgusbxd44e9vuv; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT uk_si46v88cobjkgusbxd44e9vuv UNIQUE (numero_do_pedido);


--
-- TOC entry 3554 (class 2606 OID 27521)
-- Name: local_agendamento uk_t3xem87bkcg6yn3ngtsbuygdb; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento
    ADD CONSTRAINT uk_t3xem87bkcg6yn3ngtsbuygdb UNIQUE (id_externo);


--
-- TOC entry 3610 (class 2606 OID 27507)
-- Name: usuario_sistema usuario_sistema_pkey; Type: CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.usuario_sistema
    ADD CONSTRAINT usuario_sistema_pkey PRIMARY KEY (id);


--
-- TOC entry 3612 (class 2606 OID 27554)
-- Name: agendamento_historico agendamento_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.agendamento_historico
    ADD CONSTRAINT agendamento_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3614 (class 2606 OID 27559)
-- Name: autenticacao_documento_historico autenticacao_documento_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.autenticacao_documento_historico
    ADD CONSTRAINT autenticacao_documento_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3616 (class 2606 OID 27564)
-- Name: captura_presencial_comparacao_historico captura_presencial_comparacao_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.captura_presencial_comparacao_historico
    ADD CONSTRAINT captura_presencial_comparacao_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3618 (class 2606 OID 27569)
-- Name: captura_presencial_historico captura_presencial_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.captura_presencial_historico
    ADD CONSTRAINT captura_presencial_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3620 (class 2606 OID 27574)
-- Name: dados_anomalia_historico dados_anomalia_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_anomalia_historico
    ADD CONSTRAINT dados_anomalia_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3622 (class 2606 OID 27581)
-- Name: dados_antropometricos_historico dados_antropometricos_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_antropometricos_historico
    ADD CONSTRAINT dados_antropometricos_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3624 (class 2606 OID 27588)
-- Name: dados_biograficos_comparacao_historico dados_biograficos_comparacao_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_biograficos_comparacao_historico
    ADD CONSTRAINT dados_biograficos_comparacao_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3626 (class 2606 OID 27593)
-- Name: disponibilidade_historico disponibilidade_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.disponibilidade_historico
    ADD CONSTRAINT disponibilidade_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3628 (class 2606 OID 27598)
-- Name: espelho_rg_historico espelho_rg_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.espelho_rg_historico
    ADD CONSTRAINT espelho_rg_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3630 (class 2606 OID 27603)
-- Name: horario_disponivel_historico horario_disponivel_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.horario_disponivel_historico
    ADD CONSTRAINT horario_disponivel_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3632 (class 2606 OID 27608)
-- Name: justificativas_analise_historico justificativas_analise_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.justificativas_analise_historico
    ADD CONSTRAINT justificativas_analise_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3634 (class 2606 OID 27613)
-- Name: local_agendamento_historico local_agendamento_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.local_agendamento_historico
    ADD CONSTRAINT local_agendamento_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3636 (class 2606 OID 27618)
-- Name: lote_historico lote_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.lote_historico
    ADD CONSTRAINT lote_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3638 (class 2606 OID 27625)
-- Name: observacao_historico observacao_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.observacao_historico
    ADD CONSTRAINT observacao_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3640 (class 2606 OID 27630)
-- Name: pedido_anterior_associado_historico pedido_anterior_associado_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_anterior_associado_historico
    ADD CONSTRAINT pedido_anterior_associado_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3642 (class 2606 OID 27637)
-- Name: pedido_dados_pessoais_historico pedido_dados_pessoais_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_dados_pessoais_historico
    ADD CONSTRAINT pedido_dados_pessoais_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3644 (class 2606 OID 27642)
-- Name: pedido_endereco_historico pedido_endereco_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_endereco_historico
    ADD CONSTRAINT pedido_endereco_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3646 (class 2606 OID 27647)
-- Name: pedido_rg_condicao_saude_historico pedido_rg_condicao_saude_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_condicao_saude_historico
    ADD CONSTRAINT pedido_rg_condicao_saude_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3648 (class 2606 OID 27654)
-- Name: pedido_rg_documentos_historico pedido_rg_documentos_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_documentos_historico
    ADD CONSTRAINT pedido_rg_documentos_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3650 (class 2606 OID 27661)
-- Name: pedido_rg_historico pedido_rg_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_historico
    ADD CONSTRAINT pedido_rg_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3652 (class 2606 OID 27668)
-- Name: requerimento_historico requerimento_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.requerimento_historico
    ADD CONSTRAINT requerimento_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3654 (class 2606 OID 27673)
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 3656 (class 2606 OID 27678)
-- Name: rg_representante_legal_historico rg_representante_legal_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.rg_representante_legal_historico
    ADD CONSTRAINT rg_representante_legal_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3658 (class 2606 OID 27683)
-- Name: usuario_sistema_historico usuario_sistema_historico_pkey; Type: CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.usuario_sistema_historico
    ADD CONSTRAINT usuario_sistema_historico_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 3578 (class 1259 OID 27533)
-- Name: idx7viigqamkvcttjugowoqgk1bs; Type: INDEX; Schema: emissaorg; Owner: postgres
--

CREATE INDEX idx7viigqamkvcttjugowoqgk1bs ON emissaorg.pedido_anterior_associado USING btree (id_externo_pedido, numero_pedido);


--
-- TOC entry 3557 (class 1259 OID 27522)
-- Name: idxc14ei4138waektky1l8ays6v4; Type: INDEX; Schema: emissaorg; Owner: postgres
--

CREATE INDEX idxc14ei4138waektky1l8ays6v4 ON emissaorg.local_disponibilidade USING btree (data_inicio, data_fim);


--
-- TOC entry 3514 (class 1259 OID 27511)
-- Name: idxhk4ux7etc4mv9408druqbqk3w; Type: INDEX; Schema: emissaorg; Owner: postgres
--

CREATE INDEX idxhk4ux7etc4mv9408druqbqk3w ON emissaorg.dados_biograficos_comparacao USING btree (id_externo_pedido, numero_de_protocolo);


--
-- TOC entry 3507 (class 1259 OID 27510)
-- Name: idxposac4o4uawqrd4c4umseqr43; Type: INDEX; Schema: emissaorg; Owner: postgres
--

CREATE INDEX idxposac4o4uawqrd4c4umseqr43 ON emissaorg.captura_presencial_comparacao USING btree (id_externo_pedido, numero_de_protocolo, captura_tipo);


--
-- TOC entry 3671 (class 2606 OID 27744)
-- Name: legado_pedido_atendimento fk1qwk3pwx2wj7xwslowe1h2ut2; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_atendimento
    ADD CONSTRAINT fk1qwk3pwx2wj7xwslowe1h2ut2 FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3689 (class 2606 OID 27834)
-- Name: pedido_rg fk1twn4j32mom4k1uvob15ibe27; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT fk1twn4j32mom4k1uvob15ibe27 FOREIGN KEY (entrega_recebedor_id) REFERENCES emissaorg.entrega_recebedor(id);


--
-- TOC entry 3676 (class 2606 OID 27769)
-- Name: legado_pedido_pagamento fk2yjmpuqkdf702dbgn013htnwt; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_pagamento
    ADD CONSTRAINT fk2yjmpuqkdf702dbgn013htnwt FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3664 (class 2606 OID 27709)
-- Name: dados_antropometricos fk4mbrqk9lsqhavc0atxhcmjdta; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_antropometricos
    ADD CONSTRAINT fk4mbrqk9lsqhavc0atxhcmjdta FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3683 (class 2606 OID 27804)
-- Name: observacao fk4xv5a0kdobm5g74irm5amchhy; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.observacao
    ADD CONSTRAINT fk4xv5a0kdobm5g74irm5amchhy FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3673 (class 2606 OID 27754)
-- Name: legado_pedido_impressao fk6a1ihkw5a7w067uyl6bghq7pg; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_impressao
    ADD CONSTRAINT fk6a1ihkw5a7w067uyl6bghq7pg FOREIGN KEY (impressao_lote_id) REFERENCES emissaorg.lote(id);


--
-- TOC entry 3661 (class 2606 OID 27694)
-- Name: agendamento fk8iyqguryhjwcervck1gqa6u6k; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento
    ADD CONSTRAINT fk8iyqguryhjwcervck1gqa6u6k FOREIGN KEY (usuario_terceirizado_id) REFERENCES emissaorg.usuario_sistema(id);


--
-- TOC entry 3674 (class 2606 OID 27759)
-- Name: legado_pedido_impressao fk972henn4yk1ss8gewa23cw3ng; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_impressao
    ADD CONSTRAINT fk972henn4yk1ss8gewa23cw3ng FOREIGN KEY (impressao_posto_id) REFERENCES emissaorg.local_agendamento(id);


--
-- TOC entry 3687 (class 2606 OID 27824)
-- Name: pedido_rg fkcw0f1g6xvlsji9cbkm4i6rhfu; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT fkcw0f1g6xvlsji9cbkm4i6rhfu FOREIGN KEY (lote_id) REFERENCES emissaorg.lote(id);


--
-- TOC entry 3691 (class 2606 OID 27844)
-- Name: pedido_rg_documentos fkd8792mtkb0ifc22n4f6dx9aty; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_documentos
    ADD CONSTRAINT fkd8792mtkb0ifc22n4f6dx9aty FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3690 (class 2606 OID 27839)
-- Name: pedido_rg_condicao_saude fkean70o8l8e96mvp1pck3f30ih; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg_condicao_saude
    ADD CONSTRAINT fkean70o8l8e96mvp1pck3f30ih FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3692 (class 2606 OID 27849)
-- Name: requerimento fkebn8uxopwj41tswaptgaw68sb; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.requerimento
    ADD CONSTRAINT fkebn8uxopwj41tswaptgaw68sb FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3685 (class 2606 OID 27814)
-- Name: pedido_endereco fkfdon6e9wa2u9by70qol3fw6r9; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_endereco
    ADD CONSTRAINT fkfdon6e9wa2u9by70qol3fw6r9 FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3684 (class 2606 OID 27809)
-- Name: pedido_dados_pessoais fkfyu903hceh37t50qygtxrv3mu; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_dados_pessoais
    ADD CONSTRAINT fkfyu903hceh37t50qygtxrv3mu FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3662 (class 2606 OID 27699)
-- Name: captura_presencial fkgmhs55vbbmi6n1okgwqrxnum6; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.captura_presencial
    ADD CONSTRAINT fkgmhs55vbbmi6n1okgwqrxnum6 FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3668 (class 2606 OID 27729)
-- Name: historico_status fkgtqkt1utbxrj5r6owc5ojp68r; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.historico_status
    ADD CONSTRAINT fkgtqkt1utbxrj5r6owc5ojp68r FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3679 (class 2606 OID 27784)
-- Name: local_agendamento_terceirizado fkh7i7impeubprscxxk5l2f5ad4; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento_terceirizado
    ADD CONSTRAINT fkh7i7impeubprscxxk5l2f5ad4 FOREIGN KEY (local_agendamento_id) REFERENCES emissaorg.local_agendamento(id);


--
-- TOC entry 3669 (class 2606 OID 27734)
-- Name: horario_disponivel fkjbm9fo5hn457uom4a3wfmdx02; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.horario_disponivel
    ADD CONSTRAINT fkjbm9fo5hn457uom4a3wfmdx02 FOREIGN KEY (disponibilidade_id) REFERENCES emissaorg.disponibilidade(id);


--
-- TOC entry 3680 (class 2606 OID 27789)
-- Name: local_disponibilidade fkl13asov3k9bsn62uvk6gpaqxs; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_disponibilidade
    ADD CONSTRAINT fkl13asov3k9bsn62uvk6gpaqxs FOREIGN KEY (local_agendamento_id) REFERENCES emissaorg.local_agendamento(id);


--
-- TOC entry 3675 (class 2606 OID 27764)
-- Name: legado_pedido_impressao fklk608sjvnf3knxym5sanr9p8i; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_impressao
    ADD CONSTRAINT fklk608sjvnf3knxym5sanr9p8i FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3693 (class 2606 OID 27854)
-- Name: rg_representante_legal fklo6cb6fsry63ccp83x2kxw0cq; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.rg_representante_legal
    ADD CONSTRAINT fklo6cb6fsry63ccp83x2kxw0cq FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3672 (class 2606 OID 27749)
-- Name: legado_pedido_dados_impressao fkm3vejspx859sl6sjhrx7bj4bh; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_dados_impressao
    ADD CONSTRAINT fkm3vejspx859sl6sjhrx7bj4bh FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3659 (class 2606 OID 27684)
-- Name: agendamento fko40yfk9xv44hqfvwxeslueus9; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento
    ADD CONSTRAINT fko40yfk9xv44hqfvwxeslueus9 FOREIGN KEY (horario_disponivel_id) REFERENCES emissaorg.horario_disponivel(id);


--
-- TOC entry 3660 (class 2606 OID 27689)
-- Name: agendamento fko4t6hewq2npk4u5ax1am6q4vc; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.agendamento
    ADD CONSTRAINT fko4t6hewq2npk4u5ax1am6q4vc FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3686 (class 2606 OID 27819)
-- Name: pedido_limite_utilizacao fkofltauchg0i0p6adl5t2vf7pj; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_limite_utilizacao
    ADD CONSTRAINT fkofltauchg0i0p6adl5t2vf7pj FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3682 (class 2606 OID 27799)
-- Name: lote fkpd2ypak3mh0d0sodla3tvhwy9; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.lote
    ADD CONSTRAINT fkpd2ypak3mh0d0sodla3tvhwy9 FOREIGN KEY (impressao_posto_id) REFERENCES emissaorg.impressao_posto(id);


--
-- TOC entry 3678 (class 2606 OID 27779)
-- Name: local_agendamento_terceirizado fkq4jb87ugbf289jq1epnesn8gj; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento_terceirizado
    ADD CONSTRAINT fkq4jb87ugbf289jq1epnesn8gj FOREIGN KEY (usuario_terceirizado_id) REFERENCES emissaorg.usuario_sistema(id);


--
-- TOC entry 3681 (class 2606 OID 27794)
-- Name: localizacao_cidade fkr3qtecxfiy456id607g54ufhf; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.localizacao_cidade
    ADD CONSTRAINT fkr3qtecxfiy456id607g54ufhf FOREIGN KEY (estado_id) REFERENCES emissaorg.localizacao_estado(id);


--
-- TOC entry 3667 (class 2606 OID 27724)
-- Name: espelho_rg fkrqvf12c5kg74g73cp2u8vdkga; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.espelho_rg
    ADD CONSTRAINT fkrqvf12c5kg74g73cp2u8vdkga FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3665 (class 2606 OID 27714)
-- Name: disponibilidade fkrt9l6tu2rrd01xve6jrcpxshe; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.disponibilidade
    ADD CONSTRAINT fkrt9l6tu2rrd01xve6jrcpxshe FOREIGN KEY (local_agendamento_id) REFERENCES emissaorg.local_agendamento(id);


--
-- TOC entry 3663 (class 2606 OID 27704)
-- Name: dados_anomalia fkso3pks9i12w7u0m6cfpe6srqp; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.dados_anomalia
    ADD CONSTRAINT fkso3pks9i12w7u0m6cfpe6srqp FOREIGN KEY (anthropometric_id) REFERENCES emissaorg.dados_antropometricos(id);


--
-- TOC entry 3688 (class 2606 OID 27829)
-- Name: pedido_rg fkt1cg8o8nrxkskb396urud0bwf; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.pedido_rg
    ADD CONSTRAINT fkt1cg8o8nrxkskb396urud0bwf FOREIGN KEY (impressao_posto_id) REFERENCES emissaorg.impressao_posto(id);


--
-- TOC entry 3670 (class 2606 OID 27739)
-- Name: legado_pedido_acompanhamento fktf0cxspfb4ldvxx61461mc9o0; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.legado_pedido_acompanhamento
    ADD CONSTRAINT fktf0cxspfb4ldvxx61461mc9o0 FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3677 (class 2606 OID 27774)
-- Name: local_agendamento fktlu3lvtvddkjy381v3mh7qusq; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.local_agendamento
    ADD CONSTRAINT fktlu3lvtvddkjy381v3mh7qusq FOREIGN KEY (usuario_coord_id) REFERENCES emissaorg.usuario_sistema(id);


--
-- TOC entry 3666 (class 2606 OID 27719)
-- Name: entrega_recebedor fkwiuipt7i75yfx8d5eqi60xdk; Type: FK CONSTRAINT; Schema: emissaorg; Owner: postgres
--

ALTER TABLE ONLY emissaorg.entrega_recebedor
    ADD CONSTRAINT fkwiuipt7i75yfx8d5eqi60xdk FOREIGN KEY (impressao_posto_id) REFERENCES emissaorg.impressao_posto(id);


--
-- TOC entry 3700 (class 2606 OID 27889)
-- Name: dados_antropometricos_historico fk1t5hcrkvdptokdydx6e9r254a; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_antropometricos_historico
    ADD CONSTRAINT fk1t5hcrkvdptokdydx6e9r254a FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3711 (class 2606 OID 27944)
-- Name: pedido_endereco_historico fk2vj4jffrg8hr57020gkylspsd; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_endereco_historico
    ADD CONSTRAINT fk2vj4jffrg8hr57020gkylspsd FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3716 (class 2606 OID 27969)
-- Name: rg_representante_legal_historico fk42sp7ak2lefj8wku521n8kr71; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.rg_representante_legal_historico
    ADD CONSTRAINT fk42sp7ak2lefj8wku521n8kr71 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3699 (class 2606 OID 27884)
-- Name: dados_anomalia_historico fk6tynuxu7k2xjmhgusxo2eneg4; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_anomalia_historico
    ADD CONSTRAINT fk6tynuxu7k2xjmhgusxo2eneg4 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3697 (class 2606 OID 27874)
-- Name: captura_presencial_historico fk7j10nyloptf9p1aqkuqxnyjre; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.captura_presencial_historico
    ADD CONSTRAINT fk7j10nyloptf9p1aqkuqxnyjre FOREIGN KEY (solicitationrg_id) REFERENCES emissaorg.pedido_rg(id);


--
-- TOC entry 3703 (class 2606 OID 27904)
-- Name: espelho_rg_historico fk7pmddqy52i0hg5rjkrbkld3ap; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.espelho_rg_historico
    ADD CONSTRAINT fk7pmddqy52i0hg5rjkrbkld3ap FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3704 (class 2606 OID 27909)
-- Name: horario_disponivel_historico fkb25dqf8a7sgt3ssults7jqfgj; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.horario_disponivel_historico
    ADD CONSTRAINT fkb25dqf8a7sgt3ssults7jqfgj FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3701 (class 2606 OID 27894)
-- Name: dados_biograficos_comparacao_historico fke86yy6nme936emwg5cduvxphj; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.dados_biograficos_comparacao_historico
    ADD CONSTRAINT fke86yy6nme936emwg5cduvxphj FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3708 (class 2606 OID 27929)
-- Name: observacao_historico fkfsvsdhlji0qtpcys6ehp4jvg4; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.observacao_historico
    ADD CONSTRAINT fkfsvsdhlji0qtpcys6ehp4jvg4 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3705 (class 2606 OID 27914)
-- Name: justificativas_analise_historico fkfx9clda35fa4lu8rvq38xt16s; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.justificativas_analise_historico
    ADD CONSTRAINT fkfx9clda35fa4lu8rvq38xt16s FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3714 (class 2606 OID 27959)
-- Name: pedido_rg_historico fkg4vwca02m7tlr4uqjt9mfl8ac; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_historico
    ADD CONSTRAINT fkg4vwca02m7tlr4uqjt9mfl8ac FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3715 (class 2606 OID 27964)
-- Name: requerimento_historico fkgebpvi9iocwpvvphj0ru6nhd9; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.requerimento_historico
    ADD CONSTRAINT fkgebpvi9iocwpvvphj0ru6nhd9 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3717 (class 2606 OID 27974)
-- Name: usuario_sistema_historico fkioxhsvoki6foiok60meyleqim; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.usuario_sistema_historico
    ADD CONSTRAINT fkioxhsvoki6foiok60meyleqim FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3698 (class 2606 OID 27879)
-- Name: captura_presencial_historico fkjptib65s6cxxxgj3fs2vy5wxm; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.captura_presencial_historico
    ADD CONSTRAINT fkjptib65s6cxxxgj3fs2vy5wxm FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3702 (class 2606 OID 27899)
-- Name: disponibilidade_historico fkjpx90ug2ipt71o61ennwjn8ig; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.disponibilidade_historico
    ADD CONSTRAINT fkjpx90ug2ipt71o61ennwjn8ig FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3695 (class 2606 OID 27864)
-- Name: autenticacao_documento_historico fkjtbdlw5jmnunc0bqgui0pnbx4; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.autenticacao_documento_historico
    ADD CONSTRAINT fkjtbdlw5jmnunc0bqgui0pnbx4 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3713 (class 2606 OID 27954)
-- Name: pedido_rg_documentos_historico fkjvup376cygh8wtmrq8776674s; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_documentos_historico
    ADD CONSTRAINT fkjvup376cygh8wtmrq8776674s FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3694 (class 2606 OID 27859)
-- Name: agendamento_historico fkkcps2c8xbehr78pdisvg3yo55; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.agendamento_historico
    ADD CONSTRAINT fkkcps2c8xbehr78pdisvg3yo55 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3696 (class 2606 OID 27869)
-- Name: captura_presencial_comparacao_historico fkq000gnydrjx026i738jvtul7p; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.captura_presencial_comparacao_historico
    ADD CONSTRAINT fkq000gnydrjx026i738jvtul7p FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3707 (class 2606 OID 27924)
-- Name: lote_historico fkrtvmgw154ys0droymi39ury5g; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.lote_historico
    ADD CONSTRAINT fkrtvmgw154ys0droymi39ury5g FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3712 (class 2606 OID 27949)
-- Name: pedido_rg_condicao_saude_historico fkrxkxgyqkcktgyswrh52u8ouj4; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_rg_condicao_saude_historico
    ADD CONSTRAINT fkrxkxgyqkcktgyswrh52u8ouj4 FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3706 (class 2606 OID 27919)
-- Name: local_agendamento_historico fks3aoau9uyru47yt31h7m9r8ud; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.local_agendamento_historico
    ADD CONSTRAINT fks3aoau9uyru47yt31h7m9r8ud FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3710 (class 2606 OID 27939)
-- Name: pedido_dados_pessoais_historico fks9cxbdcpbfdov0w3yv9y3dwbv; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_dados_pessoais_historico
    ADD CONSTRAINT fks9cxbdcpbfdov0w3yv9y3dwbv FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


--
-- TOC entry 3709 (class 2606 OID 27934)
-- Name: pedido_anterior_associado_historico fksov1ctkhgg2kupv74qc6tgouk; Type: FK CONSTRAINT; Schema: emissaorg_historico; Owner: postgres
--

ALTER TABLE ONLY emissaorg_historico.pedido_anterior_associado_historico
    ADD CONSTRAINT fksov1ctkhgg2kupv74qc6tgouk FOREIGN KEY (rev) REFERENCES emissaorg_historico.revinfo(rev);


-- Completed on 2023-10-01 22:18:56

--
-- PostgreSQL database dump complete
--

--
-- Database "novo" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:56

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
-- TOC entry 3303 (class 1262 OID 27209)
-- Name: novo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE novo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE novo OWNER TO postgres;

\connect novo

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

-- Completed on 2023-10-01 22:18:57

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:57

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 27200)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id uuid NOT NULL,
    cpf character varying(255),
    data_criacao timestamp(6) without time zone,
    email character varying(255),
    nome character varying(255),
    renda numeric(38,2),
    telefone character varying(255)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 35400)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20),
    CONSTRAINT roles_name_check CHECK (((name)::text = ANY ((ARRAY['ROLE_USER'::character varying, 'ROLE_MODERATOR'::character varying, 'ROLE_ADMIN'::character varying])::text[])))
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 35399)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 213 (class 1259 OID 35407)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 35413)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(50),
    password character varying(120),
    username character varying(20)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 35412)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3178 (class 2604 OID 35403)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 35416)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3334 (class 0 OID 27200)
-- Dependencies: 210
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, cpf, data_criacao, email, nome, renda, telefone) FROM stdin;
\.


--
-- TOC entry 3336 (class 0 OID 35400)
-- Dependencies: 212
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	ROLE_USER
2	ROLE_MODERATOR
3	ROLE_ADMIN
\.


--
-- TOC entry 3337 (class 0 OID 35407)
-- Dependencies: 213
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
2	3
2	1
3	1
\.


--
-- TOC entry 3339 (class 0 OID 35413)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, username) FROM stdin;
2	esdrassudario@gmail.com	$2a$10$OJiJTH69anPZcZI3Pq0I8ubquTfWmh/lVS4y.9buDT8i04frnNHS6	admin
3	esdrassudario2@gmail.com	$2a$10$.L/s3W9T./fuUmW4eQgsBePKHBTVl13sqkm5HsOUbR0dNKh.9Cugi	comum
\.


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3182 (class 2606 OID 27206)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 35406)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 35422)
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 3190 (class 2606 OID 35420)
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 3186 (class 2606 OID 35411)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3192 (class 2606 OID 35418)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 35423)
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3194 (class 2606 OID 35428)
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2023-10-01 22:18:58

--
-- PostgreSQL database dump complete
--

--
-- Database "vazio" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-10-01 22:18:58

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
-- TOC entry 3303 (class 1262 OID 27208)
-- Name: vazio; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE vazio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE vazio OWNER TO postgres;

\connect vazio

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

-- Completed on 2023-10-01 22:18:59

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-10-01 22:18:59

--
-- PostgreSQL database cluster dump complete
--

