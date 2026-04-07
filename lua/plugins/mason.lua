-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        -- "lua-language-server",
        "ast-grep",
        "vim-language-server",
        "bash-language-server",
        "intelephense",
        "laravel-ls",
        "biome",
        "css-lsp",
        "tailwindcss-language-server",
        "html-lsp",
        "rust-analyzer",
        "pyright",
        "ruff",
        "clangd",
        "snyk",

        -- install linter
        "shellcheck",

        -- install formatters
        "stylua",
        "shfmt",
        "prettier",
        "clang-format",

        -- install debuggers
        "cpptools",
        "debugpy",
        "bash-debug-adapter",
        "js-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
