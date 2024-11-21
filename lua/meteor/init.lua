local M = {}

---Open a floating window used to display meteor
---@param opts? {win?: integer}
M.show = function(opts)
  opts = opts or {}

  -- create a throwaway buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

  -- create a floating window using the throwaway buffer
  local height = math.ceil(vim.o.lines * 0.5)
  local width = math.ceil(vim.o.columns * 0.5)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    style = "minimal",
    border = "single",
  })

  -- set the current window to the floating window
  vim.api.nvim_set_current_win(win)

  -- run meteor in the floating window
  vim.fn.termopen("meteor", {
    on_exit = function(_, _, _)
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  -- start insert mode in the floating window
  vim.cmd.startinsert()
end

return M
