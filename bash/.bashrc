#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
bind '";a":vi-movement-mode'

_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_YELLOW=$(tput setaf 3)
_BLUE=$(tput setaf 4)
_MAGENTA=$(tput setaf 5)
_CYAN=$(tput setaf 6)
_IS_IT_WHITE=$(tput setaf 7)
_GRAY=$(tput setaf 8)
_PINK=$(tput setaf 9)
_LIGHT_GREEN=$(tput setaf 10)
_LIGHT_GREEN=$(tput setaf 10)
_LIGHT_YELLOW=$(tput setaf 11)
_LIGHTEST_BLUE=$(tput setaf 12)
_LIGHT_BLUE=$(tput setaf 14)
_BLACK=$(tput setaf 16)
_DARKEST_BLUE=$(tput setaf 17)
_DARK_BLUE=$(tput setaf 18)
_DARKER_BLUE=$(tput setaf 18)
_DARK_BLUE=$(tput setaf 19)

_RESET=$(tput sgr0)
_BOLD=$(tput bold)

# git prompt options
# docs: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
# GIT_PS1_STATESEPARATOR=' '
GIT_PS1_SHOWCONFLICTSTATE=yes
GIT_PS1_DESCRIBE_STYLE=branch
GIT_PS1_SHOWCOLORHINTS=true

# * - dirty
# + - staged
# $ - stash entry present
# % - untracked files present
# | - separation b/w local & remote
# u= - upstream is same as local


# PS1='[\u@\h \W]\$ '
# PS1="\n\w > "
source "$HOME/scripts/git-prompt.sh"
# PS1='\n\w`__git_ps1`> ' # single quote must be used here

_RESET=$(tput sgr0)
PS1='\n${_YELLOW}${_BOLD}\w${_RESET}`__git_ps1`\n> ' # single quote must be used here
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
# export TERMINAL=urxvt
export TERMINAL=foot
BUN_INSTALL="$HOME/.bun"
# export VOSK_MODEL_PATH="${HOME}/apps/vosk-models" # not working
export MPD_HOST="${HOME}/.config/mpd/socket" # without this mpc will not be able to connect to mpd

PATH="${PATH}:$HOME/scripts"
PATH="${PATH}:$HOME/.yarn/bin" # yarn global install 
PATH="${PATH}:${BUN_INSTALL}/bin"
PATH="${PATH}:$HOME/.local/share/gem/ruby/3.0.0/bin" # for jekyll
PATH="${PATH}:$HOME/.phpenv/bin" # for phpenv
PATH="${PATH}:$HOME/.emacs.d/bin" # for phpenv
#PATH="${PATH}:/usr/lib/jvm/default/bin"
PATH="${PATH}:$HOME/.local/bin" # local bin


alias ls='ls --color=auto' \
  d='docker' \
  di='docker images' \
  dps='docker ps' \
  k='kubectl' \
  g='git' \
  n='nvim' \
  hc='herbstclient' \
  mycli='export LESS="-SRXF" && mycli' \
  y='yarn' \
  ya='yarn add' \
  yad='yarn add --dev' \
  yga='yarn global add' \
  ys='yarn start' \
  yt='yarn build' \
  ys2='yarn start2' \
  real-htop='htop' \
  htop='bpytop'

# zoxide (smarter cd)
eval "$(zoxide init bash)"

