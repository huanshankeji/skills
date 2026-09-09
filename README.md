# skills

AI agent skills by [@huanshankeji](https://github.com/huanshankeji) mainly for our own development conventions, following the [Agent Skills](https://agentskills.io) standard.

## Skills

| Skill | Description |
|---|---|
| [git-commit-after-review](skills/git-commit-after-review/) | Creates a Git commit for follow-up work after reviewing a **named** commit, commit range, whole PR, or remaining unreviewed PR Files Changed; do **not** use when the user only reviewed uncommitted changes ("all reviewed"); ask what was reviewed unless they already named the target; includes the full reviewed hash except when it was the parent commit |

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
