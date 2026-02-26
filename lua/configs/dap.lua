local dap = require('dap')
local dapui = require('dapui')

-- DAP UI 配置
dapui.setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7') == 1,
  layouts = {
    {
      elements = {
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  controls = {
    enabled = true,
    element = 'repl',
    icons = {
      pause = '',
      play = '',
      step_into = '',
      step_over = '',
      step_out = '',
      step_back = '',
      run_last = '↻',
      terminate = '□',
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = 'rounded',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
    max_value_lines = 100,
  },
})

-- 前端调试配置（VSCode JS/TS Debugger）
require('dap-vscode-js').setup({
  debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
  debugger_cmd = { 'js-debug-adapter' },
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

-- 配置各前端语言调试
local frontend_languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte', 'astro' }

for _, language in ipairs(frontend_languages) do
  dap.configurations[language] = {
    -- Node.js 调试
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
      runtimeExecutable = 'node',
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach',
      processId = require('dap.utils').pick_process,
      cwd = '${workspaceFolder}',
    },
    -- Chrome 调试（前端浏览器）
    {
      type = 'pwa-chrome',
      request = 'launch',
      name = 'Start Chrome with localhost',
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
    },
    -- 前端框架开发服务器调试
    {
      type = 'pwa-chrome',
      request = 'launch',
      name = 'Debug Frontend (Vite)',
      url = 'http://localhost:5173',
      webRoot = '${workspaceFolder}',
      userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
    },
    {
      type = 'pwa-chrome',
      request = 'launch',
      name = 'Debug Frontend (Next.js)',
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
    },
  }
end

-- 调试自动显示/隐藏UI
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- 断点图标自定义（黑客风格）
vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })