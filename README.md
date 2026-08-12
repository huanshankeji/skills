# skills

AI agent skills by [@huanshankeji](https://github.com/huanshankeji) mainly for our own development conventions, following the [Agent Skills](https://agentskills.io) standard.

## Skills

| Skill | Description |
|---|---|
| [git-commit-review-follow-up](skills/git-commit-review-follow-up/) | Creates a Git commit for follow-up work after reviewing a commit, commit range, or PR; includes the full reviewed hash except when it was the latest previous commit |

## Installation

### Using the skills CLI

```bash
npx skills add huanshankeji/skills
```

### Manual installation

Copy the desired skill folder from [`skills/`](./skills) into the skills directory of your project:

```bash
# Universal (works with multiple agents)
cp -r skills/git-commit-review-follow-up .agents/skills/
```

### Repository layout

- [`skills/`](./skills) — directory containing all skills
