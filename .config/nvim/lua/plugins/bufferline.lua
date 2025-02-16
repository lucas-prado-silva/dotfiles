return {
    'akinsho/bufferline.nvim',
    version = "*",
    enabled = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require("bufferline")
        vim.opt.termguicolors = true

        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.minimal,
                show_buffer_icons = false,
                buffer_close_icon = "",
                close_icon = "",
                indicator = {
                    -- icon = "▎",
                    style = "none",
                }
            }
        })
    end

}
