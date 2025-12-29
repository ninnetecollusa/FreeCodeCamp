--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE username;
--
-- Name: username; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE username WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE username OWNER TO freecodecamp;

\connect username

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
-- Name: user_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_table (
    name character varying(22),
    games_played integer,
    best_guess integer
);


ALTER TABLE public.user_table OWNER TO freecodecamp;

--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_table VALUES ('Mek', 8, 1);
INSERT INTO public.user_table VALUES ('user_1767012463569', 2, 240);
INSERT INTO public.user_table VALUES ('user_1767012463570', 5, 120);
INSERT INTO public.user_table VALUES ('user_1767012655182', 2, 394);
INSERT INTO public.user_table VALUES ('user_1767012655183', 5, 216);
INSERT INTO public.user_table VALUES ('user_1767012080791', 2, 132);
INSERT INTO public.user_table VALUES ('user_1767012080792', 5, 16);


--
-- Name: user_table user_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

