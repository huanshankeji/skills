---
name: git-commit-after-review
description: >
  Creates a Git commit for follow-up work after a full review of a commit,
  commit range, or pull request. Use when the user wants those subsequent
  edits committed (or committed and pushed). If a full review is only
  suspected, or what was reviewed is not obvious, ask first.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.1.0"
---

# Commit after reviewing a commit or PR

## When to apply

- The user wants the post-review edits **committed** and **explicitly** says
  they have fully reviewed a commit or PR → apply this skill.
- A full review is only **suspected** → ask whether this commit should be
  recorded as a review follow-up. Do not assume.

## Identify what was reviewed

Do not assume which commit, range, or PR was reviewed. An open PR, the
current branch, or `HEAD` is not enough. In most cases it is not
obvious — ask. Skip asking only when the user already named the target.

Once known:

- **The commit this follow-up will sit on top of**, and this was not a PR
  review: call it "the parent commit". Do not require its hash. Do not call
  it `HEAD`, which means this new commit once it exists.
- **Otherwise**: a full 40-character hash, or a range with full hashes at
  both ends (`A..B`; use `base...head` for a GitHub-style accumulated PR
  diff). Resolve with `git rev-parse --verify <rev>`. Expand short hashes.
- **A PR**: add the PR number when known, plus the reviewed tip's full hash.
  If the number is unknown, record the reviewed range (full hashes), not
  only a single tip.

Do not invent a hash or range.

## Commit message

Match the repo's usual subject/body style. In the body, make clear this is a
follow-up from that review, and include the identifier from above (the parent
commit, full hash, range, and/or PR). Then say what changed and why. No
fixed sentence template.

## Create the commit

Commit with the repo's usual Git protocol. Push only if asked.
