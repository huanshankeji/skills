# skills

AI agent skills by [@huanshankeji](https://github.com/huanshankeji) mainly for our own development conventions, following the [Agent Skills](https://agentskills.io) standard.

## Skills

| Skill | Description |
|---|---|
| [git-commit-after-review](skills/git-commit-after-review/) | Creates a Git commit for follow-up work after reviewing a commit, commit range, or PR; ask what was reviewed unless the user already named it; includes the full reviewed hash except when it was the parent commit |

## Installation

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
