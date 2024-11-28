return {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
        -- Animación del cursor
        opts.cursor = {
            enable = true,
            timing = require("mini.animate").gen_timing.linear({ duration = 10 }),
            path = require("mini.animate").gen_path.line(),
        }

        -- Animación de desplazamiento vertical
        opts.scroll = {
            enable = true,
            timing = require("mini.animate").gen_timing.linear({ duration = 10 }),
            subscroll = require("mini.animate").gen_subscroll.equal({ steps = 60 }),
        }

        -- Animación de redimensionado de ventanas
        opts.resize = {
            enable = true,
            timing = require("mini.animate").gen_timing.linear({ duration = 10 }),
            subresize = require("mini.animate").gen_subresize.equal(),
        }

        -- Animación de apertura de ventanas
        opts.open = {
            enable = true,
            timing = require("mini.animate").gen_timing.linear({ duration = 10 }),
            winconfig = require("mini.animate").gen_winconfig.static({ step_count = 25 }),
            winblend = require("mini.animate").gen_winblend.linear({ from = 80, to = 100, steps = 60 }),
        }

        -- Animación de cierre de ventanas
        opts.close = {
            enable = true,
            timing = require("mini.animate").gen_timing.linear({ duration = 10 }),
            winconfig = require("mini.animate").gen_winconfig.static({ step_count = 25 }),
            winblend = require("mini.animate").gen_winblend.linear({ from = 100, to = 80, steps = 60 }),
        }
    end,
}
