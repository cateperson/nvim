return {
  {
    'neanias/everforest-nvim',
    name = 'everforest',
    priority = 1000,
    config = function()
      require('everforest').setup {
        transparent_background_level = 1,
        -- background = 'soft', -- Options: 'hard', 'medium', 'soft'
      }
    end,
  },
}
