import Campaign from "./models/campaign";
import DiscordGuild from "./models/discord-guild";
import DiscordRole from "./models/discord-role";
import TweetTransaction from "./models/tweet-transaction";
import UserDiscordGuild from "./models/user-discord-guild";
import UserDiscordRole from "./models/user-discord-role";
import CampaignRoleRequirement from "./models/campaign-role-requirement";
import User from "./models/user";

const isDev = process.env.NODE_ENV === "development";

const dbInit = () => {
  // if isDev run migrations, seedings, etc.
  User.sync({ alter: isDev });
  DiscordGuild.sync({ alter: isDev });
  Campaign.sync({ alter: isDev });
  DiscordRole.sync({ alter: isDev });
  TweetTransaction.sync({ alter: isDev });
  UserDiscordGuild.sync({ alter: isDev });
  UserDiscordRole.sync({ alter: isDev });
  CampaignRoleRequirement.sync({ alter: isDev });
}

export default dbInit;