vim.cmd("packadd packer.nvim")

return require("packer").startup(function ()
  use { "wbthomason/packer.nvim", opt = true }

  -- lsp
  use {
    "nvim-lua/completion-nvim",
    config = function()
      local lsp = require("nvim_lsp")
      local status = require("lsp-status")
      local completion = require("completion")
      local diagnostic = require("diagnostic")

      status.register_progress()

      local on_attach = function(client)
        completion.on_attach(client)
        status.on_attach(client)
        diagnostic.on_attach()
      end

      lsp.gopls.setup{
        on_attach = on_attach,
        capabilities = status.capabilities
      }

      lsp.html.setup{
        on_attach = on_attach,
        capabilities = status.capabilities
      }

      lsp.rust_analyzer.setup{
        on_attach = on_attach,
        capabilities = status.capabilities
      }
    end,
    requires = {
      "neovim/nvim-lspconfig",
      "nvim-lua/diagnostic-nvim",
      "nvim-lua/lsp-status.nvim"
    }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup{
        ensure_installed = {
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "python",
          "rust",
          "toml",
          "typescript"
        },
        highlight = {
          enable = true
        }
      }
    end
  }

  -- search
  use {
    "nvim-lua/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function() require("telescope").setup{} end
  }

  -- languages
  use {
    'euclidianAce/BetterLua.vim',
    'tjdevries/nlua.nvim',
    'rust-lang/rust.vim'
  }

  -- tpope
  use {
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-vinegar'
  }

  -- appearance
  use {
    {
      "norcalli/nvim-colorizer.lua",
      config = function() require("colorizer").setup() end
    },
    {
      "arcticicestudio/nord-vim",
      config = function() vim.cmd("colorscheme nord") end
    },
  }

  -- utilities
  use {
    'editorconfig/editorconfig-vim',
    'mhinz/vim-signify'
  }
end)
