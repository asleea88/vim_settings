#!/bin/bash
# tmux-resurrect post-save-layout 훅
# Claude 가 돌고 있는 pane 마다 "session:window.pane <TAB> 대화 ID" 를 기록한다.
# 대화 ID 는 Claude 가 프로세스별로 남기는 ~/.claude/sessions/<pid>.json 에서 읽는다 (/clear 후에도 갱신됨).
# 복원은 tmux-claude-restore.sh 가 이 파일을 읽어 claude --resume 으로 이어서 연다.

MAP="$HOME/.local/share/tmux/claude_sessions.tsv"
mkdir -p "$(dirname "$MAP")"
tmp="$MAP.tmp"
: > "$tmp"

tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}	#{pane_pid}" |
  while IFS=$'\t' read -r target pane_pid; do
    # ccf 처럼 claude 가 pane 의 첫 프로세스인 경우와, zsh 아래 자식으로 뜬 경우를 모두 본다
    for pid in "$pane_pid" $(pgrep -P "$pane_pid"); do
      f="$HOME/.claude/sessions/$pid.json"
      [ -f "$f" ] || continue
      id=$(jq -r '.sessionId // empty' "$f" 2>/dev/null)
      [ -n "$id" ] && printf '%s\t%s\n' "$target" "$id" >> "$tmp" && break
    done
  done

mv "$tmp" "$MAP"
