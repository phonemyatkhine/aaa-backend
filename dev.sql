-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: aaa_backend_test
-- Generation Time: 2022-12-14 12:10:29.0530 AM
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."CampaignRoleRequirements";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "CampaignRoleRequirements_id_seq";

-- Table Definition
CREATE TABLE "public"."CampaignRoleRequirements" (
    "id" int4 NOT NULL DEFAULT nextval('"CampaignRoleRequirements_id_seq"'::regclass),
    "campaignId" int4 NOT NULL,
    "discordRoleId" varchar(255) NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."Campaigns";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "Campaigns_id_seq";

-- Table Definition
CREATE TABLE "public"."Campaigns" (
    "id" int4 NOT NULL DEFAULT nextval('"Campaigns_id_seq"'::regclass),
    "name" varchar(255) NOT NULL,
    "tweetId" varchar(255) NOT NULL,
    "discordGuildId" varchar(255) NOT NULL,
    "pointPerTweet" int4 NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "description" varchar(255),
    "imageUrl" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."DiscordGuilds";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."DiscordGuilds" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."DiscordRoles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."DiscordRoles" (
    "id" varchar(255) NOT NULL,
    "discordGuildId" varchar(255) NOT NULL,
    "name" varchar(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."TweetTransactions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "TweetTransactions_id_seq";

-- Table Definition
CREATE TABLE "public"."TweetTransactions" (
    "id" int4 NOT NULL DEFAULT nextval('"TweetTransactions_id_seq"'::regclass),
    "userId" int4 NOT NULL,
    "campaignId" int4 NOT NULL,
    "rewardPoint" int4 NOT NULL,
    "status" bool NOT NULL DEFAULT true,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."UserDiscordGuilds";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "UserDiscordGuilds_id_seq";

-- Table Definition
CREATE TABLE "public"."UserDiscordGuilds" (
    "id" int4 NOT NULL DEFAULT nextval('"UserDiscordGuilds_id_seq"'::regclass),
    "userId" int4 NOT NULL,
    "discordGuildId" varchar(255) NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."UserDiscordRoles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "UserDiscordRoles_id_seq";

-- Table Definition
CREATE TABLE "public"."UserDiscordRoles" (
    "id" int4 NOT NULL DEFAULT nextval('"UserDiscordRoles_id_seq"'::regclass),
    "userId" int4 NOT NULL,
    "discordRoleId" varchar(255) NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."Users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "Users_id_seq";

-- Table Definition
CREATE TABLE "public"."Users" (
    "id" int4 NOT NULL DEFAULT nextval('"Users_id_seq"'::regclass),
    "discordUserId" varchar(255) NOT NULL,
    "discordUsername" varchar(255),
    "twitterUserId" varchar(255),
    "twitterUsername" varchar(255),
    "pacaPoints" int4 NOT NULL DEFAULT 0,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."CampaignRoleRequirements" ("id", "campaignId", "discordRoleId", "createdAt", "updatedAt") VALUES
(1, 1, '1048883585379217469', '2022-12-09 17:23:37.819514+00', '2022-12-09 17:23:37.819514+00'),
(2, 1, '1048883781991415818', '2022-12-09 17:23:37.819514+00', '2022-12-09 17:23:37.819514+00');

INSERT INTO "public"."Campaigns" ("id", "name", "tweetId", "discordGuildId", "pointPerTweet", "createdAt", "updatedAt", "description", "imageUrl") VALUES
(1, 'Example Campaign', '1601124608282742785', '1048883426612236289', 3, '2022-12-09 15:56:11.330283+00', '2022-12-09 15:56:11.330283+00', NULL, NULL),
(2, 'Test campaign', '1601124608282742785', '1048883426612236289', 2, '2022-12-09 17:43:39.02437+00', '2022-12-09 17:43:39.02437+00', NULL, NULL);

INSERT INTO "public"."DiscordGuilds" ("id", "name", "createdAt", "updatedAt") VALUES
('1048883426612236289', 'Dev hour labs', '2022-12-09 15:56:03.080719+00', '2022-12-09 16:41:07.748+00');

INSERT INTO "public"."DiscordRoles" ("id", "discordGuildId", "name", "createdAt", "updatedAt") VALUES
('1048883426612236289', '1048883426612236289', 'everyone', '2022-12-09 15:58:58.820223+00', '2022-12-09 15:58:58.820223+00'),
('1048883585379217469', '1048883426612236289', 'Sukima', '2022-12-09 15:58:58.820223+00', '2022-12-09 15:58:58.820223+00'),
('1048883616152825866', '1048883426612236289', 'Admin', '2022-12-09 15:58:58.820223+00', '2022-12-09 15:58:58.820223+00'),
('1048883781991415818', '1048883426612236289', 'Sugondese', '2022-12-09 15:58:58.820223+00', '2022-12-09 15:58:58.820223+00');

INSERT INTO "public"."Users" ("id", "discordUserId", "discordUsername", "twitterUserId", "twitterUsername", "pacaPoints", "createdAt", "updatedAt") VALUES
(3, '1048242348062167050', '', NULL, NULL, 5, '2022-12-12 07:43:10.24+00', '2022-12-12 13:12:44.034+00');

ALTER TABLE "public"."CampaignRoleRequirements" ADD FOREIGN KEY ("campaignId") REFERENCES "public"."Campaigns"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."CampaignRoleRequirements" ADD FOREIGN KEY ("discordRoleId") REFERENCES "public"."DiscordRoles"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."Campaigns" ADD FOREIGN KEY ("discordGuildId") REFERENCES "public"."DiscordGuilds"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."DiscordRoles" ADD FOREIGN KEY ("discordGuildId") REFERENCES "public"."DiscordGuilds"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."TweetTransactions" ADD FOREIGN KEY ("userId") REFERENCES "public"."Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."TweetTransactions" ADD FOREIGN KEY ("campaignId") REFERENCES "public"."Campaigns"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."UserDiscordGuilds" ADD FOREIGN KEY ("userId") REFERENCES "public"."Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."UserDiscordGuilds" ADD FOREIGN KEY ("discordGuildId") REFERENCES "public"."DiscordGuilds"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."UserDiscordRoles" ADD FOREIGN KEY ("userId") REFERENCES "public"."Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."UserDiscordRoles" ADD FOREIGN KEY ("discordRoleId") REFERENCES "public"."DiscordRoles"("id") ON DELETE CASCADE ON UPDATE CASCADE;
