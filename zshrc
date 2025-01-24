# ~~~~~~~~~~~~~ PATH ~~~~~~~~~~~~~~~~


export ZSH="$HOME/.oh-my-zsh"


# ~~~~~~~~~~~~~ THEME ~~~~~~~~~~~~~~~


ZSH_THEME=""

fpath+=($HOME/.oh-my-zsh/custom/pure)
autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~ PLUGINS ~~~~~~~~~~~~~


plugins=(git fzf fzf-tab zsh-syntax-highlighting zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# ~~~~~~~~~~~~~ KEYBIND ~~~~~~~~~~~~~


bindkey -e
bindkey '^[w' kill-region
bindkey "${terminfo[kcuu1]}" fzf-history-widget

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:descriptions' format '[%d]'


# ~~~~~~~~~~~~~ ALIAS ~~~~~~~~~~~~~~~


alias la='ls -lathr'
fast_push() {
	local message=${*:-"Fast commit"}
	git add . && git commit -m "$message" && git push
}
alias fp=fast_push
