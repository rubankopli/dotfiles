-- Pull in the wezterm API --
local wezterm = require 'wezterm'

---------------------
-- * Color Theme * --
---------------------
-- This theme is more or less the same as the 'Homebrew (Gogh)' theme, except for the blues
-- Those are changed to be more visible when using a dark purple background

-- The module table that we will export to the config file
local module = {}

-- Apply our color scheme to the config
function module.apply_to_config(config)
    config.colors =
    {
        ------------------
        -- Theme Colors --
        ------------------

        foreground = '#00FFC3',
        -- background = 'black', -- we don't need this - using a theme for the background

        -- This basically duplicates the 'Homebrew (Gogh)' theme, but changes the blues which are difficult to see with the dynamic background
        ansi = {
            '#000000',
            '#990000',
            '#00A600',
            '#999900',
            '#0099BF',
            '#B200B2',
            '#00A6B2',
            '#BFBFBF',
        },
        brights = {
            '#666666',
            '#E50000',
            '#00D900',
            '#E5E500',
            '#00CCFF',
            '#E500E5',
            '#00E5E5',
            '#E5E5E5',
        },

        --------------------
        -- Element Colors --
        --------------------

        -- Cursor colors and style
        cursor_bg = '#00FF00',
        cursor_border = '#FF00AF',
        compose_cursor = 'orange', -- only in compose mode

        -- Split line between panes
        split = '#0000F0',

        -----------------------------
        -- Selection/Mode Coloring --
        -----------------------------

        -- Highlight/Selection colors
        selection_fg = '#000000',
        selection_bg = '#FFF000',

        -- Copy mode colors
        -- copy_mode_active_highlight_fg = { Color = '' },
        -- copy_mode_active_highlight_bg = { Color = '' },
        -- copy_mode_inactive_highlight_fg = { Color = '' },
        -- copy_mode_inactive_highlight_bg = { Color = '' },

        -- Quick select colors
        -- quick_select_label_fg
        -- quick_select_label_bg
        -- quick_select_match_fg
        -- quick_select_match_bg
    }
end

return module
