# vim:set ft=zsh:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# https://qiita.com/uasi/items/80865646607b966aedc8
nvm() {
    # まず仮の nvm コマンドを unset
    unset -f nvm

    # nvm.sh をロード
    # ここで本物の nvm コマンドが定義される
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"

    # 仮の nvm コマンドに渡された引数を本物に受け渡す
    nvm "$@"
}
node(){
    unset -f node
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    node "$@" 
}

yarn(){
    unset -f yarn
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    yarn "$@" 
}
npm(){
    unset -f npm
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    npm "$@" 
}
vue(){
    unset -f vue
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    vue "$@" 
}

PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules

NODE_PATH=${NODE_PATH:A}
