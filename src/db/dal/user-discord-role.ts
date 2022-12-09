import UserDiscordRole from "../models/user-discord-role";
import { UserDiscordRoleInput, UserDiscordRoleOutput } from "../models/user-discord-role";

export const create = async (payload: UserDiscordRoleInput): Promise<UserDiscordRoleOutput> => {
  const userDiscordRole = await UserDiscordRole.create(payload);
  return userDiscordRole;
};

export const update = async (
  id: number,
  payload: Partial<UserDiscordRoleInput>
): Promise<UserDiscordRoleOutput> => {
  const userDiscordRole = await UserDiscordRole.findByPk(id);
  if (!userDiscordRole) {
    var err = new Error("UserDiscordRole not found");
    err.code = 404;
    throw err;
  }
  const updatedUserDiscordRole = await (userDiscordRole as UserDiscordRole).update(payload);
  return updatedUserDiscordRole;
};

export const updateById = async (
  id: string,
  payload: Partial<UserDiscordRoleInput>
): Promise<UserDiscordRoleOutput> => {
  const userDiscordRole = await UserDiscordRole.findOne({
    where: {
      id,
    },
  });
  if (!userDiscordRole) {
    var err = new Error("UserDiscordRole not found");
    err.code = 404;
    throw err;
  }
  const updatedUserDiscordRole = await (userDiscordRole as UserDiscordRole).update(payload);
  return updatedUserDiscordRole;
};

export const getById = async (id: number): Promise<UserDiscordRoleOutput> => {
  const userDiscordRole = await UserDiscordRole.findByPk(id);
  if (!userDiscordRole) {
    var err = new Error("UserDiscordRole not found");
    err.code = 404;
    throw err;
  }
  return userDiscordRole;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedUserDiscordRoleCount = await UserDiscordRole.destroy({
    where: { id },
  });
  return !!deletedUserDiscordRoleCount;
};

export const getAll = async (): Promise<UserDiscordRoleOutput[]> => {
  return UserDiscordRole.findAll();
};

export const findOrCreate = async ( payload: UserDiscordRoleInput): Promise<UserDiscordRoleOutput | null> => {
  const [ userDiscordRole, created ] = await UserDiscordRole.upsert({
    userId: payload.userId,
    discordRoleId: payload.discordRoleId,
  })
  return userDiscordRole;
};