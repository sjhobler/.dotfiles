-- Consolidated background setter: 'transparent' (default) or 'black'
local function set_background(mode)
  local bg = mode == 'black' and '#000000' or 'none'

  local groups = {
    'Normal',
    'NormalFloat',
    'SignColumn',
    'EndOfBuffer',
    'VertSplit',
    'StatusLine',
    'StatusLineNC',
    'TabLine',
    'TabLineFill',
    'TabLineSel',
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = bg })
  end

  vim.cmd [[
    highlight LineNr guibg=NONE
    highlight CursorLineNr guibg=NONE
    highlight GitGutterAdd guibg=NONE ctermbg=NONE
    highlight GitGutterChange guibg=NONE ctermbg=NONE
    highlight GitGutterDelete guibg=NONE ctermbg=NONE
  ]]
end

-- Kanagawa-specific highlight overrides, applied after background is set
local function set_kanagawa_highlights()
  local overrides = {
    { 'Function', { fg = '#8ba4b0', bold = true } }, -- bright version: fg = '#8CDAF0', default: #8ba4b0, '#5f6f7a'
    { 'Type', { fg = '#8ba4b0', bold = true } }, -- default: '#8EA4A2' (boolean: '#b6927b'), #5f6f7a
    { '@variable.member', { fg = '#e6d2a1', bold = false } },
    { 'FloatBorder', { fg = '#888888', bg = 'NONE' } },
    { 'NormalFloat', { fg = '#FFF8E7', bg = 'NONE' } },
    { 'Pmenu', { fg = '#888888', bg = 'NONE' } },
    { 'CursorLine', { bg = '#1a1a1a' } }, -- '#393836' } }, # default
    -- { '@function.builtin', { fg = '#9AE0B0', bold = true } }, -- bright version: '#9AE0B0'
    -- { '@keyword', { fg = '#B8A8E8', bold = true } },
    -- { 'String', { italic = true } },
    -- { 'Comment', { fg = '#7A7A88', italic = true } },
    -- { 'CursorLine', { bg = '#1E1E2A' } },
    -- { 'CursorLineNr', { fg = '#E6C384', bold = true } },
    -- { 'LineNr', { fg = '#3A3A48' } },
    -- { 'IndentBlanklineChar', { fg = '#1E1E28' } },
    -- { 'DiagnosticUnderlineError', { undercurl = true, sp = '#FF5D62' } },
    -- { 'DiagnosticUnderlineWarn', { undercurl = true, sp = '#E6C384' } },
    -- { 'DiagnosticUnderlineInfo', { undercurl = true, sp = '#8CBCF0' } },
    -- { 'DiagnosticUnderlineHint', { undercurl = true, sp = '#A8E6A3' } },
  }
  for _, hl in ipairs(overrides) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
end

-- base16-black-metal-bathory specific highlight overrides
local function set_metal_bathory_highlights()
  local overrides = {
    { 'Comment', { fg = '#555555', italic = true } },
    { 'TSComment', { fg = '#555555', italic = true } },
    { 'FloatBorder', { fg = '#888888', bg = '#000000' } },
    { 'WinSeparator', { fg = '#000000', bg = '#000000' } },
    { 'TSTypeBuiltin', { fg = '#e78a53', italic = false } },
    { 'TSPunctSpecial', { fg = '#c1c1c1', italic = false } },
  }
  for _, hl in ipairs(overrides) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
end

-- Expose globally for the colorscheme switcher
_G.SetBackground = set_background
_G.SetKanagawaHighlights = set_kanagawa_highlights
_G.SetMetalBathoryHighlights = set_metal_bathory_highlights

local function pick_nvim_colorscheme()
  local colorschemes = {
    'kanagawa',
    'catppuccin-macchiato',
    'base16-gruvbox-material-dark-hard',
    'base16-black-metal-bathory',
    'vague',
    'lackluster',
    'jellybeans-mono',
    'gruvbox-material',
    'yukinord',
  }

  vim.ui.select(colorschemes, {
    prompt = 'Select colorscheme',
  }, function(choice)
    if choice then
      vim.cmd.colorscheme(choice)
      vim.schedule(function()
        if choice == 'base16-black-metal-bathory' then
          SetBackground 'black'
          SetMetalBathoryHighlights()
        elseif choice == 'kanagawa' then
          SetBackground()
          SetKanagawaHighlights()
        else
          SetBackground()
        end
      end)
    end
  end)
end
_G.PickColorScheme = pick_nvim_colorscheme

return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    init = function()
      require('kanagawa').setup {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {
            -- Darken background shades for greater contrast
            sumiInk0 = '#0A0A0F',
            sumiInk1 = '#0E0E14',
            sumiInk2 = '#12121A',
            sumiInk3 = '#161620', -- main bg
            sumiInk4 = '#1C1C28',
            sumiInk5 = '#22222F',
            sumiInk6 = '#2A2A38',
            -- Brighten foreground for contrast
            fujiWhite = '#DCD8D0',
            oldWhite = '#C8C4B8',
            -- -- Brighten syntax accent colors
            -- springGreen = '#A8E6A3',
            -- crystalBlue = '#8CBCF0',
            -- springViolet1 = '#B8A8E8',
            -- carpYellow = '#F0C674',
          },
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = 'dragon',
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
      }
      vim.cmd.colorscheme 'kanagawa'
      set_background()
    end,
  },
  {
    'wtfox/jellybeans.nvim',
    opts = {},
  },
  {
    'RRethy/base16-nvim',
    priority = 1000,
  },
  {
    'vague2k/vague.nvim',
    priority = 1000,
  },
  {
    'slugbyte/lackluster.nvim',
    priority = 1000,
  },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      -- vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'bright'
      vim.g.gruvbox_material_statusline_style = 'mix'
      vim.g.gruvbox_material_cursor = 'auto'
    end,
  },
  {
    'adibhanna/yukinord.nvim',
    priority = 1000,
    -- config = function()
    --   vim.cmd [[colorscheme yukinord]]
    -- end,
  },

  -- Switch between colorschemes
  vim.keymap.set('n', '<leader>ccc', '<cmd>:lua PickColorScheme()<CR>', { desc = 'Select colorscheme' }),
}
