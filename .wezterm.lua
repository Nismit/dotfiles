local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Enable Japanese IME
config.use_ime = true
-- Managed by brew
config.check_for_updates = false
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.initial_rows = 35
config.initial_cols = 140
-- Remove title bar
config.window_decorations = 'RESIZE'
config.font_size = 15.0
config.adjust_window_size_when_changing_font_size = false
config.color_scheme = 'iceberg-dark'
config.font = wezterm.font("Moralerspace Neon", { weight = "Regular" })

local function segments_for_right_status(window)
  return {
    window:active_workspace(),
    wezterm.strftime('%a %b %-d %H:%M '),
  }
end

wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
  local segments = segments_for_right_status(window)

  local color_scheme = window:effective_config().resolved_palette
  -- Note the use of wezterm.color.parse here, this returns
  -- a Color object, which comes with functionality for lightening
  -- or darkening the colour (amongst other things).
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  -- Each powerline segment is going to be coloured progressively
  -- darker/lighter depending on whether we're on a dark/light colour
  -- scheme. Let's establish the "from" and "to" bounds of our gradient.
  local gradient_to, gradient_from = bg, bg
  gradient_from = gradient_to:lighten(0.3)

  -- Yes, WezTerm supports creating gradients, because why not?! Although
  -- they'd usually be used for setting high fidelity gradients on your terminal's
  -- background, we'll use them here to give us a sample of the powerline segment
  -- colours we need.
  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #segments -- only gives us as many colours as we have segments.
  )

  -- We'll build up the elements to send to wezterm.format in this table.
  local elements = {}

  for i, seg in ipairs(segments) do
    local is_first = i == 1

    if is_first then
      table.insert(elements, { Background = { Color = 'none' } })
    end
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })

    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

-- TBD
-- config.debug_key_events = true
-- config.leader = { key = '\u{10}', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'k', mods = 'CMD', action = wezterm.action.ClearScrollback 'ScrollbackAndViewport' },
}

return config
