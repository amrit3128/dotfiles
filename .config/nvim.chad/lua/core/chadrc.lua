---@type ChadrcConfig
local M = {}

local highlights = require "core.highlights"

M.ui = {
  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
