vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.updatetime=300
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.encoding = "utf-8"
vim.opt.background = "dark"
vim.opt.clipboard:append 'unnamedplus'
vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.filetype.add({
    extension = {
        Dockerfile = "dockerfile",
    },
    filename = {
        ["Dockerfile"] = "dockerfile",
        ["Dockerfile.*"] = "dockerfile",
    },
    pattern = {
        ["Dockerfile.*"] = "dockerfile",
    }
})

vim.diagnostic.config({
    virtual_text = false
})
vim.diagnostic.config({ float = { border = "single" } })
vim.o.updatetime = 250

vim.cmd [[
    syntax on
    filetype indent on
    set nocompatible
    set number
    set nobackup
    set noswapfile
    set nowrap
    set noundofile
    set cindent
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-
    map <space>ce :lua vim.diagnostic.open_float()<CR>
]]

vim.cmd [[
    autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
]]

