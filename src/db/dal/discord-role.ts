import DiscordRole from "../models/discord-role";
import { DiscordRoleInput, DiscordRoleOutput } from "../models/discord-role";

export const create = async (payload: DiscordRoleInput): Promise<DiscordRoleOutput> => {
  const discordRole = await DiscordRole.create(payload);
  return discordRole;
};

export const update = async (
  id: number,
  payload: Partial<DiscordRoleInput>
): Promise<DiscordRoleOutput> => {
  const discordRole = await DiscordRole.findByPk(id);
  if (!discordRole) {
    var err = new Error("DiscordRole not found");
    err.code = 404;
    throw err;
  }
  const updatedDiscordRole = await (discordRole as DiscordRole).update(payload);
  return updatedDiscordRole;
};

export const updateById = async (
  id: string,
  payload: Partial<DiscordRoleInput>
): Promise<DiscordRoleOutput> => {
  const discordRole = await DiscordRole.findOne({
    where: {
      id,
    },
  });
  if (!discordRole) {
    var err = new Error("DiscordRole not found");
    err.code = 404;
    throw err;
  }
  const updatedDiscordRole = await (discordRole as DiscordRole).update(payload);
  return updatedDiscordRole;
};

export const getById = async (id: number): Promise<DiscordRoleOutput> => {
  const discordRole = await DiscordRole.findByPk(id);
  if (!discordRole) {
    var err = new Error("DiscordRole not found");
    err.code = 404;
    throw err;
  }
  return discordRole;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedDiscordRoleCount = await DiscordRole.destroy({
    where: { id },
  });
  return !!deletedDiscordRoleCount;
};

export const getAll = async (): Promise<DiscordRoleOutput[]> => {
  return DiscordRole.findAll();
};

export const findOrCreate = async ( payload: DiscordRoleInput): Promise<DiscordRoleOutput | null> => {
  const [ discordRole, created ] = await DiscordRole.upsert({
    id: payload.id,
    name: payload.name,
  })
  return discordRole;
};
