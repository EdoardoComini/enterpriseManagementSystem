--
-- PostgreSQL database dump
--

\restrict IubRnftIFhYhIVbFpZoRqCo94G74k7Sa4lYXZsQmH8blfF64X9WU3UYDRkJp2xB

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-27 17:59:37

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16439)
-- Name: dettagliordini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dettagliordini (
    id integer NOT NULL,
    idordine integer NOT NULL,
    idprodotto integer NOT NULL,
    quantita integer NOT NULL,
    prezzo numeric(10,2) NOT NULL,
    CONSTRAINT dettagliordini_quantita_check CHECK ((quantita > 0))
);


ALTER TABLE public.dettagliordini OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16438)
-- Name: dettagliordini_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dettagliordini_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dettagliordini_id_seq OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 225
-- Name: dettagliordini_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dettagliordini_id_seq OWNED BY public.dettagliordini.id;


--
-- TOC entry 228 (class 1259 OID 16462)
-- Name: logoperazioni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logoperazioni (
    id integer NOT NULL,
    idutente integer,
    operazione character varying(255),
    dataoperazione timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.logoperazioni OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16461)
-- Name: logoperazioni_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logoperazioni_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logoperazioni_id_seq OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 227
-- Name: logoperazioni_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logoperazioni_id_seq OWNED BY public.logoperazioni.id;


--
-- TOC entry 224 (class 1259 OID 16423)
-- Name: ordini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordini (
    id integer NOT NULL,
    idutente integer NOT NULL,
    dataordine timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    totale numeric(10,2) NOT NULL
);


ALTER TABLE public.ordini OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16422)
-- Name: ordini_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordini_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordini_id_seq OWNER TO postgres;

--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 223
-- Name: ordini_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordini_id_seq OWNED BY public.ordini.id;


--
-- TOC entry 222 (class 1259 OID 16408)
-- Name: prodotti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodotti (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    descrizione text,
    prezzo numeric(10,2) NOT NULL,
    quantita integer NOT NULL,
    CONSTRAINT prodotti_prezzo_check CHECK ((prezzo >= (0)::numeric)),
    CONSTRAINT prodotti_quantita_check CHECK ((quantita >= 0))
);


ALTER TABLE public.prodotti OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16407)
-- Name: prodotti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prodotti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prodotti_id_seq OWNER TO postgres;

--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 221
-- Name: prodotti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prodotti_id_seq OWNED BY public.prodotti.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: utenti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utenti (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    passwordhash character varying(255) NOT NULL,
    ruolo character varying(50) NOT NULL,
    datacreazione timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT utenti_ruolo_check CHECK (((ruolo)::text = ANY ((ARRAY['ADMIN'::character varying, 'USER'::character varying])::text[])))
);


ALTER TABLE public.utenti OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: utenti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utenti_id_seq OWNER TO postgres;

--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 219
-- Name: utenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;


--
-- TOC entry 4881 (class 2604 OID 16442)
-- Name: dettagliordini id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dettagliordini ALTER COLUMN id SET DEFAULT nextval('public.dettagliordini_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16465)
-- Name: logoperazioni id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logoperazioni ALTER COLUMN id SET DEFAULT nextval('public.logoperazioni_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16426)
-- Name: ordini id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordini ALTER COLUMN id SET DEFAULT nextval('public.ordini_id_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 16411)
-- Name: prodotti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodotti ALTER COLUMN id SET DEFAULT nextval('public.prodotti_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 16393)
-- Name: utenti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);


--
-- TOC entry 5057 (class 0 OID 16439)
-- Dependencies: 226
-- Data for Name: dettagliordini; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dettagliordini (id, idordine, idprodotto, quantita, prezzo) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 16462)
-- Dependencies: 228
-- Data for Name: logoperazioni; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logoperazioni (id, idutente, operazione, dataoperazione) FROM stdin;
\.


--
-- TOC entry 5055 (class 0 OID 16423)
-- Dependencies: 224
-- Data for Name: ordini; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordini (id, idutente, dataordine, totale) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 16408)
-- Dependencies: 222
-- Data for Name: prodotti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prodotti (id, nome, descrizione, prezzo, quantita) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: utenti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utenti (id, nome, email, passwordhash, ruolo, datacreazione) FROM stdin;
\.


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 225
-- Name: dettagliordini_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dettagliordini_id_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 227
-- Name: logoperazioni_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logoperazioni_id_seq', 1, false);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 223
-- Name: ordini_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordini_id_seq', 1, false);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 221
-- Name: prodotti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prodotti_id_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 219
-- Name: utenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utenti_id_seq', 1, false);


--
-- TOC entry 4897 (class 2606 OID 16450)
-- Name: dettagliordini dettagliordini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dettagliordini
    ADD CONSTRAINT dettagliordini_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 16469)
-- Name: logoperazioni logoperazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logoperazioni
    ADD CONSTRAINT logoperazioni_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 16432)
-- Name: ordini ordini_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordini
    ADD CONSTRAINT ordini_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 16421)
-- Name: prodotti prodotti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodotti
    ADD CONSTRAINT prodotti_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 16406)
-- Name: utenti utenti_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_email_key UNIQUE (email);


--
-- TOC entry 4891 (class 2606 OID 16404)
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);


--
-- TOC entry 4901 (class 2606 OID 16451)
-- Name: dettagliordini dettagliordini_idordine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dettagliordini
    ADD CONSTRAINT dettagliordini_idordine_fkey FOREIGN KEY (idordine) REFERENCES public.ordini(id) ON DELETE CASCADE;


--
-- TOC entry 4902 (class 2606 OID 16456)
-- Name: dettagliordini dettagliordini_idprodotto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dettagliordini
    ADD CONSTRAINT dettagliordini_idprodotto_fkey FOREIGN KEY (idprodotto) REFERENCES public.prodotti(id);


--
-- TOC entry 4900 (class 2606 OID 16433)
-- Name: ordini ordini_idutente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordini
    ADD CONSTRAINT ordini_idutente_fkey FOREIGN KEY (idutente) REFERENCES public.utenti(id);


-- Completed on 2026-01-27 17:59:37

--
-- PostgreSQL database dump complete
--

\unrestrict IubRnftIFhYhIVbFpZoRqCo94G74k7Sa4lYXZsQmH8blfF64X9WU3UYDRkJp2xB

