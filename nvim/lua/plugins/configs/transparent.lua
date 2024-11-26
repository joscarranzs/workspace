return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            enable = true, -- Habilita la transparencia automáticamente
            extra_groups = { -- Grupos adicionales para aplicar transparencia
                "Normal",
                "NormalFloat",
                "TelescopePrompt",
                "TelescopeResults",
                "Pmenu",
                "PmenuSel",
                "StatusLine",
                "DiagnosticFloat",
            },
        })

        -- Asegúrate de activar manualmente la transparencia
        vim.cmd("TransparentEnable")
    end,
}
