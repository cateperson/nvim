return {
  {
    'neanias/everforest-nvim',
    name = 'everforest',
    priority = 1000,
    config = function()
      require('everforest').setup {
        -- background = 'soft', -- Options: 'hard', 'medium', 'soft'
      }
    end,
  },
}
