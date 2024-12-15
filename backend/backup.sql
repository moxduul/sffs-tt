--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: divisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divisions (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.divisions OWNER TO postgres;

--
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divisions_id_seq OWNER TO postgres;

--
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divisions_id_seq OWNED BY public.divisions.id;


--
-- Name: game_players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_players (
    id integer NOT NULL,
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    is_home_team boolean NOT NULL,
    is_replacement boolean NOT NULL,
    elo_at_time double precision NOT NULL
);


ALTER TABLE public.game_players OWNER TO postgres;

--
-- Name: game_players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_players_id_seq OWNER TO postgres;

--
-- Name: game_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_players_id_seq OWNED BY public.game_players.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    team_match_id integer NOT NULL,
    is_double boolean NOT NULL,
    winning_player_id integer,
    winning_team_id integer
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    license_number character varying NOT NULL,
    email character varying,
    phone1 character varying,
    phone2 character varying,
    team_id integer,
    classification character varying,
    "ELO_points" double precision
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sets (
    id integer NOT NULL,
    game_id integer NOT NULL,
    set_number integer NOT NULL,
    home_player_points integer NOT NULL,
    guest_player_points integer NOT NULL
);


ALTER TABLE public.sets OWNER TO postgres;

--
-- Name: sets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sets_id_seq OWNER TO postgres;

--
-- Name: sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sets_id_seq OWNED BY public.sets.id;


--
-- Name: team_matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_matches (
    id integer NOT NULL,
    home_team_id integer NOT NULL,
    guest_team_id integer NOT NULL,
    division_id integer NOT NULL,
    match_date date NOT NULL,
    season integer NOT NULL,
    home_score double precision NOT NULL,
    guest_score double precision NOT NULL
);


ALTER TABLE public.team_matches OWNER TO postgres;

--
-- Name: team_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_matches_id_seq OWNER TO postgres;

--
-- Name: team_matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_matches_id_seq OWNED BY public.team_matches.id;


--
-- Name: team_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_memberships (
    id integer NOT NULL,
    player_id integer NOT NULL,
    team_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date
);


ALTER TABLE public.team_memberships OWNER TO postgres;

--
-- Name: team_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_memberships_id_seq OWNER TO postgres;

--
-- Name: team_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_memberships_id_seq OWNED BY public.team_memberships.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying NOT NULL,
    team_number character varying NOT NULL,
    division_id integer,
    capitain_id integer
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- Name: game_players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players ALTER COLUMN id SET DEFAULT nextval('public.game_players_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: sets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets ALTER COLUMN id SET DEFAULT nextval('public.sets_id_seq'::regclass);


--
-- Name: team_matches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches ALTER COLUMN id SET DEFAULT nextval('public.team_matches_id_seq'::regclass);


--
-- Name: team_memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_memberships ALTER COLUMN id SET DEFAULT nextval('public.team_memberships_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
92af962c396f
\.


--
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divisions (id, name) FROM stdin;
2	AP
1	A
4	B
5	C
6	D
\.


--
-- Data for Name: game_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_players (id, game_id, player_id, is_home_team, is_replacement, elo_at_time) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, team_match_id, is_double, winning_player_id, winning_team_id) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") FROM stdin;
2	Philipp	Zeugin	3380	\N	NaN	NaN	1	15	1494
3	Thomas	Rosenast	3381	\N	NaN	NaN	1	14	1433
4	Kevin	Meyer	3142	\N	NaN	NaN	1	13	1371
5	Davor	Petrovic	3192	\N	NaN	NaN	1	13	1371
6	Manuel	Graf	3439	\N	NaN	NaN	1	12	1310
7	Andreas	Heiniger	2898	\N	NaN	NaN	1	12	1310
8	Peter	Boder	3340	\N	NaN	NaN	1	11	1249
9	Torsten	Einhaus	3194	\N	NaN	NaN	1	11	1249
10	Bernhard	Buergin	2669	\N	NaN	NaN	2	15	1494
11	Salko	Schmidt	3297	\N	NaN	NaN	2	12	1310
12	Carsten	Kuck	3130	\N	NaN	NaN	2	11	1249
13	Dirk	Schoenle	1516	dschoenle@web.de	+41 62 866 34 11	+49 7753 28 77	2	11	1249
14	Henry	Kuck	3382	\N	NaN	NaN	2	8	1064
15	Manfred	Porzelt	1841	\N	NaN	NaN	2	8	1064
16	Christian	Riehm	2962	\N	NaN	NaN	3	12	1310
17	Oliver	Grass	3259	\N	NaN	NaN	3	11	1249
18	Gerhard	Gretsch	3025	\N	NaN	NaN	3	10	1187
19	Petra	Kaufmann	2440	petra.kaufmann@bluemail.ch	+41 61 266 30 93	+41 79 662 10 20	3	9	1126
20	Henrik	Leimeister	3295	\N	NaN	NaN	3	8	1064
21	Georg	Ranert	3104	\N	NaN	NaN	3	8	1064
22	Denis	Liske	3359	\N	NaN	NaN	3	7	1003
23	Fraenzi	Steimer	2184	\N	NaN	NaN	3	7	1003
24	Nicola	Mohler	2974	\N	NaN	NaN	4	20	1801
25	Thilo	Vorherr	3031	\N	NaN	NaN	4	18	1678
26	Thomas	Vorherr	3030	\N	NaN	NaN	4	18	1678
27	Pascal	Kaeshammer	3099	\N	NaN	NaN	4	16	1556
28	Edgar	Hagmann	3281	\N	NaN	NaN	4	15	1494
29	Marc	Wannagat	3377	\N	NaN	NaN	4	12	1310
30	Dirk	Weniger	2760	\N	NaN	NaN	4	12	1310
31	Markus	Senn	3354	\N	NaN	NaN	5	13	1371
32	Kemal	Terzi	3070	kemal.terzi@novartis.com; kterzi@gmx.ch	+41 62 868 60 55	+41 79 900 49 32	5	13	1371
33	Leandro	Senn	3411	\N	NaN	NaN	5	12	1310
34	Adrian	Auer	3440	\N	NaN	NaN	6	12	1310
35	Silvio	Gurtner	3358	\N	NaN	NaN	6	11	1249
36	Michael	Hatke	3436	\N	NaN	NaN	6	11	1249
37	Maciek	Helbin	3347	\N	NaN	NaN	6	11	1249
38	Ralf	Baechle	2937	\N	NaN	NaN	6	10	1187
39	Christoph	Zehnder	3364	\N	NaN	NaN	6	10	1187
40	Ronald	Silva Molina	3437	\N	NaN	NaN	6	9	1126
41	Daniel	Meissner	3154	coucerbaum@yahoo.de;brix.bernhard@gmail.com	---	+49 152 3403 01 49	6	8	1064
42	Roland	Pfirter	3343	\N	NaN	NaN	7	11	1249
43	Werner	Ruder	1323	werner.ruder@ebmnet.ch; sayer@web.de;sergioviva@hot	+41 61 811 57 57	+41 61 411 26 73	7	11	1249
44	Roger	Tuescher	2680	\N	NaN	NaN	7	11	1249
45	Rene	Fasolin	3344	\N	NaN	NaN	7	8	1064
46	Simon	Sayer	3023	sayer@web.de; sergioviva@hotmail.com;sergioviva@hotma	+41 79 577 12 88	+41 61 421 22 30	8	9	1126
47	Florian	Merz	3056	\N	NaN	NaN	8	8	1064
48	Robert	Marti	3200	\N	NaN	NaN	8	6	941
49	Benjamin	Roberts	1141	\N	NaN	NaN	8	6	941
50	Marco	Viva	3156	\N	NaN	NaN	8	5	880
51	Sergio	Viva	2812	\N	NaN	NaN	8	5	880
52	Bruno	Stoecklin	2208	\N	NaN	NaN	8	3	757
53	Sandro	Borghesi	1895	\N	NaN	NaN	9	9	1126
54	Reto	Burki	1975	\N	NaN	NaN	9	7	1003
55	Markus	Heitzmann	2859	\N	NaN	NaN	9	7	1003
56	Hans-Joerg	Martus	2611	\N	NaN	NaN	9	6	941
57	Daniel	Muller	3138	danielo.muller1@gmail.com;hansjoerg.martus@novartis.co	+41 61 721 06 08	+41 79 819 21 66	9	5	880
58	Christine	Eigenmann	3094	\N	NaN	NaN	9	4	819
59	Fabian	Wu	3417	\N	NaN	NaN	9	4	819
60	Kai	Apel	3163	\N	NaN	NaN	10	8	1064
61	Alain	Baechle	2933	alain.baechle@gmx.de;nathalie.vogel@swissonline.ch	+49 152 23228900	+49 152 23228900	10	8	1064
62	Kim	Baechle	3068	\N	NaN	NaN	10	7	1003
63	Mehmet	Bayraktar	3186	\N	NaN	NaN	10	7	1003
64	Christian	Gleichauf	3365	\N	NaN	NaN	10	6	941
65	Nathalie	Vogel	3109	\N	NaN	NaN	10	6	941
66	Kirill	Haar	3447	\N	NaN	NaN	11	10	1187
67	Daniel	Barnet	3191	\N	NaN	NaN	11	8	1064
68	Kai-Uwe	Marx	3034	\N	NaN	NaN	11	8	1064
69	Marco	Brand	3446	\N	NaN	NaN	11	7	1003
70	Bernhard	Brix	2503	brix.bernhard@gmail.com	+41 78 314 62 25	---	11	6	941
71	Nam	Ha thanh	1271	\N	NaN	NaN	11	6	941
72	Maurice	Mattedi	3118	\N	NaN	NaN	11	6	941
73	Andreas	Müller	3262	\N	NaN	NaN	11	6	941
74	Kevin	Lerch	3438	\N	NaN	NaN	11	5	880
75	Christian	Switajski	3282	\N	NaN	NaN	12	15	1494
76	Manuel	Brugger	3132	\N	NaN	NaN	12	13	1371
77	Krzysztof	Hanus	3121	\N	NaN	NaN	12	13	1371
78	Jens	Kreutler	2581	\N	NaN	NaN	12	11	1249
79	Andre	Lantos	2548	andre.lantos@intergga.ch	+41 79 707 39 32	0	12	8	1064
80	Lisha	Wang	3087	\N	NaN	NaN	12	8	1064
81	Peter	Bielmeier	3131	\N	NaN	NaN	13	7	1003
82	Csaba	Verebes	2785	\N	NaN	NaN	13	6	941
83	Dieter	Widor	1501	dieter.widor@bluewin.ch	+41 61 721 22 06	+41 79 426 11 28	13	6	941
84	Jörg	Zimmermann	3000	\N	NaN	NaN	13	6	941
85	Cennet	Aslan	3401	\N	NaN	NaN	13	5	880
86	Aljoscha	Jeisy	3427	\N	NaN	NaN	13	5	880
87	Tobias	Steinke	3285	\N	NaN	NaN	14	8	1064
88	Pierre	Sangalli	3018	\N	NaN	NaN	14	7	1003
89	Christian	Meyer	3143	\N	NaN	NaN	14	6	941
90	Paul	Schaffter	3185	pschaffter@bluewin.ch	+41 61 701 40 22	+41 79 476 75 89	14	6	941
91	Christian	Selz	3002	\N	NaN	NaN	14	6	941
1	Ernoe	Varga	3055	ernoe.varga@gmail.com	+41 58 285 63 49	NaN	1	16	1556
94	aaa	aaa	123	aaa			\N		1200
95	1111	1111	1111	\N	\N	\N	\N	123	1200
97	Roland	Mohler	3048	\N	\N	\N	16	\N	800
96	Herbert	Wetter	1896	\N	\N	\N	16	\N	800
\.


--
-- Data for Name: sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sets (id, game_id, set_number, home_player_points, guest_player_points) FROM stdin;
\.


--
-- Data for Name: team_matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_matches (id, home_team_id, guest_team_id, division_id, match_date, season, home_score, guest_score) FROM stdin;
\.


--
-- Data for Name: team_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_memberships (id, player_id, team_id, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, name, team_number, division_id, capitain_id) FROM stdin;
1	BASLER 01	501	1	1
3	LIVEC 01	6701	1	19
4	NOVARTIS 01	901	1	41
5	NOVA-STEIN 01	1801	1	32
6	NOVA-STEIN 02	1802	1	41
7	KANT.VERW.  01	3001	2	43
8	KANT.VERW.  02	3002	2	46
9	NOVARTIS  02	902	2	57
10	NOVA-STEIN  03	1803	2	61
11	NOVA-STEIN  04	1804	2	70
12	ROCHE  01	4101	2	79
13	ROCHE  02	4102	2	83
14	SWISSPORT  01	5201	2	90
2	DSM SISSELN 01	4201	1	13
16	NOVARTIS 04	0904	5	96
\.


--
-- Name: divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divisions_id_seq', 6, true);


--
-- Name: game_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_players_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 1, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 97, true);


--
-- Name: sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sets_id_seq', 1, false);


--
-- Name: team_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_matches_id_seq', 1, false);


--
-- Name: team_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_memberships_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 16, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: divisions divisions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_name_key UNIQUE (name);


--
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- Name: game_players game_players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: players players_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_email_key UNIQUE (email);


--
-- Name: players players_license_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_license_number_key UNIQUE (license_number);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: sets sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);


--
-- Name: team_matches team_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_pkey PRIMARY KEY (id);


--
-- Name: team_memberships team_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_memberships
    ADD CONSTRAINT team_memberships_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: teams teams_team_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_number_key UNIQUE (team_number);


--
-- Name: ix_divisions_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_divisions_id ON public.divisions USING btree (id);


--
-- Name: ix_players_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_players_id ON public.players USING btree (id);


--
-- Name: ix_teams_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_teams_id ON public.teams USING btree (id);


--
-- Name: game_players game_players_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: game_players game_players_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_players
    ADD CONSTRAINT game_players_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: games games_team_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_team_match_id_fkey FOREIGN KEY (team_match_id) REFERENCES public.team_matches(id);


--
-- Name: games games_winning_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winning_player_id_fkey FOREIGN KEY (winning_player_id) REFERENCES public.players(id);


--
-- Name: games games_winning_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winning_team_id_fkey FOREIGN KEY (winning_team_id) REFERENCES public.teams(id);


--
-- Name: players players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: sets sets_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: team_matches team_matches_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_division_id_fkey FOREIGN KEY (division_id) REFERENCES public.divisions(id);


--
-- Name: team_matches team_matches_guest_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_guest_team_id_fkey FOREIGN KEY (guest_team_id) REFERENCES public.teams(id);


--
-- Name: team_matches team_matches_home_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_matches
    ADD CONSTRAINT team_matches_home_team_id_fkey FOREIGN KEY (home_team_id) REFERENCES public.teams(id);


--
-- Name: team_memberships team_memberships_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_memberships
    ADD CONSTRAINT team_memberships_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: team_memberships team_memberships_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_memberships
    ADD CONSTRAINT team_memberships_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: teams teams_capitain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_capitain_id_fkey FOREIGN KEY (capitain_id) REFERENCES public.players(id);


--
-- Name: teams teams_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_division_id_fkey FOREIGN KEY (division_id) REFERENCES public.divisions(id);


--
-- PostgreSQL database dump complete
--

