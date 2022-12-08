import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";
import Campaign from "./campaign";
import DiscordRole from "./discord-role";
import User from "./user";
import UserDiscordGuild from "./user-discord-guild";

interface DiscordGuildAttributes {
  id: number;
  name: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface DiscordGuildInput
  extends Optional<
    DiscordGuildAttributes,
    "id" | "name"
  > {}
export interface DiscordGuildOutput extends Required<DiscordGuildAttributes> {}

class DiscordGuild
  extends Model<DiscordGuildAttributes, DiscordGuildInput>
  implements DiscordGuildAttributes
{
  public id!: number;
  public name!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

DiscordGuild.init(
  {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);
DiscordGuild.hasMany(DiscordRole, { foreignKey: "discordGuildId" })
DiscordGuild.hasMany(Campaign, { foreignKey: "discordGuildId" })
// DiscordGuild.belongsToMany(User, { through: "User_Discord_Guild" })
DiscordGuild.hasMany(UserDiscordGuild, { foreignKey: "discordGuildId" })

export default DiscordGuild;