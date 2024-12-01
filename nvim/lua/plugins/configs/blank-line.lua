return {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
        indent = {
            char = '·',  -- Carácter utilizado para las guías de indentación
        },
        scope = {
            enabled = true,  -- Activar el resaltado de la columna de contexto
            show_start = false, -- No subraya el inicio del contexto
            show_end = false,   -- No subraya el final del contexto
        },
        exclude = {  -- Excluir buffers especiales
            filetypes = { 'dashboard', 'NvimTree', 'packer', 'lspinfo' },
            buftypes = { 'nofile', 'terminal', 'help' },
        },
    },
    config = function(_, opts)
        -- Configuración base del plugin
        require('ibl').setup(opts)
    end,
}
