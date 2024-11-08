return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = {},
    keys = {
      { "<leader>te", "<cmd>Neotree toggle reveal<CR>", desc = "Neotree" },
      { "<leader>tb", "<cmd>Neotree toggle buffers<CR>", desc = "Buffers (Neotree)" },
    },
  },
  {
    "stevearc/oil.nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      },
      {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        opts = {
          manual_mode = true,
        },
        main = "project_nvim",
        keys = {
          { "<leader>tR", "<cmd>ProjectRoot<CR>", desc = "Project root" },
        },
      },
    },
    cmd = "Telescope",
    opts = {},
    config = function(_, opts)
      require("telescope").setup(opts)
      local has_fzf, _ = pcall(require, "telescope._extensions.fzf")
      if has_fzf then
        require("telescope").load_extension("fzf")
      end
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Text" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Marks" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
      { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },
      { "<leader>fC", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      {
        "]h",
        function()
          require("gitsigns").next_hunk()
        end,
        desc = "Next hunk",
      },
      {
        "[h",
        function()
          require("gitsigns").prev_hunk()
        end,
        desc = "Previous hunk",
      },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
      { "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
      { "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle deleted" },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      delay = 200,
      filetypes_denylist = {
        "alpha",
        "grug-far",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "noice",
        "Outline",
        "TelescopePrompt",
        "Trouble",
        "undotree",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
    keys = {
      { "<leader>tc", "<cmd>ColorizerToggle<CR>", desc = "Colorizer" },
    },
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>tu", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {},
    keys = {
      { "<leader>tg", "<cmd>GrugFar<CR>", desc = "Grug far" },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer diagnostics",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "Symbols",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle<cr>",
        desc = "LSP definitions/references",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location list",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix list",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Trouble", "TodoTelescope" },
    opts = {},
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Todo (Trouble)" },
      {
        "<leader>xT",
        "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<CR>",
        desc = "Todo/Fix/Fixme (Trouble)",
      },
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Todo (Telescope)" },
      {
        "<leader>fT",
        "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>",
        desc = "Todo/Fix/Fixme (Telescope)",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "echasnovski/mini.icons",
    },
    opts_extend = { "spec" },
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>b", group = "buffer" },
          { "<leader>c", group = "code" },
          { "<leader>f", group = "find" },
          { "<leader>g", group = "git" },
          { "<leader>gt", group = "toggle" },
          { "<leader>n", group = "noice" },
          { "<leader>q", group = "session" },
          { "<leader>t", group = "toggle" },
          { "<leader>x", group = "diagnostics/quickfix" },
          { "]", group = "next" },
          { "[", group = "previous" },
          { "g", group = "goto" },
          { "z", group = "fold" },
        },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps (which-key)",
      },
    },
  },
}
