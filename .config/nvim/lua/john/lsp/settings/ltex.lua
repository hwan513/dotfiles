return {
  filetypes = { "typst", "typ", "latex", "tex", "markdown" }, --  <-- add this
  use_spellfile = false, -- Uses the value of 'spellfile' as an external file when checking the document
  window_border = "single", -- How the border should be rendered
  settings = {
    ltex = {
      language = "en-NZ",
      additionalRules = {
        enablePickyRules = true,
        -- -- install ngrams from https://dev.languagetool.org/finding-errors-using-n-gram-data.html
        -- languageModel = "~/ngrams/",
      },
      checkFrequency = "save",
      disabledRules = {
        ["en-NZ"] = { "PROFANITY" },
      },
      enabled = {
        "bibtex",
        "context",
        "context.tex",
        "html",
        "latex",
        "tex",
        "markdown",
        "org",
        "restructuredtext",
        "rsweave",
        "typ",
        "typst",
      },
    },
  },
}
