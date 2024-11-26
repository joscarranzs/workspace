return {
    {
        "nvim-telescope/telescope.nvim", -- Plugin principal
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            telescope.setup({
                defaults = {
                    prompt_prefix = "🔍 ",
                    selection_caret = "➤ ",
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.move_selection_next,
                            ["<C-p>"] = actions.move_selection_previous,
                            ["<C-c>"] = actions.close,
                            ["<CR>"] = function(prompt_bufnr)
                                local entry = action_state.get_selected_entry()
                                actions.close(prompt_bufnr)
                                vim.cmd("tabedit " .. entry.path)
                            end,
                        },
                        n = {
                            ["<CR>"] = function(prompt_bufnr)
                                local entry = action_state.get_selected_entry()
                                actions.close(prompt_bufnr)
                                vim.cmd("tabedit " .. entry.path)
                            end,
                            ["q"] = actions.close,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden" }
                        end,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            -- Cargar la extensión fzf si está instalada
            pcall(telescope.load_extension, "fzf")
        end,
    },
}
