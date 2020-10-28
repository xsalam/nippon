--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4

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
-- Name: sales_person; Type: TABLE; Schema: public; Owner: nippon
--

CREATE TABLE public.sales_person (
    id integer NOT NULL,
    store_name character varying(50) NOT NULL,
    person_name character varying(50) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(225) NOT NULL,
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE public.sales_person OWNER TO nippon;

--
-- Name: sales_person_id_seq; Type: SEQUENCE; Schema: public; Owner: nippon
--

CREATE SEQUENCE public.sales_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_person_id_seq OWNER TO nippon;

--
-- Name: sales_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nippon
--

ALTER SEQUENCE public.sales_person_id_seq OWNED BY public.sales_person.id;


--
-- Name: sales_product; Type: TABLE; Schema: public; Owner: nippon
--

CREATE TABLE public.sales_product (
    id integer NOT NULL,
    product_name character varying NOT NULL,
    product_size integer NOT NULL,
    product_base character varying NOT NULL,
    product_stock integer,
    updated_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.sales_product OWNER TO nippon;

--
-- Name: sales_product_id_seq; Type: SEQUENCE; Schema: public; Owner: nippon
--

CREATE SEQUENCE public.sales_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_product_id_seq OWNER TO nippon;

--
-- Name: sales_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nippon
--

ALTER SEQUENCE public.sales_product_id_seq OWNED BY public.sales_product.id;


--
-- Name: sales_transaction; Type: TABLE; Schema: public; Owner: nippon
--

CREATE TABLE public.sales_transaction (
    id integer NOT NULL,
    sales_person_id integer NOT NULL,
    sales_product_id integer NOT NULL,
    quantity integer NOT NULL,
    sales_time timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.sales_transaction OWNER TO nippon;

--
-- Name: sales_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: nippon
--

CREATE SEQUENCE public.sales_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_transaction_id_seq OWNER TO nippon;

--
-- Name: sales_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nippon
--

ALTER SEQUENCE public.sales_transaction_id_seq OWNED BY public.sales_transaction.id;


--
-- Name: sales_person id; Type: DEFAULT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_person ALTER COLUMN id SET DEFAULT nextval('public.sales_person_id_seq'::regclass);


--
-- Name: sales_product id; Type: DEFAULT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_product ALTER COLUMN id SET DEFAULT nextval('public.sales_product_id_seq'::regclass);


--
-- Name: sales_transaction id; Type: DEFAULT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_transaction ALTER COLUMN id SET DEFAULT nextval('public.sales_transaction_id_seq'::regclass);


--
-- Data for Name: sales_person; Type: TABLE DATA; Schema: public; Owner: nippon
--

COPY public.sales_person (id, store_name, person_name, email, password, created_on) FROM stdin;
\.


--
-- Data for Name: sales_product; Type: TABLE DATA; Schema: public; Owner: nippon
--

COPY public.sales_product (id, product_name, product_size, product_base, product_stock, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: sales_transaction; Type: TABLE DATA; Schema: public; Owner: nippon
--

COPY public.sales_transaction (id, sales_person_id, sales_product_id, quantity, sales_time) FROM stdin;
\.


--
-- Name: sales_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nippon
--

SELECT pg_catalog.setval('public.sales_person_id_seq', 1, false);


--
-- Name: sales_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nippon
--

SELECT pg_catalog.setval('public.sales_product_id_seq', 6, true);


--
-- Name: sales_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nippon
--

SELECT pg_catalog.setval('public.sales_transaction_id_seq', 1, false);


--
-- Name: sales_person sales_person_email_key; Type: CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_email_key UNIQUE (email);


--
-- Name: sales_person sales_person_pkey; Type: CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_pkey PRIMARY KEY (id);


--
-- Name: sales_product sales_product_pk; Type: CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_product
    ADD CONSTRAINT sales_product_pk PRIMARY KEY (id);


--
-- Name: sales_transaction sales_transaction_pk; Type: CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT sales_transaction_pk PRIMARY KEY (id);


--
-- Name: sales_transaction sales_transaction_fk_person; Type: FK CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT sales_transaction_fk_person FOREIGN KEY (sales_person_id) REFERENCES public.sales_person(id);


--
-- Name: sales_transaction sales_transaction_fk_product; Type: FK CONSTRAINT; Schema: public; Owner: nippon
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT sales_transaction_fk_product FOREIGN KEY (sales_product_id) REFERENCES public.sales_product(id);


--
-- PostgreSQL database dump complete
--

