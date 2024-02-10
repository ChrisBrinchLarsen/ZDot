local Z={
    [1]="nvim-treesitter/nvim-treesitter",
    --lazy = false,       -- When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are 'required', or when one of the lazy-loading handlers triggers
    --enabled = true,     -- When false, or if the function returns false, then this plugin will not be included in the spec
    --pin = false         -- When true, this plugin will not be included in updates
    --branch = "",        -- Branch of the repository
    --tag = "",           -- Tag of the repository
    --commit = "",        -- Commit of the repository
    --version = "",       -- Version to use from the repository
    --submodules = true   -- When false, git submodules will not be fetched. Defaults to true
    --priority = 1000,    -- Only useful for start plugins (lazy=false) to force loading certain plugins first. Default priority is 50. It's recommended to set this to a high number for colorschemes.
    --dir = "",           -- A directory pointing to a local plugin
    --url = "",           -- A custom git url where the plugin is hosted
    --dev = false,        -- When true, a local pluging directory will be used instead
    --cond = ture,        -- When false, or if the function returns false, then this plugin will not be loaded. Useful to disable some plugins in vscode, or firenvim for example.
    --dependencies = {},  -- A list of plugin names or plugin specs that should be loaded when the plugin loads. Dependencies are always lazy-loaded unless specified otherwise. When specifying a name, make sure the plugin spec has been defined somewhere else.
    --init = function() end, -- init functions are always executed during startup
    --opts = {},          -- opts should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()
    --main = "",          -- You can specify the main module to use for config() and opts(), in case it can not be determined automatically. See config()
    --build = func or string, -- build is executed when a plugin is installed or updated. Before running build, a plugin is first loaded. If it's a string it will be ran as a shell command. When prefixed with : it is a Neovim command. You can also specify a list to executed multiple build commands. Some plugins provide their own build.lua which is automatically used by lazy. So no need to specify a build step for those plugins.
    --module = false,     -- When true, do not automatically load this Lua module when it's required somewhere
    --event = "",         -- Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
    --cmd = "",           -- Lazy-load on command
    --ft = "",            -- Lazy-load on filetype
    --keys = "",          -- Lazy-load on key mapping
    --keys = "",
    --keys = "",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Specifying which languages we want treesitter support for, use :TSInstall <language> to install manually
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "c_sharp", "cmake", "cpp", "css", "csv", "diff", "disassembly", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "html", "javascript", "json", "latex", "luadoc", "make", "markdown", "python", "regex", "rust", "sql", "toml", "typescript", "xml", "yaml"},
            auto_install = true, -- If we enter a file type that we don't have a parser for, this will automatically install the corresponding parser
            highlight = {        -- Enabling the highlight module
                enable = true,
            },
            incremental_selection = { -- Allows us to intelligently select code
                enable = true,
                keymaps = {
                    init_selection = "<Leader>v", -- Will select the current context of what you're hovering
                    node_incremental = "v",       -- Will expand the selection to the next logical context
                    --scope_incremental = "grc",  -- Will select the entire scope that the hovered code exists in
                    node_decremental = "V",       -- Will shrink the selection to the previous logical context
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- Capture groups can be found in the nvim-treesitter-textobjects repository
                        -- Capture groups are defined in textobjects.scm
                        ["af"] = "@function.outer", -- Around function
                        ["if"] = "@function.inner", -- Inside function
                        ["ac"] = "@class.outer",    --
                        -- We can optionally set descriptions of the mappings to be used in nvim_buf_set_keymap
                        -- which some plugins hook into and can display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- Here we are also specifying that we're looking for the "@scope" defined in locals.scm
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    -- We can choose the selection mode, default is charwise 'v')
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * metod: eg 'v' or 'o'
                    -- and should return the mode ('v', 'V', or '<c-v>') or a table
                    -- mapping query_strings to modes
                    selection_modes = {
                        ['@parameter.outer'] = 'v',     -- charwise
                        ['@function.outer']  = 'V',     -- linewise
                        ['@class.outer']     = '<c-v>', -- blockwise
                    },
                    include_surrounding_whitespace = true, -- Textobjects are extended to include preceding or succeeding whitespace.
                },
            },
        })
    end,
}
return Z
