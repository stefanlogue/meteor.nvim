vim.api.nvim_create_user_command("Meteor", function()
  require("meteor").show()
end, {
  desc = "Open a floating window used to display meteor",
})
