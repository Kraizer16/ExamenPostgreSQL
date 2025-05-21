--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

-- Started on 2025-05-20 22:23:10 -05

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
-- TOC entry 3500 (class 1262 OID 24889)
-- Name: movierental; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE movierental WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE movierental OWNER TO postgres;

\connect movierental

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 836 (class 1247 OID 24900)
-- Name: categorias; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.categorias AS ENUM (
    'Accion',
    'Comedia',
    'Drama',
    'Romance',
    'Ficcion',
    'Infantil'
);


ALTER TYPE public.categorias OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 25018)
-- Name: alquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alquiler (
    id integer NOT NULL,
    fechainicio date NOT NULL,
    fechadevolucion date NOT NULL,
    costototal numeric(10,2) NOT NULL,
    idcliente integer
);


ALTER TABLE public.alquiler OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25017)
-- Name: alquiler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alquiler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alquiler_id_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 216
-- Name: alquiler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alquiler_id_seq OWNED BY public.alquiler.id;


--
-- TOC entry 218 (class 1259 OID 25029)
-- Name: alquilerpeliculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alquilerpeliculas (
    idalquiler integer,
    idpelicula integer
);


ALTER TABLE public.alquilerpeliculas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24955)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    contacto character varying(30) NOT NULL,
    direccion character varying(50) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24954)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 214
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 220 (class 1259 OID 25043)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id integer NOT NULL,
    fecha date NOT NULL,
    monto numeric(10,2),
    idcliente integer,
    idsucursal integer
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25042)
-- Name: pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_id_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 219
-- Name: pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_seq OWNED BY public.pago.id;


--
-- TOC entry 212 (class 1259 OID 24914)
-- Name: peliculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peliculas (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL,
    genero public.categorias NOT NULL,
    director character varying(20) NOT NULL,
    aniolanzamiento integer NOT NULL,
    disponibilidad boolean NOT NULL,
    precioalquiler numeric(10,2) NOT NULL
);


ALTER TABLE public.peliculas OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24913)
-- Name: peliculas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peliculas_id_seq OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 211
-- Name: peliculas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;


--
-- TOC entry 210 (class 1259 OID 24891)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    ubicacion character varying(40) NOT NULL
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24890)
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursales_id_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 209
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- TOC entry 213 (class 1259 OID 24920)
-- Name: sucursalpelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursalpelicula (
    idpelicula integer,
    idsucursal integer
);


ALTER TABLE public.sucursalpelicula OWNER TO postgres;

--
-- TOC entry 3321 (class 2604 OID 25021)
-- Name: alquiler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler ALTER COLUMN id SET DEFAULT nextval('public.alquiler_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 24958)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 25046)
-- Name: pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id SET DEFAULT nextval('public.pago_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 24917)
-- Name: peliculas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 24894)
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- TOC entry 3491 (class 0 OID 25018)
-- Dependencies: 217
-- Data for Name: alquiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alquiler VALUES (1, '2025-01-10', '2025-01-12', 20000.00, 1);
INSERT INTO public.alquiler VALUES (2, '2025-01-13', '2025-01-15', 23000.00, 2);
INSERT INTO public.alquiler VALUES (3, '2025-02-10', '2025-02-12', 27000.00, 3);
INSERT INTO public.alquiler VALUES (4, '2025-02-23', '2025-02-25', 30000.00, 4);
INSERT INTO public.alquiler VALUES (5, '2025-03-10', '2025-03-12', 36000.00, 5);
INSERT INTO public.alquiler VALUES (6, '2025-03-28', '2025-03-30', 30000.00, 6);
INSERT INTO public.alquiler VALUES (7, '2025-04-01', '2025-04-10', 20000.00, 7);
INSERT INTO public.alquiler VALUES (8, '2025-04-15', '2025-04-20', 24000.00, 8);
INSERT INTO public.alquiler VALUES (9, '2025-05-11', '2025-05-15', 20000.00, 9);
INSERT INTO public.alquiler VALUES (10, '2025-06-09', '2025-06-29', 11000.00, 10);


--
-- TOC entry 3492 (class 0 OID 25029)
-- Dependencies: 218
-- Data for Name: alquilerpeliculas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alquilerpeliculas VALUES (1, 1);
INSERT INTO public.alquilerpeliculas VALUES (1, 4);
INSERT INTO public.alquilerpeliculas VALUES (2, 7);
INSERT INTO public.alquilerpeliculas VALUES (2, 1);
INSERT INTO public.alquilerpeliculas VALUES (3, 2);
INSERT INTO public.alquilerpeliculas VALUES (3, 3);
INSERT INTO public.alquilerpeliculas VALUES (4, 3);
INSERT INTO public.alquilerpeliculas VALUES (4, 5);
INSERT INTO public.alquilerpeliculas VALUES (5, 6);
INSERT INTO public.alquilerpeliculas VALUES (5, 9);
INSERT INTO public.alquilerpeliculas VALUES (6, 9);
INSERT INTO public.alquilerpeliculas VALUES (6, 11);
INSERT INTO public.alquilerpeliculas VALUES (7, 15);
INSERT INTO public.alquilerpeliculas VALUES (7, 8);
INSERT INTO public.alquilerpeliculas VALUES (8, 8);
INSERT INTO public.alquilerpeliculas VALUES (8, 12);
INSERT INTO public.alquilerpeliculas VALUES (9, 10);
INSERT INTO public.alquilerpeliculas VALUES (9, 13);
INSERT INTO public.alquilerpeliculas VALUES (10, 13);
INSERT INTO public.alquilerpeliculas VALUES (10, 14);


--
-- TOC entry 3489 (class 0 OID 24955)
-- Dependencies: 215
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (1, 'Marlon', '3012787447', 'Cra12A #22-37');
INSERT INTO public.cliente VALUES (2, 'Yolanda', '3208346845', 'Cl14B #14-67');
INSERT INTO public.cliente VALUES (3, 'Fabian', '3105569976', 'Av5A #62-12');
INSERT INTO public.cliente VALUES (4, 'Eduard', '3223367524', 'Cra22 #45-31');
INSERT INTO public.cliente VALUES (5, 'Diego', '3145569976', 'Av51B #33-09');
INSERT INTO public.cliente VALUES (6, 'Gisela', '3202684173', 'cl24A #15-17');
INSERT INTO public.cliente VALUES (7, 'Juandi', '3133042661', 'Cra17A #28-39');
INSERT INTO public.cliente VALUES (8, 'Santiago', '3123133361', 'Cra19B #72-97');
INSERT INTO public.cliente VALUES (9, 'Sara', '3156549888', 'Cra78B #12-97');
INSERT INTO public.cliente VALUES (10, 'Isabella', '3036569912', 'Cl40 #22-90');


--
-- TOC entry 3494 (class 0 OID 25043)
-- Dependencies: 220
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pago VALUES (1, '2025-01-12', 20000.00, 1, 1);
INSERT INTO public.pago VALUES (2, '2025-01-15', 23000.00, 2, 1);
INSERT INTO public.pago VALUES (3, '2025-02-12', 27000.00, 3, 2);
INSERT INTO public.pago VALUES (4, '2025-02-25', 30000.00, 4, 2);
INSERT INTO public.pago VALUES (5, '2025-03-12', 36000.00, 5, 3);
INSERT INTO public.pago VALUES (6, '2025-03-30', 30000.00, 6, 3);
INSERT INTO public.pago VALUES (7, '2025-04-10', 20000.00, 7, 4);
INSERT INTO public.pago VALUES (8, '2025-04-20', 24000.00, 8, 4);
INSERT INTO public.pago VALUES (9, '2025-05-15', 20000.00, 9, 5);
INSERT INTO public.pago VALUES (10, '2025-06-29', 11000.00, 10, 5);


--
-- TOC entry 3486 (class 0 OID 24914)
-- Dependencies: 212
-- Data for Name: peliculas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.peliculas VALUES (1, 'Cars', 'Infantil', 'Jeff Leston', 2003, true, 10000.00);
INSERT INTO public.peliculas VALUES (2, 'Cars2', 'Infantil', 'Jeff Leston', 2005, true, 12000.00);
INSERT INTO public.peliculas VALUES (3, 'Cars3', 'Infantil', 'Jeff Leston', 2007, true, 15000.00);
INSERT INTO public.peliculas VALUES (4, 'Avengers', 'Accion', 'Stan lee', 2010, true, 10000.00);
INSERT INTO public.peliculas VALUES (5, 'Avengers2', 'Accion', 'Stan lee', 2015, true, 15000.00);
INSERT INTO public.peliculas VALUES (6, 'Avengers3', 'Accion', 'Stan lee', 2018, true, 17000.00);
INSERT INTO public.peliculas VALUES (7, 'StarWars', 'Ficcion', 'DarkLord', 2009, true, 13000.00);
INSERT INTO public.peliculas VALUES (8, 'StarWars2', 'Ficcion', 'DarkLord', 2011, true, 15000.00);
INSERT INTO public.peliculas VALUES (9, 'StarWars3', 'Ficcion', 'DarkLord', 2015, true, 19000.00);
INSERT INTO public.peliculas VALUES (10, 'SonComoNiños', 'Comedia', 'Timbre', 2013, true, 10000.00);
INSERT INTO public.peliculas VALUES (11, 'SonComoNiños2', 'Comedia', 'Timbre', 2017, true, 11000.00);
INSERT INTO public.peliculas VALUES (12, 'Kiss', 'Romance', 'Loured', 2020, true, 9000.00);
INSERT INTO public.peliculas VALUES (13, 'Kiss2', 'Romance', 'Loured', 2022, true, 10000.00);
INSERT INTO public.peliculas VALUES (14, 'PasionGavilanes', 'Drama', 'Caracol', 1999, true, 1000.00);
INSERT INTO public.peliculas VALUES (15, 'PasionGavilanes2', 'Drama', 'Caracol', 2001, true, 5000.00);


--
-- TOC entry 3484 (class 0 OID 24891)
-- Dependencies: 210
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sucursales VALUES (1, 'Manizales');
INSERT INTO public.sucursales VALUES (2, 'Risaralda');
INSERT INTO public.sucursales VALUES (3, 'Santander');
INSERT INTO public.sucursales VALUES (4, 'Bogota');
INSERT INTO public.sucursales VALUES (5, 'Medellin');


--
-- TOC entry 3487 (class 0 OID 24920)
-- Dependencies: 213
-- Data for Name: sucursalpelicula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sucursalpelicula VALUES (1, 1);
INSERT INTO public.sucursalpelicula VALUES (4, 1);
INSERT INTO public.sucursalpelicula VALUES (7, 1);
INSERT INTO public.sucursalpelicula VALUES (2, 2);
INSERT INTO public.sucursalpelicula VALUES (3, 2);
INSERT INTO public.sucursalpelicula VALUES (5, 2);
INSERT INTO public.sucursalpelicula VALUES (6, 3);
INSERT INTO public.sucursalpelicula VALUES (9, 3);
INSERT INTO public.sucursalpelicula VALUES (11, 3);
INSERT INTO public.sucursalpelicula VALUES (15, 4);
INSERT INTO public.sucursalpelicula VALUES (8, 4);
INSERT INTO public.sucursalpelicula VALUES (12, 4);
INSERT INTO public.sucursalpelicula VALUES (10, 5);
INSERT INTO public.sucursalpelicula VALUES (13, 5);
INSERT INTO public.sucursalpelicula VALUES (14, 5);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 216
-- Name: alquiler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alquiler_id_seq', 10, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 214
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 10, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 219
-- Name: pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_seq', 10, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 211
-- Name: peliculas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peliculas_id_seq', 15, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 209
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 5, true);


--
-- TOC entry 3334 (class 2606 OID 25023)
-- Name: alquiler alquiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 24962)
-- Name: cliente cliente_contacto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_contacto_key UNIQUE (contacto);


--
-- TOC entry 3332 (class 2606 OID 24960)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 25048)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 24919)
-- Name: peliculas peliculas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 24896)
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 24898)
-- Name: sucursales sucursales_ubicacion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_ubicacion_key UNIQUE (ubicacion);


--
-- TOC entry 3339 (class 2606 OID 25024)
-- Name: alquiler alquiler_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(id);


--
-- TOC entry 3340 (class 2606 OID 25032)
-- Name: alquilerpeliculas alquilerpeliculas_idalquiler_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquilerpeliculas
    ADD CONSTRAINT alquilerpeliculas_idalquiler_fkey FOREIGN KEY (idalquiler) REFERENCES public.alquiler(id);


--
-- TOC entry 3341 (class 2606 OID 25037)
-- Name: alquilerpeliculas alquilerpeliculas_idpelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquilerpeliculas
    ADD CONSTRAINT alquilerpeliculas_idpelicula_fkey FOREIGN KEY (idpelicula) REFERENCES public.peliculas(id);


--
-- TOC entry 3342 (class 2606 OID 25049)
-- Name: pago pago_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(id);


--
-- TOC entry 3343 (class 2606 OID 25054)
-- Name: pago pago_idsucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_idsucursal_fkey FOREIGN KEY (idsucursal) REFERENCES public.sucursales(id);


--
-- TOC entry 3337 (class 2606 OID 24923)
-- Name: sucursalpelicula sucursalpelicula_idpelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursalpelicula
    ADD CONSTRAINT sucursalpelicula_idpelicula_fkey FOREIGN KEY (idpelicula) REFERENCES public.peliculas(id);


--
-- TOC entry 3338 (class 2606 OID 24928)
-- Name: sucursalpelicula sucursalpelicula_idsucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursalpelicula
    ADD CONSTRAINT sucursalpelicula_idsucursal_fkey FOREIGN KEY (idsucursal) REFERENCES public.sucursales(id);


-- Completed on 2025-05-20 22:23:11 -05

--
-- PostgreSQL database dump complete
--

