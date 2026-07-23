#!/usr/bin/env bash
# Resolve the local branch this checkout most likely branched from, so
# `hunk diff <target>` can compare the current branch against its parent
# instead of just the working tree. Prints the branch name, or nothing
# if it can't be determined (caller then falls back to a plain diff).

dir="${1:-.}"

git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

current="$(git -C "$dir" branch --show-current 2>/dev/null)"
if [ -z "$current" ]; then
  exit 0
fi

best=""
best_date=0
while IFS= read -r branch; do
  [ "$branch" = "$current" ] && continue
  git -C "$dir" merge-base --is-ancestor "$branch" HEAD 2>/dev/null || continue
  date="$(git -C "$dir" log -1 --format=%ct "$branch" 2>/dev/null)"
  date="${date:-0}"
  if [ "$date" -gt "$best_date" ]; then
    best_date="$date"
    best="$branch"
  fi
done < <(git -C "$dir" for-each-ref --format='%(refname:short)' refs/heads)

echo "$best"
