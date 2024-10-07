return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      lazy = false,
    },
    "nvim-neotest/nvim-nio",
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup("/home/matheo/.virtualenvs/neovim/bin/python")
      end,
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<F5>", dap.continue, {})
    vim.keymap.set("n", "<F10>", dap.step_over, {})
    vim.keymap.set("n", "<F11>", dap.step_into, {})
    vim.keymap.set("n", "<F12>", dap.step_out, {})
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
    --vim.keymap.set("n", "<Leader>B", dap.set_breakpoint(), {})
    --vim.keymap.set("n", "<Leader>lp", dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")), {})
    --vim.keymap.set("n", "<Leader>dr", dap.repl.open(), {})
    --vim.keymap.set("n", "<Leader>dl", dap.run_last(), {})
    --vim.keymap.set({ "n", "v" }, "<Leader>dh", require("dap.ui.widgets").hover(), {})
    --vim.keymap.set({ "n", "v" }, "<Leader>dp", require("dap.ui.widgets").preview(), {})
    --vim.keymap.set("n", "<Leader>df", function()
    --	local widgets = require("dap.ui.widgets")
    --	widgets.centered_float(widgets.frames)
    --end)
    --vim.keymap.set("n", "<Leader>ds", function()
    --	local widgets = require("dap.ui.widgets")
    --	widgets.centered_float(widgets.scopes)
    --end)
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/matheo/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
      {
        name = "Launch file with argument",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
          local args_str = vim.fn.input({
            prompt = "Arguments: ",
          })
          return vim.split(args_str, " +")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
      {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
