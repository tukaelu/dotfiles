# dotfiles

**Warning**: This is a personal setting, so please use it at your own risk!

## Included  configuration

- Vim (NeoVim)
- Git
- tmux

## Requirements

### Vim

Requires Neovim (>= 0.5) - need a nightly build to get the most out of it

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations and abstraction layer for Neovim.

#### Language Servers

Global installation of the Language Server for each development language is required

- Go
  - gopls
- TypeScript
  - typescript-language-server
  - diagnostic-languageserver

### tmux

- [Powerline](https://github.com/powerline/powerline)

```
pip install powerline-status
```

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- [Tmux Resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum/)
