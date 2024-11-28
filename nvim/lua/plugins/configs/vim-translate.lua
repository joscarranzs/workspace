return {
    'voldikss/vim-translator',
    config = function()
        -- Configuración del plugin
        vim.g.translator_target_lang = 'en' -- Idioma de destino: inglés
        vim.g.translator_default_engines = { 'google' } -- Motor de traducción
    end
}
