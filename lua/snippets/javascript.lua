local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

return {

  s('clg', {
    t 'console.log(',
    i(1),
    t { ');' },
  }),
  s('clo', {
    t 'console.log(',
    t { '"' },
    rep(1),
    t { '"' },
    t { ', ' },
    i(1),
    t { ');' },
  }),
}
