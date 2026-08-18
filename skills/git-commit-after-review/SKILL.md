---
name: git-commit-after-review
description: >
  Creates a Git commit for follow-up work after a full review of a named
  commit, commit range, pull request, or remaining unreviewed PR changes in
  the GitHub Files Changed tab/view. Use when the user wants those subsequent
  edits committed (or committed and pushed) and has named that review target
  (or invoked this skill). Do not use when they only reviewed uncommitted
  working-tree changes ("all reviewed", "I reviewed these edits"). If a full
  review of a commit/PR/Files Changed is only suspected, or the target is not
  obvious, ask first.
license: Apache-2.0
metadata:
  author: huanshankeji
  version: "1.2.0"
---

# Commit after reviewing a commit or PR

## When to apply

- The user wants the post-review edits **committed** and has **named** a
  review target: a commit, a commit range, a whole PR, or remaining
  unreviewed PR Files Changed (or they invoked this skill by name,
  `/git-commit-after-review`, or `@`) → apply this skill.
- A full review of such a target is only **suspected** → ask whether this
  commit should be recorded as a review follow-up. Do not assume.

### Do not apply

- The user reviewed **uncommitted / working-tree** changes and wants those
  committed. Phrases like "all reviewed", "I reviewed these changes", or
  "looks good, commit" without naming a commit, PR, or Files Changed tab
  mean a **normal commit**, not this skill.
- Do not treat an open PR, the current branch, or `git log` on this branch
  as proof that this skill applies.

If this skill is applied **implicitly** (the user did not name it, type
`/git-commit-after-review`, or `@` it), tell them in the reply that
`git-commit-after-review` is being used. Do this on the first reply that
follows the skill, including when asking what was reviewed. If they only
reviewed uncommitted changes, do not apply the skill in the first place.

## Identify what was reviewed

Do not assume which commit, range, PR, or remaining unreviewed Files
Changed was reviewed. An open PR, the current branch, or `HEAD` is not
enough. Naming a PR is not enough to know whether they reviewed the
whole PR or remaining unreviewed Files Changed. In most cases it is not
obvious — ask. Skip asking only when the user already named the target.

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

Match the repo's usual subject/body style. In the body, make clear this is a
follow-up from that review, and include the identifier from above (the parent
commit, full hash, range, whole PR, and/or remaining unreviewed Files
Changed). Then say what changed and why. No fixed sentence template.

## Create the commit

Commit with the repo's usual Git protocol. Push only if asked.
