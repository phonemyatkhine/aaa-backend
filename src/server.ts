import express, {
  Express,
} from "express";
import dotenv from "dotenv";
import routes from "./api/routes";
import bodyParser from "body-parser";

dotenv.config();

// Imports / Requires
const app: Express = express();

// CORS only limits on production/staging server
const cors = require("cors");
const isDev = process.env.NODE_ENV === "development";

if (!isDev) {
  const whitelist = ['https://www.pacapaca.io/'];
  const corsOptions = {
    origin: function(origin: any, callback: any) {
      if (whitelist.indexOf(origin) !== -1) {
        callback(null, true)
      } else {
        callback(new Error('Not allowed by CORS'))
      }
    }
  }
  app.use(cors(corsOptions));
} else {
  app.use(cors());
}
const jsonParser = bodyParser.json();
app.use(jsonParser);

// Routes
app.use("/", routes);

// Serve
const port = process.env.PORT || 3000;
try {
  app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
  });
} catch (error: any) {
  console.log(`Error occurred: ${error.message}`);
}