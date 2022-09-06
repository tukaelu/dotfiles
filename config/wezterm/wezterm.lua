local wezterm = require 'wezterm'
local act = wezterm.action

local is_mac = wezterm.target_triple:find 'darwin' -- x86_64-apple-darwin
local is_linux = wezterm.target_triple:find 'linux' -- x86_64-unknown-linux-gnu

-- Functions

local function font_with_fallback(expected, attrs)
  local families = expected
  local fallbacks = { 'Noto Sans JP' }

  if is_mac then
    table.insert(fallbacks, 'DroidSansMono Nerd Font')
    table.insert(fallbacks, 'ヒラギノ丸ゴ ProN')
  elseif is_linux then
    table.insert(fallbacks, 'Ubuntu Monospace')
    table.insert(fallbacks, 'Doroid Sans')
  end

  for i = 1, #fallbacks do
    table.insert(families, fallbacks[i])
  end

  return wezterm.font_with_fallback(families, attrs)
end

local function font_size()
  Size = 18
  if is_mac then
    Size = 16
  elseif is_linux then
    Size = 20
  end
  return Size
end

return {

  front_end = 'Software',
  enable_scroll_bar = true,
  scrollback_lines = 10000,

  -- https://github.com/wez/wezterm/issues/2027
  animation_fps = 1,
  cursor_blink_rate = 0,

  check_for_updates = false,

  -- IME
  use_ime = true,
  ime_preedit_rendering = 'System',

  -- colorscheme
  color_scheme = 'nord',
  window_background_opacity = 0.75,

  -- font
  font = font_with_fallback { 'Cica' },
  font_size = font_size(),

  -- tab
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,

  -- keybindings
  disable_default_key_bindings = true,
  leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 2000 },
  keys = {
    -- { key = '[', mods = 'LEADER', action = act({ CopyTo = 'Clipboard' }) },
    { key = '[', mods = 'LEADER', action = act('ActivateCopyMode') },
    { key = ']', mods = 'LEADER', action = act({ PasteFrom = 'Clipboard' }) },
    { key = 't', mods = 'LEADER', action = act({ SpawnTab = 'CurrentPaneDomain' }) },
    { key = 'w', mods = 'LEADER', action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = '1', mods = 'LEADER', action = act({ ActivateTab = 0 }) },
    { key = '2', mods = 'LEADER', action = act({ ActivateTab = 1 }) },
    { key = '3', mods = 'LEADER', action = act({ ActivateTab = 2 }) },
    { key = '4', mods = 'LEADER', action = act({ ActivateTab = 3 }) },
    { key = '5', mods = 'LEADER', action = act({ ActivateTab = 4 }) },
    { key = '6', mods = 'LEADER', action = act({ ActivateTab = 5 }) },
    { key = '7', mods = 'LEADER', action = act({ ActivateTab = 6 }) },
    { key = '8', mods = 'LEADER', action = act({ ActivateTab = 7 }) },
    { key = '9', mods = 'LEADER', action = act({ ActivateTab = 8 }) },
    { key = 'n', mods = 'LEADER', action = act({ ActivateTabRelative = 1 }) },
    { key = 'p', mods = 'LEADER', action = act({ ActivateTabRelative = -1 }) },
  },

  key_tables = {
    copy_mode = {
      { key = 'h', mods = 'NONE', action = act({ CopyMode = 'MoveLeft' }) },
      { key = 'j', mods = 'NONE', action = act({ CopyMode = 'MoveDown' }) },
      { key = 'k', mods = 'NONE', action = act({ CopyMode = 'MoveUp' }) },
      { key = 'l', mods = 'NONE', action = act({ CopyMode = 'MoveRight' }) },
      { key = 'a', mods = 'CTRL', action = act({ CopyMode = { SetSelectionMode = 'SemanticZone' } }) },
      { key = 'v', mods = 'NONE', action = act({ CopyMode = { SetSelectionMode = 'Block' } }) },
      { key = 'V', mods = 'NONE', action = act({ CopyMode = { SetSelectionMode = 'Line' } }) },
      { key = 'w', mods = 'NONE', action = act({ CopyMode = { SetSelectionMode = 'Word' } }) },
      { key = 'y', mods = 'NONE', action = act({ CopyTo = 'Clipboard' }) },
      { key = 'Escape', mods = 'NONE', action = act({ CopyMode = 'Close' }) },
      { key = 'c', mods = 'CTRL', action = act({ CopyMode = 'Close' }) },
    },
  },

  launch_menu = {},
}
