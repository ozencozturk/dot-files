export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

set_prompt () {
    BASE_PATH="${PWD##*/}"
    echo -ne "\033]0;$BASE_PATH\007"
}
set_my_tab () {
   update_terminal_cwd
   set_prompt
}

PROMPT_COMMAND=set_my_tab

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
"export EDITOR=atom
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias ls='ls -GFh'
alias la='ls -a'
export LSCOLORS=Exfxcxdxbxegedabagacad
bind "set completion-ignore-case on"
