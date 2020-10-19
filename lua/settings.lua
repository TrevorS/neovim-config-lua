local utils = require("utils")

local map = utils.map;
local home_path = utils.home_path;
local lua_path = utils.lua_path;
local nvim_path = utils.nvim_path;

-- editor
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- undo and backup file
vim.bo.undofile = true
vim.o.backup = false
vim.o.undofile = true
vim.o.writebackup = false

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.inccommand = "nosplit"

-- visual
vim.o.lazyredraw = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.visualbell = true
vim.o.syntax = "enable"

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = "yes"

-- misc configuration
vim.o.virtualedit = "onemore"
vim.o.wildmode = "longest,list:longest"
vim.o.errorbells = false
vim.o.mouse = "a"

-- disable automatic commenting (not yet working)
vim.api.nvim_exec("set formatoptions-=cro", false)
vim.api.nvim_exec("autocmd FileType * setlocal formatoptions-=cro", false)

-- lsp
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1

vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
vim.g.completion_matching_ignore_case = true

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { "lsp", "snippet", "tabnine" } },
    { mode = "<c-p>" },
    { mode = "<c-n>" }
  },
  lua = {
    { complete_items = { "ts", "lsp", "tabnine" } }
  },
  rust = {
    { complete_items = { "ts", "lsp", "tabnine" } }
  }
}

vim.api.nvim_command("autocmd BufEnter * lua require('completion').on_attach()")

vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"

vim.g.mapleader = " "
