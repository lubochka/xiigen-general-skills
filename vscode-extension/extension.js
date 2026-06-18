const fs = require("fs");
const path = require("path");
const vscode = require("vscode");

function workspaceRoot() {
  const folder = vscode.workspace.workspaceFolders && vscode.workspace.workspaceFolders[0];
  if (!folder) {
    throw new Error("Open a workspace before installing XIIGen skills.");
  }
  return folder.uri.fsPath;
}

function copyDir(source, target) {
  fs.mkdirSync(path.dirname(target), { recursive: true });
  fs.cpSync(source, target, { recursive: true, force: true });
}

function activate(context) {
  const extensionRoot = context.extensionPath;

  context.subscriptions.push(vscode.commands.registerCommand("xiigen.addPlanningSkills", async () => {
    const target = path.join(workspaceRoot(), "agent-skills");
    copyDir(path.join(extensionRoot, "resources", "agent-skills"), target);
    vscode.window.showInformationMessage("XIIGen planning skills copied to agent-skills.");
  }));

  context.subscriptions.push(vscode.commands.registerCommand("xiigen.addCursorRules", async () => {
    const target = path.join(workspaceRoot(), ".cursor", "rules");
    copyDir(path.join(extensionRoot, "resources", "cursor-rules"), target);
    vscode.window.showInformationMessage("XIIGen Cursor rules copied to .cursor/rules.");
  }));

  context.subscriptions.push(vscode.commands.registerCommand("xiigen.openReadme", async () => {
    const uri = vscode.Uri.file(path.join(extensionRoot, "README.md"));
    await vscode.commands.executeCommand("vscode.open", uri);
  }));
}

function deactivate() {}

module.exports = { activate, deactivate };
