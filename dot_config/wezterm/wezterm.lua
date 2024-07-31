-- Pull in the wezterm API --
local wezterm = require 'wezterm'

-- This will hold the configuration. --
local config = wezterm.config_builder()

-- This is where you actually apply your config choices --


--------------------
-- * APPEARANCE * --
--------------------


config.font = wezterm.font 'Lilex Nerd Font Mono'

-------------------------
-- Color Configuration --
-------------------------

config.color_scheme = 'Ibm 3270 (High Contrast) (Gogh)'

config.colors =
{
    foreground = '#00FFC3',
    -- background = 'black',

    cursor_bg = '#00FF00',
    -- cursor_bg = '#FF00AF',
    cursor_border = '#FF00AF',

    -- Text foreground/background when highlighting text
    selection_fg = '#000000',
    selection_bg = '#FFF000',

    -- Split line between panes
    split = '#0000F0',

    compose_cursor = 'orange',

    -- copy_mode_active_highlight_fg = { Color = '' },
    -- copy_mode_active_highlight_bg = { Color = '' },
    -- copy_mode_inactive_highlight_fg = { Color = '' },
    -- copy_mode_inactive_highlight_bg = { Color = '' },

    -- quick_select_label_fg
    -- quick_select_label_bg
    -- quick_select_match_fg
    -- quick_select_match_bg

    tab_bar = {
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
}

-----------------------
-- Tab Configuration --
-----------------------

config.use_fancy_tab_bar = false



-- Tab bar settings --
config.window_frame = {
    -- Tab bar font --
    font = wezterm.font { family = 'Hack Nerd Font', weight = 'Bold' },

    font_size = 12.0,

    -- background colors for the tab bar --
    active_titlebar_bg = '#000000',
    inactive_titlebar_bg = '#000000',

}

config.tab_bar_style =
{

}



--------------------------
-- Scrolling Background --
--------------------------

local dynamic_background = require 'wezterm-background'
dynamic_background.apply_to_config(config)

------------------
-- * LAUNCHER * --
------------------

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
