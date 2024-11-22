local spy = require("luassert.spy")
local meteor = require("meteor")

describe("meteor", function()
  describe("show", function()
    it("creates a new scratch buffer", function()
      local nvim_create_buf_spy = spy.on(vim.api, "nvim_create_buf")
      local buf_count = #vim.api.nvim_list_bufs()

      meteor.show()

      local new_buf_count = #vim.api.nvim_list_bufs()

      assert.equals(buf_count + 1, new_buf_count, "buffer count increased by 1")
      assert.spy(nvim_create_buf_spy).was_called_with(false, true)
    end)
  end)
end)
