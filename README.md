# 🚀 ZSH Configuration Repository

<div align="center">
  <img src="https://img.shields.io/badge/Shell-Zsh-89e051?style=for-the-badge&logo=zsh&logoColor=white" alt="Zsh">
  <img src="https://img.shields.io/badge/Terminal-Oh_My_Zsh-1A2C34?style=for-the-badge&logo=ohmyzsh&logoColor=white" alt="Oh My Zsh">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="License">
</div>

<p align="center">
  <em>A modern and powerful ZSH configuration with all the necessary tools to enhance your command-line experience.</em>
</p>

---

## 📋 Table of Contents

- [🎯 Prerequisites](#-prerequisites)
- [🔧 Installation](#-installation)
  - [📦 FZF Installation](#-fzf-installation)
  - [🎨 Oh My Zsh Installation](#-oh-my-zsh-installation)
  - [🔌 Plugin Installation](#-plugin-installation)
  - [⚙️ Final Configuration](#️-final-configuration)
- [🐧 Exegol](#-exegol)

---

## 🎯 Prerequisites

Make sure you have **Zsh** installed on your system:

```bash
# Check if Zsh is installed
which zsh

# Installation on Ubuntu/Debian
sudo apt install zsh

# Installation on Arch Linux
sudo pacman -S zsh
```

---

## 🔧 Installation

### 📦 FZF Installation

**FZF** is a command-line fuzzy finder that significantly improves the user experience.

<details>
<summary>📍 <strong>Local Installation (recommended)</strong></summary>

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
</details>

<details>
<summary>🐧 <strong>Ubuntu/Debian</strong></summary>

```bash
sudo apt install -y fzf
```
</details>

<details>
<summary>🏗️ <strong>Arch Linux</strong></summary>

```bash
sudo pacman -Syu fzf
```
</details>

### 🎨 Oh My Zsh Installation

**Oh My Zsh** is an open source framework for managing your Zsh configuration.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 🔌 Plugin Installation

These plugins add advanced features to your shell:

| Plugin | Description |
|--------|-------------|
| 🎨 **zsh-syntax-highlighting** | Real-time syntax highlighting |
| 💡 **zsh-autosuggestions** | Automatic suggestions based on history |
| 🔄 **zsh-completions** | Advanced auto-completion |
| 🔍 **fzf-tab** | Enhances completion with FZF |
| ✨ **pure** | Minimal and elegant theme |

```bash
# Plugin installation
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

git clone https://github.com/sindresorhus/pure.git "$HOME/.oh-my-zsh/custom/pure"
```

### ⚙️ Final Configuration

#### 🏠 Standard Configuration

```bash
curl -o ~/.zshrc https://raw.githubusercontent.com/Denos-soneD/zshrc/main/zshrc && source ~/.zshrc
```
