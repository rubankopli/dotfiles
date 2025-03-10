-- Pull in the wezterm API --
local wezterm = require 'wezterm'

-- Pull in modules --
local dynamic_background = require 'wezterm-background' -- dynamic background
local dank_theme = require 'dank-theme' -- custom theme

-- This will hold the configuration. --
local config = wezterm.config_builder()

-- This is where you actually apply your config choices --

-------------------
--- * GENERAL * ---
-------------------

-- NO BELL NOISE PLEASE DEAR GOD
config.audible_bell = 'Disabled'

-- Don't prompt for confirmation on exit
config.window_close_confirmation = 'NeverPrompt'


-------------
-- Startup --
-------------

-- non-windows targets
--if wezterm.target_triple ~= 'x86_64-pc-windows-msvc' then
--	config.default_prog = { 'zellij' }
--end
--config.default_prog = { 'zellij', 'attach', '--create', 'dev' }


---------------------
--- * BEHAVIOUR * ---
---------------------
-- (?<path>(?<base_folder>[\w]+\/)+)(?<file>[\w]+\.[\w]{1,3})(?<line>:(?<line_number>[\d]+)){0,1}(?<column>:(?<column_number>[\d]+)){0,1}
----------------
-- Hyperlinks --
----------------

-- Custom Hyperlink Regexes

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Make Jira numbers clickable
-- Internal capture group for adding other boards (TAS|OTHER1|OTHER2) etc.
table.insert(config.hyperlink_rules, {
    regex = [[\b((TAS|TRIAGE)-\d{3,4})\b]],
    format = 'https://seegrid.atlassian.net/browse/$1',
})

-- Open file:line:column links in vscode
-- $1 - path
-- $2 - parent folder
-- $3 - filename
-- $4 - :line   (optional)
-- $5 - line
-- $6 - :column (optional)
-- $7 - column
table.insert(config.hyperlink_rules, {
    regex = [[(([\w]+\/)+)([\w]+\.[\w]{1,3})(:([\d]+)){0,1}(:([\d]+)){0,1}]],
    format = 'code:$1$3$4$6'
})

wezterm.on('window-focus-changed', function(window, pane)
    wezterm.action.SpawnCommandInNewTab()
end)

-- Custom URI Handling --
wezterm.on('open-uri', function(window, pane, uri)
    -- Check if there is a 'code:' in front of the link
    local uri_start, uri_end = uri:find 'code:'
    if uri_start == 1 then

        -- Grab the portion without the 'code:' prefix
        local path = uri:sub(uri_end + 1)
        -- path = name:gsub("checkout/src/", "")

        local folder = "/home/seegrid.local/rkopli/repos/seegrid/dev/vehicle-metapackage/submodules/blue/"
        path = (folder .. path)

        window:perform_action(
            -- wezterm.action.SpawnCommandInNewTab {
                -- args = { 'code', '--goto', path },
            -- },
            wezterm.background_child_process {
                'code', '--goto', path
            },
            pane
        )
        -- Open the file in vscode
        -- wezterm.background_child_process('code', '--goto', file)
        -- wezterm.run_child_process('code', '--goto', file)
        -- prevent the default action from opening in a browser
        return false
    end
    -- otherwise, by not specifying a return value, we allow later
    -- handlers and ultimately the default action to cause the
    -- URI to be opened in the browser
end)

-----------------------
--- * KEYBINDINGS * ---
-----------------------

config.keys = {
    {
        key = 'Backspace', mods = 'CTRL',
        action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' },

	key = 'Delete', mods = 'ALT',
	action = wezterm.action.SendKey { key = 'd', mods = 'ALT' },

    },
}

----------------------
--- * APPEARANCE * ---
----------------------

----------------
-- Font/Theme --
----------------

config.font = wezterm.font 'Lilex Nerd Font Mono'

dank_theme.apply_to_config(config) -- Apply our custom theme and create config.colors

-----------------------
-- Tab Configuration --
-----------------------

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Tab colors
config.colors.tab_bar = {

    -- The inactive tab bar edge/divider --
    inactive_tab_edge = '#575757',

    active_tab = {
        bg_color = '#222222',
        fg_color = '#00ff00',

        intensity = 'Bold',
    },

    inactive_tab = {
        bg_color = '#252525',
        fg_color = '#666666',

        intensity = 'Normal'
    }
}

-- Tab bar settings --
config.window_frame = {
    -- Tab bar font --
    font = wezterm.font { family = 'Hack Nerd Font', weight = 'Bold' },

    font_size = 12.0,

    -- Background colors for the tab bar --
    active_titlebar_bg = '#000000',
    inactive_titlebar_bg = '#000000',

}

config.tab_bar_style =
{
--    local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
--    local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
}



--------------------------
-- Scrolling Background --
--------------------------

dynamic_background.apply_to_config(config)

--------------------
--- * LAUNCHER * ---
--------------------

------------------------------
-- Windows Launcher Options --
------------------------------
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.launch_menu =
    {
        {
            args = { 'powershell.exe', '-NoLogo', '-NoExit' },
            label = 'Powershell',
        },
    }
end



-- and finally, return the configuration to wezterm --
return config
