local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

return {
  -- filetypes = { "typst", "typ" }, --  <-- add this
  settings = {
    ltex = {
      -- install ngrams from https://dev.languagetool.org/finding-errors-using-n-gram-data.html
      -- save the folder at ~/ngrams/en/
      --   additionalRules = {
      --     languageModel = "~/ngrams/",
      --   },
      language = "en-NZ",
      disabledRules = {
        ["en-US"] = { "PROFANITY" },
        ["en-GB"] = { "PROFANITY" },
      },
      enabled = {
        "bibtex",
        "context",
        "context.tex",
        "html",
        "latex",
        "markdown",
        "org",
        "restructuredtext",
        "rsweave",
        "typ",
        "typst",
      },

      dictionary = {
        ["en-US"] = words,
        ["en-GB"] = words,
      },
    },
  },
}
