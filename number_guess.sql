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
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (53, 14, 11);
INSERT INTO public.games VALUES (54, 14, 7);
INSERT INTO public.games VALUES (55, 15, 923);
INSERT INTO public.games VALUES (56, 15, 854);
INSERT INTO public.games VALUES (57, 16, 504);
INSERT INTO public.games VALUES (58, 16, 31);
INSERT INTO public.games VALUES (59, 15, 881);
INSERT INTO public.games VALUES (60, 15, 376);
INSERT INTO public.games VALUES (61, 15, 268);
INSERT INTO public.games VALUES (62, 17, 586);
INSERT INTO public.games VALUES (63, 17, 469);
INSERT INTO public.games VALUES (64, 18, 569);
INSERT INTO public.games VALUES (65, 18, 927);
INSERT INTO public.games VALUES (66, 17, 373);
INSERT INTO public.games VALUES (67, 17, 79);
INSERT INTO public.games VALUES (68, 17, 228);
INSERT INTO public.games VALUES (69, 19, 294);
INSERT INTO public.games VALUES (70, 19, 722);
INSERT INTO public.games VALUES (71, 20, 496);
INSERT INTO public.games VALUES (72, 20, 48);
INSERT INTO public.games VALUES (73, 19, 589);
INSERT INTO public.games VALUES (74, 19, 454);
INSERT INTO public.games VALUES (75, 19, 211);
INSERT INTO public.games VALUES (76, 21, 881);
INSERT INTO public.games VALUES (77, 21, 294);
INSERT INTO public.games VALUES (78, 22, 132);
INSERT INTO public.games VALUES (79, 22, 59);
INSERT INTO public.games VALUES (80, 21, 646);
INSERT INTO public.games VALUES (81, 21, 275);
INSERT INTO public.games VALUES (82, 21, 945);
INSERT INTO public.games VALUES (83, 23, 782);
INSERT INTO public.games VALUES (84, 23, 586);
INSERT INTO public.games VALUES (85, 24, 598);
INSERT INTO public.games VALUES (86, 24, 744);
INSERT INTO public.games VALUES (87, 23, 355);
INSERT INTO public.games VALUES (88, 23, 855);
INSERT INTO public.games VALUES (89, 23, 416);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (14, 'Low');
INSERT INTO public.users VALUES (15, 'user_1714382447117');
INSERT INTO public.users VALUES (16, 'user_1714382447116');
INSERT INTO public.users VALUES (17, 'user_1714382517708');
INSERT INTO public.users VALUES (18, 'user_1714382517707');
INSERT INTO public.users VALUES (19, 'user_1714382583383');
INSERT INTO public.users VALUES (20, 'user_1714382583382');
INSERT INTO public.users VALUES (21, 'user_1714382624501');
INSERT INTO public.users VALUES (22, 'user_1714382624500');
INSERT INTO public.users VALUES (23, 'user_1714382797112');
INSERT INTO public.users VALUES (24, 'user_1714382797111');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 89, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


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

