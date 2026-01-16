#!/bin/bash
export PATH="/Users/sam/.local/bin:/opt/homebrew/bin:$PATH"
WORKSPACE=/Users/sam/workspace
WORKTREE_DIR=.worktrees

project=$(
  find "$WORKSPACE" -maxdepth 3 -name .git -type d 2>/dev/null \
    | sed "s|$WORKSPACE/||; s|/\.git$||" \
    | sort \
    | fzf --reverse --prompt="project > " --header="프로젝트를 선택하세요"
)
[ -z "$project" ] && exit

target="$WORKSPACE/$project"

if [ -d "$target/$WORKTREE_DIR" ] && [ "$(ls -A "$target/$WORKTREE_DIR" 2>/dev/null)" ]; then
  worktree=$(
    { echo "main (원본)"; ls -t "$target/$WORKTREE_DIR"; } \
      | fzf --reverse --prompt="worktree > " --header="$project — 작업 공간을 선택하세요"
  )
  [ -z "$worktree" ] && exit

  if [ "$worktree" != "main (원본)" ]; then
    cd "$target" && workmux open "$worktree"
    exit
  fi
fi

tmux new-window -c "$target" -n "$(basename "$project")" claude \; \
  split-window -h -l 40% -c "$target" \; \
  select-pane -L
