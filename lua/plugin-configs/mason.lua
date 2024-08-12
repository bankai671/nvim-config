require("mason").setup({
    ui = {
        border = "single"
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "clangd",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "rust_analyzer"
    },
})
