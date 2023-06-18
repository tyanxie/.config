---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.J = {
  n = {
    ["J"] = { "5j", opts = { nowait = true } },
  },
}

M.K = {
  n = {
    ["K"] = { "5k", opts = { nowait = true } },
  }
}

-- more keybinds!

return M
