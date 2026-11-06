#!/usr/bin/env bash
# Resolve the branch this checkout most likely branched from, so diff tools
# can compare the current branch against its parent instead of just the
# working tree. Prints the branch name, or nothing if it can't be determined
# (caller then falls back to a plain diff).
#
# Resolution order:
#   1. Target branch of the open MR/PR for the current branch (glab / gh)
#   2. Local branch whose merge-base with HEAD is closest to HEAD
#      (the parent need not be an ancestor: it may have moved on since)

dir="${1:-.}"

git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

current="$(git -C "$dir" branch --show-current 2>/dev/null)"
if [ -z "$current" ]; then
  exit 0
fi

remote_url="$(git -C "$dir" remote get-url origin 2>/dev/null)"
target=""
case "$remote_url" in
  *github.com*)
    command -v gh >/dev/null 2>&1 &&
      target="$(cd "$dir" && timeout 5 gh pr view --json baseRefName -q .baseRefName 2>/dev/null)"
    ;;
  ?*)
    command -v glab >/dev/null 2>&1 &&
      target="$(cd "$dir" && timeout 5 glab mr view -F json 2>/dev/null |
        sed -n 's/.*"target_branch":"\([^"]*\)".*/\1/p' | head -n1)"
    ;;
esac
if [ -n "$target" ]; then
  if git -C "$dir" rev-parse --verify -q "refs/heads/$target" >/dev/null; then
    echo "$target"
    exit 0
  elif git -C "$dir" rev-parse --verify -q "refs/remotes/origin/$target" >/dev/null; then
    echo "origin/$target"
    exit 0
  fi
fi

best=""
best_dist=-1
best_date=0
while IFS= read -r branch; do
  [ "$branch" = "$current" ] && continue
  mb="$(git -C "$dir" merge-base "$branch" HEAD 2>/dev/null)" || continue
  dist="$(git -C "$dir" rev-list --count "$mb..HEAD" 2>/dev/null)"
  [ "$dist" -eq 0 ] && continue # branch already contains HEAD
  date="$(git -C "$dir" log -1 --format=%ct "$branch" 2>/dev/null)"
  date="${date:-0}"
  if [ "$best_dist" -lt 0 ] || [ "$dist" -lt "$best_dist" ] ||
    { [ "$dist" -eq "$best_dist" ] && [ "$date" -gt "$best_date" ]; }; then
    best_dist="$dist"
    best_date="$date"
    best="$branch"
  fi
done < <(git -C "$dir" for-each-ref --format='%(refname:short)' refs/heads)

echo "$best"
