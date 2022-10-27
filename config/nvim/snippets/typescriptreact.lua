local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local snippets = {
  s({ trig = "imp", name = "import" }, {
    t "import ", i(2), t " from '", i(1), t "'",
    i(0)
  }),
  s({ trig = "imp", name = "import(named)" }, {
    t "import {", i(2), t "} from '", i(1), t "'",
    i(0)
  }),
  s({ trig = "np", name = "next page" }, {
    t({
      "import { NextPage, GetStaticProps, InferGetStaticPropsType } from 'next",
      "",
      "type PageProps = InferGetStaticPropsType<typeof getStaticProps>",
      "",
    }),
    t "const ", i(1), t "Page: NextPage<PageProps> = () => {",
    t({
      "  return (",
      "    <></>",
      "  )",
      "}",
      "",
    }),
    t "export default ", i(2), t "Page",
    t({
      "",
      "",
      "export const getStaticProps: GetStaticProps = async () => {",
      "  return {",
      "    props: {},",
      "  }",
      "}",
    }),
    i(0)
  }),
}

return snippets
