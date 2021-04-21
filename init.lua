require('plugins')

require('feline').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { 'additionalTextEdits' } }

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
    ["rust-analyzer"] = {
        checkOnSave = {
            enable = true
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
    }
}
})

require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
    };
}

vim.api.nvim_command("colorscheme nvcode")

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noinsert"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 600
vim.o.inccommand = "split"
vim.o.mouse = "a"
vim.o.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumheight = 20
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.scrolloff = 5
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.undofile = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.formatoptions = "croqnljb"

vim.bo.undofile = vim.o.undofile
vim.bo.expandtab = vim.o.expandtab
vim.bo.shiftwidth = vim.o.shiftwidth
vim.bo.tabstop = vim.o.tabstop
vim.bo.formatoptions = vim.o.formatoptions

vim.wo.signcolumn = "yes"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.number = true
vim.wo.list = true
vim.wo.listchars = vim.o.listchars
vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.colorcolumn = "110"

vim.g.completion_enable_snippet = "snippets.nvim"

function _G.snippet_expand(key)
    if vim.fn['vsnip#jumpable'](1) == 1 then
        return vim.cmd('<Plug>(vsnip-jump-next)')
    else
        return vim.api.nvim_replace_termcodes(key, true, true, true)
    end
end

vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', '<Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {expr = true, silent = true})
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true, silent = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true, silent = true})

vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", {expr = true, silent = true, silent = true, noremap = true})

vim.api.nvim_set_keymap('n', 'F', "<cmd>Telescope find_files<CR>", {})
vim.api.nvim_set_keymap('n', 'R', "<cmd>Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap('n', 'B', "<cmd>Telescope buffers<CR>", {})
vim.api.nvim_set_keymap('n', 'H', "<cmd>Telescope highlights<CR>", {})
vim.api.nvim_set_keymap('n', 'M', "<cmd>Telescope marks<CR>", {})

vim.api.nvim_set_keymap('n', '<leader><Esc>', "<Esc>:noh<CR><Esc>", {})
vim.api.nvim_set_keymap('n', 'n', "nzz", {})
vim.api.nvim_set_keymap('n', 'N', "Nzz", {})
vim.api.nvim_set_keymap('n', '*', "*zz", {})
vim.api.nvim_set_keymap('n', '#', "#zz", {})
vim.api.nvim_set_keymap('n', 'j', "gj", {})
vim.api.nvim_set_keymap('n', 'k', "gk", {})

vim.api.nvim_set_keymap('n', '<leader>l', "<cmd>tabnext<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>tabprevious<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>tn', "<cmd>tabnew<CR>", {})
vim.api.nvim_set_keymap('n', '<leader><S-l>', "<cmd>tabmove 1<CR>", {})
vim.api.nvim_set_keymap('n', '<leader><S-h>', "<cmd>tabmove -1<CR>", {})

vim.api.nvim_set_keymap('n', '<leader>ne', ':exec "tcd " . expand("%:p:h")<CR>:exec "NERDTree"<CR><C-w>p', {})

vim.cmd('autocmd vimenter * NERDTree | wincmd p')
