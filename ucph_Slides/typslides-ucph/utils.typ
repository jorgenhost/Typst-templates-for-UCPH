//************************************************************************\\

#let ucph-logo_wide = {
  set align(bottom)
  image("logos/ucph_1_wide.svg")
  v(1cm)
}

#let ucph-logo = {
  set align(bottom + right)
  image("logos/ucph_1_standard.svg", width: 15%)
  v(1cm)
}

#let _resize-text(body) = layout(size => {
  let font-size = text.size
  let (height,) = measure(block(width: size.width, text(size: font-size)[#body]))

  let max_height = size.height

  while height > max_height {
    font-size -= 0.2pt
    height = measure(block(width: size.width, text(size: font-size)[#body])).height
  }

  block(
    height: height,
    width: 100%,
    text(size: font-size)[#body],
  )
})

//************************************************************************\\

#let _divider(color: none) = {
  line(
    length: 100%,
    stroke: 1pt + color,
  )
}

//************************************************************************\\

#let _slide-header(title, outlined, color) = {
  rect(
    fill: color,
    width: 100%,
    height: if title != none {
      1.6cm
    } else {
      .95cm
    },
    inset: .6cm,
    if outlined {
      text(white, weight: "semibold", size: 24pt)[#h(.1cm) #title #metadata(title) <subsection>]
    } else {
      text(white, weight: "semibold", size: 24pt)[#h(.1cm) #title]
    },
  )
}

//************************************************************************\\

// #let _make-frontpage(
//   title,
//   subtitle,
//   authors,
//   info,
//   theme-color,
// ) = {
//   set align(left + horizon)
//   set page(footer: ucph-logo_wide, margin: (bottom: 100pt))
//   text(40pt, weight: "bold")[#smallcaps(title)]

//   v(-.95cm)

//   if subtitle != none {
//     set text(24pt)
//     v(.1cm)
//     subtitle
//   }

//   let subtext = []

//   if authors != none {
//     subtext += text(22pt, weight: "regular")[#authors]
//   }

//   if info != none {
//     subtext += text(20pt, fill: black, weight: "regular")[#v(-.15cm) #info]
//   }

//   _divider(color: black)
//   [#subtext]
// }
