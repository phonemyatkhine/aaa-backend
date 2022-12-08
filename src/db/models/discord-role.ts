import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";
import Campaign from "./campaign";
import CampaignRoleRequirement from "./campaign-role-requirement";
import DiscordGuild from "./discord-guild";
import User from "./user";
import UserDiscordRole from "./user-discord-role";

interface DiscordRoleAttributes {
  id: number;
  discordGuildId: number;
  name: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface DiscordRoleInput
  extends Optional<
    DiscordRoleAttributes,
    "id" | "discordGuildId" | "name"
  > {}
export interface DiscordRoleOutput extends Required<DiscordRoleAttributes> {}

class DiscordRole
  extends Model<DiscordRoleAttributes, DiscordRoleInput>
  implements DiscordRoleAttributes
{
  public id!: number;
  public discordGuildId!: number;
  public discordRoleId!: number;
  public name!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

DiscordRole.init(
  {
    id: {
      type: DataTypes.BIGINT,
      autoIncrement: true,
      primaryKey: true,
    },
    discordGuildId: {
      type: DataTypes.BIGINT,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);
// DiscordRole.belongsTo(DiscordGuild, { foreignKey: "guildId" });
// DiscordRole.belongsToMany(User, { through: "User_Discord_Role" })
// DiscordRole.belongsToMany(Campaign, { through: "Campaign_Role_Requirement" })
DiscordRole.hasMany(UserDiscordRole, { foreignKey: "discordRoleId" });
DiscordRole.hasMany(CampaignRoleRequirement, { foreignKey: "discordRoleId" });

export default DiscordRole;