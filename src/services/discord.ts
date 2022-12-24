import { doRequest } from "./common";
import * as userDal from "../db/dal/user";
import * as userDiscordRoleDal from "../db/dal/user-discord-role";
import * as discordGuildDal from "../db/dal/discord-guild";
import * as userDiscordGuildDal from "../db/dal/user-discord-guild";
import UserDiscordRole from "../db/models/user-discord-role";

export const populateDiscordData = async (discordUserId: string, username: string, accessToken: string) => {
  console.log('hehe');
  const user = await userDal.findOrCreate({
    discordUserId,
    discordUsername : username,
  });
  console.log(user);

  if(!user) {
    var error = new Error("Something went wrong");
    error.code = 500;
    throw error;
  }
  let response: any = await doRequest("https://discord.com/api/users/@me/guilds", {
    auth: {
      bearer: accessToken
    }
  }).catch((err) => {
    var error = new Error("Something went wrong");
    error.code = 500;
    throw error;
  });

  const guilds = JSON.parse(response);

  let discordGuilds = await discordGuildDal.getAll();
  let discordGuildIds = discordGuilds.map((guild: any) => guild.id);
  if (guilds.length > 0) {
    guilds.forEach(async (guild: any) => {
      if (discordGuildIds.includes(guild.id)) {
        let discordGuildId: string = guild.id;
        await userDiscordGuildDal.findOrCreate({
          userId: user.id,
          discordGuildId,
        });
        let response : any = await doRequest(`https://discord.com/api/users/@me/guilds/${discordGuildId}/member`, {
          auth: {
            bearer: accessToken
          }
        }).catch((err) => {
          var error = new Error("Something went wrong");
          error.code = 500;
          throw error;
        });

        let memberData = JSON.parse(response);
        if (memberData.roles.length > 0) {
          memberData.roles.forEach(async (discordRoleId: string) => {
            userDiscordRoleDal.create({
              userId: user.id,
              discordRoleId,
            }).then((userDiscordRole) => {
            }).catch((err) => {
              return;
            })
          })
        }
      }
    })
  }
  return true;
}