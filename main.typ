
#set text(size: 11pt)
#set page(margin: (top: 3cm, bottom: 3cm, left: 3cm, right: 3cm))
#let subheader(content) = [
  #text(weight: "bold")[#content]
  #v(0.5em)
  #line(length: 100%, stroke: 0.4pt)
]

#set par(
  first-line-indent: 1em,
  spacing: 1em,
  justify: true,
  leading: 1.25em,
)

#show heading: set block(above: 2em)

#include "lit_review/lit_review_template.typ"
