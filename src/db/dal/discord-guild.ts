import DiscordGuild from "../models/discord-guild";
import { DiscordGuildInput, DiscordGuildOutput } from "../models/discord-guild";

export const create = async (payload: DiscordGuildInput): Promise<DiscordGuildOutput> => {
  const discordGuild = await DiscordGuild.create(payload);
  return discordGuild;
};

export const update = async (
  id: number,
  payload: Partial<DiscordGuildInput>
): Promise<DiscordGuildOutput> => {
  const discordGuild = await DiscordGuild.findByPk(id);
  if (!discordGuild) {
    var err = new Error("DiscordGuild not found");
    err.code = 404;
    throw err;
  }
  const updatedDiscordGuild = await (discordGuild as DiscordGuild).update(payload);
  return updatedDiscordGuild;
};

export const updateById = async (
  id: string,
  payload: Partial<DiscordGuildInput>
): Promise<DiscordGuildOutput> => {
  const discordGuild = await DiscordGuild.findOne({
    where: {
      id,
    },
  });
  if (!discordGuild) {
    var err = new Error("DiscordGuild not found");
    err.code = 404;
    throw err;
  }
  const updatedDiscordGuild = await (discordGuild as DiscordGuild).update(payload);
  return updatedDiscordGuild;
};

export const getById = async (id: number): Promise<DiscordGuildOutput> => {
  const discordGuild = await DiscordGuild.findByPk(id);
  if (!discordGuild) {
    var err = new Error("DiscordGuild not found");
    err.code = 404;
    throw err;
  }
  return discordGuild;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedDiscordGuildCount = await DiscordGuild.destroy({
    where: { id },
  });
  return !!deletedDiscordGuildCount;
};

export const getAll = async (): Promise<DiscordGuildOutput[]> => {
  return DiscordGuild.findAll();
};

export const findOrCreate = async ( payload: DiscordGuildInput): Promise<DiscordGuildOutput | null> => {
  const [ discordGuild, created ] = await DiscordGuild.upsert({
    id: payload.id,
    name: payload.name,
  })
  return discordGuild;
};
