import e from "express";
import User from "../models/user";
import { UserInput, UserOutput } from "../models/user";

export const create = async (payload: UserInput): Promise<UserOutput> => {
  const user = await User.create(payload);
  return user;
};

export const update = async (
  id: number,
  payload: Partial<UserInput>
): Promise<UserOutput> => {
  const user = await User.findByPk(id);
  if (!user) {
    var err = new Error("User not found");
    err.code = 404;
    throw err;
  }
  const updatedUser = await (user as User).update(payload);
  return updatedUser;
};

export const updateById = async (
  id: string,
  payload: Partial<UserInput>
): Promise<UserOutput> => {
  const user = await User.findOne({
    where: {
      id,
    },
  });
  if (!user) {
    var err = new Error("User not found");
    err.code = 404;
    throw err;
  }
  const updatedUser = await (user as User).update(payload);
  return updatedUser;
};

export const getById = async (id: number): Promise<UserOutput> => {
  const user = await User.findByPk(id);
  if (!user) {
    var err = new Error("User not found");
    err.code = 404;
    throw err;
  }
  return user;
};

export const getByDiscordUserId = async (discordUserId: string): Promise<UserOutput> => {
  const user = await User.findOne({
    where: {
      discordUserId,
    }
  });
  if (!user) {
    var err = new Error("User not found");
    err.code = 404;
    throw err;
  }
  return user;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedUserCount = await User.destroy({
    where: { id },
  });
  return !!deletedUserCount;
};

export const getAll = async (): Promise<UserOutput[]> => {
  return User.findAll();
};

export const findOrCreate = async ( payload: UserInput): Promise<UserOutput | null> => {
  const [ user, created ] = await User.upsert({
    discordUserId: payload.discordUserId,
    discordUsername: payload.discordUsername,
  })
  return user;
};
