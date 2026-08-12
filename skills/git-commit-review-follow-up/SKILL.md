---
name: git-commit-review-follow-up
description: >
  Creates a Git commit for follow-up work after reviewing a commit, a range of
  commits, or the accumulated changes in a pull request. Include the full
  commit hash of the reviewed commit, except when reviewing the latest previous
  commit — mention that specifically instead. Invoke when the user explicitly
  says they have fully reviewed a commit or PR; if you only suspect that, ask
  whether to apply this skill. Use when committing (or committing and pushing)
  that review follow-up, whether the further edits were made by the user or by
  an AI agent.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.0.0"
---

# Commit follow-up after reviewing a commit or PR

Use this when the user has **fully reviewed** an existing commit, a range of
commits, or the **accumulated changes in a PR**, then further edits were made
(by the user manually or by an AI agent), and those edits should be committed
as a review follow-up.

## When to apply

- The user **explicitly** says they have fully reviewed the changes of a
  commit or PR → **invoke this skill**.
- You **suspect** they have done that but they did not say so clearly → **ask**
  whether to apply this skill. Do not assume.

## Identify what was reviewed

| User intent | What to record |
|---|---|
| The **latest previous commit** (the current `HEAD` before this follow-up) | Say so specifically. Do **not** require its hash. |
| **One named commit** (hash, `HEAD~n`, “that commit”, etc.) | That commit’s **full** 40-character hash (`git rev-parse --verify <rev>^{commit}`). Expand short hashes. |
| **A range of commits** (especially when there is no PR) | The range with **full** hashes at both ends (e.g. `<full-a>..<full-b>` or `<full-a>...<full-b>` as appropriate). |
| **Accumulated PR changes** | The PR number when known, plus the reviewed tip’s **full** hash (PR `HEAD` as of the review). If the PR number is unknown, keep the **range of commits** that was reviewed (full hashes), not only a single tip. |

If several candidates exist, ask. Do not invent a hash or range.

## Commit message

Match the repo’s usual subject/body style. In the body, make clear this is a
follow-up from that review, and include the identifier from the table above
(latest previous commit, full hash, range, and/or PR). Then say what changed
and why. No fixed sentence template.

## Create the commit

Follow the repo’s usual Git commit protocol (status, diff, log; HEREDOC
message; no `--amend` / force-push unless the user asked). Stage the follow-up
files and commit. Push only if the user asked to push.
