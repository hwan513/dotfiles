local jdtls_package = require("mason-registry").get_package("jdtls")
local jdtls_path = jdtls_package:get_install_path()
local equinox_launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "/config_mac"
local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local extendedClientCapabilities = require("jdtls").extendedClientCapabilities


-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
return {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", equinox_launcher,
    "-configuration", config_path,
    "-data", workspace_folder,
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

  -- settings = {
  --   java = {
  --     format = {
  --       settings = {
  --         url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
  --       },
  --     },
  --   },
  -- },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    extendedClientCapabilities = extendedClientCapabilities;
    bundles = {},
  },
}
