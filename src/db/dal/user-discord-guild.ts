import UserDiscordGuild from "../models/user-discord-guild";
import { UserDiscordGuildInput, UserDiscordGuildOutput } from "../models/user-discord-guild";

export const create = async (payload: UserDiscordGuildInput): Promise<UserDiscordGuildOutput> => {
  const discordGuild = await UserDiscordGuild.create(payload);
  return discordGuild;
};

export const update = async (
  id: number,
  payload: Partial<UserDiscordGuildInput>
): Promise<UserDiscordGuildOutput> => {
  const discordGuild = await UserDiscordGuild.findByPk(id);
  if (!discordGuild) {
    var err = new Error("UserDiscordGuild not found");
    err.code = 404;
    throw err;
  }
  const updatedUserDiscordGuild = await (discordGuild as UserDiscordGuild).update(payload);
  return updatedUserDiscordGuild;
};

export const updateById = async (
  id: string,
  payload: Partial<UserDiscordGuildInput>
): Promise<UserDiscordGuildOutput> => {
  const discordGuild = await UserDiscordGuild.findOne({
    where: {
      id,
    },
  });
  if (!discordGuild) {
    var err = new Error("UserDiscordGuild not found");
    err.code = 404;
    throw err;
  }
  const updatedUserDiscordGuild = await (discordGuild as UserDiscordGuild).update(payload);
  return updatedUserDiscordGuild;
};

export const getById = async (id: number): Promise<UserDiscordGuildOutput> => {
  const discordGuild = await UserDiscordGuild.findByPk(id);
  if (!discordGuild) {
    var err = new Error("UserDiscordGuild not found");
    err.code = 404;
    throw err;
  }
  return discordGuild;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedUserDiscordGuildCount = await UserDiscordGuild.destroy({
    where: { id },
  });
  return !!deletedUserDiscordGuildCount;
};

export const getAll = async (): Promise<UserDiscordGuildOutput[]> => {
  return UserDiscordGuild.findAll();
};

export const findOrCreate = async ( payload: UserDiscordGuildInput): Promise<UserDiscordGuildOutput | null> => {
  const [ discordGuild, created ] = await UserDiscordGuild.upsert({
    userId: payload.userId,
    discordGuildId: payload.discordGuildId,
  })
  return discordGuild;
};