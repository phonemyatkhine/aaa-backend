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
    "updatedAt" timestamp with time zone NOT NULL,
    description character varying(255),
    "imageUrl" character varying(255)
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

COPY public."Campaigns" (id, name, "tweetId", "discordGuildId", "pointPerTweet", "createdAt", "updatedAt", description, "imageUrl") FROM stdin;
1	Example Campaign	1601124608282742785	1048883426612236289	3	2022-12-09 15:56:11.330283+00	2022-12-09 15:56:11.330283+00	\N	\N
2	Test campaign	1601124608282742785	1048883426612236289	2	2022-12-09 17:43:39.02437+00	2022-12-09 17:43:39.02437+00	\N	\N
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
1048883426612236289	1048883426612236289	everyone	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883585379217469	1048883426612236289	Sukima	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883616152825866	1048883426612236289	Admin	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
1048883781991415818	1048883426612236289	Sugondese	2022-12-09 15:58:58.820223+00	2022-12-09 15:58:58.820223+00
\.


--
-- Data for Name: TweetTransactions; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."TweetTransactions" (id, "userId", "campaignId", "rewardPoint", status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: UserDiscordGuilds; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."UserDiscordGuilds" (id, "userId", "discordGuildId", "createdAt", "updatedAt") FROM stdin;
15	3	1048883426612236289	2022-12-23 16:31:15.696+00	2022-12-23 17:21:07.709+00
\.


--
-- Data for Name: UserDiscordRoles; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."UserDiscordRoles" (id, "userId", "discordRoleId", "createdAt", "updatedAt") FROM stdin;
28	3	1048883616152825866	2022-12-23 16:31:16.196+00	2022-12-23 16:31:16.196+00
29	3	1048883781991415818	2022-12-23 16:31:16.196+00	2022-12-23 16:31:16.196+00
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: myusername
--

COPY public."Users" (id, "discordUserId", "discordUsername", "twitterUserId", "twitterUsername", "pacaPoints", "createdAt", "updatedAt") FROM stdin;
3	1048242348062167050	yoichi	\N	\N	5	2022-12-12 07:43:10.24+00	2022-12-23 17:21:07.148+00
\.


--
-- Name: CampaignRoleRequirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."CampaignRoleRequirements_id_seq"', 1, false);


--
-- Name: Campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."Campaigns_id_seq"', 1, false);


--
-- Name: TweetTransactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."TweetTransactions_id_seq"', 9, true);


--
-- Name: UserDiscordGuilds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."UserDiscordGuilds_id_seq"', 19, true);


--
-- Name: UserDiscordRoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."UserDiscordRoles_id_seq"', 37, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myusername
--

SELECT pg_catalog.setval('public."Users_id_seq"', 20, true);


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

