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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: jvsouzx
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO jvsouzx;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: jvsouzx
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO jvsouzx;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: jvsouzx
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO jvsouzx;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jvsouzx
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: jvsouzx
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    planet_id integer,
    distance_from_earth integer,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO jvsouzx;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: jvsouzx
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO jvsouzx;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jvsouzx
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: jvsouzx
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO jvsouzx;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: jvsouzx
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO jvsouzx;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jvsouzx
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: jvsouzx
--

CREATE TABLE public.planet_types (
    name character varying(20) NOT NULL,
    planet_types_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_types OWNER TO jvsouzx;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jvsouzx
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO jvsouzx;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jvsouzx
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: jvsouzx
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,1),
    galaxy_id integer,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO jvsouzx;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: jvsouzx
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO jvsouzx;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jvsouzx
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: jvsouzx
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral Galaxy where the Solar System is located.', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighboring spiral galaxy that may collide with the Milky Way in the future.', 10000, 2);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Giant elliptical galaxy in the Virgo Cluster, famous for its supermassive black hole.', 13000, 53);
INSERT INTO public.galaxy VALUES (4, 'Triangulum (M33)', 'Small spiral galaxy in the Local Group, the third largest after Andromeda and the Milky Way.', 12000, 3);
INSERT INTO public.galaxy VALUES (5, 'Sombrero (M104)', 'Spiral galaxy with a large central bulge and a prominent dust disk.', 9000, 29);
INSERT INTO public.galaxy VALUES (6, 'Lge Magellanic Cloud', 'Satellite galaxy of the Milky Way, visible to the naked eye in the southern hemisphere.', 13000, 163);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: jvsouzx
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite, responsible for tides and stabilizing the planets axis.', 4500.0, 1, NULL, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of Mars two moons, with a decaying orbit.', 4300.0, 2, NULL, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller Martian moon with an elongated shape, possibly an asteroid capture.', 4300.0, 2, NULL, false);
INSERT INTO public.moon VALUES (4, 'Andromeda Alpha I', 'Hypothetical moon orbiting Proxima Andromeda b, possibly rocky.', NULL, 3, NULL, true);
INSERT INTO public.moon VALUES (5, 'M87-X', 'Theoretical moon orbiting the hypothetical M87b planet.', NULL, 4, 53000000, false);
INSERT INTO public.moon VALUES (6, 'Triangulum Minor', 'Hypothetical small icy moon orbiting Triangulum Prime.', 500.0, 5, 3000000, false);
INSERT INTO public.moon VALUES (7, 'HD 102365 c-I', 'Theoretical moon of HD 102365 b, potentially geologically active.', 5800.0, 6, 29000000, true);
INSERT INTO public.moon VALUES (8, 'Magellanic Beta', 'Possible exomoon orbiting Magellanic Terra, could have an atmosphere.', 2800.0, 7, 163000, true);
INSERT INTO public.moon VALUES (9, 'Venus Minor', 'Hypothetical captured asteroid orbiting Venus.', 2000.0, 8, NULL, false);
INSERT INTO public.moon VALUES (10, 'Kepler-442b-1', 'A possible exomoon in the habitable zone of Kepler-442b.', 2000.0, 9, NULL, true);
INSERT INTO public.moon VALUES (11, 'Andromeda X-1a', 'Hypothetical rocky moon orbiting Andromeda X-1.', 4000.0, 10, NULL, true);
INSERT INTO public.moon VALUES (12, 'Sombrero Beta', 'Hypothetical massive exomoon orbiting Sombrero Prime.', 4500.0, 11, NULL, true);
INSERT INTO public.moon VALUES (13, 'LMC-1a', 'Possible exomoon of LMC-1, could be ice-covered.', 1800.0, 12, NULL, false);
INSERT INTO public.moon VALUES (14, 'Titan', 'Saturn’s largest moon, has a thick atmosphere and liquid methane lakes.', 4500.0, 2, NULL, true);
INSERT INTO public.moon VALUES (15, 'Europa', 'Icy moon of Jupiter with a subsurface ocean, potential for life.', 4500.0, 2, NULL, true);
INSERT INTO public.moon VALUES (16, 'M33-X1', 'Theoretical moon of an exoplanet in the Triangulum Galaxy.', 3500.0, 4, NULL, true);
INSERT INTO public.moon VALUES (17, 'Magellanic Delta', 'A large exomoon orbiting a planet in the Large Magellanic Cloud.', 1500.0, 7, NULL, true);
INSERT INTO public.moon VALUES (18, 'Ganymede', 'The largest moon in the Solar System, bigger than Mercury.', 4500.0, 2, NULL, true);
INSERT INTO public.moon VALUES (19, 'Enceladus', 'An icy moon with geysers, potentially harboring microbial life.', 4500.0, 2, NULL, true);
INSERT INTO public.moon VALUES (20, 'Sombrero Gamma', 'A small icy exomoon orbiting a gas giant in the Sombrero Galaxy.', 5000.0, 11, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: jvsouzx
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet to support life, home to humans and diverse ecosystems.', 4540.0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'A rocky planet with the tallest volcano in the Solar System, Olympus Mons.', 4600.0, false, 1);
INSERT INTO public.planet VALUES (3, 'Proxima Andromeda b', 'Hypothetical exoplanet orbiting Alpha Andromedae, potentially a super-Earth.', NULL, false, 2);
INSERT INTO public.planet VALUES (4, 'M87b', 'Theoretical exoplanet orbiting the supermassive black hole in Messier 87.', NULL, false, 3);
INSERT INTO public.planet VALUES (5, 'Triangulum Prime', 'Hypothetical exoplanet in the Triangulum Galaxy, possibly a gas giant.', 1000.0, false, 4);
INSERT INTO public.planet VALUES (6, 'HD 102365 b', 'Confirmed exoplanet orbiting HD 102365, possibly a hot Neptune.', 6000.0, false, 5);
INSERT INTO public.planet VALUES (7, 'Magellanic Terra', 'Hypothetical rocky planet in the Large Magellanic Cloud, potentially Earth-like.', 3000.0, false, 6);
INSERT INTO public.planet VALUES (8, 'Venus', 'A terrestrial planet with a dense atmosphere, extreme temperatures, and volcanic activity.', 4500.0, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 'Exoplanet in the habitable zone, potentially capable of supporting life.', 2900.0, false, 5);
INSERT INTO public.planet VALUES (10, 'Andromeda X-1', 'Hypothetical exoplanet in the Andromeda Galaxy, possibly a super-Earth.', 4500.0, false, 2);
INSERT INTO public.planet VALUES (11, 'Sombrero Prime', 'Theoretical exoplanet in the Sombrero Galaxy, potentially a gas giant.', 5000.0, false, 5);
INSERT INTO public.planet VALUES (12, 'LMC-1', 'Hypothetical planet orbiting R136a1, possibly a rogue planet.', 2000.0, false, 6);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: jvsouzx
--

INSERT INTO public.planet_types VALUES ('Terrestrial', 1, 1);
INSERT INTO public.planet_types VALUES ('Terrestrial', 2, 2);
INSERT INTO public.planet_types VALUES ('Terrestrial', 3, 8);
INSERT INTO public.planet_types VALUES ('Exoplanet', 4, 3);
INSERT INTO public.planet_types VALUES ('Exoplanet', 5, 4);
INSERT INTO public.planet_types VALUES ('Exoplanet', 6, 5);
INSERT INTO public.planet_types VALUES ('Exoplanet', 7, 6);
INSERT INTO public.planet_types VALUES ('Exoplanet', 8, 7);
INSERT INTO public.planet_types VALUES ('Exoplanet', 9, 9);
INSERT INTO public.planet_types VALUES ('Exoplanet', 10, 10);
INSERT INTO public.planet_types VALUES ('Exoplanet', 11, 11);
INSERT INTO public.planet_types VALUES ('Exoplanet', 12, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: jvsouzx
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System, providing light and energy to Earth.', 4.6, 1, 0);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 'Brightest star in the Andromeda constellation, located near the Andromeda Galaxy.', 60.0, 2, 97);
INSERT INTO public.star VALUES (4, 'M33-031340.21+311725.4', 'Massive Wolf-Rayet star in the Triangulum Galaxy.', 4.0, 4, 3000000);
INSERT INTO public.star VALUES (6, 'R136a1', 'One of the most massive known stars, located in the Large Magellanic Cloud.', 1.0, 6, 163000);
INSERT INTO public.star VALUES (3, 'Virgo A Star', 'Supermassive black hole at the center of Messier 87, also known as M87*.', NULL, 3, 53000000);
INSERT INTO public.star VALUES (5, 'HD 102365', 'Sun-like star in the Sombrero Galaxy, possibly hosting exoplanets.', 6.0, 5, 29000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jvsouzx
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jvsouzx
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jvsouzx
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jvsouzx
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jvsouzx
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet_types uniq_planet_id; Type: CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT uniq_planet_id UNIQUE (planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_types planet_types_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jvsouzx
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

