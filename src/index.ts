import { Hono } from "hono";
import { serve } from "@hono/node-server";

const app = new Hono();

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

serve({
  fetch: app.fetch,
  port: process.env.API_PORT ?? 3000,
});
