-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.opt.relativenumber = true
vim.filetype.add({
  pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})
-- nnoremap <F2> :w<CR>:execute "!groff -ms -T pdf -tle % > tmp.pdf" <CR>
-- vim.opt.fillchars = { eob = "~" }
