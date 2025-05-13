return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    defaults = {
        vimgrep_arguments = {
            'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
            '--smart-case'
        }
    },
    config = function()
    end
}
