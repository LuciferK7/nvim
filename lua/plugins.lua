return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'kyazdani42/nvim-web-devicons'
    use 'famiu/feline.nvim'
    use 'emi2k01/nvcode-color-schemes.vim'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'preservim/nerdtree'
end)
