#!/bin/bash
# tmux-resurrect post-restore-all 훅
# tmux-claude-save.sh 가 남긴 pane 별 대화 ID 로 claude --resume 을 실행한다.
# 셸이 떠 있는 pane 에만 입력하므로, 이미 claude 나 다른 프로그램이 돌고 있는 pane 은 건드리지 않는다.

MAP="$HOME/.local/share/tmux/claude_sessions.tsv"
[ -f "$MAP" ] || exit 0

resume_pane() {
  local target="$1" id="$2" cmd
  # 복원 직후엔 셸이 아직 뜨는 중일 수 있어 최대 5초 기다린다
  for _ in $(seq 1 10); do
    cmd=$(tmux display-message -p -t "$target" '#{pane_current_command}' 2>/dev/null) || return
    case "$cmd" in
      zsh|bash|sh|fish)
        tmux send-keys -t "$target" "claude --resume $id" C-m
        return
        ;;
    esac
    sleep 0.5
  done
}

while IFS=$'\t' read -r target id; do
  [ -n "$target" ] && [ -n "$id" ] && resume_pane "$target" "$id" &
done < "$MAP"
wait
