--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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
-- Name: megaschema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA megaschema;


ALTER SCHEMA megaschema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employee; Type: TABLE; Schema: megaschema; Owner: postgres
--

CREATE TABLE megaschema.employee (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    surname character varying(128) NOT NULL,
    patronymic character varying(128) NOT NULL,
    date_of_employment date NOT NULL
);


ALTER TABLE megaschema.employee OWNER TO postgres;

--
-- Name: employee_grades; Type: TABLE; Schema: megaschema; Owner: postgres
--

CREATE TABLE megaschema.employee_grades (
    employee_id bigint NOT NULL,
    grade_id bigint NOT NULL
);


ALTER TABLE megaschema.employee_grades OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: megaschema; Owner: postgres
--

ALTER TABLE megaschema.employee ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME megaschema.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_roles; Type: TABLE; Schema: megaschema; Owner: postgres
--

CREATE TABLE megaschema.employee_roles (
    employee_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE megaschema.employee_roles OWNER TO postgres;

--
-- Name: grade; Type: TABLE; Schema: megaschema; Owner: postgres
--

CREATE TABLE megaschema.grade (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    salary numeric(10,2) NOT NULL,
    CONSTRAINT positive_salary CHECK ((salary > (0)::numeric))
);


ALTER TABLE megaschema.grade OWNER TO postgres;

--
-- Name: grade_id_seq; Type: SEQUENCE; Schema: megaschema; Owner: postgres
--

ALTER TABLE megaschema.grade ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME megaschema.grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role; Type: TABLE; Schema: megaschema; Owner: postgres
--

CREATE TABLE megaschema.role (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    monitors_count bigint NOT NULL,
    CONSTRAINT positive_monitors CHECK ((monitors_count >= 0))
);


ALTER TABLE megaschema.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: megaschema; Owner: postgres
--

ALTER TABLE megaschema.role ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME megaschema.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: megaschema; Owner: postgres
--

COPY megaschema.employee (id, name, surname, patronymic, date_of_employment) FROM stdin;
1	Иван	Иванов	Иванович	2024-01-01
3	Иван2	Иванов	Иванович	2024-01-02
4	Пётр	Петров	Петрович	2023-01-03
\.


--
-- Data for Name: employee_grades; Type: TABLE DATA; Schema: megaschema; Owner: postgres
--

COPY megaschema.employee_grades (employee_id, grade_id) FROM stdin;
\.


--
-- Data for Name: employee_roles; Type: TABLE DATA; Schema: megaschema; Owner: postgres
--

COPY megaschema.employee_roles (employee_id, role_id) FROM stdin;
\.


--
-- Data for Name: grade; Type: TABLE DATA; Schema: megaschema; Owner: postgres
--

COPY megaschema.grade (id, name, salary) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: megaschema; Owner: postgres
--

COPY megaschema.role (id, name, monitors_count) FROM stdin;
1	Backend	2
\.


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: megaschema; Owner: postgres
--

SELECT pg_catalog.setval('megaschema.employee_id_seq', 4, true);


--
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: megaschema; Owner: postgres
--

SELECT pg_catalog.setval('megaschema.grade_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: megaschema; Owner: postgres
--

SELECT pg_catalog.setval('megaschema.role_id_seq', 1, true);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: grade grade_name_is_unique; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.grade
    ADD CONSTRAINT grade_name_is_unique UNIQUE (name);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- Name: role role_name_is_unique; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.role
    ADD CONSTRAINT role_name_is_unique UNIQUE (name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: employee_grades unique_fk_employee_grades; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_grades
    ADD CONSTRAINT unique_fk_employee_grades UNIQUE (employee_id, grade_id);


--
-- Name: employee_roles unique_fk_employee_roles; Type: CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_roles
    ADD CONSTRAINT unique_fk_employee_roles UNIQUE (employee_id, role_id);


--
-- Name: employee_grades employee_grades__employee_relate; Type: FK CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_grades
    ADD CONSTRAINT employee_grades__employee_relate FOREIGN KEY (employee_id) REFERENCES megaschema.employee(id);


--
-- Name: employee_grades employee_grades__grades_relate; Type: FK CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_grades
    ADD CONSTRAINT employee_grades__grades_relate FOREIGN KEY (grade_id) REFERENCES megaschema.grade(id);


--
-- Name: employee_roles employee_roles__employee_relate; Type: FK CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_roles
    ADD CONSTRAINT employee_roles__employee_relate FOREIGN KEY (employee_id) REFERENCES megaschema.employee(id);


--
-- Name: employee_roles employee_roles__roles_relate; Type: FK CONSTRAINT; Schema: megaschema; Owner: postgres
--

ALTER TABLE ONLY megaschema.employee_roles
    ADD CONSTRAINT employee_roles__roles_relate FOREIGN KEY (role_id) REFERENCES megaschema.role(id);


--
-- PostgreSQL database dump complete
--
