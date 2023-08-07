-- AVAILABLE SPINNER: dots
-- dots_negative
-- dots_snake
-- dots_footsteps
-- dots_hop
-- line
-- pipe
-- dots_ellipsis
-- dots_scrolling
-- star
-- flip
-- hamburger
-- grow_vertical
-- grow_horizontal
-- noise
-- dots_bounce
-- triangle
-- arc
-- circle
-- square_corners
-- circle_quarters
-- circle_halves
-- dots_toggle
-- box_toggle
-- arrow
-- zip
-- bouncing_bar
-- bouncing_ball
-- clock
-- earth
-- moon
-- dots_pulse
-- meter

return {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  opts = {
    text = {
      spinner = {
        '🕛', '🕐', '🕑', '🕒', '🕓', '🕔', '🕕', '🕖', '🕗', '🕘', '🕙', '🕚',
      },

      -- animation shown when tasks are ongoing
      --
      -- spinner = "pipe",

      -- character shown when all tasks are complete
      --
      done = "✔",

      -- message shown when task starts
      --
      commenced = "Started",

      -- message shown when task completes
      --
      completed = "Completed",
    },
    align = {
      -- align fidgets along bottom edge of buffer
      --
      bottom = true,

      -- align fidgets along right edge of buffer
      --
      right = true,
    },
    timer = {
      -- frame rate of spinner animation, in ms
      --
      spinner_rate = 125,

      -- how long to keep around empty fidget, in ms
      --
      fidget_decay = 2000,

      -- how long to keep around completed task, in ms
      --
      task_decay = 1000,
    },
    window = {
      -- where to anchor, either "win" or "editor"
      --
      relative = "win",

      -- &winblend for the window
      --
      blend = 100,

      -- the zindex value for the window
      --
      zindex = nil,

      -- style of border for the fidget window
      --
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
      -- border = "none",
    },
    fmt = {
      -- right-justify text in fidget box
      --
      leftpad = true,

      -- list of tasks grows upwards
      --
      stack_upwards = true,

      -- maximum width of the fidget box
      --
      max_width = 0,

      -- function to format fidget title
      --
      fidget =
          function(fidget_name, spinner)
            return string.format("%s %s", spinner, fidget_name)
          end,

      -- function to format each task line
      --
      task =
          function(task_name, message, percentage)
            return string.format(
              "%s%s [%s]",
              message,
              percentage and string.format(" (%s%%)", percentage) or "",
              task_name
            )
          end,
    },
    -- sources = {                 -- Sources to configure
    --   * = {                     -- Name of source
    --     ignore = false,         -- Ignore notifications from this source
    --   },
    -- },
    debug = {
      -- whether to enable logging, for debugging
      --
      logging = false,

      -- whether to interpret LSP strictly
      --
      strict = false,
    },
  },
}
