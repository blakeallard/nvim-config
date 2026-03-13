---@type ChadrcConfig
local M = {}
M.base46 = {
    theme = "vesper",
    transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
        Normal = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        NvimTreeNormal = { bg = "NONE" },
        NvimTreeNormalNC = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
    },
}
M.colorify = {
    enabled = false,
}
return M
