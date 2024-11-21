local M = {}

M.check = function()
  vim.health.start("meteor.nvim report")

  if vim.fn.executable("meteor") == 0 then
    vim.health.issues("meteor is not installed or not in PATH")
    return
  end

  vim.health.ok("meteor is installed")

  local results = vim.system({ "meteor", "--version" }, { text = true }):wait()

  if results.code ~= 0 then
    vim.health.issues("unable to get meteor version", results.stderr)
    return
  end

  vim.health.info("meteor version: " .. results.stdout)
end

return M
