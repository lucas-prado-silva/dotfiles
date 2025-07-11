return {
    "nvimdev/lspsaga.nvim",
    enabled = true,
    config = function()
        require("lspsaga").setup({
            lightbulb = { virtual_text = false },
            ui = {
                border = "rounded",
                code_action = "",
            },
        })

        vim.keymap.set("n", "<leader>.", "<cmd>Lspsaga code_action<cr>")
        vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
        vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>")
    end,
}
