vim.opt.shiftwidth=4
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Setup for lazy.nvim
-- https://lazy.folke.io/installation

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

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
	{ "folke/todo-comments.nvim", opts = {} },
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    opts = {
		filesystem = {
		  filtered_items = {
		    visible = true,
		  },
		},
	      },
	    branch = "v3.x",
	    dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	    },
	    lazy = false, -- neo-tree will lazily load itself
	},
	{
	    'nvim-treesitter/nvim-treesitter',
	    lazy = false,
	    build = ':TSUpdate'
	},
	{
	    "scottmckendry/cyberdream.nvim",
	    lazy = false,
	    priority = 1000,
	},
	{
	    "nvzone/floaterm",
	    dependencies = "nvzone/volt",
	    opts = {},
	    cmd = "FloatermToggle",
	}          
    },
    install = { colorscheme = { "cyberdream" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require'nvim-treesitter.config'.setup {
    ensure_installed = { 'c', 'cpp', 'python' },
        highlight = {
        enable = true, -- Enable syntax highlighting
    },
    indent = {
        enable = true, -- Enable smart indentation
    },
}

require("cyberdream").setup({
    variant = "default", 

    -- Enable transparent background
    transparent = true,
})



vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<C-f>", "<Cmd>FloatermToggle<CR>")
vim.cmd.colorscheme "cyberdream"
