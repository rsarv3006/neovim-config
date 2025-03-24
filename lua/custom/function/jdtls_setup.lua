local M = {}

M.setup = function()
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }

    -- buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
    -- buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

    client.server_capabilities.document_formatting = true
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local config = {
    cmd = {
      '/opt/homebrew/Cellar/openjdk/23.0.2/bin/java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '-javaagent:' .. '/Users/RSarvis/jdt-language-server-1.45.0-202502271238/plugins/lombok.jar',
      '--add-modules=ALL-SYSTEM',
      '--add-opens',
      'java.base/java.util=ALL-UNNAMED',
      '--add-opens',
      'java.base/java.lang=ALL-UNNAMED',
      '-jar',
      vim.fn.expand '/Users/RSarvis/jdt-language-server-1.45.0-202502271238/plugins/org.eclipse.equinox.launcher_1.6.1000.v20250131-0606.jar',
      '-configuration',
      vim.fn.expand '/Users/RSarvis/jdt-language-server-1.45.0-202502271238/config_mac_arm',
      '-data',
      vim.fn.expand '~/.cache/jdtls/workspace' .. project_name,
    },
    root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
    settings = {
      java = {},
    },
    init_options = {
      bundles = {},
    },
    capabilities = capabilities,
    on_attach = on_attach,
  }

  require('jdtls').start_or_attach(config)
end

return M
