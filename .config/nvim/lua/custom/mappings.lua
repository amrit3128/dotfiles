---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!
vim.api.nvim_set_keymap('n', '<F7>', ':lua C_compile()<CR>', { noremap = true })
function C_compile()
  vim.cmd(' !gcc % && ./a.out ')
end

vim.api.nvim_set_keymap('n', '<F2>', ':lua Groff()<CR>', { noremap = true, silent = true })
function Groff()
  vim.cmd('silent w')
  vim.cmd('!groff -ms -T pdf -tle ' .. vim.fn.shellescape(vim.fn.expand('%')) .. ' > tmp.pdf')
end

vim.api.nvim_set_keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

return M
