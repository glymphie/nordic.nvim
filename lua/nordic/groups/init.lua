local merge = require('nordic.utils').merge
local C = require 'nordic.config'

local M = {}

M.integrations = {
    'dashboard',
    'diffview',
    'gitsigns',
    'headlines',
    'indent-blankline',
    'lazy',
    'leap',
    'lsp_signature',
    'lspsaga',
    'ministatusline',
    'neo-tree',
    'noice',
    'nvim-cmp',
    'nvim-dap-ui',
    'nvim-dap',
    'nvim-notify',
    'nvim-tree',
    'telescope',
    'treesitter-context',
    'treesitter',
    'trouble',
    'vimtex',
    'which-key',
}

M.native = {
    'editor',
    'syntax',
    'diff',
    'lsp',
}

function M.get_groups()
    local groups = {}
    for _, native in ipairs(M.native) do
        groups = merge(groups, require('nordic.groups.native.' .. native))
    end
    for _, integration in ipairs(M.integrations) do
        groups = merge(groups, require('nordic.groups.integrations.' .. integration))
    end
    return merge(groups, C.options.override)
end

function M.set_term_colors()
    local colors = require 'nordic.groups.native.terminal'
    for term, col in pairs(colors) do
        vim.g[term] = col
    end
end

return M
