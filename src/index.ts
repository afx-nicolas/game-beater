import { Hono } from "hono";

const app = new Hono();

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

Bun.serve({
  fetch: app.fetch,
  port: process.env.API_PORT ?? 3000,
});
