--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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

ALTER TABLE ONLY public."UserDiscordRoles" DROP CONSTRAINT "UserDiscordRoles_userId_fkey";
ALTER TABLE ONLY public."UserDiscordRoles" DROP CONSTRAINT "UserDiscordRoles_discordRoleId_fkey";
ALTER TABLE ONLY public."UserDiscordGuilds" DROP CONSTRAINT "UserDiscordGuilds_userId_fkey";
ALTER TABLE ONLY public."UserDiscordGuilds" DROP CONSTRAINT "UserDiscordGuilds_discordGuildId_fkey";
ALTER TABLE ONLY public."TweetTransactions" DROP CONSTRAINT "TweetTransactions_userId_fkey";
ALTER TABLE ONLY public."TweetTransactions" DROP CONSTRAINT "TweetTransactions_campaignId_fkey";
ALTER TABLE ONLY public."DiscordRoles" DROP CONSTRAINT "DiscordRoles_discordGuildId_fkey";
ALTER TABLE ONLY public."Campaigns" DROP CONSTRAINT "Campaigns_discordGuildId_fkey";
ALTER TABLE ONLY public."CampaignRoleRequirements" DROP CONSTRAINT "CampaignRoleRequirements_discordRoleId_fkey";
ALTER TABLE ONLY public."CampaignRoleRequirements" DROP CONSTRAINT "CampaignRoleRequirements_campaignId_fkey";
DROP INDEX public.user_discord_roles_discord_role_id_user_id;
DROP INDEX public.user_discord_guilds_discord_guild_id_user_id;
DROP INDEX public.tweet_transactions_user_id_campaign_id;
DROP INDEX public.campaign_role_requirements_discord_role_id_campaign_id;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key99";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key98";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key97";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key96";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key95";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key94";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key93";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key92";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key91";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key90";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key9";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key89";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key88";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key87";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key86";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key85";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key84";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key83";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key82";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key81";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key80";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key8";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key79";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key78";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key77";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key76";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key75";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key74";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key73";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key72";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key71";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key70";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key7";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key69";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key68";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key67";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key66";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key65";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key64";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key63";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key62";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key61";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key60";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key6";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key59";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key58";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key57";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key56";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key55";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key54";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key53";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key52";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key51";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key50";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key5";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key49";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key48";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key47";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key46";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key45";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key44";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key43";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key42";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key41";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key40";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key4";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key39";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key38";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key37";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key36";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key35";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key34";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key33";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key32";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key31";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key30";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key3";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key29";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key28";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key27";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key26";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key25";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key24";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key23";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key22";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key21";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key20";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key2";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key19";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key18";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key17";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key16";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key15";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key14";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key134";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key133";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key132";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key131";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key130";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key13";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key129";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key128";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key127";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key126";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key125";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key124";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key123";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key122";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key121";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key120";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key12";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key119";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key118";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key117";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key116";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key115";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key114";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key113";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key112";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key111";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key110";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key11";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key109";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key108";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key107";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key106";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key105";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key104";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key103";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key102";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key101";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key100";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key10";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key1";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_discordUserId_key";
ALTER TABLE ONLY public."UserDiscordRoles" DROP CONSTRAINT "UserDiscordRoles_pkey";
ALTER TABLE ONLY public."UserDiscordGuilds" DROP CONSTRAINT "UserDiscordGuilds_pkey";
ALTER TABLE ONLY public."TweetTransactions" DROP CONSTRAINT "TweetTransactions_pkey";
ALTER TABLE ONLY public."DiscordRoles" DROP CONSTRAINT "DiscordRoles_pkey";
ALTER TABLE ONLY public."DiscordGuilds" DROP CONSTRAINT "DiscordGuilds_pkey";
ALTER TABLE ONLY public."Campaigns" DROP CONSTRAINT "Campaigns_pkey";
ALTER TABLE ONLY public."CampaignRoleRequirements" DROP CONSTRAINT "CampaignRoleRequirements_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."UserDiscordRoles" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."UserDiscordGuilds" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."TweetTransactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Campaigns" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."CampaignRoleRequirements" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserDiscordRoles_id_seq";
DROP TABLE public."UserDiscordRoles";
DROP SEQUENCE public."UserDiscordGuilds_id_seq";
DROP TABLE public."UserDiscordGuilds";
DROP SEQUENCE public."TweetTransactions_id_seq";
DROP TABLE public."TweetTransactions";
DROP TABLE public."DiscordRoles";
DROP TABLE public."DiscordGuilds";
DROP SEQUENCE public."Campaigns_id_seq";
DROP TABLE public."Campaigns";
DROP SEQUENCE public."CampaignRoleRequirements_id_seq";
DROP TABLE public."CampaignRoleRequirements";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: CampaignRoleRequirements; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."CampaignRoleRequirements" (
    id integer NOT NULL,
    "campaignId" integer NOT NULL,
    "discordRoleId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."CampaignRoleRequirements" OWNER TO myusername;

--
-- Name: CampaignRoleRequirements_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."CampaignRoleRequirements_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CampaignRoleRequirements_id_seq" OWNER TO myusername;

--
-- Name: CampaignRoleRequirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."CampaignRoleRequirements_id_seq" OWNED BY public."CampaignRoleRequirements".id;


--
-- Name: Campaigns; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."Campaigns" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "tweetId" character varying(255) NOT NULL,
    "discordGuildId" character varying(255) NOT NULL,
    "pointPerTweet" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Campaigns" OWNER TO myusername;

--
-- Name: Campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."Campaigns_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Campaigns_id_seq" OWNER TO myusername;

--
-- Name: Campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."Campaigns_id_seq" OWNED BY public."Campaigns".id;


--
-- Name: DiscordGuilds; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."DiscordGuilds" (
    id character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."DiscordGuilds" OWNER TO myusername;

--
-- Name: DiscordRoles; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."DiscordRoles" (
    id character varying(255) NOT NULL,
    "discordGuildId" character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."DiscordRoles" OWNER TO myusername;

--
-- Name: TweetTransactions; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."TweetTransactions" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "campaignId" integer NOT NULL,
    "rewardPoint" integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."TweetTransactions" OWNER TO myusername;

--
-- Name: TweetTransactions_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."TweetTransactions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TweetTransactions_id_seq" OWNER TO myusername;

--
-- Name: TweetTransactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."TweetTransactions_id_seq" OWNED BY public."TweetTransactions".id;


--
-- Name: UserDiscordGuilds; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."UserDiscordGuilds" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "discordGuildId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."UserDiscordGuilds" OWNER TO myusername;

--
-- Name: UserDiscordGuilds_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."UserDiscordGuilds_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserDiscordGuilds_id_seq" OWNER TO myusername;

--
-- Name: UserDiscordGuilds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."UserDiscordGuilds_id_seq" OWNED BY public."UserDiscordGuilds".id;


--
-- Name: UserDiscordRoles; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."UserDiscordRoles" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "discordRoleId" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."UserDiscordRoles" OWNER TO myusername;

--
-- Name: UserDiscordRoles_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."UserDiscordRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserDiscordRoles_id_seq" OWNER TO myusername;

--
-- Name: UserDiscordRoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."UserDiscordRoles_id_seq" OWNED BY public."UserDiscordRoles".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: myusername
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    "discordUserId" character varying(255) NOT NULL,
    "discordUsername" character varying(255),
    "twitterUserId" character varying(255),
    "twitterUsername" character varying(255),
    "pacaPoints" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO myusername;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: myusername
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO myusername;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myusername
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: CampaignRoleRequirements id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."CampaignRoleRequirements" ALTER COLUMN id SET DEFAULT nextval('public."CampaignRoleRequirements_id_seq"'::regclass);


--
-- Name: Campaigns id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Campaigns" ALTER COLUMN id SET DEFAULT nextval('public."Campaigns_id_seq"'::regclass);


--
-- Name: TweetTransactions id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."TweetTransactions" ALTER COLUMN id SET DEFAULT nextval('public."TweetTransactions_id_seq"'::regclass);


--
-- Name: UserDiscordGuilds id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordGuilds" ALTER COLUMN id SET DEFAULT nextval('public."UserDiscordGuilds_id_seq"'::regclass);


--
-- Name: UserDiscordRoles id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordRoles" ALTER COLUMN id SET DEFAULT nextval('public."UserDiscordRoles_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: CampaignRoleRequirements; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."CampaignRoleRequirements" (id, "campaignId", "discordRoleId", "createdAt", "updatedAt") FROM stdin;
1	1	1048883585379217469	2022-12-09 17:23:37.819514+00	2022-12-09 17:23:37.819514+00
2	1	1048883781991415818	2022-12-09 17:23:37.819514+00	2022-12-09 17:23:37.819514+00
\.


--
-- Data for Name: Campaigns; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."Campaigns" (id, name, "tweetId", "discordGuildId", "pointPerTweet", "createdAt", "updatedAt") FROM stdin;
1	Example Campaign	1601124608282742785	1048883426612236289	3	2022-12-09 15:56:11.330283+00	2022-12-09 15:56:11.330283+00
2	Test campaign	1601124608282742785	1048883426612236289	2	2022-12-09 17:43:39.02437+00	2022-12-09 17:43:39.02437+00
\.


--
-- Data for Name: DiscordGuilds; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."DiscordGuilds" (id, name, "createdAt", "updatedAt") FROM stdin;
1048883426612236289	Dev hour labs	2022-12-09 15:56:03.080719+00	2022-12-09 16:41:07.748+00
\.


--
-- Data for Name: DiscordRoles; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."DiscordRoles" (id, "discordGuildId", name, "createdAt", "updatedAt") FROM stdin;
1048883616152825866	1048883426612236289	Admin	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883585379217469	1048883426612236289	Sukima	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883426612236289	1048883426612236289	everyone	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883781991415818	1048883426612236289	Sugondese	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
\.


--
-- Data for Name: TweetTransactions; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."TweetTransactions" (id, "userId", "campaignId", "rewardPoint", status, "createdAt", "updatedAt") FROM stdin;
8	1	1	3	t	2022-12-09 17:42:59.547+00	2022-12-09 17:42:59.547+00
11	1	2	2	t	2022-12-09 17:44:49.842+00	2022-12-09 17:44:49.842+00
\.


--
-- Data for Name: UserDiscordGuilds; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."UserDiscordGuilds" (id, "userId", "discordGuildId", "createdAt", "updatedAt") FROM stdin;
54	1	1048883426612236289	2022-12-09 17:02:44.961+00	2022-12-09 17:21:21.077+00
\.


--
-- Data for Name: UserDiscordRoles; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."UserDiscordRoles" (id, "userId", "discordRoleId", "createdAt", "updatedAt") FROM stdin;
58	1	1048883781991415818	2022-12-09 17:09:24.131+00	2022-12-09 17:15:57.613+00
57	1	1048883585379217469	2022-12-09 17:09:24.131+00	2022-12-09 17:15:57.613+00
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."Users" (id, "discordUserId", "discordUsername", "twitterUserId", "twitterUsername", "pacaPoints", "createdAt", "updatedAt") FROM stdin;
1	1048242348062167050		\N	\N	5	2022-12-09 15:00:47.463+00	2022-12-09 17:44:49.865+00
\.


--
-- Name: CampaignRoleRequirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."CampaignRoleRequirements_id_seq"', 2, true);


--
-- Name: Campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."Campaigns_id_seq"', 1, true);


--
-- Name: TweetTransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."TweetTransactions_id_seq"', 11, true);


--
-- Name: UserDiscordGuilds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."UserDiscordGuilds_id_seq"', 80, true);


--
-- Name: UserDiscordRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."UserDiscordRoles_id_seq"', 78, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."Users_id_seq"', 50, true);


--
-- Name: CampaignRoleRequirements CampaignRoleRequirements_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."CampaignRoleRequirements"
    ADD CONSTRAINT "CampaignRoleRequirements_pkey" PRIMARY KEY (id);


--
-- Name: Campaigns Campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_pkey" PRIMARY KEY (id);


--
-- Name: DiscordGuilds DiscordGuilds_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."DiscordGuilds"
    ADD CONSTRAINT "DiscordGuilds_pkey" PRIMARY KEY (id);


--
-- Name: DiscordRoles DiscordRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."DiscordRoles"
    ADD CONSTRAINT "DiscordRoles_pkey" PRIMARY KEY (id);


--
-- Name: TweetTransactions TweetTransactions_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."TweetTransactions"
    ADD CONSTRAINT "TweetTransactions_pkey" PRIMARY KEY (id);


--
-- Name: UserDiscordGuilds UserDiscordGuilds_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordGuilds"
    ADD CONSTRAINT "UserDiscordGuilds_pkey" PRIMARY KEY (id);


--
-- Name: UserDiscordRoles UserDiscordRoles_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordRoles"
    ADD CONSTRAINT "UserDiscordRoles_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_discordUserId_key; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key1; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key1" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key10; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key10" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key100; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key100" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key101; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key101" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key102; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key102" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key103; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key103" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key104; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key104" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key105; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key105" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key106; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key106" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key107; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key107" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key108; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key108" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key109; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key109" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key11; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key11" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key110; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key110" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key111; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key111" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key112; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key112" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key113; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key113" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key114; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key114" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key115; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key115" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key116; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key116" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key117; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key117" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key118; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key118" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key119; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key119" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key12; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key12" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key120; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key120" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key121; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key121" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key122; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key122" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key123; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key123" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key124; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key124" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key125; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key125" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key126; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key126" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key127; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key127" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key128; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key128" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key129; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key129" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key13; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key13" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key130; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key130" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key131; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key131" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key132; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key132" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key133; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key133" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key134; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key134" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key14; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key14" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key15; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key15" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key16; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key16" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key17; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key17" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key18; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key18" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key19; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key19" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key2; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key2" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key20; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key20" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key21; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key21" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key22; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key22" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key23; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key23" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key24; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key24" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key25; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key25" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key26; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key26" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key27; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key27" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key28; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key28" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key29; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key29" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key3; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key3" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key30; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key30" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key31; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key31" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key32; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key32" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key33; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key33" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key34; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key34" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key35; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key35" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key36; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key36" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key37; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key37" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key38; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key38" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key39; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key39" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key4; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key4" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key40; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key40" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key41; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key41" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key42; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key42" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key43; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key43" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key44; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key44" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key45; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key45" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key46; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key46" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key47; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key47" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key48; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key48" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key49; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key49" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key5; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key5" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key50; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key50" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key51; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key51" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key52; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key52" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key53; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key53" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key54; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key54" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key55; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key55" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key56; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key56" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key57; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key57" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key58; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key58" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key59; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key59" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key6; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key6" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key60; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key60" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key61; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key61" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key62; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key62" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key63; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key63" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key64; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key64" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key65; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key65" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key66; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key66" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key67; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key67" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key68; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key68" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key69; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key69" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key7; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key7" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key70; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key70" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key71; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key71" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key72; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key72" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key73; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key73" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key74; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key74" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key75; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key75" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key76; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key76" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key77; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key77" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key78; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key78" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key79; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key79" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key8; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key8" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key80; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key80" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key81; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key81" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key82; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key82" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key83; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key83" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key84; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key84" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key85; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key85" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key86; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key86" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key87; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key87" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key88; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key88" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key89; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key89" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key9; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key9" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key90; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key90" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key91; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key91" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key92; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key92" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key93; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key93" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key94; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key94" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key95; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key95" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key96; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key96" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key97; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key97" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key98; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key98" UNIQUE ("discordUserId");


--
-- Name: Users Users_discordUserId_key99; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_discordUserId_key99" UNIQUE ("discordUserId");


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: campaign_role_requirements_discord_role_id_campaign_id; Type: INDEX; Schema: public; Owner: myusername
--

CREATE UNIQUE INDEX campaign_role_requirements_discord_role_id_campaign_id ON public."CampaignRoleRequirements" USING btree ("discordRoleId", "campaignId");


--
-- Name: tweet_transactions_user_id_campaign_id; Type: INDEX; Schema: public; Owner: myusername
--

CREATE UNIQUE INDEX tweet_transactions_user_id_campaign_id ON public."TweetTransactions" USING btree ("userId", "campaignId");


--
-- Name: user_discord_guilds_discord_guild_id_user_id; Type: INDEX; Schema: public; Owner: myusername
--

CREATE UNIQUE INDEX user_discord_guilds_discord_guild_id_user_id ON public."UserDiscordGuilds" USING btree ("discordGuildId", "userId");


--
-- Name: user_discord_roles_discord_role_id_user_id; Type: INDEX; Schema: public; Owner: myusername
--

CREATE UNIQUE INDEX user_discord_roles_discord_role_id_user_id ON public."UserDiscordRoles" USING btree ("discordRoleId", "userId");


--
-- Name: CampaignRoleRequirements CampaignRoleRequirements_campaignId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."CampaignRoleRequirements"
    ADD CONSTRAINT "CampaignRoleRequirements_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES public."Campaigns"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CampaignRoleRequirements CampaignRoleRequirements_discordRoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."CampaignRoleRequirements"
    ADD CONSTRAINT "CampaignRoleRequirements_discordRoleId_fkey" FOREIGN KEY ("discordRoleId") REFERENCES public."DiscordRoles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Campaigns Campaigns_discordGuildId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."Campaigns"
    ADD CONSTRAINT "Campaigns_discordGuildId_fkey" FOREIGN KEY ("discordGuildId") REFERENCES public."DiscordGuilds"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: DiscordRoles DiscordRoles_discordGuildId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."DiscordRoles"
    ADD CONSTRAINT "DiscordRoles_discordGuildId_fkey" FOREIGN KEY ("discordGuildId") REFERENCES public."DiscordGuilds"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TweetTransactions TweetTransactions_campaignId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."TweetTransactions"
    ADD CONSTRAINT "TweetTransactions_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES public."Campaigns"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TweetTransactions TweetTransactions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."TweetTransactions"
    ADD CONSTRAINT "TweetTransactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserDiscordGuilds UserDiscordGuilds_discordGuildId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordGuilds"
    ADD CONSTRAINT "UserDiscordGuilds_discordGuildId_fkey" FOREIGN KEY ("discordGuildId") REFERENCES public."DiscordGuilds"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserDiscordGuilds UserDiscordGuilds_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordGuilds"
    ADD CONSTRAINT "UserDiscordGuilds_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserDiscordRoles UserDiscordRoles_discordRoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordRoles"
    ADD CONSTRAINT "UserDiscordRoles_discordRoleId_fkey" FOREIGN KEY ("discordRoleId") REFERENCES public."DiscordRoles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserDiscordRoles UserDiscordRoles_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myusername
--

ALTER TABLE ONLY public."UserDiscordRoles"
    ADD CONSTRAINT "UserDiscordRoles_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

