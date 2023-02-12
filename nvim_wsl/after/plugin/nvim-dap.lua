local _1, dap              = pcall(require, 'dap')
local _2, dapui            = pcall(require, 'dapui')
local _3, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')

if not (_1 and _2 and _3) then
  vim.notify('Hey Gh: one of: dap, dapui, dap-virtual text missing')
  return
end

vim.fn.sign_define('DapBreakpoint',          { text='', texthl='DiagnosticError', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DiagnosticWarn',  linehl='', numhl='' })
vim.fn.sign_define('DapStopped',             { text='', texthl='DapUIPlayPause',  linehl='', numhl='' })

-- auto start dapui when dap fires
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.after.event_terminated['dapui_config'] = dapui.close
dap.listeners.after.event_exited['dapui_config'] = dapui.close

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
}

dap.adapters.codelldb = {
  type = 'server',
  -- port = "${port}",
  port = 7777,
  executable = {
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "7777"},
  }
}

dap.adapters.python = {
  type = 'executable';
  -- command = 'path/to/virtualenvs/debugpy/bin/python';
  command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.cpp = {
  {
    name = "cppdbg",
    type = "cppdbg",
    request = "launch",
    program = vim.fn.getcwd() .. '/${fileBasenameNoExtension}',
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    cwd = '${workspaceFolder}',
    -- miMode = 'gdb',
    -- miDebuggerPath = '',
    -- miDebuggerPath = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
    stopAtEntry = true,
    args = { '<', 'input.txt', '>', 'output.txt' },
  },
  -- {
  --   name = 'Attach to gdbserver :1234',
  --   type = 'cppdbg',
  --   request = 'launch',
  --   MIMode = 'gdb',
  --   miDebuggerServerAddress = 'localhost:1234',
  --   miDebuggerPath = '/usr/bin/gdb',
  --   cwd = '${workspaceFolder}',
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  -- },
  {
    name = "codelldb",
    type = "codelldb",
    request = "launch",
    program = vim.fn.getcwd() .. '/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    name = "Launch file";
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = '/usr/bin/python3';
    -- pythonPath = '/home/gheiath/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
    -- pythonPath = function()
    --   -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    --   -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    --   -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    --   local cwd = vim.fn.getcwd()
    --   if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    --     return cwd .. '/venv/bin/python'
    --   elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    --     return cwd .. '/.venv/bin/python'
    --   else
    --     return '/usr/bin/python3'
    --   end
    -- end;
  },
}

dap_virtual_text.setup {
  enabled = true,                        -- enable this plugin (the default)
  enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,               -- show stop reason when stopped for exceptions
  commented = false,                     -- prefix virtual text with comment string
  only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
  all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
  --- A callback that determines how a variable is displayed or whether it should be omitted
  --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
  --- @param buf number
  --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
  --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
  --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
  display_callback = function(variable, _buf, _stackframe, _node)
    return variable.name .. ' = ' .. variable.value
  end,

  -- experimental features:
  virt_text_pos = 'eol',       -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false,          -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,          -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil      -- position the virtual text at a fixed window column (starting from the first text column) ,
                               -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

dapui.setup {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = ""
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.5
        },
        -- {
        --   id = "breakpoints",
        --   size = 0.25
        -- },
        {
          id = "stacks",
          size = 0.25
        },
        {
          id = "watches",
          size = 0.25
        }
      },
      position = "bottom",
      size = 10
    },
    -- {
    --   elements =
    --   {
    --     {
    --       id = "repl",
    --       size = 0.5
    --     },
    --     {
    --       id = "console",
    --       size = 0.5
    --     }
    --   },
    --   position = "bottom",
    --   size = 10
    -- }
  },
  mappings =
  {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render =
  {
    indent = 1,
    max_value_lines = 100
  }
}
