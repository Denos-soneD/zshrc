# ZSHRC

### Install fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Install dependance
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/sindresorhus/pure.git "$HOME/.oh-my-zsh/custom/pure"
```

### Install my zshrc :

```bash
curl -o ~/.zshrc https://raw.githubusercontent.com/Denos-soneD/zshrc/main/.zshrc && source ~/.zshrc
```

### Install exegol_zshrc :
```bash
curl -o ~/.exegol/my-resources/setup/zsh/zshrc https://raw.githubusercontent.com/Denos-soneD/zshrc/main/exegol_zshrc
```
