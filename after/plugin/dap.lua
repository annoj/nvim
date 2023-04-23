local dap = require('dap')

-- Start codelldb automatically
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/opt/codelldb/adapter/codelldb',
        args = {"--port", "${port}"}
    }
}

-- Configure codelldb
dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false
    }
}

-- Keymaps
vim.keymap.set("n", "<leader>db", function() require'dap'.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dB", function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<leader>dc", function() require'dap'.continue() end)
-- vim.keymap.set("n", "<leader>dr", function() require'dap'.restart() end)
-- vim.keymap.set("n", "<leader>dq", function() require'dap'.terminate() end)
-- vim.keymap.set("n", "<leader>dsi", function() require'dap'.step_into() end)
-- vim.keymap.set("n", "<leader>dsv", function() require'dap'.step_over() end)
-- vim.keymap.set("n", "<leader>dso", function() require'dap'.step_out() end)

-- dapui
local dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  require'stackmap'.push('debugging', 'n', {
    ['si'] = function() require'dap'.step_into() end,
    ['sv'] = function() require'dap'.step_over() end,
    ['so'] = function() require'dap'.step_out() end,
    ['b'] = function() require'dap'.toggle_breakpoint() end,
    ['B'] = function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    ['c'] = function() require'dap'.continue() end,
    ['r'] = function() require'dap'.restart() end,
    ['q'] = function() require'dap'.terminate() end,
  })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  require'stackmap'.pop('debugging', 'n')
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- dap-virtual-text
require'nvim-dap-virtual-text'.setup()
