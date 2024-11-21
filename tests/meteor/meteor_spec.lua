local plugin = require("meteor")

describe("meteor", function()
  describe("show", function()
    it("creates a new buffer and window", function()
      local bufcount = #vim.api.nvim_list_bufs()
      local wincount = #vim.api.nvim_list_wins()

      plugin.show()

      local newbufcount = #vim.api.nvim_list_bufs()
      local newwincount = #vim.api.nvim_list_wins()

      assert.equals(bufcount + 1, newbufcount, "buffer count increased by 1")
      assert.equals(wincount + 1, newwincount, "window count increased by 1")
    end)
  end)
end)
