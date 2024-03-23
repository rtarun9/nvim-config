vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit color.
vim.opt.termguicolors = true

-- Use Ctrl-n to toggle nvim-tree.
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })

-- LSP mappings.
vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })
