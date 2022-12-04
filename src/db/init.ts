// import Example from "./models/example";
const isDev = process.env.NODE_ENV === "development";

const dbInit = () => {
//   if isDev run migrations, seedings, etc.
//   Example.sync({ alter: isDev });
}

export default dbInit;