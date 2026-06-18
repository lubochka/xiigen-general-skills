#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const cwd = process.cwd();

const packs = {
  "agent-skills": {
    from: "agent-skills",
    to: "agent-skills",
    note: "Agent Skills-compatible folders"
  },
  "claude-skills": {
    from: "claude/skills",
    to: ".claude/skills",
    note: "Claude-compatible skill folders"
  },
  "codex-skills": {
    from: "codex/skills",
    to: ".agents/skills",
    note: "Codex-compatible skill folders"
  },
  "cursor-rules": {
    from: "cursor/rules",
    to: ".cursor/rules",
    note: "Cursor .mdc rules"
  }
};

const planningSkills = [
  "authority-chain",
  "project-rules-first",
  "plan-before-execution",
  "scope-and-blockers",
  "assumption-registry",
  "decision-capture",
  "evidence-before-final",
  "session-output-contract"
];

function usage() {
  console.log(`XIIGen Agent Skills

Usage:
  npx @xiigen/agent-skills init
  npx @xiigen/agent-skills add agent-skills
  npx @xiigen/agent-skills add claude-skills
  npx @xiigen/agent-skills add codex-skills
  npx @xiigen/agent-skills add cursor-rules
  npx @xiigen/agent-skills add planning
  npx @xiigen/agent-skills add all

Notes:
  - Commands copy reusable guidance into the current working directory.
  - Review copied files before committing them to a target project.
  - Architecture and stack guides must be adapted from the target project, not copied as universal rules.`);
}

function copyDir(source, target) {
  if (!fs.existsSync(source)) {
    throw new Error(`Missing packaged source: ${source}`);
  }
  fs.mkdirSync(path.dirname(target), { recursive: true });
  fs.cpSync(source, target, { recursive: true, force: true });
}

function copyPack(name) {
  const pack = packs[name];
  if (!pack) {
    throw new Error(`Unknown pack: ${name}`);
  }
  copyDir(path.join(root, pack.from), path.join(cwd, pack.to));
  console.log(`Added ${pack.note} to ${pack.to}`);
}

function copyPlanning() {
  const target = path.join(cwd, "agent-skills");
  fs.mkdirSync(target, { recursive: true });
  for (const skill of planningSkills) {
    copyDir(path.join(root, "agent-skills", skill), path.join(target, skill));
  }
  console.log(`Added planning skill subset to agent-skills (${planningSkills.length} skills).`);
}

function initProject() {
  const profileSource = path.join(root, "adaptation", "project-profile.template.yaml");
  const profileTarget = path.join(cwd, "project-profile.yaml");
  if (!fs.existsSync(profileTarget)) {
    fs.copyFileSync(profileSource, profileTarget);
    console.log("Created project-profile.yaml from template.");
  } else {
    console.log("Skipped project-profile.yaml because it already exists.");
  }
  copyPlanning();
  console.log("Next: fill project-profile.yaml, then read adaptation/ADAPTATION-RUNBOOK.md in the package or repository.");
}

const [command, target] = process.argv.slice(2);

try {
  if (!command || command === "--help" || command === "-h") {
    usage();
  } else if (command === "init") {
    initProject();
  } else if (command === "add" && target === "all") {
    Object.keys(packs).forEach(copyPack);
  } else if (command === "add" && target === "planning") {
    copyPlanning();
  } else if (command === "add" && target) {
    copyPack(target);
  } else {
    usage();
    process.exitCode = 1;
  }
} catch (error) {
  console.error(`Error: ${error.message}`);
  process.exitCode = 1;
}
