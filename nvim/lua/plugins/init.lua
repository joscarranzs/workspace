-- Configurar lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar y cargar plugins desde la carpeta plugins/configs
require("lazy").setup({
    require("plugins.configs.rosepine"),
    require("plugins.configs.transparent"),
    require("plugins.configs.lsp"),
    require("plugins.configs.nvim-treesitter"),
    require("plugins.configs.lualine"),
    require("plugins.configs.supermaven"),
    require("plugins.configs.telescope"),
    require("plugins.configs.noice"),
    require("plugins.configs.dashboard"),
    require("plugins.configs.oil"),
    require("plugins.configs.muilti-cursors"),
    require("plugins.configs.nvim-db"),
    require("plugins.configs.nvim-jbtls"),
    require("plugins.configs.cmp"),
})