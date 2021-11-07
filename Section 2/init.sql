--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

-- Started on 2021-11-07 12:36:15

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
-- TOC entry 202 (class 1259 OID 18365)
-- Name: Car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Car" (
    id numeric NOT NULL,
    sales_person_id numeric NOT NULL,
    manufacturer text,
    model_name text,
    serial_number numeric,
    weight double precision,
    price double precision,
    manu_id numeric
);


ALTER TABLE public."Car" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18428)
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    id numeric NOT NULL,
    first_name text,
    last_name text,
    phone numeric
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18373)
-- Name: Sales_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sales_person" (
    sales_person_id numeric NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE public."Sales_person" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18459)
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturer (
    id numeric NOT NULL,
    name text
);


ALTER TABLE public.manufacturer OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18436)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id numeric NOT NULL,
    sales_person_id numeric,
    customer_id numeric,
    car_id numeric,
    date date,
    quantity numeric
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 2847 (class 0 OID 18365)
-- Dependencies: 202
-- Data for Name: Car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Car" (id, sales_person_id, manufacturer, model_name, serial_number, weight, price, manu_id) FROM stdin;
1	1	Honda	ABC	123	100.1	10000.12	1
2	2	Hyundai	test1	5643	102.3	100003.3	5
3	3	Honda\n	edfas	5569978	1000	100000	1
4	4	Mercendes	aef	56563	34123	10000	3
5	5	Rolls Royce	ttt	55563	6562	122000	2
6	6	tesla	asdfasdfsdf	569877	1111	99999	4
\.


--
-- TOC entry 2849 (class 0 OID 18428)
-- Dependencies: 204
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (id, first_name, last_name, phone) FROM stdin;
1	james	wong	89556114
2	ivan	lee	88741125
3	faith	tan	96332214
4	jean	wee	85632214
5	lee	min	96687745
\.


--
-- TOC entry 2848 (class 0 OID 18373)
-- Dependencies: 203
-- Data for Name: Sales_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sales_person" (sales_person_id, first_name, last_name) FROM stdin;
1	samuel	ong
2	jsaon	sia
3	tiffany	yong
4	bob	kang
5	tang	yong
6	timothy	tee
\.


--
-- TOC entry 2851 (class 0 OID 18459)
-- Dependencies: 206
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturer (id, name) FROM stdin;
1	honda
2	rolls royce
3	mercendes
4	tesla
5	hyundai
\.


--
-- TOC entry 2850 (class 0 OID 18436)
-- Dependencies: 205
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, sales_person_id, customer_id, car_id, date, quantity) FROM stdin;
1	1	1	1	2021-11-20	1
3	3	3	3	2021-11-01	5
4	4	4	4	2021-11-15	2
5	5	5	5	2021-11-01	12
6	1	4	1	2021-11-03	4
2	6	2	6	2021-10-11	1
\.


--
-- TOC entry 2707 (class 2606 OID 18372)
-- Name: Car Car_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 18435)
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 18380)
-- Name: Sales_person Sales_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sales_person"
    ADD CONSTRAINT "Sales_person_pkey" PRIMARY KEY (sales_person_id);


--
-- TOC entry 2715 (class 2606 OID 18466)
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 18443)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 18454)
-- Name: transaction car_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT car_id FOREIGN KEY (car_id) REFERENCES public."Car"(id);


--
-- TOC entry 2719 (class 2606 OID 18449)
-- Name: transaction customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES public."Customer"(id);


--
-- TOC entry 2717 (class 2606 OID 18472)
-- Name: Car manu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT manu_id FOREIGN KEY (manu_id) REFERENCES public.manufacturer(id) NOT VALID;


--
-- TOC entry 2716 (class 2606 OID 18381)
-- Name: Car sales_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT sales_person_id FOREIGN KEY (sales_person_id) REFERENCES public."Sales_person"(sales_person_id) NOT VALID;


--
-- TOC entry 2718 (class 2606 OID 18444)
-- Name: transaction sales_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT sales_person_id FOREIGN KEY (sales_person_id) REFERENCES public."Sales_person"(sales_person_id);


-- Completed on 2021-11-07 12:36:15

--
-- PostgreSQL database dump complete
--

