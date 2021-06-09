vim.env.FZF_DEFAULT_COMMAND = "rg --files --ignore-vcs"

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
            enable = false,
        }
    }
}
})

require'compe'.setup {
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
      ultisnips = true;
    };
}


vim.g.mapleader = " "
vim.api.nvim_command("colorscheme nord")

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 600
vim.o.inccommand = "split"
vim.o.mouse = "a"
vim.o.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·"
vim.o.completeopt = "menuone,noselect"
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

vim.api.nvim_set_keymap('n', '<leader>F', "<cmd>Files<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>R', "<cmd>Rg<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>B', "<cmd>Buffers<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>M', "<cmd>Marks<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>H', "<cmd>History:<CR>", {})

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

vim.api.nvim_set_keymap('n', '<leader>cd', ':exec "tcd " . expand("%:p:h")<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ne', '<cmd>NERDTreeToggle<CR><cmd>NERDTreeCWD<CR>', {})

local remap = vim.api.nvim_set_keymap

vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
vim.cmd("autocmd FileType qf setlocal wrap")

function _G.tab_expand()
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info({"selected"})["selected"] == -1 then
            vim.api.nvim_input("<C-n><Tab>")
        end
        return vim.fn.call("compe#confirm", {''})
    elseif vim.fn.call("vsnip#jumpable", {1}) == 1 then
        return vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-next)', true, true, true)
    else
        return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
    end
end

vim.api.nvim_set_keymap('i', '<Tab>', "v:lua.tab_expand()", {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {expr = true, silent = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true, silent = true})

function _G.list_diagnostics()
    vim.lsp.diagnostic.set_loclist()
    vim.cmd("lopen")
end

vim.api.nvim_set_keymap('n', '<leader>sd', '<cmd>call v:lua.list_diagnostics()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>aw', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {})
