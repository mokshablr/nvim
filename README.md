# 🧠 Personal Configuration Reference

This README documents your personalized setup and configurations. Below is the section dedicated to your **Neovim** setup.

---

## ⚙️ Neovim Configuration

### 🔑 Keymaps (`nvim/lua/core/keymap.lua`)

#### 🤝 Leader Key
- **Leader key**: `<space>`

#### 📁 File & Navigation
| Shortcut         | Mode | Action                          |
|------------------|------|----------------------------------|
| `<leader>pv`     | n    | Open file explorer (`:Ex`)       |
| `<leader>e`      | n    | Toggle `nvim-tree`               |
| `<leader>d`      | n    | Focus on `nvim-tree`             |
| `<leader>c`      | n    | Locate current file in tree      |

#### ✂️ Editing Helpers
| Shortcut     | Mode | Action                                              |
|--------------|------|-----------------------------------------------------|
| `J`          | v    | Move selected lines **down**                        |
| `K`          | v    | Move selected lines **up**                          |
| `<leader>p`  | x    | Paste over text without losing the original yank    |
| `<leader>y`  | n/v  | Yank to system clipboard                            |
| `<leader>Y`  | n    | Yank full line to system clipboard                  |

#### 🔍 Search (Telescope)
| Shortcut       | Mode | Action                                         |
|----------------|------|------------------------------------------------|
| `<leader>pf`   | n    | Find files (project-wide)                      |
| `<C-p>`        | n    | Git-tracked files                              |
| `<leader>fg`   | n    | Grep for string (you type the query)           |
| `<leader>ps`   | n    | Use `live_grep_args` extension for live grep   |

#### ⛔ Diagnostics & LSP
| Shortcut       | Mode | Action                                                |
|----------------|------|-------------------------------------------------------|
| `<leader>i`    | n    | Show diagnostic float popup                           |
| `[d` / `]d`    | n    | Jump to previous/next diagnostic                      |
| `gD`           | n    | Go to declaration                                     |
| `gd`           | n    | Go to definition                                      |
| `K`            | n    | Hover info                                            |
| `gi`           | n    | Go to implementation                                  |
| `<C-k>`        | n    | Show signature help                                   |
| `<leader>wa`   | n    | Add workspace folder                                  |
| `<leader>wr`   | n    | Remove workspace folder                               |
| `<leader>wl`   | n    | List workspace folders                                |
| `<leader>D`    | n    | Go to type definition                                 |
| `<leader>rn`   | n    | Rename symbol                                         |
| `<leader>ca`   | n/v  | Code actions                                          |
| `<leader>]`    | n    | Format file                                           |

#### ⚠️ Trouble (Diagnostics UI)
| Shortcut       | Mode | Action                                 |
|----------------|------|----------------------------------------|
| `<leader>l`    | n    | Toggle Trouble                         |
| `<leader>xw`   | n    | Workspace diagnostics                  |
| `<leader>h`    | n    | Document diagnostics                   |
| `<leader>xq`   | n    | Quickfix list                          |
| `<leader>xl`   | n    | Location list                          |
| `gr`           | n    | Show LSP references in Trouble         |

#### 👥 Terminal
| Shortcut       | Mode | Action                 |
|----------------|------|------------------------|
| `<leader>\``   | n    | Toggle terminal window |

#### 🔠 Notes
- LSP keybindings are **buffer-local** and only set **after a language server attaches**.
- You’re using `trouble.nvim` for enhanced diagnostics display (overriding default `gr`).
- Clipboard integration: system-wide yank/paste and clever paste-over logic.

---

### 🔢 Auto-completion (`nvim/lua/plugins/cmp.lua`)

#### Plugin: `nvim-cmp`
Auto-completion engine with snippet and LSP support.

**Main Plugin**: `hrsh7th/nvim-cmp`

**Dependencies:**
- `L3MON4D3/LuaSnip` — snippet engine
  - Loads snippets from VSCode and supports JS regex
- `saadparwaiz1/cmp_luasnip` — bridges cmp and LuaSnip
- `hrsh7th/cmp-nvim-lsp` — integrates LSP completions
- `neovim/nvim-lspconfig` — LSP setup

**Key Features:**
- `<Tab>` to confirm a completion
- Completion popup and documentation styled with borders
- Supports snippets and LSP out-of-the-box
- JS snippets extended with HTML support

**Completion Settings:**
```lua
completion = {
  completeopt = "menu, menuone, noinsert"
}
```

**Snippets:**
- Loaded using: `require("luasnip.loaders.from_vscode").load()`
- JS files can reuse HTML snippets: `luasnip.filetype_extend("javascript", { "html" })`

---

### 🔊 Harpoon (`nvim/lua/plugins/harpoon.lua`)

#### Plugin: `theprimeagen/harpoon`
Quick file marking and navigation plugin.

**Key Features:**
- Mark files for quick access
- Open a UI to jump between them
- Navigate between up to 4 marked files using custom shortcuts

**Keybindings:**
| Shortcut       | Mode | Action                           |
|----------------|------|----------------------------------|
| `<leader>q`    | n    | Add current file to harpoon list |
| `<leader>w`    | n    | Toggle Harpoon UI                |
| `<leader>f`    | n    | Go to file 1                     |
| `<leader>s`    | n    | Go to file 2                     |
| `<leader>a`    | n    | Go to file 3                     |
| `<leader>g`    | n    | Go to file 4                     |

---

### 🚀 LSP Setup (`nvim/lua/plugins/lsp.lua`)

#### Plugins:
- `williamboman/mason.nvim`
- `williamboman/mason-lspconfig.nvim`
- `neovim/nvim-lspconfig`

**LSP Installation & Management**:
- `mason.nvim`: Installs language servers
- `mason-lspconfig.nvim`: Bridges Mason with `nvim-lspconfig`

**Automatically Installed LSPs:**
- `pyright`
- `clangd`
- `rust_analyzer`
- `html`

**Special Configurations:**
- `lua_ls`: Enables recognition of global `vim` variable
- `rust_analyzer`: Runs `clippy`, enables advanced diagnostics

**Handler Logic:**
- Generic handler for all other LSPs using `lspconfig[server].setup({})`
- Each special LSP gets custom settings

**Trigger LSP Setup:**
```lua
build = ":MasonUpdate"
```

---

*More sections will be added here as you share additional parts of your config.*

