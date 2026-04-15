local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

-- dap.configurations.cpp = {
--   {
--     name = "Debug Machine (minimal)",
--     type = "cppdbg",
--     request = "launch",
--
--     program = os.getenv("MOUNTED_TARGET_DIR") .. "/build/src/Machine",
--
--     cwd = vim.fn.getcwd(),
--     stopAtEntry = false,
--
--     args = {
--       "-config", "/source/Machine/config",
--       "-fake-service-technician",
--     },
--
--     MIMode = "gdb",
--   },
-- }

local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
