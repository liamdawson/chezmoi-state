// Name: Open Workspace Project
// Description: Open a project via ghq

import "@johnlindquist/kit";
import { Choice } from "@johnlindquist/kit/types/core";
import * as path from "path";

const projectRoot = exec("ghq root")?.stdout?.trim() || "/";
const rawProjects = exec("ghq list")?.stdout?.trim() || "";
const projects: Array<Choice<string>> = rawProjects
  .split("\n")
  .map((projectPath) => ({
    name: projectPath.replace(/^.+\//, ""),
    description: projectPath,
    value: path.join(projectRoot, projectPath),
  }));

const project = await kitPrompt({
  placeholder: "project",
  choices: projects,
  strict: true,
});

await exec(`code ${project}`);
