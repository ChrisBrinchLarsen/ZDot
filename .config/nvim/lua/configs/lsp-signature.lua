return {
    [1] = "ray-x/lsp_signature.nvim", -- Requesting a plugin is assumed to be from a github repo so the syntax is "username/repository"
    --name = "",          -- A custom name alias for the plugin used for the directory and as display name in lazy.nvim UI
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
    event = "VeryLazy", -- Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
    --cmd = "",           -- Lazy-load on command
    --ft = "",            -- Lazy-load on filetype
    --keys = "",          -- Lazy-load on key mapping
    --config = function() -- config is executed when the plugin loads. The default implementation will automatically run require(MAIN).setup(opts). Lazy uses several heuristics to determine the plugin's MAIN module automatically based on the plugin's name. See also opts. To use the default implementation without opts set config to true.
    --    require("plugin").setup({ -- Plugin configurations go in here
    --
    --    })
    --end,
    config = function()
        require("lsp_signature").setup({
            debug = false,                                    -- set to true to enable debug logging
            log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
            -- default is  ~/.cache/nvim/lsp_signature.log
            verbose = false,                                  -- show debug line number

            bind = true,                                      -- This is mandatory, otherwise border config won't get registered.
            -- If you want to hook lspsaga or other signature handler, pls set to false
            doc_lines = 10,                                   -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
            -- set to 0 if you DO NOT want any API comments be shown
            -- This setting only take effect in insert mode, it does not affect signature help in normal
            -- mode, 10 by default

            max_height = 12,             -- max height of signature floating_window
            max_width = 80,              -- max_width of signature floating_window, line will be wrapped if exceed max_width
            -- the value need >= 40
            wrap = true,                 -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
            floating_window = true,      -- show hint in a floating window, set to false for virtual text only mode

            floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
            -- will set to true when fully tested, set to false will use whichever side has more space
            -- this setting will be helpful if you do not want the PUM and floating win overlap

            floating_window_off_x = 1, -- adjust float windows x position.
            -- can be either a number or function
            floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
            -- can be either number or function, see examples

            close_timeout = 4000, -- close floating window after ms when laster parameter is entered
            fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
            hint_enable = true, -- virtual hint enable
            hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
            hint_scheme = "String",
            hint_inline = function() return false end, -- should the hint be inline(nvim 0.10 only)?  default false
            -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
            -- return 'right_align' to display hint right aligned in the current line
            hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
            handler_opts = {
                border = "rounded",              -- double, rounded, single, shadow, none, or a table of borders
            },

            always_trigger = false,         -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

            auto_close_after = nil,         -- autoclose signature float win after x sec, disabled if nil.
            extra_trigger_chars = {},       -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
            zindex = 200,                   -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

            padding = '',                   -- character to pad on left and right of signature can be ' ', or '|'  etc

            transparency = nil,             -- disabled by default, allow floating win transparent value 1~100
            shadow_blend = 36,              -- if you using shadow as border use this set the opacity
            shadow_guibg = 'Black',         -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
            timer_interval = 200,           -- default timer check interval set to lower value if you want to reduce latency
            toggle_key = nil,               -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
            toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
            -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
            -- may not popup when typing depends on floating_window setting

            select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
            move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
        })
    end,
}
