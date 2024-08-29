--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    user_game integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    guesses integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (27, 1, 5);
INSERT INTO public.games VALUES (27, 1, 6);
INSERT INTO public.games VALUES (27, 2, 6);
INSERT INTO public.games VALUES (28, 1, 722);
INSERT INTO public.games VALUES (28, 2, 488);
INSERT INTO public.games VALUES (29, 1, 660);
INSERT INTO public.games VALUES (29, 2, 920);
INSERT INTO public.games VALUES (28, 3, 377);
INSERT INTO public.games VALUES (28, 4, 901);
INSERT INTO public.games VALUES (28, 5, 772);
INSERT INTO public.games VALUES (27, 3, 11);
INSERT INTO public.games VALUES (30, 1, 474);
INSERT INTO public.games VALUES (30, 2, 585);
INSERT INTO public.games VALUES (31, 1, 854);
INSERT INTO public.games VALUES (31, 2, 256);
INSERT INTO public.games VALUES (30, 3, 460);
INSERT INTO public.games VALUES (30, 4, 4);
INSERT INTO public.games VALUES (30, 5, 447);
INSERT INTO public.games VALUES (32, 1, 930);
INSERT INTO public.games VALUES (32, 2, 60);
INSERT INTO public.games VALUES (33, 1, 841);
INSERT INTO public.games VALUES (33, 2, 429);
INSERT INTO public.games VALUES (32, 3, 557);
INSERT INTO public.games VALUES (32, 4, 898);
INSERT INTO public.games VALUES (32, 5, 811);
INSERT INTO public.games VALUES (27, 4, 1);
INSERT INTO public.games VALUES (27, 5, 2);
INSERT INTO public.games VALUES (34, 1, 630);
INSERT INTO public.games VALUES (34, 2, 806);
INSERT INTO public.games VALUES (35, 1, 174);
INSERT INTO public.games VALUES (35, 2, 222);
INSERT INTO public.games VALUES (34, 3, 266);
INSERT INTO public.games VALUES (34, 4, 958);
INSERT INTO public.games VALUES (34, 5, 388);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (29, 'user_1724921020000', 660);
INSERT INTO public.users VALUES (28, 'user_1724921020001', 377);
INSERT INTO public.users VALUES (31, 'user_1724921166048', 256);
INSERT INTO public.users VALUES (30, 'user_1724921166049', 4);
INSERT INTO public.users VALUES (32, 'user_1724921192646', 60);
INSERT INTO public.users VALUES (33, 'user_1724921192645', 429);
INSERT INTO public.users VALUES (27, '1', 1);
INSERT INTO public.users VALUES (35, 'user_1724921344018', 174);
INSERT INTO public.users VALUES (34, 'user_1724921344019', 266);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

