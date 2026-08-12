---
name: git-commit-after-review
description: >
  Creates a Git commit for follow-up work after a full review of a commit,
  commit range, or pull request. Use when the user wants those subsequent
  edits committed (or committed and pushed). If a full review is only
  suspected, ask first.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.0.0"
---

# Commit after reviewing a commit or PR

## When to apply

- The user wants the post-review edits **committed** and **explicitly** says
  they have fully reviewed a commit or PR → apply this skill.
- A full review is only **suspected** → ask whether this commit should be
  recorded as a review follow-up. Do not assume.

## Identify what was reviewed

- **The commit this follow-up will sit on top of**, and this was not a PR
  review: call it "the parent commit". Do not require its hash. Do not call
  it `HEAD`, which means this new commit once it exists.
- **Otherwise**: a full 40-character hash, or a range with full hashes at
  both ends. Resolve each rev on its own with
  `git rev-parse --verify <rev>^{commit}` — a range is not a single rev, and
  `^{commit}` turns an annotated tag into the commit it points at. Expand
  short hashes.
- **A PR**: add the PR number when known, plus the reviewed tip's full hash.
  If the number is unknown, record the reviewed range (full hashes), not
  only a single tip.

A GitHub-style accumulated PR diff is `git diff <base>...<head>`, which
compares the merge base against `<head>`. Record it as a diff, e.g. "the diff
of `<full-base>...<full-head>`", or record
`git merge-base <base> <head>`'s output as `<full-merge-base>..<full-head>`.
A bare `A...B` is read as a symmetric difference by `git log`, which also
lists commits added to `<base>` after branching and never reviewed.

If several candidates exist, ask. Do not invent a hash or range.

## Commit message

Match the repo's usual subject/body style. In the body, make clear this is a
follow-up from that review, and include the identifier from above (the parent
commit, full hash, range, and/or PR). Then say what changed and why. No
fixed sentence template.

## Create the commit

Stage the post-review edits by path. Do not stage unrelated working-tree
changes, and do not reach for `git commit -a`.

Never `--amend` or force-push here: this skill exists to tie the follow-up to
the reviewed snapshot, and rewriting either commit breaks that link. Add a new
commit instead. Push only if asked.
