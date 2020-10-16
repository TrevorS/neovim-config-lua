local utils = require("utils")

local map = utils.map

-- keymaps
map("n", "<leader>v", "<cmd>vsplit<cr><c-w>l", { silent = true })
map("n", "<leader>h", "<cmd>split<cr><c-w>j", { silent = true })

map("n", "<c-h>", "<c-w>h", { silent = true })
map("n", "<c-j>", "<c-w>j", { silent = true })
map("n", "<c-k>", "<c-w>k", { silent = true })
map("n", "<c-l>", "<c-w>l", { silent = true })

map("n", "<leader>ev", "<cmd>edit " .. utils.nvim_path("init.vim"), { cr = true, silent = true })
map("n", "<leader>el", "<cmd>edit " .. utils.lua_path("init.lua"), { cr = true, silent = true })
map("n", "<leader>et", "<cmd>edit " .. utils.home_path(".tmux.conf"), { cr = true, silent = true })

map("n", "<leader>l", "<cmd>redraw!<cr><cmd>:nohl<cr><esc>", { silent = true })

map("n", "<leader>p", "<cmd>lua require('telescope.builtin').find_files{}", { cr = true, silent = true })
map("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep{}", { cr = true, silent = true })

-- lsp
map("i", "<tab>", [[ pumvisible() ? "\<C-n>" : "\<tab>" ]], { expr = true, silent = true })
map("i", "<s-tab>", [[ pumvisible() ? "\<C-p>" : "\<s-tab>" ]], { expr = true, silent = true })

map("n", "K", "<cmd>lua vim.lsp.buf.hover()", { cr = true, silent = true })
