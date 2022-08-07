-- prevent redrawing window every time LSP resends results
vim.cmd([[ let g:coq_settings = { 'display.pum.fast_close': v:false } ]])
