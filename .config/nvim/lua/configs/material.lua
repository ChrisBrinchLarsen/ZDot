return{
    [1] = "marko-cerovac/material.nvim",
    --name = "",          -- A custom name alias for the plugin used for the directory and as display name in lazy.nvim UI
    lazy = false,
    --lazy = false,       -- When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are 'required', or when one of the lazy-loading handlers triggers
    --enabled = true,     -- When false, or if the function returns false, then this plugin will not be included in the spec
    --pin = false         -- When true, this plugin will not be included in updates
    --branch = "",        -- Branch of the repository
    --tag = "",           -- Tag of the repository
    --commit = "",        -- Commit of the repository
    --version = "",       -- Version to use from the repository
    --submodules = true   -- When false, git submodules will not be fetched. Defaults to true
    -- priority = 1000,
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
    config = function()
        require('material').setup({
            contrast = {
                terminal = true,             -- Enable contrast for the built-in terminal
                sidebars = true,             -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                floating_windows = false,    -- Enable contrast for floating windows
                cursor_line = false,         -- Enable darker background for the cursor line
                non_current_windows = false, -- Enable contrasted background for non-current windows
                filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
            },
            styles = {                       -- Give comments style such as bold, italic, underline etc.
                comments = { italic = true },
                strings = { --[[ bold = true ]] },
                keywords = { --[[ underline = true ]] },
                functions = { --[[ bold = true, undercurl = true ]] },
                variables = {},
                operators = {},
                types = {},
            },
            plugins = { -- Uncomment the plugins that you use to highlight them
                -- Available plugins:
                -- "dap",
                "dashboard",
                -- "eyeliner",
                "fidget",
                -- "flash",
                "gitsigns",
                -- "harpoon",
                -- "hop",
                "illuminate",
                -- "indent-blankline",
                -- "lspsaga",
                -- "mini",
                -- "neogit",
                -- "neotest",
                -- "neo-tree",
                -- "neorg",
                -- "noice",
                "nvim-cmp",
                -- "nvim-navic",
                "nvim-tree",
                "nvim-web-devicons",
                "rainbow-delimiters",
                -- "sneak",
                "telescope",
                "trouble",
                "which-key",
                -- "nvim-notify",
            },
            disable = {
                colored_cursor = false, -- Disable the colored cursor
                borders = false,        -- Disable borders between verticaly split windows
                background = true,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
                term_colors = false,    -- Prevent the theme from setting terminal colors
                eob_lines = true,       -- Hide the end-of-buffer lines
            },
            high_visibility = {
                lighter = false,       -- Enable higher contrast text for lighter style
                darker = true,         -- Enable higher contrast text for darker style
            },
            lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
            async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)
            custom_colors = nil,       -- If you want to override the default colors, set this to a function
            custom_highlights = {},    -- Overwrite highlights with your own
        })
        vim.g.material_style = "deep ocean"
        vim.cmd("colorscheme material") -- Running the vim command that actually sets our colorscheme
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#3C4772', bold = true })
        vim.api.nvim_set_hl(0, 'LineNr',      { fg = '#84FFFF', bold = true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#3C4772', bold = true })
    end,
}
