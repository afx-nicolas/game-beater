export default {
  "*.{js,ts}": (stagedFiles) => [
    "eslint . --fix --max-warnings=0",
    `prettier --write ${stagedFiles.join(" ")}`,
    "tsc -p tsconfig.json --noEmit",
  ],
};
