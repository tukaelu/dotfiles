return {
  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
    },
    config = function ()
      local lsp = require('lsp-zero')

      lsp.preset({
        name = 'recommended',
        sign_icon = { error = ' ', warn = ' ', hint = ' ', info = ' ' }
      })

      lsp.on_attach(function(_, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        --Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      end)

      lsp.setup_servers({
        'diagnostic',
        'tsserver',
        'eslint',
        'astro',
        'gopls',
        'terraformls',
      })

      lsp.configure('tsserver', {
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
        cmd = { 'typescript-language-server', '--stdio' },
      })

      lsp.configure('terraformls', {
        filetypes = { 'tf', 'terraform' },
        cmd = { 'terraform-ls', 'serve' },
      })

      lsp.setup()
    end
  },
  {
    'glepnir/lspsaga.nvim',
    lazy = true,
    keys = {
      { mode = 'n', 'K', '<Cmd>Lspsaga hover_doc<CR>' },
      { mode = 'n', '<C-l>', '<Cmd>Lspsaga lsp_finder<CR>' },
      { mode = 'n', '<C-d>', '<Cmd>Lspsaga peek_definition<CR>' },
      { mode = 'n', '<C-_>', '<Cmd>Lspsaga rename<CR>' },
      { mode = 'n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>' },
    },
    opts = {
      ui = {
        border = 'rounded',
        winblend = 100,
      },
      diagnostic = {
        insert_winblend = 100,
      }
    }
  },

  -- formatter
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function ()
      local nls = require('null-ls')
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

      nls.setup({
        souces = {
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.prettierd,
          nls.builtins.diagnostics.yamllint,
          nls.builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file('.eslintrc.js')
            end,
          }),
          nls.builtins.completion.spell,
        },
        on_attach = function(current_client, bufnr)
          if current_client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function(client)
                    return client.name == 'null-ls'
                  end,
                  bufnr = bufnr,
                })
              end,
            })
          end
        end
      })
    end
  },
}
