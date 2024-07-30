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

-- Background Quick Configuration Controls

-- Dimming of background images in general and for the rain and water trails in particular
local background_dimmer = { brightness = 0.1 }
local background_rain_dimmer = { brightness = 0.2 }
-- opacity of the different layers
local background_window_opacity = 0.6
local background_window_water_trail_opacity = 0.6
local background_rain_opacity = 0.6
local background_indoor_opacity = 1.0
-- Adjust the scaling strategy for the background images
local background_height = '100%'
local background_width = '100%'
local background_repeat_y_size = '100%'
-- 'scrolling speed' adjustment for the layers
local parallax_scaling_factor = 1.0

-- Path where the background images are stored
local background_image_path = 'C:/Users/almig/'

config.background =
{
    -- back-most layer. Will be rendered first (outdoors/window)
    {
        source = { File = background_image_path .. 'city.png' },

        hsb = background_dimmer,
        opacity = background_window_opacity,

        height = background_height,
        width = background_width,


    },
    -- middle layers - rain (the order doesn't matter too much for these)
    -- These two 'trails' layers fall slower - like rain sliding down your window pane
    {
        source = { File = background_image_path .. 'trails_0.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        attachment = { Parallax = -0.05 },

        hsb = background_rain_dimmer,
        opacity = background_window_water_trail_opacity,
    },
    {
        source = { File = background_image_path .. 'trails_0.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        vertical_offset = '-100%',
        attachment = { Parallax = -0.05 },

        hsb = background_rain_dimmer,
        opacity = background_window_water_trail_opacity,
    },
    -- these next three rain layers fall faster, like the actual rain
    -- they are also a bit more transparent
    {
        source = { File = background_image_path .. 'rain_0.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        attachment = { Parallax = -1.5 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    {
        source = { File = background_image_path .. 'rain_0.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        vertical_offset = '-100%',
        attachment = { Parallax = -1.5 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    {
        source = { File = background_image_path .. 'rain_1.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        attachment = { Parallax = -1.5 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    {
        source = { File = background_image_path .. 'rain_1.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        vertical_offset = '-100%',
        attachment = { Parallax = -1.5 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    {
        source = { File = background_image_path .. 'rain_2.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        attachment = { Parallax = -2.0 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    {
        source = { File = background_image_path .. 'rain_2.png' },

        height = background_height,
        width = background_width,

        repeat_y_size = background_repeat_y_size,
        vertical_offset = '-100%',
        attachment = { Parallax = -2.0 * parallax_scaling_factor },

        hsb = background_dimmer,
        opacity = background_rain_opacity,
    },
    -- final topmost layer (indoors)
    {
        source = { File = background_image_path .. 'indoors.png' },
        height = background_height,
        width = background_width,

        hsb = background_dimmer,
        opacity = background_indoor_opacity,
    }
}


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
