# Nvim Configuration
This repository contains my personal Neovim configuration, built upon a modular kickstart setup.

## Installation

### Install Neovim

This configuration targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) versions of Neovim.

### Install External Dependencies

External Requirements:

*   Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
*   [ripgrep](https://github.com/BurntSushi/ripgrep#installation), [fd-find](https://github.com/sharkdp/fd#installation)
*   **luarocks**: Required for managing Lua dependencies.
*   Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
*   A [Nerd Font](https://www.nerdfonts.com/): required for neorg, adds icons

> [!NOTE]
> See [Install Recipes](#Install-Recipes) for Macos and Linux specific for quick install snippets.

### Install this Configuration

Clone this repository into your Neovim configuration directory (typically `~/.config/nvim`):

### Post Installation

Start Neovim:

```sh
nvim
```

## Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

#### macOS (Homebrew) Install Steps

<details><summary>macOS Install Steps</summary>

```sh
brew install neovim ripgrep fd git luarocks
```
</details>

#### Arch Linux Install Steps

<details><summary>Arch Install Steps</summary>

```sh
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim luarocks
```
</details>
