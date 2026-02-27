// eslint.config.js (ESLint v9 flat config)
import security from "eslint-plugin-security";

export default [
  {
    files: ["**/*.js"],
    plugins: {
      security,
    },
    rules: {
      // Basic quality rules
      "no-unused-vars": "warn",
      "no-eval": "warn",

      // Security plugin example rule (as referenced in lab)
      "security/detect-possible-timing-attacks": "warn",
    },
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
    },
  },
];
