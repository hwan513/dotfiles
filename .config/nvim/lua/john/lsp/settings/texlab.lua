return {
  settings = {
    texlab = {
      build = {
        onSave = true,
        executable = "tectonic",
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates",
        },
      },
    },
  },
}
