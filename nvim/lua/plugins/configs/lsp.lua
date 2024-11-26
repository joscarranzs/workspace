-- Archivo: lsp.lua
-- Este archivo configura y gestiona los servidores LSP (Language Server Protocol) en Neovim.

return {
    -- Herramientas para soporte adicional
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            -- Asegúrate de que opts.ensure_installed es una tabla
            opts.ensure_installed = opts.ensure_installed or {}

            -- Extiende la tabla con las herramientas necesarias
            vim.list_extend(opts.ensure_installed, {
                "stylua", -- Formateador para Lua
                "selene", -- Linter para Lua
                "luacheck", -- Análisis estático para Lua
                "shellcheck", -- Linter para scripts de shell
                "shfmt", -- Formateador para scripts de shell
                "tailwindcss-language-server", -- Soporte para Tailwind CSS
                "typescript-language-server", -- Soporte para TypeScript
                "css-lsp", -- Soporte para CSS
            })
        end,
    },

    -- Soporte y configuración de LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false }, -- Desactiva sugerencias inline
            servers = {
                cssls = {}, -- Configuración para CSS
                html = {}, -- Configuración para HTML
                yamlls = { -- Configuración para YAML
                    settings = {
                        yaml = {
                            keyOrdering = false, -- Desactiva el reordenamiento automático de claves
                        },
                    },
                },
                lua_ls = { -- Configuración específica para Lua
                    single_file_support = true,
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false, -- No verificar bibliotecas de terceros
                            },
                            completion = {
                                workspaceWord = true,
                                callSnippet = "Both", -- Ofrecer snippets en completado
                            },
                            hint = {
                                enable = true, -- Habilitar sugerencias
                            },
                            diagnostics = {
                                disable = { "incomplete-signature-doc", "trailing-space" }, -- Desactivar diagnósticos específicos
                                globals = { "vim" }, -- Reconocer `vim` como global
                            },
                            format = {
                                enable = false, -- Desactivar formato automático
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "2",
                                    continuation_indent_size = "2",
                                },
                            },
                        },
                    },
                },
                tailwindcss = { -- Configuración para Tailwind CSS
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                },
                tsserver = { -- Configuración para TypeScript
                    root_dir = function(...)
                        return require("lspconfig.util").root_pattern(".git")(...)
                    end,
                    single_file_support = false,
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "literal",
                                includeInlayFunctionParameterTypeHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayFunctionParameterTypeHints = true,
                            },
                        },
                    },
                },
            },
            setup = function()
                local lspconfig = require("lspconfig")
                local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
                local lsp_attach = function(client, bufnr)
                    -- Define keybindings aquí si es necesario
                end

                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "bashls", -- Soporte para Bash
                        "cssls", -- Soporte para CSS
                        "html", -- Soporte para HTML
                        "gradle_ls", -- Soporte para Gradle
                        "groovyls", -- Soporte para Groovy
                        "lua_ls", -- Soporte para Lua
                        "jdtls", -- Soporte para Java
                        "jsonls", -- Soporte para JSON
                        "lemminx", -- Soporte para XML
                        "marksman", -- Soporte para Markdown
                        "quick_lint_js", -- Linter para JavaScript
                        "yamlls", -- Soporte para YAML
                    },
                })

                require("mason-tool-installer").setup({
                    ensure_installed = {
                        "java-debug-adapter", -- Adaptador para depurar Java
                        "java-test", -- Herramienta para pruebas en Java
                    },
                })

                -- Instalación explícita de herramientas por un posible problema de carga diferida
                vim.api.nvim_command("MasonToolsInstall")

                require("mason-lspconfig").setup_handlers({
                    function(server_name)
                        if server_name ~= "jdtls" then
                            lspconfig[server_name].setup({
                                on_attach = lsp_attach,
                                capabilities = lsp_capabilities,
                            })
                        end
                    end,
                })

                -- Configuración específica para Lua
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
        },
        config = function()
            -- Cambiar el estilo de los bordes de las ventanas flotantes del LSP
            local open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded"
                return open_floating_preview(contents, syntax, opts, ...)
            end
        end,
    },

    -- Atajos de teclado adicionales para el LSP
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = {
                {
                    "gd", -- Ir a la definición usando Telescope
                    function()
                        require("telescope.builtin").lsp_definitions({ reuse_win = false })
                    end,
                    desc = "Ir a la Definición",
                },
            }

            -- Registrar las teclas definidas
            for _, key in ipairs(keys) do
                vim.api.nvim_set_keymap("n", key[1], "", { noremap = true, silent = true, desc = key.desc })
            end
        end,
    },
}
