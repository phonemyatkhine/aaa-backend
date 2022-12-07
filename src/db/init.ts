import Campaign from "./models/campaign";
const isDev = process.env.NODE_ENV === "development";

const dbInit = () => {
  // if isDev run migrations, seedings, etc.
  Campaign.sync({ alter: isDev });
}

export default dbInit;