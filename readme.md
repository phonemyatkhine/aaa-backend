### Local testing
- Import dev.sql into your postgres docker db
- docker exec -i [container] psql -U myusername -d [dbname] < dev.sql

- Check .env in dev hour labs channel
- src/db/init.ts will populate DiscordRoles depending on .env: DISCORD_BOT_TOKEN, DISCORD_GUILD_ID
___
### Prepare prod.sql
- Clear all data from dev.sql
- Create DiscordGuilds record for paca paca channel.
- Create Campaign record with tweetId, discordGuildId.
- Change .env: DISCORD_BOT_TOKEN, DISCORD_GUILD_ID to your paca paca channel.
- src/db/init.ts will populate DiscordRoles.
- Create CampaignRoleRequirements records
- Good to go