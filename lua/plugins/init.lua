-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- colorscheme, currently github_dark
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('github-theme').setup {
  --       terminal_colors = true,
  --       dim_inactive = true,
  --       options = {
  --         transparent = true,
  --       }
  --     }
  --   end,
  --   init = function()
  --     vim.cmd("colorscheme github_dark")
  --   end
  -- },
  {
    'VonHeikemen/rubber-themes.vim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd('colorscheme rubber')
    end
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>up",
        function()
          local Util = require("lazy.core.util")
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            Util.warn("Disabled auto pairs", { title = "Option" })
          else
            Util.info("Enabled auto pairs", { title = "Option" })
          end
        end,
        desc = "Toggle auto pairs",
      },
    },
  },
  { 'ggandor/lightspeed.nvim' },
  {
    'gennaro-tedesco/nvim-jqx',
    ft = { 'json', 'yaml' },
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
  },
  {
    'roobert/surround-ui.nvim',
    dependencies = {
      'kylechui/nvim-surround',
      'folke/which-key.nvim',
    },
    config = function()
      require('surround-ui').setup({
        root_key = "S"
      })
    end
  },
  {
    'andweeb/presence.nvim',
  },
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }
  },
  -- Git in github
  'tpope/vim-fugitive',
  -- hub in github
  'tpope/vim-rhubarb',
  'tpope/vim-vinegar',
  'kyazdani42/nvim-web-devicons',
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer' },
  },
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',   opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      numhl = true,
      current_line_blame = true,
    },
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.opts)
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require 'nvim-tree'.setup({
        view = {
          number = true,
          signcolumn = "yes",
          float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * 0.8
              local window_h = screen_h * 0.5
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                relative = "editor",
                border = "rounded",
                width = window_w_int,
                height = window_h_int,
                row = center_y,
                col = center_x,
              }
            end
          }
        }
      })
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = '',
      }
    }
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
  },
  'nvim-lua/popup.nvim',
  'notjedi/nvim-rooter.lua',
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function() require("bufferline").setup {} end,
  },
  {
    'onsails/lspkind-nvim',
    config = function()
      local lspkind = require("lspkind")
      lspkind.init({})
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
}, {})


