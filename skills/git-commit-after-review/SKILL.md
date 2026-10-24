---
name: git-commit-after-review
description: >
  Creates a Git commit recording follow-up changes after a human has fully
  reviewed a named commit, commit range, whole PR, or remaining unreviewed
  PR Files Changed. Use only when the user explicitly requests this skill
  or accepts an agent's suggestion to use it. Agents may suggest it, but
  must wait for acceptance before applying its workflow. An AI agent's
  review alone does not qualify. Excludes reviews of uncommitted changes.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.3.0"
---

# Commit after reviewing a commit or PR

## When to apply

Apply only at the user's explicit request to use this skill, including
acceptance of an agent's suggestion. Merely mentioning the skill, naming
a review target, or requesting a commit after review does not invoke it.

Agents may suggest this skill when the context indicates a completed
human review of a commit, commit range, whole PR, or remaining unreviewed
PR Files Changed. Wait for the user's acceptance before applying the
workflow. Do not routinely interrupt ordinary commit requests to ask
about this skill.

### Do not apply

- An AI agent's review alone does not qualify as human review.
- The user reviewed **uncommitted / working-tree** changes and wants those
  committed. Phrases like "all reviewed", "I reviewed these changes", or
  "looks good, commit" without naming a commit, PR, or Files Changed tab
  mean a **normal commit**, not this skill.
- Do not treat an open PR, the current branch, or `git log` on this branch
  as proof that this skill applies.

## Identify what was reviewed

Once invoked, establish the human-reviewed target and scope from the
conversation. Ask only for missing information. Do not infer the target
from an open PR, the current branch, or `HEAD`, or assume that naming a
PR means the whole PR rather than remaining unreviewed Files Changed.

Once known:

- **The commit this follow-up will sit on top of**, and this was not a PR
  review: call it "the parent commit". Do not require its hash. Do not call
  it `HEAD`, which means this new commit once it exists.
- **Otherwise**: a full 40-character hash, or a range with full hashes at
  both ends (`A..B`; use `base...head` for a GitHub-style accumulated PR
  diff). Resolve with `git rev-parse --verify <rev>`. Expand short hashes.
- **A whole PR**: add the PR number when known, plus the reviewed tip's
  full hash. If the number is unknown, record the reviewed range (full
  hashes), not only a single tip.
- **Remaining unreviewed PR changes** in the GitHub Files Changed
  tab/view (for example `/pull/<n>/changes`): not the whole PR. Record
  the PR number when known, that this was remaining unreviewed Files
  Changed, and the reviewed tip's full hash. If the number is unknown,
  record the reviewed range (full hashes). Do not invent which files
  remained.

Do not invent a hash or range.

## Commit message

In the body, make clear this is a follow-up from that review, and include
the identifier from above (the parent commit, full hash, range, whole PR,
and/or remaining unreviewed Files Changed). Then say what changed and why.
No fixed sentence template.

## Create the commit

Commit with the repo's usual Git protocol. Push only if asked.
