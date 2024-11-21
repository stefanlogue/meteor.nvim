local M = {}

M.check = function()
  vim.health.start("meteor.nvim report")

  if vim.fn.executable("meteor") == 0 then
    vim.health.issues("meteor is not installed or not in PATH")
    return
  end

  vim.health.ok("meteor is installed")
end

return M
