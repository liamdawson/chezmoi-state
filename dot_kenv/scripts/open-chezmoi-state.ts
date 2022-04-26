// Name: Open Chezmoi State
// Description: Open the Chezmoi config file and state directory

import "@johnlindquist/kit";
import * as path from "path";
import * as os from "os";

const chezmoiDir = await exec("chezmoi source-path")?.stdout?.trim();
const chezmoiConfigPath = path.join(
  os.homedir(),
  ".config",
  "chezmoi",
  "chezmoi.toml"
);

await exec(
  `code --folder-uri "file://${chezmoiDir}" --file-uri "file://${chezmoiConfigPath}"`
);
