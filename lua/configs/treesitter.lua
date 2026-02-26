require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'typescript',
    'javascript',
    'tsx',
    'html',
    'css',
    'scss',
    'json',
    'jsonc',
    'vue',
    'svelte',
    'astro',
    'markdown',
    'markdown_inline',
    'bash',
    'regex',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  },
})