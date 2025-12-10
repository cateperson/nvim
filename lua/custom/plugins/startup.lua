return {
  {
    'startup-nvim/startup.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope.nvim',
      'ahmedkhalf/project.nvim',
    },
    config = function()
      ---------------------------------------------------------------------
      -- Theme Detection
      ---------------------------------------------------------------------
      local function get_palette()
        local name = vim.g.colors_name or ''

        -- Default: Catppuccin Mocha (Your preference)
        if name == '' or name:lower():match 'catppuccin' then
          return {
            icon = '#89b4fa', -- Blue
            text = '#cdd6f4', -- Text
            subtle = '#a6adc8', -- Subtext
          }
        end

        -- Everforest (Soft only)
        if name:lower():match 'everforest' then
          return {
            icon = '#7fbbb3', -- Aqua/Green highlight
            text = '#d3c6aa', -- Foreground
            subtle = '#9da9a0', -- Muted
          }
        end

        -- Fallback to Mocha if something else
        return {
          icon = '#89b4fa',
          text = '#cdd6f4',
          subtle = '#a6adc8',
        }
      end

      ---------------------------------------------------------------------
      -- Helper Commands
      ---------------------------------------------------------------------
      -- Wrapper to trigger the native Neorg new note prompt
      vim.api.nvim_create_user_command('NeorgNewAction', function()
        -- Feed the keys for the Neorg "new note" plug mapping.
        -- We use <Plug>(neorg.dirman.new-note) which triggers the interactive prompt.
        local key = vim.api.nvim_replace_termcodes('<Plug>(neorg.dirman.new-note)', true, true, true)
        vim.api.nvim_feedkeys(key, 'm', false)
      end, {})

      -- Wrapper to find files in the notes directory using Telescope
      vim.api.nvim_create_user_command('NeorgFindFiles', function()
        local notes_dir = vim.fn.expand('~/notes')
        -- Ensure the notes directory exists
        if vim.fn.isdirectory(notes_dir) == 0 then
          vim.fn.mkdir(notes_dir, 'p')
        end
        -- Launch Telescope in the notes directory
        require('telescope.builtin').find_files({ cwd = notes_dir, prompt_title = "Find Notes" })
      end, {})

      ---------------------------------------------------------------------
      -- Startup Config
      ---------------------------------------------------------------------
      require('startup').setup {
        theme = nil,
        parts = { 'header', 'body', 'footer' },
        options = {
          cursor_column = 0.5, -- Center the cursor column
        },

        header = {
          type = 'text',
          align = 'center',
          margin = 3,
          highlight = 'StartupHeader',
          content = {
            [[ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
            [[ ████╗  ██║██║   ██║██║████╗ ████║ ]],
            [[ ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
            [[ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
            [[ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
          },
        },

        body = {
          type = 'mapping',
          align = 'center',
          margin = 4,
          highlight = 'StartupBody',
          content = {
            { '  New File', 'enew', 'n' },
            { '  Find File', 'Telescope find_files', 'f' },
            { '  Recent Projects', 'Telescope projects', 'p' },
            { '  File Explorer', 'Neotree toggle', 'e' },
            { '  Open Notes', 'NeorgFindFiles', 'S' }, -- Changed key from 'o' to 'S'
            { '  New Note', 'NeorgNewAction', 'N' },
            { '󰗼  Quit', 'qa', 'q' },
          },
        },

        footer = {
          type = 'text',
          align = 'center',
          margin = 3,
          highlight = 'StartupFooter',
          content = { 'startup.nvim' },
        },
      }

      ---------------------------------------------------------------------
      -- Highlight Styling (Apply on ColorScheme change)
      ---------------------------------------------------------------------
      local function apply_highlights()
        local c = get_palette()
        vim.api.nvim_set_hl(0, 'StartupHeader', { fg = c.icon })
        vim.api.nvim_set_hl(0, 'StartupBody', { fg = c.text })
        vim.api.nvim_set_hl(0, 'StartupFooter', { fg = c.subtle })
        vim.api.nvim_set_hl(0, 'StartupHiddenCursor', { blend = 100, nocombine = true })
      end

      -- Apply immediately
      apply_highlights()

      -- Re-apply on colorscheme change
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = apply_highlights,
      })

      ---------------------------------------------------------------------
      -- Hide the cursor on the dashboard
      ---------------------------------------------------------------------
      local cursor_group = vim.api.nvim_create_augroup('StartupCursorHide', { clear = true })
      local original_guicursor = vim.go.guicursor

      vim.api.nvim_create_autocmd('FileType', {
        group = cursor_group,
        pattern = 'startup',
        callback = function()
          -- Force global update for this window context
          vim.opt.guicursor = 'a:StartupHiddenCursor'

          vim.api.nvim_create_autocmd('BufLeave', {
            group = cursor_group,
            buffer = 0,
            once = true,
            callback = function()
              vim.opt.guicursor = original_guicursor
            end,
          })
        end,
      })
    end,
  },
}
