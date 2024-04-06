import { handler as ssrHandler } from "./dist/server/entry.mjs";

const app = express();
app.disable("x-powered-by");

app.use(express.static("dist/client/"));
app.use(ssrHandler);
