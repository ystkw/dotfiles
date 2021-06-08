function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

zle -N peco_select_history
bindkey '^r' peco_select_history

function peco-cd () {
    local selected_dir=$(find . -type d | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cd
bindkey '^s' peco-cd

# Pecoを使ってインタラクティブにcd - Qiita
# http://qiita.com/VienosNotes/items/c576c08b36ff7d9f4ec9
# ファイル／ディレクトリを検索して、peco って cd するやつ 2 - Qiita
# http://qiita.com/yungsang/items/e10ca283a1ceeaa845db

function ls-peco() {
  PWD=`ls -la | awk '{print $9}' | peco --prompt="$(pwd) >"`
  BUFFER=${BUFFER}${PWD}
  CURSOR=$#BUFFER
}

zle -N ls-peco
bindkey "^f" ls-peco;
