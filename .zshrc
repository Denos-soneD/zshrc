# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

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

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Aliases for ls command with different options
alias ls='ls --color=auto'
alias la='ls -A'
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

# Aliases for git commands
alias g='git'         # Shortcut for git
alias ga='git add'    # Add files to staging area
alias gal='git add .' # Add all files to staging area
alias gc='git commit -m' # Commit with message
alias gs='git status' # Show git status
alias gl='git log --oneline --graph' # Show git log in one line with graph
alias gp='git push'   # Push changes to remote repository
alias gpl='git pull'  # Pull changes from remote repository
alias gm='git merge'  # Merge branches
alias gr='git rebase' # Rebase changes
alias gd='git diff'   # Show git diff
alias gco='git checkout' # Checkout branch
alias gb='git branch' # List git branches
alias gba='git branch -a' # List all git branches
alias gbd='git branch -d' # Delete git branch
alias gcp='git cherry-pick' # Cherry-pick commit
alias grs='git reset' # Reset changes
alias gcl='git clone' # Clone repository
alias gcb='git checkout -b' # Create and checkout new branch
alias gpr='git pull --rebase' # Pull changes with rebase
alias gsh='git show' # Show git commit
alias gf='git add . && git commit -m "fast push" && git push' # Fast push: add, commit, and push

# Additional useful aliases
alias cls='clear'     # Clear terminal screen (duplicate of 'c')
alias reload='source ~/.zshrc' # Reload zsh configuration
alias update='sudo apt update && sudo apt upgrade' # Update and upgrade system packages
alias ip='ip -c a'    # Show IP addresses with color
alias ports='netstat -tulanp' # Show listening ports and associated programs

# Additional aliases
alias chown='chown --preserve-root' # Prevent chown from operating recursively on /
alias chmod='chmod --preserve-root' # Prevent chmod from operating recursively on /
alias chgrp='chgrp --preserve-root' # Prevent chgrp from operating recursively on /
alias wget='wget -c'  # Continue incomplete downloads

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"