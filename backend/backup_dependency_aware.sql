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

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.alembic_version DISABLE TRIGGER ALL;

INSERT INTO public.alembic_version (version_num) VALUES ('92af962c396f');


ALTER TABLE public.alembic_version ENABLE TRIGGER ALL;

--
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.divisions DISABLE TRIGGER ALL;

INSERT INTO public.divisions (id, name) VALUES (2, 'AP');
INSERT INTO public.divisions (id, name) VALUES (1, 'A');
INSERT INTO public.divisions (id, name) VALUES (4, 'B');
INSERT INTO public.divisions (id, name) VALUES (5, 'C');
INSERT INTO public.divisions (id, name) VALUES (6, 'D');


ALTER TABLE public.divisions ENABLE TRIGGER ALL;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.players DISABLE TRIGGER ALL;

INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (2, 'Philipp', 'Zeugin', '3380', NULL, 'NaN', 'NaN', 1, '15', 1494);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (3, 'Thomas', 'Rosenast', '3381', NULL, 'NaN', 'NaN', 1, '14', 1433);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (4, 'Kevin', 'Meyer', '3142', NULL, 'NaN', 'NaN', 1, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (5, 'Davor', 'Petrovic', '3192', NULL, 'NaN', 'NaN', 1, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (6, 'Manuel', 'Graf', '3439', NULL, 'NaN', 'NaN', 1, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (7, 'Andreas', 'Heiniger', '2898', NULL, 'NaN', 'NaN', 1, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (8, 'Peter', 'Boder', '3340', NULL, 'NaN', 'NaN', 1, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (9, 'Torsten', 'Einhaus', '3194', NULL, 'NaN', 'NaN', 1, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (10, 'Bernhard', 'Buergin', '2669', NULL, 'NaN', 'NaN', 2, '15', 1494);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (11, 'Salko', 'Schmidt', '3297', NULL, 'NaN', 'NaN', 2, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (12, 'Carsten', 'Kuck', '3130', NULL, 'NaN', 'NaN', 2, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (13, 'Dirk', 'Schoenle', '1516', 'dschoenle@web.de', '+41 62 866 34 11', '+49 7753 28 77', 2, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (14, 'Henry', 'Kuck', '3382', NULL, 'NaN', 'NaN', 2, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (15, 'Manfred', 'Porzelt', '1841', NULL, 'NaN', 'NaN', 2, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (16, 'Christian', 'Riehm', '2962', NULL, 'NaN', 'NaN', 3, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (17, 'Oliver', 'Grass', '3259', NULL, 'NaN', 'NaN', 3, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (18, 'Gerhard', 'Gretsch', '3025', NULL, 'NaN', 'NaN', 3, '10', 1187);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (19, 'Petra', 'Kaufmann', '2440', 'petra.kaufmann@bluemail.ch', '+41 61 266 30 93', '+41 79 662 10 20', 3, '9', 1126);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (20, 'Henrik', 'Leimeister', '3295', NULL, 'NaN', 'NaN', 3, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (21, 'Georg', 'Ranert', '3104', NULL, 'NaN', 'NaN', 3, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (22, 'Denis', 'Liske', '3359', NULL, 'NaN', 'NaN', 3, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (23, 'Fraenzi', 'Steimer', '2184', NULL, 'NaN', 'NaN', 3, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (24, 'Nicola', 'Mohler', '2974', NULL, 'NaN', 'NaN', 4, '20', 1801);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (25, 'Thilo', 'Vorherr', '3031', NULL, 'NaN', 'NaN', 4, '18', 1678);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (26, 'Thomas', 'Vorherr', '3030', NULL, 'NaN', 'NaN', 4, '18', 1678);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (27, 'Pascal', 'Kaeshammer', '3099', NULL, 'NaN', 'NaN', 4, '16', 1556);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (28, 'Edgar', 'Hagmann', '3281', NULL, 'NaN', 'NaN', 4, '15', 1494);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (29, 'Marc', 'Wannagat', '3377', NULL, 'NaN', 'NaN', 4, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (30, 'Dirk', 'Weniger', '2760', NULL, 'NaN', 'NaN', 4, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (31, 'Markus', 'Senn', '3354', NULL, 'NaN', 'NaN', 5, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (32, 'Kemal', 'Terzi', '3070', 'kemal.terzi@novartis.com; kterzi@gmx.ch', '+41 62 868 60 55', '+41 79 900 49 32', 5, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (33, 'Leandro', 'Senn', '3411', NULL, 'NaN', 'NaN', 5, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (34, 'Adrian', 'Auer', '3440', NULL, 'NaN', 'NaN', 6, '12', 1310);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (35, 'Silvio', 'Gurtner', '3358', NULL, 'NaN', 'NaN', 6, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (36, 'Michael', 'Hatke', '3436', NULL, 'NaN', 'NaN', 6, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (37, 'Maciek', 'Helbin', '3347', NULL, 'NaN', 'NaN', 6, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (38, 'Ralf', 'Baechle', '2937', NULL, 'NaN', 'NaN', 6, '10', 1187);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (39, 'Christoph', 'Zehnder', '3364', NULL, 'NaN', 'NaN', 6, '10', 1187);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (40, 'Ronald', 'Silva Molina', '3437', NULL, 'NaN', 'NaN', 6, '9', 1126);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (41, 'Daniel', 'Meissner', '3154', 'coucerbaum@yahoo.de;brix.bernhard@gmail.com', '---', '+49 152 3403 01 49', 6, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (42, 'Roland', 'Pfirter', '3343', NULL, 'NaN', 'NaN', 7, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (43, 'Werner', 'Ruder', '1323', 'werner.ruder@ebmnet.ch; sayer@web.de;sergioviva@hot', '+41 61 811 57 57', '+41 61 411 26 73', 7, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (44, 'Roger', 'Tuescher', '2680', NULL, 'NaN', 'NaN', 7, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (45, 'Rene', 'Fasolin', '3344', NULL, 'NaN', 'NaN', 7, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (46, 'Simon', 'Sayer', '3023', 'sayer@web.de; sergioviva@hotmail.com;sergioviva@hotma', '+41 79 577 12 88', '+41 61 421 22 30', 8, '9', 1126);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (47, 'Florian', 'Merz', '3056', NULL, 'NaN', 'NaN', 8, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (48, 'Robert', 'Marti', '3200', NULL, 'NaN', 'NaN', 8, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (49, 'Benjamin', 'Roberts', '1141', NULL, 'NaN', 'NaN', 8, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (50, 'Marco', 'Viva', '3156', NULL, 'NaN', 'NaN', 8, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (51, 'Sergio', 'Viva', '2812', NULL, 'NaN', 'NaN', 8, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (52, 'Bruno', 'Stoecklin', '2208', NULL, 'NaN', 'NaN', 8, '3', 757);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (53, 'Sandro', 'Borghesi', '1895', NULL, 'NaN', 'NaN', 9, '9', 1126);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (54, 'Reto', 'Burki', '1975', NULL, 'NaN', 'NaN', 9, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (55, 'Markus', 'Heitzmann', '2859', NULL, 'NaN', 'NaN', 9, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (56, 'Hans-Joerg', 'Martus', '2611', NULL, 'NaN', 'NaN', 9, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (57, 'Daniel', 'Muller', '3138', 'danielo.muller1@gmail.com;hansjoerg.martus@novartis.co', '+41 61 721 06 08', '+41 79 819 21 66', 9, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (58, 'Christine', 'Eigenmann', '3094', NULL, 'NaN', 'NaN', 9, '4', 819);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (59, 'Fabian', 'Wu', '3417', NULL, 'NaN', 'NaN', 9, '4', 819);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (60, 'Kai', 'Apel', '3163', NULL, 'NaN', 'NaN', 10, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (61, 'Alain', 'Baechle', '2933', 'alain.baechle@gmx.de;nathalie.vogel@swissonline.ch', '+49 152 23228900', '+49 152 23228900', 10, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (62, 'Kim', 'Baechle', '3068', NULL, 'NaN', 'NaN', 10, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (63, 'Mehmet', 'Bayraktar', '3186', NULL, 'NaN', 'NaN', 10, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (64, 'Christian', 'Gleichauf', '3365', NULL, 'NaN', 'NaN', 10, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (65, 'Nathalie', 'Vogel', '3109', NULL, 'NaN', 'NaN', 10, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (66, 'Kirill', 'Haar', '3447', NULL, 'NaN', 'NaN', 11, '10', 1187);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (67, 'Daniel', 'Barnet', '3191', NULL, 'NaN', 'NaN', 11, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (68, 'Kai-Uwe', 'Marx', '3034', NULL, 'NaN', 'NaN', 11, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (69, 'Marco', 'Brand', '3446', NULL, 'NaN', 'NaN', 11, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (70, 'Bernhard', 'Brix', '2503', 'brix.bernhard@gmail.com', '+41 78 314 62 25', '---', 11, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (71, 'Nam', 'Ha thanh', '1271', NULL, 'NaN', 'NaN', 11, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (72, 'Maurice', 'Mattedi', '3118', NULL, 'NaN', 'NaN', 11, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (73, 'Andreas', 'Müller', '3262', NULL, 'NaN', 'NaN', 11, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (74, 'Kevin', 'Lerch', '3438', NULL, 'NaN', 'NaN', 11, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (75, 'Christian', 'Switajski', '3282', NULL, 'NaN', 'NaN', 12, '15', 1494);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (76, 'Manuel', 'Brugger', '3132', NULL, 'NaN', 'NaN', 12, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (77, 'Krzysztof', 'Hanus', '3121', NULL, 'NaN', 'NaN', 12, '13', 1371);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (78, 'Jens', 'Kreutler', '2581', NULL, 'NaN', 'NaN', 12, '11', 1249);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (79, 'Andre', 'Lantos', '2548', 'andre.lantos@intergga.ch', '+41 79 707 39 32', '0', 12, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (80, 'Lisha', 'Wang', '3087', NULL, 'NaN', 'NaN', 12, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (81, 'Peter', 'Bielmeier', '3131', NULL, 'NaN', 'NaN', 13, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (82, 'Csaba', 'Verebes', '2785', NULL, 'NaN', 'NaN', 13, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (83, 'Dieter', 'Widor', '1501', 'dieter.widor@bluewin.ch', '+41 61 721 22 06', '+41 79 426 11 28', 13, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (84, 'Jörg', 'Zimmermann', '3000', NULL, 'NaN', 'NaN', 13, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (85, 'Cennet', 'Aslan', '3401', NULL, 'NaN', 'NaN', 13, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (86, 'Aljoscha', 'Jeisy', '3427', NULL, 'NaN', 'NaN', 13, '5', 880);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (87, 'Tobias', 'Steinke', '3285', NULL, 'NaN', 'NaN', 14, '8', 1064);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (88, 'Pierre', 'Sangalli', '3018', NULL, 'NaN', 'NaN', 14, '7', 1003);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (89, 'Christian', 'Meyer', '3143', NULL, 'NaN', 'NaN', 14, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (90, 'Paul', 'Schaffter', '3185', 'pschaffter@bluewin.ch', '+41 61 701 40 22', '+41 79 476 75 89', 14, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (91, 'Christian', 'Selz', '3002', NULL, 'NaN', 'NaN', 14, '6', 941);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (1, 'Ernoe', 'Varga', '3055', 'ernoe.varga@gmail.com', '+41 58 285 63 49', 'NaN', 1, '16', 1556);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (94, 'aaa', 'aaa', '123', 'aaa', '', '', NULL, '', 1200);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (95, '1111', '1111', '1111', NULL, NULL, NULL, NULL, '123', 1200);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (97, 'Roland', 'Mohler', '3048', NULL, NULL, NULL, 16, NULL, 800);
INSERT INTO public.players (id, first_name, last_name, license_number, email, phone1, phone2, team_id, classification, "ELO_points") VALUES (96, 'Herbert', 'Wetter', '1896', NULL, NULL, NULL, 16, NULL, 800);


ALTER TABLE public.players ENABLE TRIGGER ALL;

--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.teams DISABLE TRIGGER ALL;

INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (1, 'BASLER 01', '501', 1, 1);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (3, 'LIVEC 01', '6701', 1, 19);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (4, 'NOVARTIS 01', '901', 1, 41);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (5, 'NOVA-STEIN 01', '1801', 1, 32);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (6, 'NOVA-STEIN 02', '1802', 1, 41);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (7, 'KANT.VERW.  01', '3001', 2, 43);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (8, 'KANT.VERW.  02', '3002', 2, 46);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (9, 'NOVARTIS  02', '902', 2, 57);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (10, 'NOVA-STEIN  03', '1803', 2, 61);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (11, 'NOVA-STEIN  04', '1804', 2, 70);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (12, 'ROCHE  01', '4101', 2, 79);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (13, 'ROCHE  02', '4102', 2, 83);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (14, 'SWISSPORT  01', '5201', 2, 90);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (2, 'DSM SISSELN 01', '4201', 1, 13);
INSERT INTO public.teams (id, name, team_number, division_id, capitain_id) VALUES (16, 'NOVARTIS 04', '0904', 5, 96);


ALTER TABLE public.teams ENABLE TRIGGER ALL;

--
-- Data for Name: team_matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.team_matches DISABLE TRIGGER ALL;



ALTER TABLE public.team_matches ENABLE TRIGGER ALL;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.games DISABLE TRIGGER ALL;



ALTER TABLE public.games ENABLE TRIGGER ALL;

--
-- Data for Name: game_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.game_players DISABLE TRIGGER ALL;



ALTER TABLE public.game_players ENABLE TRIGGER ALL;

--
-- Data for Name: sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.sets DISABLE TRIGGER ALL;



ALTER TABLE public.sets ENABLE TRIGGER ALL;

--
-- Data for Name: team_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

ALTER TABLE public.team_memberships DISABLE TRIGGER ALL;



ALTER TABLE public.team_memberships ENABLE TRIGGER ALL;

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
-- PostgreSQL database dump complete
--

