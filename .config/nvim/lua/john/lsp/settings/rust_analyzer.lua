return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      rustfmt = {
        overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
      },
    },
  },
}
