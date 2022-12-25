-- Set custom logo and footer
vim.cmd([[
let g:startify_custom_header =
\ startify#pad(split(system('cat ~/.local/share/venom/ascii.txt'), '\n'))
let g:startify_custom_footer = startify#pad(split(system('echo Venom 2.0 Man o War'), '\n'))
]])

-- Close last window if it is NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- I have no idea why packer doesn't run this during start but whatever
require("nvim-tree").setup()
require("lualine").setup()

-- HACK WARNING AHEAD
-- Ok basically nvim-tree won't allow a simple command such as `silent! autocmd vimenter * NvimTreeToggle | wincmd p`, I have no idea why, so basically I have to get the timer to trigger it right after.
local function tree_toggle_on_setup()
  require("nvim-tree").toggle(false, true)
end

vim.fn.timer_start(0, tree_toggle_on_setup)
-- HACK WARNING FINISHED
