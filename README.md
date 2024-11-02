# zshrc

To install `fzf`, `oh-my-posh`, and `woxide`, use the following commands:

### Install fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Install oh-my-posh
```bash
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
```

### Install woxide
```bash
cargo install woxide
```

Install my zshrc :

```bash
curl -o ~/.zshrc https://raw.githubusercontent.com/Denos-soneD/zshrc/main/.zshrc && source ~/.zshrc
