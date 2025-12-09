return {
  'ahmedkhalf/project.nvim',
  event = 'VeryLazy',
  config = function()
    require('project_nvim').setup {
      detection_methods = { 'pattern' },
      patterns = { '.git', 'Makefile', 'package.json', '.project' },
      silent_chdir = true,
      manual_mode = false,
    }

    -- Load into Telescope
    require('telescope').load_extension 'projects'
  end,
}
