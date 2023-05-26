require("jazzkid")
print("Yo waddup")

local augroup = vim.api.nvim_create_augroup
local jazzkidGroup = augroup('jazzkid', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HilightYank', {})

function R(name)
    require("plenary.reload").reload_modul(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeaout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = jazzkidGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
