return {
  "vyfor/cord.nvim",
  build = ":CordUpdate",
  opts = {
    -- Hide project name
    workspace_text = "",
    -- Idle configuration
    idle = {
      enabled = true, -- Enable idle detection (default is true)
      timeout = 600000, -- 10 minutes in milliseconds (600000 ms)
      show_status = true, -- Show idle status (default is true)
      ignore_focus = true, -- Optional: still show idle if Neovim is focused
      unidle_on_focus = true, -- Optional: return from idle when focus returns
      smart_idle = true, -- Optional: only show idle if all instances are idle
      details = "Idling", -- Optional: what to show in Discord when idle
      state = nil, -- Optional: can set a custom state message
      tooltip = "💤", -- Optional: icon or tooltip
      icon = nil, -- Optional: custom icon
    },
    -- You can add other cord.nvim configuration fields here as necessary
  },
}
