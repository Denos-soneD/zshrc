# Check and install fzf if not installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if ! command -v fzf &> /dev/null; then
   echo "fzf not found, installing..."
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/fzf
   ~/.config/fzf/install
fi

# Check and install oh-my-posh if not installed
if ! command -v oh-my-posh &> /dev/null; then
   echo "oh-my-posh not found, installing..."
   curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Check and install zoxide if not installed
if ! command -v zoxide &> /dev/null; then
   echo "zoxide not found, installing..."
   curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Set the default editor
if [ ! -f "$HOME/.config/ohmyposh/zen.toml" ]; then
   mkdir -p "$HOME/.config/ohmyposh"
   wget https://raw.githubusercontent.com/Denos-soneD/zshrc/refs/heads/main/zen.toml -O "$HOME/.config/ohmyposh/zen.toml"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice turbo wait'0'
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit ice turbo wait'1'
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

# Add in snippets
zinit ice turbo wait'0'
zinit snippet OMZL::git.zsh

zinit ice turbo wait'2'
zinit pack for \
    OMZP::git \
    OMZP::git-commit \
    OMZP::sudo \
    OMZP::common-aliases \
    OMZP::docker \
    OMZP::docker-compose

zinit ice turbo wait'3'
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::nmap
zinit snippet OMZP::ubuntu
zinit snippet OMZP::debian
zinit snippet OMZP::python
zinit snippet OMZP::npm


# Add completion directory to fpath and initialize completion
autoload -Uz compinit && compinit

zinit cdreplay -q

#Init oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -e
bindkey '^[w' kill-region     
bindkey "${terminfo[kcuu1]}" fzf-history-widget

# History
HISTSIZE=500000
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
zstyle --set ":completion:*" list-colors "di=34;1:ln=36;1:so=32;1:pi=33;1:ex=35;1:bd=33;1;40:cd=33;1;40:or=31;1:mi=33;1:su=31;1:sg=30;1;47:tw=34;1;46:ow=34;1;43"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' prefix ''
FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:*' fzf-preview 'source ~/.zshrc; if [[ -d "$word" ]]; then ls --color "$word"; elif [[ "$word" == -* ]]; then :; else alias $word 2>/dev/null || (man $word | col -b | sed -n "/^DESCRIPTION/,/^OPTIONS/{/^OPTIONS/!p}" | fold -s -w 69  | sed "s/^[ \t]*//" 2>/dev/null || echo "No alias or man page found for $word" 2>/dev/null); fi'


# Aliases
alias ..='cd ..'    # Go up one directory
alias ...='cd ../..' # Go up two directores
alias ....='cd ../../..'   # Go up three directories
alias .....='cd ../../../..'  # Go up four directories

# Aliases for ls command with different options 
alias ls='ls --color=auto' # List files with color highlighting
alias la='ls -A'        # List all files except . and ..
alias ll='ls -alF'    # List all files in long format with type indicators
alias l='ls -CF'      # List files in columns with type indicators

# Aliases for grep command with color highlighting
alias grep='grep --color=auto'    # Grep with color highlighting
alias fgrep='fgrep --color=auto'  # Fixed-string grep with color highlighting
alias egrep='egrep --color=auto'  # Extended grep with color highlighting

# Aliases for disk usage and free memory
alias df='df -h'      # Human-readable disk usage
alias du='du -h'      # Human-readable directory usage
alias free='free -m'  # Memory usage in megabytes

# Aliases for shell utilities
alias j='jobs'        # List active jobs
alias ping='ping -c 5' # Ping with 5 packets
alias c='clear'       # Clear terminal screen
alias path='echo -e ${PATH//:/\\n}' # Display PATH variable with each entry on a new line

# Aliases for directory management
alias md='mkdir -p'   # Create directory and parent directories if needed
alias rd='rmdir'      # Remove directory

# Alias for using neovim instead of vim
alias vim='nvim'      # Use neovim instead of vim
alias vi='nvim'       # Use neovim instead of vi

# Function for fast push with optional commit message
fast_push() {
   local message=${*:-"fast push"}
   git add . && git commit -m "$message" && git push
}
alias fp='fast_push' # Fast push with optional commit message

# Additional useful aliases
alias cls='clear'     # Clear terminal screen (duplicate of 'c')
alias reload='source ~/.zshrc' # Reload zsh configuration
if command -v apt &> /dev/null; then
   alias update='sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y' # Update and upgrade system packages for Debian-based distros
elif command -v pacman &> /dev/null; then
   alias update='sudo pacman -Syu && yay -y' # Update and upgrade system packages for Arch-based distros using pacman and yay
fi
alias ip='ip -c a'    # Show IP addresses with color
alias ports='netstat -tulanp' # Show listening ports and associated programs

# Additional aliases
alias chown='chown --preserve-root' # Prevent chown from operating recursively on /
alias chmod='chmod --preserve-root' # Prevent chmod from operating recursively on /
alias chgrp='chgrp --preserve-root' # Prevent chgrp from operating recursively on /
alias wget='wget -c'  # Continue incomplete downloads
alias upzshrc='curl -o ~/.zshrc https://raw.githubusercontent.com/Denos-soneD/zshrc/main/.zshrc && source ~/.zshrc' # Update zshrc from GitHub
#End of aliases

# Shell integrations
PATH+=:$HOME/.local/bin
eval "$(register-python-argcomplete --no-defaults exegol)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
