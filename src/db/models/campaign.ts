import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";
import CampaignRoleRequirement from "./campaign-role-requirement";
import DiscordGuild from "./discord-guild";
import DiscordRole from "./discord-role";
import TweetTransaction from "./tweet-transaction";
import User from "./user";

interface CampaignAttributes {
  id: number;
  name: string;
  tweetId: string;
  description: string;
  imageUrl: string;
  discordGuildId: string;
  pointPerTweet: number;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface CampaignInput
  extends Optional<
    CampaignAttributes,
    "id" | "name" | "tweetId" | "discordGuildId" | "pointPerTweet" | "description" | "imageUrl"
  > {}
export interface CampaignOutput extends Required<CampaignAttributes> {}

class Campaign
  extends Model<CampaignAttributes, CampaignInput>
  implements CampaignAttributes
{
  public id!: number;
  public name!: string;
  public tweetId!: string;
  public description!: string;
  public imageUrl!: string;
  public discordGuildId!: string;
  public pointPerTweet!: number;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

Campaign.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    imageUrl: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    tweetId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    discordGuildId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    pointPerTweet: {
      type: DataTypes.INTEGER,
      allowNull: false,
    }
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

Campaign.belongsToMany(DiscordRole, { through: "Campaign_Role_Requirement" })
Campaign.hasMany(TweetTransaction, { foreignKey: "campaignId" });
Campaign.hasMany(CampaignRoleRequirement, { foreignKey: "campaignId" });
// Campaign.belongsTo(DiscordGuild, { foreignKey: "discordGuildId" })
// Campaign.belongsToMany(User, { through: "Tweet_Transaction" })

export default Campaign;