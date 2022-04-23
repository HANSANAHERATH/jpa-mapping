--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md526376a31bc2249a792efbc2bbae6a422';






\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 11.14

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 11.14

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
-- Name: mapping; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mapping WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE mapping OWNER TO postgres;

\connect mapping

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
-- Name: criteria_search; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA criteria_search;


ALTER SCHEMA criteria_search OWNER TO postgres;

--
-- Name: many_to_many; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA many_to_many;


ALTER SCHEMA many_to_many OWNER TO postgres;

--
-- Name: many_to_one; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA many_to_one;


ALTER SCHEMA many_to_one OWNER TO postgres;

--
-- Name: one_to_one; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA one_to_one;


ALTER SCHEMA one_to_one OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book; Type: TABLE; Schema: criteria_search; Owner: postgres
--

CREATE TABLE criteria_search.book (
    book_id bigint NOT NULL,
    isbn bigint,
    published_date date,
    rating double precision,
    title character varying(255) NOT NULL,
    total_pages integer
);


ALTER TABLE criteria_search.book OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: criteria_search; Owner: postgres
--

CREATE SEQUENCE criteria_search.book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE criteria_search.book_book_id_seq OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: criteria_search; Owner: postgres
--

ALTER SEQUENCE criteria_search.book_book_id_seq OWNED BY criteria_search.book.book_id;


--
-- Name: post; Type: TABLE; Schema: many_to_many; Owner: postgres
--

CREATE TABLE many_to_many.post (
    post_id bigint NOT NULL,
    published_date date,
    title character varying(255) NOT NULL
);


ALTER TABLE many_to_many.post OWNER TO postgres;

--
-- Name: post_details; Type: TABLE; Schema: many_to_many; Owner: postgres
--

CREATE TABLE many_to_many.post_details (
    post_detail_id bigint NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE many_to_many.post_details OWNER TO postgres;

--
-- Name: post_details_mapping; Type: TABLE; Schema: many_to_many; Owner: postgres
--

CREATE TABLE many_to_many.post_details_mapping (
    post_id bigint NOT NULL,
    post_detail_id bigint NOT NULL
);


ALTER TABLE many_to_many.post_details_mapping OWNER TO postgres;

--
-- Name: post_details_post_detail_id_seq; Type: SEQUENCE; Schema: many_to_many; Owner: postgres
--

CREATE SEQUENCE many_to_many.post_details_post_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE many_to_many.post_details_post_detail_id_seq OWNER TO postgres;

--
-- Name: post_details_post_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: many_to_many; Owner: postgres
--

ALTER SEQUENCE many_to_many.post_details_post_detail_id_seq OWNED BY many_to_many.post_details.post_detail_id;


--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: many_to_many; Owner: postgres
--

CREATE SEQUENCE many_to_many.post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE many_to_many.post_post_id_seq OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: many_to_many; Owner: postgres
--

ALTER SEQUENCE many_to_many.post_post_id_seq OWNED BY many_to_many.post.post_id;


--
-- Name: mobile_no; Type: TABLE; Schema: many_to_one; Owner: postgres
--

CREATE TABLE many_to_one.mobile_no (
    mobile_id bigint NOT NULL,
    mobile_no character varying(255) NOT NULL,
    user_id bigint
);


ALTER TABLE many_to_one.mobile_no OWNER TO postgres;

--
-- Name: mobile_no_mobile_id_seq; Type: SEQUENCE; Schema: many_to_one; Owner: postgres
--

CREATE SEQUENCE many_to_one.mobile_no_mobile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE many_to_one.mobile_no_mobile_id_seq OWNER TO postgres;

--
-- Name: mobile_no_mobile_id_seq; Type: SEQUENCE OWNED BY; Schema: many_to_one; Owner: postgres
--

ALTER SEQUENCE many_to_one.mobile_no_mobile_id_seq OWNED BY many_to_one.mobile_no.mobile_id;


--
-- Name: user; Type: TABLE; Schema: many_to_one; Owner: postgres
--

CREATE TABLE many_to_one."user" (
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE many_to_one."user" OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: many_to_one; Owner: postgres
--

CREATE SEQUENCE many_to_one.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE many_to_one.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: many_to_one; Owner: postgres
--

ALTER SEQUENCE many_to_one.user_user_id_seq OWNED BY many_to_one."user".user_id;


--
-- Name: book; Type: TABLE; Schema: one_to_one; Owner: postgres
--

CREATE TABLE one_to_one.book (
    book_id bigint NOT NULL,
    isbn bigint,
    published_date date,
    rating double precision,
    title character varying(255) NOT NULL,
    total_pages integer,
    photo_id bigint NOT NULL
);


ALTER TABLE one_to_one.book OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: one_to_one; Owner: postgres
--

CREATE SEQUENCE one_to_one.book_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE one_to_one.book_book_id_seq OWNER TO postgres;

--
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: one_to_one; Owner: postgres
--

ALTER SEQUENCE one_to_one.book_book_id_seq OWNED BY one_to_one.book.book_id;


--
-- Name: photo; Type: TABLE; Schema: one_to_one; Owner: postgres
--

CREATE TABLE one_to_one.photo (
    photo_id bigint NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE one_to_one.photo OWNER TO postgres;

--
-- Name: photo_photo_id_seq; Type: SEQUENCE; Schema: one_to_one; Owner: postgres
--

CREATE SEQUENCE one_to_one.photo_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE one_to_one.photo_photo_id_seq OWNER TO postgres;

--
-- Name: photo_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: one_to_one; Owner: postgres
--

ALTER SEQUENCE one_to_one.photo_photo_id_seq OWNED BY one_to_one.photo.photo_id;


--
-- Name: book book_id; Type: DEFAULT; Schema: criteria_search; Owner: postgres
--

ALTER TABLE ONLY criteria_search.book ALTER COLUMN book_id SET DEFAULT nextval('criteria_search.book_book_id_seq'::regclass);


--
-- Name: post post_id; Type: DEFAULT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post ALTER COLUMN post_id SET DEFAULT nextval('many_to_many.post_post_id_seq'::regclass);


--
-- Name: post_details post_detail_id; Type: DEFAULT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post_details ALTER COLUMN post_detail_id SET DEFAULT nextval('many_to_many.post_details_post_detail_id_seq'::regclass);


--
-- Name: mobile_no mobile_id; Type: DEFAULT; Schema: many_to_one; Owner: postgres
--

ALTER TABLE ONLY many_to_one.mobile_no ALTER COLUMN mobile_id SET DEFAULT nextval('many_to_one.mobile_no_mobile_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: many_to_one; Owner: postgres
--

ALTER TABLE ONLY many_to_one."user" ALTER COLUMN user_id SET DEFAULT nextval('many_to_one.user_user_id_seq'::regclass);


--
-- Name: book book_id; Type: DEFAULT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.book ALTER COLUMN book_id SET DEFAULT nextval('one_to_one.book_book_id_seq'::regclass);


--
-- Name: photo photo_id; Type: DEFAULT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.photo ALTER COLUMN photo_id SET DEFAULT nextval('one_to_one.photo_photo_id_seq'::regclass);


--
-- Data for Name: book; Type: TABLE DATA; Schema: criteria_search; Owner: postgres
--

INSERT INTO criteria_search.book VALUES (1, 1, '2020-11-11', 10.5, 'title', 100);


--
-- Data for Name: post; Type: TABLE DATA; Schema: many_to_many; Owner: postgres
--

INSERT INTO many_to_many.post VALUES (6, '2022-04-23', 'title 510');
INSERT INTO many_to_many.post VALUES (8, '2022-04-23', 'title 685');
INSERT INTO many_to_many.post VALUES (9, '2022-04-23', 'title 887');
INSERT INTO many_to_many.post VALUES (10, '2022-04-23', 'title 317');
INSERT INTO many_to_many.post VALUES (7, '2022-04-23', 'new Title');
INSERT INTO many_to_many.post VALUES (5, '2022-04-23', 'NEW TITLE1');
INSERT INTO many_to_many.post VALUES (11, '2022-04-23', 'title 828');
INSERT INTO many_to_many.post VALUES (12, '2022-04-23', 'title 504');
INSERT INTO many_to_many.post VALUES (13, '2022-04-23', 'title 480');
INSERT INTO many_to_many.post VALUES (14, '2022-04-23', 'title 988');
INSERT INTO many_to_many.post VALUES (15, '2022-04-23', 'title 191');
INSERT INTO many_to_many.post VALUES (16, '2022-04-23', 'title 170');
INSERT INTO many_to_many.post VALUES (17, '2022-04-23', 'title 432');
INSERT INTO many_to_many.post VALUES (18, '2022-04-23', 'title 687');


--
-- Data for Name: post_details; Type: TABLE DATA; Schema: many_to_many; Owner: postgres
--

INSERT INTO many_to_many.post_details VALUES (9, 'URL 16');
INSERT INTO many_to_many.post_details VALUES (11, 'URL 510');
INSERT INTO many_to_many.post_details VALUES (12, 'URL 131');
INSERT INTO many_to_many.post_details VALUES (15, 'URL 685');
INSERT INTO many_to_many.post_details VALUES (16, 'URL 340');
INSERT INTO many_to_many.post_details VALUES (17, 'URL 887');
INSERT INTO many_to_many.post_details VALUES (18, 'URL 908');
INSERT INTO many_to_many.post_details VALUES (19, 'URL 317');
INSERT INTO many_to_many.post_details VALUES (20, 'URL 217');
INSERT INTO many_to_many.post_details VALUES (13, 'new URL');
INSERT INTO many_to_many.post_details VALUES (10, 'NEW URL1');
INSERT INTO many_to_many.post_details VALUES (21, 'URL 828');
INSERT INTO many_to_many.post_details VALUES (22, 'URL 27');
INSERT INTO many_to_many.post_details VALUES (14, 'new URL');
INSERT INTO many_to_many.post_details VALUES (23, 'URL 504');
INSERT INTO many_to_many.post_details VALUES (24, 'URL 596');
INSERT INTO many_to_many.post_details VALUES (25, 'URL 480');
INSERT INTO many_to_many.post_details VALUES (26, 'URL 109');
INSERT INTO many_to_many.post_details VALUES (27, 'URL 988');
INSERT INTO many_to_many.post_details VALUES (28, 'URL 170');
INSERT INTO many_to_many.post_details VALUES (29, 'URL 191');
INSERT INTO many_to_many.post_details VALUES (30, 'URL 309');
INSERT INTO many_to_many.post_details VALUES (31, 'URL 170');
INSERT INTO many_to_many.post_details VALUES (32, 'URL 428');
INSERT INTO many_to_many.post_details VALUES (33, 'URL 432');
INSERT INTO many_to_many.post_details VALUES (34, 'URL 842');
INSERT INTO many_to_many.post_details VALUES (35, 'URL 687');
INSERT INTO many_to_many.post_details VALUES (36, 'URL 253');


--
-- Data for Name: post_details_mapping; Type: TABLE DATA; Schema: many_to_many; Owner: postgres
--

INSERT INTO many_to_many.post_details_mapping VALUES (5, 9);
INSERT INTO many_to_many.post_details_mapping VALUES (5, 10);
INSERT INTO many_to_many.post_details_mapping VALUES (6, 11);
INSERT INTO many_to_many.post_details_mapping VALUES (6, 12);
INSERT INTO many_to_many.post_details_mapping VALUES (7, 13);
INSERT INTO many_to_many.post_details_mapping VALUES (7, 14);
INSERT INTO many_to_many.post_details_mapping VALUES (8, 15);
INSERT INTO many_to_many.post_details_mapping VALUES (8, 16);
INSERT INTO many_to_many.post_details_mapping VALUES (9, 17);
INSERT INTO many_to_many.post_details_mapping VALUES (9, 18);
INSERT INTO many_to_many.post_details_mapping VALUES (10, 19);
INSERT INTO many_to_many.post_details_mapping VALUES (10, 20);
INSERT INTO many_to_many.post_details_mapping VALUES (11, 21);
INSERT INTO many_to_many.post_details_mapping VALUES (11, 22);
INSERT INTO many_to_many.post_details_mapping VALUES (12, 23);
INSERT INTO many_to_many.post_details_mapping VALUES (12, 24);
INSERT INTO many_to_many.post_details_mapping VALUES (13, 25);
INSERT INTO many_to_many.post_details_mapping VALUES (13, 26);
INSERT INTO many_to_many.post_details_mapping VALUES (14, 27);
INSERT INTO many_to_many.post_details_mapping VALUES (14, 28);
INSERT INTO many_to_many.post_details_mapping VALUES (15, 29);
INSERT INTO many_to_many.post_details_mapping VALUES (15, 30);
INSERT INTO many_to_many.post_details_mapping VALUES (16, 31);
INSERT INTO many_to_many.post_details_mapping VALUES (16, 32);
INSERT INTO many_to_many.post_details_mapping VALUES (17, 33);
INSERT INTO many_to_many.post_details_mapping VALUES (17, 34);
INSERT INTO many_to_many.post_details_mapping VALUES (18, 35);
INSERT INTO many_to_many.post_details_mapping VALUES (18, 36);


--
-- Data for Name: mobile_no; Type: TABLE DATA; Schema: many_to_one; Owner: postgres
--

INSERT INTO many_to_one.mobile_no VALUES (1, 'Mobile 644', 1);
INSERT INTO many_to_one.mobile_no VALUES (2, 'Mobile 184', 1);
INSERT INTO many_to_one.mobile_no VALUES (5, 'Mobile 953', 3);
INSERT INTO many_to_one.mobile_no VALUES (6, 'Mobile 982', 3);
INSERT INTO many_to_one.mobile_no VALUES (7, 'Mobile 903', 4);
INSERT INTO many_to_one.mobile_no VALUES (8, 'Mobile 342', 4);
INSERT INTO many_to_one.mobile_no VALUES (3, 'new Mobile', 2);
INSERT INTO many_to_one.mobile_no VALUES (4, 'Kamals No', 2);
INSERT INTO many_to_one.mobile_no VALUES (9, 'Mobile 164', 5);
INSERT INTO many_to_one.mobile_no VALUES (10, 'Mobile 937', 5);
INSERT INTO many_to_one.mobile_no VALUES (11, 'Mobile 893', 6);
INSERT INTO many_to_one.mobile_no VALUES (12, 'Mobile 810', 6);
INSERT INTO many_to_one.mobile_no VALUES (13, 'Mobile 131', 7);
INSERT INTO many_to_one.mobile_no VALUES (14, 'Mobile 629', 7);
INSERT INTO many_to_one.mobile_no VALUES (15, 'Mobile 871', 8);
INSERT INTO many_to_one.mobile_no VALUES (16, 'Mobile 777', 8);
INSERT INTO many_to_one.mobile_no VALUES (17, 'Mobile 802', 9);
INSERT INTO many_to_one.mobile_no VALUES (18, 'Mobile 818', 9);
INSERT INTO many_to_one.mobile_no VALUES (19, 'Mobile 266', 10);
INSERT INTO many_to_one.mobile_no VALUES (20, 'Mobile 410', 10);
INSERT INTO many_to_one.mobile_no VALUES (21, 'Mobile 624', 11);
INSERT INTO many_to_one.mobile_no VALUES (22, 'Mobile 403', 11);
INSERT INTO many_to_one.mobile_no VALUES (23, 'Mobile 637', 12);
INSERT INTO many_to_one.mobile_no VALUES (24, 'Mobile 101', 12);
INSERT INTO many_to_one.mobile_no VALUES (25, 'Mobile 584', 13);
INSERT INTO many_to_one.mobile_no VALUES (26, 'Mobile 348', 13);


--
-- Data for Name: user; Type: TABLE DATA; Schema: many_to_one; Owner: postgres
--

INSERT INTO many_to_one."user" VALUES (1, 'name 824');
INSERT INTO many_to_one."user" VALUES (3, 'name 917');
INSERT INTO many_to_one."user" VALUES (4, 'name 289');
INSERT INTO many_to_one."user" VALUES (5, 'name 647');
INSERT INTO many_to_one."user" VALUES (6, 'name 11');
INSERT INTO many_to_one."user" VALUES (7, 'name 460');
INSERT INTO many_to_one."user" VALUES (8, 'name 68');
INSERT INTO many_to_one."user" VALUES (9, 'name 8');
INSERT INTO many_to_one."user" VALUES (10, 'name 330');
INSERT INTO many_to_one."user" VALUES (11, 'name 283');
INSERT INTO many_to_one."user" VALUES (12, 'name 654');
INSERT INTO many_to_one."user" VALUES (13, 'name 659');
INSERT INTO many_to_one."user" VALUES (2, 'Lanka');


--
-- Data for Name: book; Type: TABLE DATA; Schema: one_to_one; Owner: postgres
--

INSERT INTO one_to_one.book VALUES (3, 150, '2022-04-23', 150, 'title150', 150, 3);
INSERT INTO one_to_one.book VALUES (4, 614, '2022-04-23', 614, 'title614', 614, 4);
INSERT INTO one_to_one.book VALUES (5, 100, '2022-04-23', 100, 'title100', 100, 5);
INSERT INTO one_to_one.book VALUES (6, 396, '2022-04-23', 396, 'title396', 396, 6);
INSERT INTO one_to_one.book VALUES (7, 117, '2022-04-23', 117, 'title117', 117, 7);
INSERT INTO one_to_one.book VALUES (8, 320, '2022-04-23', 320, 'title320', 320, 8);
INSERT INTO one_to_one.book VALUES (9, 200, '2022-04-23', 200, 'title200', 200, 9);
INSERT INTO one_to_one.book VALUES (10, 567, '2022-04-23', 567, 'title567', 567, 10);
INSERT INTO one_to_one.book VALUES (11, 146, '2022-04-23', 146, 'title146', 146, 11);
INSERT INTO one_to_one.book VALUES (12, 246, '2022-04-23', 246, 'title246', 246, 12);
INSERT INTO one_to_one.book VALUES (13, 356, '2022-04-23', 356, 'title356', 356, 13);
INSERT INTO one_to_one.book VALUES (14, 597, '2022-04-23', 597, 'title597', 597, 14);
INSERT INTO one_to_one.book VALUES (15, 574, '2022-04-23', 574, 'title574', 574, 15);
INSERT INTO one_to_one.book VALUES (16, 845, '2022-04-23', 845, 'title845', 845, 16);
INSERT INTO one_to_one.book VALUES (17, 454, '2022-04-23', 454, 'title454', 454, 17);
INSERT INTO one_to_one.book VALUES (18, 572, '2022-04-23', 572, 'title572', 572, 18);
INSERT INTO one_to_one.book VALUES (19, 777, '2022-04-23', 777, 'title777', 777, 19);
INSERT INTO one_to_one.book VALUES (20, 541, '2022-04-23', 541, 'title541', 541, 20);
INSERT INTO one_to_one.book VALUES (21, 834, '2022-04-23', 834, 'title834', 834, 21);


--
-- Data for Name: photo; Type: TABLE DATA; Schema: one_to_one; Owner: postgres
--

INSERT INTO one_to_one.photo VALUES (3, 'URL150');
INSERT INTO one_to_one.photo VALUES (4, 'URL614');
INSERT INTO one_to_one.photo VALUES (5, 'URL100');
INSERT INTO one_to_one.photo VALUES (6, 'URL396');
INSERT INTO one_to_one.photo VALUES (7, 'URL117');
INSERT INTO one_to_one.photo VALUES (8, 'URL320');
INSERT INTO one_to_one.photo VALUES (9, 'URL200');
INSERT INTO one_to_one.photo VALUES (10, 'URL567');
INSERT INTO one_to_one.photo VALUES (11, 'URL146');
INSERT INTO one_to_one.photo VALUES (12, 'URL246');
INSERT INTO one_to_one.photo VALUES (13, 'URL356');
INSERT INTO one_to_one.photo VALUES (14, 'URL597');
INSERT INTO one_to_one.photo VALUES (15, 'URL574');
INSERT INTO one_to_one.photo VALUES (16, 'URL845');
INSERT INTO one_to_one.photo VALUES (17, 'URL454');
INSERT INTO one_to_one.photo VALUES (18, 'URL572');
INSERT INTO one_to_one.photo VALUES (19, 'URL777');
INSERT INTO one_to_one.photo VALUES (20, 'URL541');
INSERT INTO one_to_one.photo VALUES (21, 'URL834');


--
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: criteria_search; Owner: postgres
--

SELECT pg_catalog.setval('criteria_search.book_book_id_seq', 1, true);


--
-- Name: post_details_post_detail_id_seq; Type: SEQUENCE SET; Schema: many_to_many; Owner: postgres
--

SELECT pg_catalog.setval('many_to_many.post_details_post_detail_id_seq', 36, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: many_to_many; Owner: postgres
--

SELECT pg_catalog.setval('many_to_many.post_post_id_seq', 18, true);


--
-- Name: mobile_no_mobile_id_seq; Type: SEQUENCE SET; Schema: many_to_one; Owner: postgres
--

SELECT pg_catalog.setval('many_to_one.mobile_no_mobile_id_seq', 26, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: many_to_one; Owner: postgres
--

SELECT pg_catalog.setval('many_to_one.user_user_id_seq', 13, true);


--
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: one_to_one; Owner: postgres
--

SELECT pg_catalog.setval('one_to_one.book_book_id_seq', 21, true);


--
-- Name: photo_photo_id_seq; Type: SEQUENCE SET; Schema: one_to_one; Owner: postgres
--

SELECT pg_catalog.setval('one_to_one.photo_photo_id_seq', 21, true);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: criteria_search; Owner: postgres
--

ALTER TABLE ONLY criteria_search.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- Name: post_details post_details_pkey; Type: CONSTRAINT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post_details
    ADD CONSTRAINT post_details_pkey PRIMARY KEY (post_detail_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- Name: mobile_no mobile_no_pkey; Type: CONSTRAINT; Schema: many_to_one; Owner: postgres
--

ALTER TABLE ONLY many_to_one.mobile_no
    ADD CONSTRAINT mobile_no_pkey PRIMARY KEY (mobile_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: many_to_one; Owner: postgres
--

ALTER TABLE ONLY many_to_one."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (photo_id);


--
-- Name: book uk_iht4edf5qjsosvs5wh329vsis; Type: CONSTRAINT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.book
    ADD CONSTRAINT uk_iht4edf5qjsosvs5wh329vsis UNIQUE (photo_id);


--
-- Name: post_details_mapping fk2w4di03hv1444m2p4jxpwwu7; Type: FK CONSTRAINT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post_details_mapping
    ADD CONSTRAINT fk2w4di03hv1444m2p4jxpwwu7 FOREIGN KEY (post_detail_id) REFERENCES many_to_many.post_details(post_detail_id);


--
-- Name: post_details_mapping fkdry569pkb4vynvl5o2l8mtigl; Type: FK CONSTRAINT; Schema: many_to_many; Owner: postgres
--

ALTER TABLE ONLY many_to_many.post_details_mapping
    ADD CONSTRAINT fkdry569pkb4vynvl5o2l8mtigl FOREIGN KEY (post_id) REFERENCES many_to_many.post(post_id);


--
-- Name: mobile_no fka0rfhlcr4ptc8jt566pa8b97i; Type: FK CONSTRAINT; Schema: many_to_one; Owner: postgres
--

ALTER TABLE ONLY many_to_one.mobile_no
    ADD CONSTRAINT fka0rfhlcr4ptc8jt566pa8b97i FOREIGN KEY (user_id) REFERENCES many_to_one."user"(user_id);


--
-- Name: book fkc4kkvusmioiqpnhuhic8wsjsv; Type: FK CONSTRAINT; Schema: one_to_one; Owner: postgres
--

ALTER TABLE ONLY one_to_one.book
    ADD CONSTRAINT fkc4kkvusmioiqpnhuhic8wsjsv FOREIGN KEY (photo_id) REFERENCES one_to_one.photo(photo_id);


--
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 11.14

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
-- Name: railway; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA railway;


ALTER SCHEMA railway OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: goods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods (
    id bigint NOT NULL,
    date date,
    description character varying(255),
    is_deleted boolean NOT NULL,
    min_quantity real NOT NULL,
    name character varying(255),
    total_quantity real NOT NULL,
    category bigint,
    unit bigint
);


ALTER TABLE public.goods OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goods_id_seq OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goods_id_seq OWNED BY public.goods.id;


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id bigint NOT NULL,
    date date,
    description character varying(255),
    handover_to character varying(255),
    inventory_type character varying(10),
    quantity real NOT NULL,
    shed_store_no character varying(255),
    supervisor_name character varying(255),
    "time" time without time zone,
    goods_id bigint,
    unit_id bigint
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.roles OWNER TO postgres;

--
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
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_details (
    id bigint NOT NULL,
    email character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.user_details OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_id_seq OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE railway.category OWNER TO postgres;

--
-- Name: goods; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.goods (
    id bigint NOT NULL,
    date date,
    description character varying(255),
    is_deleted boolean NOT NULL,
    min_quantity real NOT NULL,
    name character varying(255),
    total_quantity real NOT NULL,
    category bigint,
    unit bigint
);


ALTER TABLE railway.goods OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: railway; Owner: postgres
--

CREATE SEQUENCE railway.goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE railway.goods_id_seq OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE OWNED BY; Schema: railway; Owner: postgres
--

ALTER SEQUENCE railway.goods_id_seq OWNED BY railway.goods.id;


--
-- Name: inventory; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.inventory (
    id bigint NOT NULL,
    date date,
    description character varying(255),
    handover_to character varying(255),
    inventory_type character varying(10),
    quantity real NOT NULL,
    shed_store_no character varying(255),
    supervisor_name character varying(255),
    "time" time without time zone,
    goods_id bigint,
    unit_id bigint
);


ALTER TABLE railway.inventory OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: railway; Owner: postgres
--

CREATE SEQUENCE railway.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE railway.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: railway; Owner: postgres
--

ALTER SEQUENCE railway.inventory_id_seq OWNED BY railway.inventory.id;


--
-- Name: roles; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.roles (
    id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE railway.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: railway; Owner: postgres
--

CREATE SEQUENCE railway.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE railway.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: railway; Owner: postgres
--

ALTER SEQUENCE railway.roles_id_seq OWNED BY railway.roles.id;


--
-- Name: units; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.units (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE railway.units OWNER TO postgres;

--
-- Name: user_details; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.user_details (
    id bigint NOT NULL,
    email character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE railway.user_details OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: railway; Owner: postgres
--

CREATE SEQUENCE railway.user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE railway.user_details_id_seq OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: railway; Owner: postgres
--

ALTER SEQUENCE railway.user_details_id_seq OWNED BY railway.user_details.id;


--
-- Name: user_roles; Type: TABLE; Schema: railway; Owner: postgres
--

CREATE TABLE railway.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE railway.user_roles OWNER TO postgres;

--
-- Name: goods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods ALTER COLUMN id SET DEFAULT nextval('public.goods_id_seq'::regclass);


--
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);


--
-- Name: goods id; Type: DEFAULT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.goods ALTER COLUMN id SET DEFAULT nextval('railway.goods_id_seq'::regclass);


--
-- Name: inventory id; Type: DEFAULT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.inventory ALTER COLUMN id SET DEFAULT nextval('railway.inventory_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.roles ALTER COLUMN id SET DEFAULT nextval('railway.roles_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.user_details ALTER COLUMN id SET DEFAULT nextval('railway.user_details_id_seq'::regclass);


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: category; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.category VALUES (1, 'category1');
INSERT INTO railway.category VALUES (2, 'category2');


--
-- Data for Name: goods; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.goods VALUES (4, '2021-12-30', 'nope', false, 10, 'test2', 0, 1, 1);
INSERT INTO railway.goods VALUES (2, '2021-12-31', 'abc', false, 11, 'test5', 0, 2, 2);
INSERT INTO railway.goods VALUES (6, '2021-12-30', 'note', true, 8, 'abc', 0, 1, 1);
INSERT INTO railway.goods VALUES (7, '2021-12-30', 'ddd', false, 10, 'cde', 0, 2, 2);
INSERT INTO railway.goods VALUES (3, '2021-12-30', 'nope', false, 10, 'test1', 1975, 1, 1);
INSERT INTO railway.goods VALUES (8, '2021-12-31', '2121', false, 10, 'ds', 1000, 1, 1);
INSERT INTO railway.goods VALUES (9, '2022-01-21', 'gfgfgfgfg', false, 10, 'bbbbbbbbbbbbb', 13000, 1, 1);


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.inventory VALUES (1, '2021-12-30', 'gfg', 'fdfd', 'GOODS_IN', 100, 'gf', 'fdfd', '15:14:58', 2, 2);
INSERT INTO railway.inventory VALUES (2, '2021-12-30', 'gfg', 'fdfd', 'GOODS_OUT', 100, 'gf', 'fdfd', '15:15:44', 2, 2);
INSERT INTO railway.inventory VALUES (3, '2021-12-30', 'gfg', 'fdfd', 'GOODS_IN', 100, 'gf', 'fdfd', '15:18:03', 2, 2);
INSERT INTO railway.inventory VALUES (4, '2021-12-30', 'gfg', 'fdfd', 'GOODS_IN', 1000, 'gf', 'fdfd', '15:20:34', 3, 1);
INSERT INTO railway.inventory VALUES (5, '2021-12-30', 'gfg', 'fdfd', 'GOODS_IN', 1000, 'gf', 'fdfd', '15:49:42', 3, 1);
INSERT INTO railway.inventory VALUES (6, '2021-12-30', 'gfg', 'fdfd', 'GOODS_OUT', 100, 'gf', 'fdfd', '17:01:50', 2, 2);
INSERT INTO railway.inventory VALUES (7, '2021-12-31', 'dsd', 'dssd', 'GOODS_OUT', 10, 'dsds', 'dsd', '10:42:50', 3, 1);
INSERT INTO railway.inventory VALUES (8, '2021-12-31', '', '', 'GOODS_OUT', 1, '', '', '10:43:41', 3, 1);
INSERT INTO railway.inventory VALUES (9, '2021-12-31', '', '', 'GOODS_OUT', 1, '', '', '10:43:47', 3, 1);
INSERT INTO railway.inventory VALUES (10, '2021-12-31', '', '', 'GOODS_OUT', 1, '', '', '10:43:52', 3, 1);
INSERT INTO railway.inventory VALUES (11, '2021-12-31', '', '', 'GOODS_OUT', 1, '', '', '10:43:57', 3, 1);
INSERT INTO railway.inventory VALUES (12, '2021-12-31', '', '', 'GOODS_OUT', 1, '', '', '10:44:10', 3, 1);
INSERT INTO railway.inventory VALUES (13, '2021-12-31', '', '', 'GOODS_OUT', 10, '', '', '10:44:17', 3, 1);
INSERT INTO railway.inventory VALUES (14, '2021-12-31', 'gfg', 'gfg', 'GOODS_IN', 1000, 'gfg', 'gfg', '12:13:09', 8, 1);
INSERT INTO railway.inventory VALUES (15, '2022-01-21', '', '', 'GOODS_IN', 10000, '', '', '20:57:31', 9, 1);
INSERT INTO railway.inventory VALUES (16, '2022-01-21', '', '', 'GOODS_OUT', 1000, '', '', '20:58:38', 9, 1);
INSERT INTO railway.inventory VALUES (17, '2022-01-21', '', '', 'GOODS_IN', 4000, '', '', '20:58:58', 9, 1);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.roles VALUES (1, 'ROLE_USER');
INSERT INTO railway.roles VALUES (2, 'ROLE_MODERATOR');
INSERT INTO railway.roles VALUES (3, 'ROLE_ADMIN');


--
-- Data for Name: units; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.units VALUES (1, 'Packs');
INSERT INTO railway.units VALUES (2, 'KGs');
INSERT INTO railway.units VALUES (3, 'RSs');


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.user_details VALUES (1, 'admin@icta.lk', '$2a$10$YtAFyankLB/B/KTtj3SDgeH4ihDMIDDYiZDx9mKhFFM1XUvanEnOG', 'admin');


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: railway; Owner: postgres
--

INSERT INTO railway.user_roles VALUES (1, 3);


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goods_id_seq', 1, false);


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_details_id_seq', 1, false);


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: railway; Owner: postgres
--

SELECT pg_catalog.setval('railway.goods_id_seq', 9, true);


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: railway; Owner: postgres
--

SELECT pg_catalog.setval('railway.inventory_id_seq', 17, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: railway; Owner: postgres
--

SELECT pg_catalog.setval('railway.roles_id_seq', 3, true);


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: railway; Owner: postgres
--

SELECT pg_catalog.setval('railway.user_details_id_seq', 1, true);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: inventory fk9wlh8r1o63mqim0hi7nsghdb4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fk9wlh8r1o63mqim0hi7nsghdb4 FOREIGN KEY (unit_id) REFERENCES public.units(id);


--
-- Name: inventory fkeksqvm5w6gqchurbih3dvo8vy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fkeksqvm5w6gqchurbih3dvo8vy FOREIGN KEY (goods_id) REFERENCES public.goods(id);


--
-- Name: user_roles fkh6deu8wkydeisyod6sif716g2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh6deu8wkydeisyod6sif716g2 FOREIGN KEY (user_id) REFERENCES public.user_details(id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: goods fklfxlsm7xh8hxca9nkgd2bqlt7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT fklfxlsm7xh8hxca9nkgd2bqlt7 FOREIGN KEY (unit) REFERENCES public.units(id);


--
-- Name: goods fko0nrxou86hx21xwavcbufhnmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT fko0nrxou86hx21xwavcbufhnmt FOREIGN KEY (category) REFERENCES railway.category(id);


--
-- Name: inventory fk9wlh8r1o63mqim0hi7nsghdb4; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.inventory
    ADD CONSTRAINT fk9wlh8r1o63mqim0hi7nsghdb4 FOREIGN KEY (unit_id) REFERENCES railway.units(id);


--
-- Name: inventory fkeksqvm5w6gqchurbih3dvo8vy; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.inventory
    ADD CONSTRAINT fkeksqvm5w6gqchurbih3dvo8vy FOREIGN KEY (goods_id) REFERENCES railway.goods(id);


--
-- Name: user_roles fkh6deu8wkydeisyod6sif716g2; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.user_roles
    ADD CONSTRAINT fkh6deu8wkydeisyod6sif716g2 FOREIGN KEY (user_id) REFERENCES railway.user_details(id);


--
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES railway.roles(id);


--
-- Name: goods fklfxlsm7xh8hxca9nkgd2bqlt7; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.goods
    ADD CONSTRAINT fklfxlsm7xh8hxca9nkgd2bqlt7 FOREIGN KEY (unit) REFERENCES railway.units(id);


--
-- Name: goods fko0nrxou86hx21xwavcbufhnmt; Type: FK CONSTRAINT; Schema: railway; Owner: postgres
--

ALTER TABLE ONLY railway.goods
    ADD CONSTRAINT fko0nrxou86hx21xwavcbufhnmt FOREIGN KEY (category) REFERENCES railway.category(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

