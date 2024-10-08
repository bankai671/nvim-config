require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "bash",
        "dockerfile",
        "css",
        "scss",
        "html",
        "ini",
        "rust",
        "go",
        "haskell",
        "markdown",
        "python",
    },

    sync_install = true,
    auto_install = true,

    highlight = {
        enable = true,
    }
})
