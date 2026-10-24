# skills

AI agent skills by [@huanshankeji](https://github.com/huanshankeji) mainly for our own development conventions, following the [Agent Skills](https://agentskills.io) standard.

## Skills

| Skill | Description |
|---|---|
| [git-commit-after-review](skills/git-commit-after-review/) | Creates a Git commit for follow-up work after a **human** fully reviews a named commit, commit range, whole PR, or remaining unreviewed PR Files Changed. Agents may suggest it, but apply it only when the user explicitly requests or accepts its use. Excludes AI-only reviews and reviews of uncommitted changes. |

## Installation

### Cursor

In Cursor, open **Customize** → **Add Marketplace** (or the Plugins tab) and import:

```text
https://github.com/huanshankeji/skills
```

### Claude Code

```
/plugin marketplace add huanshankeji/skills
```

```
/plugin install huanshankeji-skills@huanshankeji-skills
```

### Codex

```bash
codex plugin marketplace add huanshankeji/skills
codex plugin add huanshankeji-skills@huanshankeji-skills
```

### Codex Cloud

Adding this repository via **Add plugin marketplace** does not make its
plugin available in Codex Cloud. The ZIP script provides an uploadable package
for installing it as a personal plugin instead.

Create the uploadable plugin ZIP with:

```sh
./zip_codex_plugin.sh
```

This writes `huanshankeji-skills.zip` in the current working directory,
including the plugin manifests, license, and all skills.

### Using the skills CLI

```bash
npx skills add huanshankeji/skills
```

### Manual installation

Copy the desired skill folder from [`skills/`](./skills) into the skills directory of your project:

```bash
# Universal (works with multiple agents)
cp -r skills/<skill-name> .agents/skills/
```
