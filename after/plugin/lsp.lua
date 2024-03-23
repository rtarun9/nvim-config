local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
	lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    clangd = function()
      require('lspconfig').clangd.setup({
        capabilities = {
          offsetEncoding = 'utf-8',
        },
      })
    end,
  },
})
