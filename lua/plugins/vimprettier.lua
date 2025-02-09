return {
  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile",
    ft = {
      "javascript",
      "typescript",
      "css",
      "less",
      "scss",
      "json",
      "graphql",
      "markdown",
      "vue",
      "yaml",
      "html",
    },
  },
}
