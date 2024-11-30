if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
# bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '\e[3;5~' kill-word

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias c='clear'
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias logseq='logseq --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias ls='lsd '
alias cl='clear'
alias lc='clear'
alias sl='ls'
# alias cat='bat'
alias songs='mpv --no-vid --shuffle https://youtube.com/playlist\?list\=PLAn1jVZ2DTg3BBMpAmtGKAdnZh6PimnVF\&si\=080D1NNZEBAwt6xm'
alias sttt_scanline='sttt scanline --scanline-vertical true --scanline-reverse true --scanline-width 2 --scanline-scale-width 1.1 --scanline-scale-ratio 0.5'
alias weather='curl wttr.in'

function mkcd {
  if [ ! -n "$1" ]; then
  echo "Enter a directory name"
  elif [ -d $1 ]; then
  echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  cd  "$cwd"
  fi
  rm -f -- "$tmp"
}

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# pnpm
# export PNPM_HOME="/home/amrit/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/amrit/.dart-cli-completion/zsh-config.zsh ]] && . /home/amrit/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


#. "$HOME/.atuin/bin/env"
#
#eval "$(atuin init zsh)"
