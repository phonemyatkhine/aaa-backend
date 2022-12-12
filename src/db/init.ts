// import Campaign from "./models/campaign";
// import DiscordGuild from "./models/discord-guild";
// import DiscordRole from "./models/discord-role";
// import TweetTransaction from "./models/tweet-transaction";
// import UserDiscordGuild from "./models/user-discord-guild";
// import UserDiscordRole from "./models/user-discord-role";
// import CampaignRoleRequirement from "./models/campaign-role-requirement";
// import User from "./models/user";
import { create as createRole } from "./dal/discord-role";
import { DiscordRoleInput } from "./models/discord-role";
import { doRequest } from "../services/common";

const isDev = process.env.NODE_ENV === "development";

const dbInit = async () => {
  // if isDev run migrations, seedings, etc.

  // User.sync({ alter: isDev });
  // DiscordGuild.sync({ alter: isDev });
  // Campaign.sync({ alter: isDev });
  // DiscordRole.sync({ alter: isDev });
  // TweetTransaction.sync({ alter: isDev });
  // UserDiscordGuild.sync({ alter: isDev });
  // UserDiscordRole.sync({ alter: isDev });
  // CampaignRoleRequirement.sync({ alter: isDev });

  // Import roles from discord bot token.
  // const discordGuildId = process.env.DISCORD_GUILD_ID;
  // let response: any = await doRequest(`https://discord.com/api/guilds/${discordGuildId}`, {
  //   headers: {
  //     Authorization: `Bot ${process.env.DISCORD_BOT_TOKEN}`,
  //   }
  // }).catch((err) => {
  //   console.log(err);
  //   return;
  // });
  // const data = JSON.parse(response);
  // console.log(data);
  // data.roles.forEach((role: any) => {
  //   let roleData: DiscordRoleInput = {
  //     id: role.id,
  //     name: role.name,
  //     discordGuildId: discordGuildId,
  //   }
  //   createRole(roleData).then((role) => {

  //   }).catch((err) => {
      
  //   });
  // })
}

export default dbInit;