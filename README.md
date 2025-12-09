# My Neovim Configuration

## Introduction

This repository contains my personal Neovim configuration, built upon a modular kickstart setup. It aims to be a functional, well-organized, and easily customizable environment for development.

## Features

This configuration includes:

*   **Themes**: Defaults to **Catppuccin Mocha** with a convenient toggle (`<leader>tt`) to switch to **Everforest**.
*   **Custom Startup Screen**: A personalized startup dashboard featuring:
    *   A custom ASCII art header.
    *   Mappings for common actions like creating new files, finding files, and project management.
    *   A centered layout.
    *   A hidden cursor for a cleaner look.
*   **Plugin Management**: Uses `lazy.nvim` for efficient plugin loading.
*   **Language Server Protocol (LSP)**: Integrated LSP for intelligent code completion, diagnostics, and refactoring.
*   **Tree-sitter**: Enhanced syntax highlighting and structural text editing.
*   **File Explorer**: Utilizes **Neo-tree** for a fast and intuitive file system navigation.
*   **Fuzzy Finder**: **Telescope.nvim** for quick file, buffer, and command searching.

## Installation

### Install Neovim

This configuration targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) versions of Neovim. Please ensure you have the latest versions installed.

### Install External Dependencies

External Requirements:

*   Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
*   [ripgrep](https://github.com/BurntSushi/ripgrep#installation), [fd-find](https://github.com/sharkdp/fd#installation)
*   **luarocks**: Required for managing Lua dependencies.
*   Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
*   A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons (set `vim.g.have_nerd_font` in `init.lua` to `true` if you have one)
*   Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
*   Language Setup: You may need language-specific tools (e.g., `npm` for TypeScript, `go` for Golang, etc.) for LSP functionality.

> [!NOTE]
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes and quick install snippets.

### Install this Configuration

Clone this repository into your Neovim configuration directory (typically `~/.config/nvim`):

```sh
git clone <your_repo_url> "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

> [!NOTE]
> Replace `<your_repo_url>` with the actual URL of your Git repository.

### Post Installation

Start Neovim:

```sh
nvim
```

Lazy will automatically install all configured plugins. Use `:Lazy` to view the current plugin status. Hit `q` to close the window.

## Usage

*   **Toggle Themes**: Use `<leader>tt` to switch between Catppuccin Mocha and Everforest. Your last chosen theme will persist across sessions.
*   **Startup Menu**: The custom startup screen provides quick access to common actions.

## Customization

*   **Plugin Configurations**: Most plugin-specific settings are located in `lua/kickstart/plugins/` and `lua/custom/plugins/`.
*   **Keymaps**: Custom keybindings can be found in `lua/keymaps.lua`.
*   **Options**: General Neovim options are in `lua/options.lua`.

## FAQ

*   **How do I update plugins?**
    *   Run `:Lazy update` in Neovim.
*   **How do I "uninstall" this configuration?**
    *   See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information.

## Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install this Configuration](#Install-this-Configuration) step.

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