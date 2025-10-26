-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set tab width to 2 spaces
vim.o.tabstop = 2     -- Number of spaces a tab counts for
vim.o.shiftwidth = 2  -- Number of spaces for indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.softtabstop = 2 -- How many spaces the Tab key feels like


vim.o.number          = true          -- line numbers
vim.o.relativenumber  = true
vim.o.termguicolors   = true
vim.o.hidden          = true
vim.o.updatetime      = 300
vim.o.scrolloff       = 6


-- Setup lazy.nvim
require("lazy").setup({
	 -------------------------------------------------
  -- Theme (feel free to swap for any you like)
  -------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme catppuccin-macchiato"
    end,
  },

  -------------------------------------------------
  -- File explorer (tree view)
  -------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          filtered_items = { visible = false },
        },
        window = {
          width = 30,
          mappings = {
            ["<space>e"] = "toggle_node",
          },
        },
      })
      -- Toggle with <leader>e
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
  },

  -------------------------------------------------
  -- Simple C++ compile‑and‑run task
  -------------------------------------------------
  {
    "stevearc/overseer.nvim",
    -- cmd = "OverseerRunTemplate", -- load only when this command is run
    lazy = false,
    config = function()
      local overseer = require("overseer")
      overseer.setup()

      overseer.register_template({
        name = "CppRun",
        builder = function()
          local src = vim.fn.expand("%:p")
          local exe = src:gsub("%.cpp$", "")
          return {
            cmd = { "g++", "-std=c++17", "-Wall", "-Wextra", "-O2", src, "-o", exe },
            cwd = vim.fn.expand("%:p:h"),
            components = { "default" },
            on_exit = function(_, code)
              if code == 0 then
                overseer.run_action({ cmd = { exe }, cwd = vim.fn.expand("%:p:h") })
              else
                vim.notify("Compilation failed", vim.log.levels.ERROR)
              end
            end,
          }
        end,
        condition = { filetype = { "cpp" } },
        -- params = { file = "%:p" },
        -- params = {
        --   file = {
        --     name = "file",
        --     desc = "Source file to compile",
        --     type = "string",
        --     default = vim.fn.expand("%:p"),
        --   },
        -- },
      })

      -- <leader>r → compile & run current .cpp file
      vim.keymap.set("n", "<leader>r",
        ":OverseerRun CppRun<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  }
}, {
  -- Lazy.nvim options (optional)
  ui = {
    border = "rounded",
  },
})

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", { noremap = true, silent = true })

