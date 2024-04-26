vim.g.mapleader = " "

-- NvimTree keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>',   { noremap = true })

-- ToggleTerm keymaps
vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>', { noremap = true })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line down(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==") -- move line down(n)
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==") -- move line up(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line down(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- move line down(v)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- move line up(v)

vim.cmd [[
    vmap <Tab> >gv
    vmap <S-Tab> <gv
]]
