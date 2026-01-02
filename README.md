# Nvim Configuration
This repository contains my personal Neovim configuration, built upon a modular kickstart setup.

## Installation

### Install Neovim

This configuration targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) versions of Neovim.

### Install External Dependencies

External Requirements:

*   **Basic Utils**: `git`, `make`, `unzip`, `curl`
*   **C Compiler**: `gcc` or `clang` (Required for `nvim-treesitter`)
*   **[ripgrep](https://github.com/BurntSushi/ripgrep#installation)** & **[fd-find](https://github.com/sharkdp/fd#installation)**: Required for `telescope.nvim`
*   **LuaJIT** & **Luarocks**: Required for `neorg` and managing Lua dependencies
*   **Node.js** & **npm**: Required for `mason.nvim` to install tooling (e.g. `markdownlint`)
*   **Clipboard tool**: `xclip` / `xsel` (X11), `wl-copy` (Wayland), or `win32yank` (Windows)
*   **[Nerd Font](https://www.nerdfonts.com/)**: Required for icons and `neorg`

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
brew install neovim ripgrep fd git luarocks luajit node
```
</details>

#### Arch Linux Install Steps

<details><summary>Arch Install Steps</summary>

```sh
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim luarocks luajit nodejs npm
```
</details>

#### Ubuntu / Debian Install Steps

<details><summary>Ubuntu Install Steps</summary>

```sh
sudo apt update
sudo apt install -y build-essential git unzip ripgrep fd-find neovim luarocks luajit nodejs npm
```
</details>

#### Fedora Install Steps

<details><summary>Fedora Install Steps</summary>

```sh
sudo dnf install -y gcc make git ripgrep fd-find neovim luarocks luajit nodejs npm unzip
```
</details>
