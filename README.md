# My Personal Neovim Configuration

A highly customized and modular Neovim setup built from kickstart.nvim, featuring modern plugins and optimized workflows for development.

## ✨ Features

- **Modular Architecture**: Clean separation of concerns with organized Lua modules
- **Modern Plugin Management**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Advanced Completion**: Smart autocompletion with [blink.cmp](https://github.com/Saghen/blink.cmp)
- **Powerful Navigation**: Fast file and project navigation with Telescope and Neo-tree
- **Git Integration**: Comprehensive Git workflow with Fugitive, Neogit, and Gitsigns
- **LSP Support**: Full Language Server Protocol integration with formatting and linting
- **Treesitter**: Enhanced syntax highlighting and text objects
- **Snippets**: Custom code snippets for JavaScript and SCSS
- **Smooth Scrolling**: Enhanced scrolling experience with Neoscroll
- **Motion Enhancement**: Quick navigation with Leap and text objects with Mini.ai

## 📁 Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/                 # Core configuration
│   │   ├── init.lua           # Configuration loader
│   │   ├── setup.lua          # Basic Neovim settings
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── autocommands.lua   # Auto commands
│   │   └── custom.lua         # Custom configurations
│   ├── plugins/               # Plugin configurations
│   │   ├── init.lua           # Plugin loader
│   │   ├── colorscheme.lua    # Color scheme setup
│   │   ├── telescope.lua      # Fuzzy finder
│   │   ├── neo-tree.lua       # File explorer
│   │   ├── blink.lua          # Completion engine
│   │   ├── nvim-lspconfig.lua # LSP configuration
│   │   ├── conform.lua        # Code formatting
│   │   ├── lint.lua           # Linting
│   │   ├── gitsigns.lua       # Git integration
│   │   ├── fugitive.lua       # Git commands
│   │   ├── neogit.lua         # Git interface
│   │   ├── nvim-treesitter.lua# Syntax highlighting
│   │   ├── which-key.lua      # Key binding help
│   │   ├── mini-*.lua         # Mini plugin suite
│   │   ├── leap.lua           # Motion plugin
│   │   ├── marks.lua          # Enhanced marks
│   │   ├── autopairs.lua      # Auto pair brackets
│   │   ├── autotag.lua        # Auto close HTML tags
│   │   ├── better-escape.lua  # Improved escape sequences
│   │   ├── guess-indent.lua   # Auto detect indentation
│   │   ├── indent_line.lua    # Indentation guides
│   │   ├── neoscroll.lua      # Smooth scrolling
│   │   ├── project.lua        # Project management
│   │   ├── tabline.lua        # Enhanced tabline
│   │   ├── tiny-inline-diagnostics.lua # Inline diagnostics
│   │   ├── todo-comments.lua  # TODO highlighting
│   │   ├── vim-tmux-navigator.lua # Tmux integration
│   │   ├── langmapper.lua     # Language mapping
│   │   ├── lazy-dev.lua       # Development tools
│   │   └── debug.lua          # Debug adapter protocol
│   ├── snippets/              # Custom snippets
│   │   ├── javascript.lua     # JavaScript snippets
│   │   └── scss.lua           # SCSS snippets
│   └── health.lua             # Health check functions
└── lazy-lock.json             # Plugin version lock file
```

## 🚀 Installation

### Prerequisites

Ensure you have the following installed:

- **Neovim** (>= 0.9.0) - Latest stable or nightly
- **Git** - For plugin management and version control
- **Node.js & npm** - For LSP servers and tools
- **Ripgrep** - For fast searching with Telescope
- **fd** - For file finding
- **A Nerd Font** - For icons and symbols
- **Language-specific tools** as needed (Go, Python, etc.)

### Quick Setup

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/andreeich/nvim.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```
   
   Lazy.nvim will automatically install all plugins on first run.

## ⚙️ Key Features

### Plugin Highlights

- **Telescope**: Fuzzy finder for files, buffers, and more
- **Neo-tree**: Modern file explorer with Git integration
- **Blink.cmp**: Fast and feature-rich completion engine
- **LSP**: Full language server support with automatic installation
- **Treesitter**: Advanced syntax highlighting and text objects
- **Gitsigns**: Git decorations and hunk navigation
- **Which-key**: Interactive key binding help
- **Mini suite**: Collection of small, focused plugins
- **Leap**: Lightning-fast cursor movement
- **Conform**: Asynchronous code formatting
- **Nvim-lint**: Asynchronous linting

### Custom Configurations

- **Modular setup**: Easy to maintain and extend
- **Optimized keymaps**: Intuitive and efficient key bindings
- **Smart autocommands**: Automated tasks and behaviors
- **Custom snippets**: Productivity-focused code snippets
- **Health checks**: Built-in configuration validation

## 🎯 Usage

### Essential Keymaps

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep |
| Normal | `<leader>fb` | Find buffers |
| Normal | `<leader>fh` | Find help |
| Normal | `<leader>e` | Toggle file explorer |
| Normal | `<leader>gg` | Open Git interface |
| Normal | `<leader>?` | Show which-key help |

### Plugin Management

- `:Lazy` - Open plugin manager
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - View startup performance

### LSP Commands

- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions

## 🛠️ Customization

### Adding New Plugins

1. Create a new file in `lua/plugins/` directory
2. Follow the lazy.nvim plugin specification
3. The plugin will be automatically loaded

### Modifying Keymaps

Edit `lua/config/keymaps.lua` to add or modify key bindings.

### Adding Snippets

Add custom snippets in the `lua/snippets/` directory organized by language.

### Color Scheme

Modify `lua/plugins/colorscheme.lua` to change the appearance.

## 🔍 Health Check

Run `:checkhealth` to verify your setup and identify any issues.

## 📚 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Lua Guide for Neovim](https://neovim.io/doc/user/lua-guide.html)

## 🤝 Contributing

This is a personal configuration, but feel free to:
- Fork and adapt for your own use
- Report issues or suggest improvements
- Share your own customizations

## 📄 License

This configuration is based on kickstart.nvim and maintains the same MIT license.

---

*Happy coding with Neovim!* 🎉
