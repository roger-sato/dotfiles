# zsh-completions の設定。コマンド補完機能
autoload -U compinit && compinit -u

# git のカラー表示
git config --global color.ui auto

# vim バインドにする
bindkey -v
bindkey -r "^[" vi-cmd-mode
bindkey -M viins "qq" vi-cmd-mode
# bindkey -M viins "jj" vi-cmd-mode

# alias
alias ssob='aws sso login --profile backlog'
alias sson='aws sso login --profile nulab-inc'
alias sshc='peco-sshconfig-ssh'
alias sbt='sbt -mem 4096'
alias v='lvim'
alias g='git'
alias gs='git status'

alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias ga='git add'
alias gf='git pull'
alias gp='git push'
alias gd='git diff'
alias gdcp='git diff -U0 | pbcopy'
alias gdl='git -c delta.side-by-side=false diff'
alias gl='git log'
alias gll='git -c delta.side-by-side=false log'
alias gcm='git commit -m'
alias gg='lazygit'
alias fd='fd --hidden'
alias ls='exa'
alias lsa='exa -abghHliS'
alias nv='neovide'
alias nv='neovide'

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cd なしでもディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ (履歴) を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# [TAB] でパス名の補完候補を表示したあと、
# 続けて [TAB] を押すと候補からパス名を選択できるようになる
# 候補を選ぶには [TAB] か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# コマンドのスペルを訂正する
setopt correct

# cd した先のディレクトリをディレクトリスタックに追加する
# cd [TAB] でディレクトリのヒストリが表示されるので、選択して移動できる
# ※ ディレクトリスタック: 今までに行ったディレクトリのヒストリのこと
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# glob: パス名にマッチするワイルドカードパターンのこと
# ※ たとえば mv hoge.* ~/dir というコマンドにおける * のこと
setopt extended_glob

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものにしている
# ※ たとえば Ctrl-W でカーソル前の1単語を削除したとき / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

function peco-ssh-hosts() {
    grep 'Host ' ~/.ssh/conf.d/* | awk '{print $2}' | grep -v '*' | peco
}

function peco-sshconfig-ssh() {
    local host=$(grep 'Host ' ~/.ssh/conf.d/* | awk '{print $2}' | grep -v '*' | peco)
    if [ -n "$host" ]; then
        echo "ssh -F ~/.ssh/config $host"
        ssh -F ~/.ssh/config $host
    fi
}

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node \
    zdharma-continuum/history-search-multi-word \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    chrissicool/zsh-256color \
    b4b4r07/enhancd \


### End of Zinit's installer chunk
export SANDBOX="$HOME/dev/roger-sato/sandbox"
export CONFIG_DIR="$HOME/.config/lazygit"
export YOUR_MYSQL_USER_NAME=nobuaki
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH
export MYVIMRC=~/.config/nvim/init.vim
export PATH=$HOME/.nimble/bin:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:~/dev/google/flutter/bin
export PATH=$PATH:~/.local/bin

export EDITOR='lvim'

# ターミナル起動時にtmuxが起動してない場合は起動する
if [ $SHLVL = 1 ]; then
  tmux
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.yarn/bin:$PATH"
[[ -d /usr/local/opt/mysql@5.7/bin ]] && \
  export PATH=/usr/local/opt/mysql@5.7/bin:${PATH}
export MYVIMDIR=~/.config/nvim/
export TMP="$TMPDIR"
alias vdiff='vimdiff'

# starshipの有効化
eval "$(starship init zsh)"

ZSH_DIR="${HOME}/.zsh"

if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
	for file in ${ZSH_DIR}/*.zsh; do
		[ -r $file ] && source $file
	done
fi

if [[ -e /usr/local/etc/profile.d/z.sh ]]; then
    . /usr/local/etc/profile.d/z.sh
fi

if [[ -e /usr/local/opt/asdf/libexec/asdf.sh ]]; then
    export ASDF_DIR='/usr/local/opt/asdf/libexec'
    . /usr/local/opt/asdf/libexec/asdf.sh
fi

if [[ -e $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
fi

notica() { curl -X POST --data "d:$*" "https://notica.us/?IECTRg" ; }

if [[ -e ~/.zsh/.zshrc.local.zsh ]]; then
    source ~/.zsh/.zshrc.local.zsh
fi

if [[ -e ~/.asdf/plugins/java/set-java-home.zsh ]]; then
    . ~/.asdf/plugins/java/set-java-home.zsh
fi