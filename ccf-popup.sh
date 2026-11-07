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

# git이 더 이상 추적하지 않는 worktree 메타데이터 정리
git -C "$target" worktree prune 2>/dev/null

# git이 실제로 알고 있는 .worktrees/ 하위 worktree 이름만 추출 (디스크에 남은 orphan 디렉터리는 제외)
worktrees=$(
  git -C "$target" worktree list --porcelain 2>/dev/null \
    | sed -n "s|^worktree $target/$WORKTREE_DIR/||p"
)
# 디렉터리 수정 시각 기준 최신순 정렬
[ -n "$worktrees" ] && worktrees=$(cd "$target/$WORKTREE_DIR" 2>/dev/null && ls -td -- $worktrees 2>/dev/null)

if [ -n "$worktrees" ]; then
  worktree=$(
    { echo "main (원본)"; echo "$worktrees"; } \
      | fzf --reverse --prompt="worktree > " --header="$project — 작업 공간을 선택하세요"
  )
  [ -z "$worktree" ] && exit

  if [ "$worktree" != "main (원본)" ]; then
    cd "$target" && workmux open "$worktree"
    exit
  fi
fi

tmux new-window -c "$target" -n "$(basename "$project")" claude \;
