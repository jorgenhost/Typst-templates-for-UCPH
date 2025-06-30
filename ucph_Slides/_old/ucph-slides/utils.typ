#let logo-wide-en = align(bottom + center, image("logos/ucph_1_wide.svg", width: 100%))
#let logo-std-en = pad(align(right + bottom, image("logos/ucph_1_standard.svg", width: 12%)), 7pt)
#let logo-neg-en = pad(align(right + bottom, image("logos/ucph_1_negative.svg", width: 12%)), 7pt)

#let logo-wide-da = align(bottom + center, image("logos/ucph_1_wide_dk.svg", width: 100%))
#let logo-std-da = pad(align(right + bottom, image("logos/ucph_1_standard_dk.svg", width: 12%)), 7pt)
#let logo-neg-da = pad(align(right + bottom, image("logos/ucph_1_negative_dk.svg", width: 12%)), 7pt)

// Function to get logos based on language
#let get-logos(lang) = {
  if lang == "da" {
    (
      wide: logo-wide-da,
      standard: logo-std-da,
      negative: logo-neg-da,
    )
  }
  if lang == "en" {
    (
      wide: logo-wide-en,
      standard: logo-std-en,
      negative: logo-neg-en,
    )
  } else { none }
}

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

