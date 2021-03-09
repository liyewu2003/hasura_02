const { compilerOptions } = require("./tsconfig.json");
const pack = require("./package.json");

module.exports = {
  preset: "ts-jest",
  moduleNameMapper: {
    "^@striver/lib/(.*)$": "<rootDir>/lib/$1",
    "^@striver/api/(.*)$": "<rootDir>/pages/api/$1",
  },
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"],
  collectCoverage: true,
  coveragePathIgnorePatterns: ["(tests/.*.mock).(jsx?|tsx?)$", "/metadata/"],
  coverageDirectory: "<rootDir>/coverage/",
  testRegex: "(/__tests__/.*|(\\.|/)(test|spec))\\.tsx?$",
  transform: {
    "^.+\\.(ts|tsx)$": "ts-jest",
  },
  setupFilesAfterEnv: ["@testing-library/jest-dom/extend-expect"],
};
