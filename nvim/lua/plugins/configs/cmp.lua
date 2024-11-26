-- File: nvim/lua/plugins/configs/cmp.lua

return {
    -- Cargar nvim-cmp y sus dependencias
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Fuente de completado para LSP (Protocolo de Servidor de Lenguaje)
            "hrsh7th/cmp-buffer", -- Completado de palabras del búfer actual
            "hrsh7th/cmp-path", -- Completado de rutas de archivos
            "hrsh7th/cmp-cmdline", -- Completado para el modo de línea de comandos
            "saadparwaiz1/cmp_luasnip", -- Completado para snippets usando LuaSnip
            "L3MON4D3/LuaSnip", -- Motor para manejar snippets
            "petertriho/cmp-git", -- Completado para comandos y operaciones de Git
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- Configuración general para nvim-cmp
            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- Expandir snippets usando LuaSnip
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                -- Mapeos para el completado
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Desplazar hacia arriba en la documentación
                    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Desplazar hacia abajo en la documentación
                    ["<C-Space>"] = cmp.mapping.complete(), -- Mostrar manualmente las sugerencias de completado
                    ["<C-e>"] = cmp.mapping.abort(), -- Cancelar el completado actual
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar la selección actual
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item() -- Seleccionar el siguiente elemento si el menú de completado está visible
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump() -- Expandir o saltar a la siguiente posición en un snippet
                        else
                            fallback() -- Comportamiento por defecto
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item() -- Seleccionar el elemento anterior si el menú está visible
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1) -- Saltar a la posición anterior en un snippet
                        else
                            fallback() -- Comportamiento por defecto
                        end
                    end, { "i", "s" }),
                }),
                -- Fuentes de completado disponibles
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Fuente de completado basada en LSP
                    { name = "luasnip" }, -- Fuente para snippets
                    { name = "buffer" }, -- Fuente de palabras del búfer actual
                    { name = "path" }, -- Fuente de rutas de archivos
                }),
            })

            -- Configuración específica para ciertos tipos de archivos
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" }, -- Fuente de completado para Git (útil en mensajes de commits)
                }, {
                        { name = "buffer" }, -- Palabras del búfer como fuente secundaria
                    }),
            })

            -- Configuración para completado en el modo de búsqueda (`/` y `?`)
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(), -- Configuración predefinida para cmdline
                sources = {
                    { name = "buffer" }, -- Completado basado en palabras del búfer
                },
            })

            -- Configuración para completado en el modo de comandos (`:`)
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(), -- Configuración predefinida para cmdline
                sources = cmp.config.sources({
                    { name = "path" }, -- Completado de rutas de archivos
                }, {
                        { name = "cmdline" }, -- Completado para comandos de Neovim
                    }),
            })
        end,
    },
}
