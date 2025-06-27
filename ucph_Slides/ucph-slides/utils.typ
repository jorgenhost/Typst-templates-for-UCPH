//************************************************************************\\

#let _resize-text(body) = layout(size => {
  let font-size = text.size
  let (height,) = measure(block(width: size.width, text(size: font-size)[#body]))

  let max_height = size.height

  while height > max_height {
    font-size -= 0.2pt
    height = measure(block(width: size.width, text(size: font-size)[#body])).height
  }

  block(height: height, width: 100%, text(size: font-size)[#body])
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
