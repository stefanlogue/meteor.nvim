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
    it("sets the buffer options correctly", function()
      meteor.show()

      local bufhidden_option =
        vim.api.nvim_get_option_info2("bufhidden", { buf = 2 })
      local bufhidden_option_value =
        vim.api.nvim_get_option_value("bufhidden", { buf = 2 })
      assert.is_true(bufhidden_option.was_set, "bufhidden was set")
      assert.equals("wipe", bufhidden_option_value, "bufhidden was set to wipe")

      local modifiable_option =
        vim.api.nvim_get_option_info2("modifiable", { buf = 2 })
      local modifiable_option_value =
        vim.api.nvim_get_option_value("modifiable", { buf = 2 })
      assert.is_true(modifiable_option.was_set, "modifiable was set")
      assert.is_false(modifiable_option_value, "modifiable was set to false")
    end)
  end)
end)
