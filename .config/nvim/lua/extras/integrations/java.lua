local jdtls_opts = function(jdtls_package_path)
  local lombok_path = jdtls_package_path .. "lombok.jar"
  return {

    cmd = {
      "jdtls",
      "--jvm-arg=-javaagent:" .. lombok_path,
    },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = { updateBuildConfiguration = "interactive" },
        format = { enabled = true },
        maven = { downloadSources = true },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true },
        references = { includeDecompiledSources = true },
      },
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
    flags = { allow_incremental_sync = true },
  }
end
return {
  { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = { "jdtls" } } },
  { "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = { exclude = { "jdtls" } } } },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local jdtls_path = vim.fn.expand("$MASON/packages/jdtls/")
          require("jdtls").start_or_attach(jdtls_opts(jdtls_path))
        end,
      })
    end,
  },
}
