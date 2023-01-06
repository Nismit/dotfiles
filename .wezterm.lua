local wezterm = require 'wezterm'

return {
  use_ime = true, -- Enable Japanese IME
  font_size = 15.0,
  window_background_opacity = 0.95,
  color_scheme = 'iceberg-dark',
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  initial_rows = 35,
  initial_cols = 140,
}
