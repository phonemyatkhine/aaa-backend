import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";

interface UserDiscordGuildAttributes {
  id: number;
  userId: number;
  discordGuildId: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface UserDiscordGuildInput
  extends Optional<
    UserDiscordGuildAttributes,
    "id" | "userId" | "discordGuildId"
  > {}
export interface UserDiscordGuildOutput extends Required<UserDiscordGuildAttributes> {}

class UserDiscordGuild
  extends Model<UserDiscordGuildAttributes, UserDiscordGuildInput>
  implements UserDiscordGuildAttributes
{
  public id!: number;
  public userId!: number;
  public discordGuildId!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

UserDiscordGuild.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    discordGuildId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    indexes: [{
      unique: true,
      fields: ["discordGuildId", "userId"],
    }],
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

export default UserDiscordGuild;