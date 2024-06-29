local jdtls_package = require("mason-registry").get_package("jdtls")
local jdtls_package_path = jdtls_package:get_install_path()
local jdtls_path = jdtls_package_path .. "/jdtls"
local lombok_path = jdtls_package_path .. "/lombok.jar"
return {
  cmd = {
    jdtls_path,
    "--jvm-arg=-javaagent:" .. lombok_path,
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      eclipse = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
      format = {
        enabled = true,
        settings = {
          -- url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
          -- url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml",
          url = "/Users/henrywang/.config/nvim/lua/john/lsp/settings/jdtls.xml",
        },
      },
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

  flags = {
    allow_incremental_sync = true,
  },

  -- settings = {
  --   java = {
  --     format = {
  --       enabled = true,
  --       settings = {
  --         url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
  --         profile = "GoogleStyle",
  --       },
  --     },
  --
  --   },
}
