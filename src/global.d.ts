export declare global {
  namespace NodeJS {
    interface ProcessEnv {
      API_PORT: number;
      DATABASE_NAME: string;
      DATABASE_USER: string;
      DATABASE_PASSWORD: string;
    }
  }
}
