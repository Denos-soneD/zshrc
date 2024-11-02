# Check and install fzf if not installed
if ! command -v fzf &> /dev/null; then
   echo "fzf not found, installing..."
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
   ~/.fzf/install
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
   wget https://raw.githubusercontent.com/Denos-soneD/zshrc/refs/heads/main/zen.toml   -O "$HOME/.config/ohmyposh/zen.toml"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
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

#Init oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -e
bindkey '^[w' kill-region
bindkey "\e[A" fzf-history-widget

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
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:alias -ges' show-alias -g-description yes

# Aliases for navigation
alias -g ..='cd ..'    # Go up one directory
alias -g ...='cd ../..' # Go up two directories
alias -g ....='cd ../../..'   # Go up three directories
alias -g .....='cd ../../../..'  # Go up four directories

# Aliases for ls command with different options
alias -g ls='ls --color=auto' # List files with color highlighting
alias -g la='ls -A'        # List all files except . and ..
alias -g ll='ls -alF'    # List all files in long format with type indicators
alias -g l='ls -CF'      # List files in columns with type indicators

# Aliases for grep command with color highlighting
alias -g grep='grep --color=auto'    # Grep with color highlighting
alias -g fgrep='fgrep --color=auto'  # Fixed-string grep with color highlighting
alias -g egrep='egrep --color=auto'  # Extended grep with color highlighting

# Aliases for disk usage and free memory
alias -g df='df -h'      # Human-readable disk usage
alias -g du='du -h'      # Human-readable directory usage
alias -g free='free -m'  # Memory usage in megabytes

# Aliases for shell utilities
alias -g j='jobs'        # List active jobs
alias -g ping='ping -c 5' # Ping with 5 packets
alias -g c='clear'       # Clear terminal screen
alias -g path='echo -e ${PATH//:/\\n}' # Display PATH variable with each entry on a new line

# Aliases for directory management
alias -g md='mkdir -p'   # Create directory and parent directories if needed
alias -g rd='rmdir'      # Remove directory

# Aliases for using neovim instead of vim
alias -g vim='nvim'      # Use neovim instead of vim
alias -g vi='nvim'       # Use neovim instead of vi

# Aliases for git commands
alias -g g='git'         # Shortcut for git
alias -g ga='git add'    # Add files to staging area
alias -g gal='git add .' # Add all files to staging area
alias -g gc='git commit -m' # Commit with message
alias -g gs='git status' # Show git status
alias -g gl='git log --oneline --graph' # Show git log in one line with graph
alias -g gp='git push'   # Push changes to remote repository
alias -g gpl='git pull'  # Pull changes from remote repository
alias -g gm='git merge'  # Merge branches
alias -g gr='git rebase' # Rebase changes
alias -g gd='git diff'   # Show git diff
alias -g gco='git checkout' # Checkout branch
alias -g gb='git branch' # List git branches
alias -g gba='git branch -a' # List all git branches
alias -g gbd='git branch -d' # Delete git branch
alias -g gcp='git cherry-pick' # Cherry-pick commit
alias -g grs='git reset' # Reset changes
alias -g gcl='git clone' # Clone repository
alias -g gcb='git checkout -b' # Create and checkout new branch
alias -g gpr='git pull --rebase' # Pull changes with rebase
alias -g gsh='git show' # Show git commit

# Function for fast push with optional commit message
fast_push() {
   local message=${*:-"fast push"}
   git add . && git commit -m "$message" && git push
}
alias -g fp='fast_push' # Fast push with optional commit message

# Additional useful aliases
alias -g cls='clear'     # Clear terminal screen (duplicate of 'c')
alias -g reload='source ~/.zshrc' # Reload zsh configuration
if command -v apt &> /dev/null; then
   alias -g update='sudo apt update && sudo apt upgrade' # Update and upgrade system packages for Debian-based distros
elif command -v pacman &> /dev/null; then
   alias -g update='sudo pacman -Syu' # Update and upgrade system packages for Arch-based distros
fi
alias -g ip='ip -c a'    # Show IP addresses with color
alias -g ports='netstat -tulanp' # Show listening ports and associated programs

# Additional aliases
alias -g chown='chown --preserve-root' # Prevent chown from operating recursively on /
alias -g chmod='chmod --preserve-root' # Prevent chmod from operating recursively on /
alias -g chgrp='chgrp --preserve-root' # Prevent chgrp from operating recursively on /
alias -g wget='wget -c'  # Continue incomplete downloads
alias -g exegol='sudo -E $HOME/.local/bin/exegol' # Run exegol with sudo and preserve environment variables

# Shell integrations
eval "$(register-python-argcomplete --no-defaults exegol)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
