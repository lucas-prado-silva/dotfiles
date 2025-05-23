return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- prevents treesitter and LSP from attaching to the buffer of a big file
        bigfile = {
            enabled = true,
            notify = true,
        },
        indent = {
            -- your indent configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            priority = 1,
            enabled = false,
            char = "|",
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = "│",
                underline = false,    -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
            },
        },
        dashboard = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true } -- Wrap notifications
            }
        }
    },
    keys = {
        { "<leader>un", function() Snacks.notifier.hide() end,      desc = "Dismiss All Notifications" },
        -- { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
        -- { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
        { "<leader>gb", function() Snacks.git.blame_line() end,     desc = "Git Blame Line" },
        { "<leader>gB", function() Snacks.gitbrowse() end,          desc = "Git Browse" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,   desc = "Lazygit Current File History" },
        { "<leader>gl", function() Snacks.lazygit.log() end,        desc = "Lazygit Log (cwd)" },
        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        -- { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
        -- { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
        {
            "]]",
            function() Snacks.words.jump(vim.v.count1) end,
            desc = "Next Reference",
            mode = {
                "n", "t" }
        },
        {
            "[[",
            function() Snacks.words.jump(-vim.v.count1) end,
            desc = "Prev Reference",
            mode = {
                "n", "t" }
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                -- Snacks.indent.enable()
            end,
        })
    end,
}
