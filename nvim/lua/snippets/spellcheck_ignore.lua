local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- ... other nodes

return {
  s("ig", {                  -- trigger: "ig"
    t("spellcheck: ignore"), -- text node: inserts "spellcheck: ignore"
  }),
  -- s("example", { -- trigger: "example"
  --     t("This is an example snippet."),
  --     i(1, "placeholder"), -- insert node: allows jumping to this location and entering text
  --     t(" with a placeholder.")
  -- }),
  -- -- ... more snippets
}
