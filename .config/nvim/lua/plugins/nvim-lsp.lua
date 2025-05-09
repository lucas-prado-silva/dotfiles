return {
    "neovim/nvim-lspconfig",
    config = function()
        require("mason").setup({
            registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
        })
        require("mason-lspconfig").setup()

        require("blink.cmp").setup({
            completion = {
                documentation = { auto_show = true },
            },
            keymap = { preset = "enter" },
        })

        vim.diagnostic.config({
            signs = {
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                },
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.WARN] = "",
                },
            },
            update_in_insert = true,
            virtual_text = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                local Snacks = require("snacks")

                map("gd", function()
                    Snacks.picker.lsp_definitions()
                end, "[G]oto [D]efinition")
                map("gr", function()
                    Snacks.picker.lsp_references()
                end, "[G]oto [R]eferences")
                map("gI", function()
                    Snacks.picker.lsp_implementations()
                end, "[G]oto [I]mplementation")
                map("<leader>ll", vim.diagnostic.setloclist, "Open diagnostic [l]sp [l]oclist list")
                map("<leader>lq", vim.diagnostic.setqflist, "Open diagnostic [l]sp [q]uickfix list")
                map("<leader>lr", vim.lsp.buf.rename, "[l]sp [R]ename")
                map("<leader>lca", vim.lsp.buf.code_action, "[l]sp [C]ode Action")
                map("<leader>k", vim.lsp.buf.hover, "hover")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                local function setup_document_highlight(bufnr)
                    local highlight_augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })

                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        group = highlight_augroup,
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        group = highlight_augroup,
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "LspDocumentHighlight", buffer = event2.buf })
                        end,
                    })
                end

                local function setup_codelens(bufnr)
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = bufnr,
                        callback = vim.lsp.codelens.refresh,
                    })
                end

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client then
                    if
                        client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
                    then
                        setup_document_highlight(event.buf)
                    end
                    if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens, event.buf) then
                        setup_codelens(event.buf)
                    end
                    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                        vim.lsp.inlay_hint.enable(true)
                    end
                    if client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end
                end
            end,
        })
    end,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
        { "saghen/blink.cmp", build = "cargo build --release" },
    },
}
