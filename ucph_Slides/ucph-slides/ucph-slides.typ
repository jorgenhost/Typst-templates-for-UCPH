#import "./utils.typ": *
#import "./colors.typ": *

// state or func?
#let theme-color = state("theme-color", none)
#let sections = state("sections", ())

#let ucph-base-color = ucph_dark.red
#let logo-wide-en = align(bottom + center, image("logos/ucph_1_wide.svg", width: 100%))
#let logo-std-en = image("logos/ucph_1_standard.svg", width: 12%)
#let logo-neg-en = image("logos/ucph_1_negative.svg", width: 12%)

#let logo-wide-da = align(bottom + center, image("logos/ucph_1_wide_dk.svg", width: 100%))
#let logo-std-da = image("logos/ucph_1_standard_dk.svg", width: 12%)
#let logo-neg-da = image("logos/ucph_1_negative_dk.svg", width: 12%)


#let ucph_slides(
  ratio: "16-9",
  language: "en",
  theme: ucph-base-color,
  font: "Libertinus Serif",
  link-style: "color",
  body,
) = {
  theme-color.update(theme)
  set text(font: font)
  set page(paper: "presentation-" + ratio, fill: white)

  show ref: it => {
    show regex("\d{4}"): set text(blue)
    it
  }

  show cite: it => {
    show regex("\d{4}"): set text(blue)
    it
  }

  show link: it => (
    context {
      if it.has("label") {
        text(fill: black)[#it]
      } else if link-style == "underline" {
        underline(stroke: black)[#it]
      } else if link-style == "both" {
        text(fill: black, underline[#it])
      } else {
        text(fill: black)[#it]
      }
    }
  )

  show footnote: it => (
    context {
      text(fill: theme-color.get())[#it]
    }
  )

  set enum(numbering: (it => context text(fill: black)[*#it.*]))

  body
}

#let stress(body) = (
  context {
    text(fill: theme-color.get(), weight: "semibold")[#body]
  }
)

//***************************************************\\// Base "class" (?)


#let framed(
  title: none,
  back-color: rgb("FBF7EE"),
  framed-color: none,
  content,
) = (
  context {
    let w = auto

    set block(
      inset: (x: .6cm, y: .6cm),
      breakable: false,
      above: .1cm,
      below: .1cm,
    )

    if title != none {
      set block(width: 100%)
      stack(
        block(
          fill: if framed-color == none { theme-color.get() } else { framed-color },
          inset: (x: .6cm, y: .55cm),
          radius: (top: .2cm, bottom: 0cm),
          stroke: 2pt,
        )[
          #text(weight: "semibold", fill: white)[#title]
        ],
        block(
          fill: {
            if back-color != none {
              back-color
            } else {
              white
            }
          },
          radius: (top: 0cm, bottom: .2cm),
          stroke: 2pt,
          content,
        ),
      )
    } else {
      stack(block(
        width: auto,
        fill: if back-color != none {
          back-color
        } else {
          rgb("FBF7EE")
        },
        radius: (top: .2cm, bottom: .2cm),
        stroke: 2pt,
        content,
      ))
    }
  }
)

//***************************************************\\

// Source: https://github.com/polylux-typ/polylux/blob/main/src/toolbox/toolbox-impl.typ

#let cols(columns: none, gutter: 1em, ..bodies) = {
  let bodies = bodies.pos()

  let columns = if columns == none {
    (1fr,) * bodies.len()
  } else {
    columns
  }

  if columns.len() != bodies.len() {
    panic("Number of columns must match number of content arguments")
  }

  grid(columns: columns, gutter: gutter, ..bodies)
}

//***************************************************\\

#let grayed(
  text-size: 24pt,
  content,
) = {
  set align(center + horizon)
  set text(size: text-size)
  block(
    fill: rgb("#F3F2F0"),
    inset: (x: .8cm, y: .8cm),
    breakable: false,
    above: .9cm,
    below: .9cm,
    radius: (top: .2cm, bottom: .2cm),
  )[#content]
}

//***************************************************\\

#let register-section(
  name,
) = (
  context {
    let sect-page = here().position()
    sections.update(sections => {
      sections.push((body: name, loc: sect-page))
      sections
    })
  }
)

//**************************************** Front Slide ****************************************\\

#let front-slide(
  title: none,
  title-size: 40pt,
  subtitle: none,
  subtitle-size: 24pt,
  authors: none,
  authors-size: 22pt,
  info: none,
  info-size: 16pt,
  margin: (left: 1cm, right: 1cm, top: 2cm, bottom: 2.5cm),
  align_arg: left + horizon,
  underline: true,
  logo: align(bottom + center, image("logos/ucph_1_wide.svg", width: 100%)),
  line-color: black,
) = (
  context {
    set align(align_arg)
    set page(
      footer: [#logo #v(0.5cm)],
      margin: margin,
    )
    text(title-size, weight: "bold")[#smallcaps(title)]

    v(-.95cm)

    if subtitle != none {
      set text(subtitle-size)
      v(.1cm)
      subtitle
    }

    let subtext = []

    if authors != none {
      v(-.5em)
      subtext += text(authors-size, weight: "regular")[#authors]
    }
    if info != none {
      subtext += text(20pt, fill: black, weight: "regular")[#v(-.25cm) #info]
    }

    if underline == true {
      line(
        length: 100%,
        stroke: 1pt + line-color,
      )
      [#subtext]
    }
  }
)


//*************************************** Content Slide ***************************************\\

#let table-of-contents(
  title: "Contents",
  text-size: 20pt,
  logo: align(right + bottom, pad(image("logos/ucph_1_standard.svg", width: 12%), bottom: 10pt)),
) = (
  context {
    set page(
      margin: if title != none {
        (x: 1.6cm, top: 2.5cm, bottom: 2cm)
      } else {
        (x: 1.6cm, top: 1.75cm, bottom: 2cm)
      },
      footer: logo,
    )
    text(size: 35pt, weight: "bold")[
      #smallcaps(title)
      #v(-.9cm)
      #_divider(color: theme-color.get())
    ]

    set text(size: text-size)
    v(-.9cm)
    show linebreak: none

    let sections = query(<section>)

    if sections.len() == 0 {
      let subsections = query(<subsection>)
      pad(enum(..subsections.map(subsection => [#link(subsection.location(), subsection.value) <toc>])))
    } else {
      pad(enum(..sections.map(section => {
        let section_loc = section.location()
        let subsections = query(selector(<subsection>)
          .after(section_loc)
          .before(selector(<section>).after(section_loc, inclusive: false)))
        if subsections.len() != 0 {
          [#link(section_loc, section.value) <toc> #list(..subsections.map(subsection => [#link(
                subsection.location(),
                subsection.value,
              ) <toc>]))]
        } else {
          [#link(section.location(), section.value) <toc>]
        }
      })))
    }
  }
)

//**************************************** Title Slide ****************************************\\

#let title-slide(
  body,
  text-size: 42pt,
  logo: align(right + bottom, pad(image("logos/ucph_1_standard.svg", width: 12%), bottom: 10pt)),
) = (
  context {
    register-section(body)
    set page(footer: logo, margin: (x: 2cm, top: 2.5cm, bottom: 2cm))
    show heading: text.with(size: text-size, weight: "semibold")

    set align(left + horizon)

    [#heading(depth: 1, smallcaps(body)) #metadata(body) <section>]

    _divider(color: theme-color.get())
    pagebreak()
  }
)

//**************************************** Focus Slide ****************************************\\

#let focus-slide(
  text-color: white,
  text-size: 60pt,
  logo: align(bottom + right, pad(image("logos/ucph_1_negative.svg", width: 12%), bottom: 10pt)),
  body,
  margin: (left: 1cm, right: 1cm, top: 2cm, bottom: 2cm),
  page-fill: none,
) = (
  context {
    set page(
      fill: if page-fill == none { theme-color.get() } else { page-fill },
      margin: margin,
      footer: logo,
    )

    set text(
      weight: "semibold",
      size: text-size,
      fill: text-color,
    )

    set align(center + horizon)
    _resize-text(body)
  }
)

//****************************************** Slide ********************************************\\

#let slide(
  title: none,
  back-color: white,
  outlined: false,
  body,
  logo: align(right + bottom, pad(image("logos/ucph_1_standard_dk.svg", width: 11%), bottom: 10pt)),
) = (
  context {
    let page-num = context counter(page).display(
      "1/1",
      both: true,
    )

    set page(
      fill: back-color,
      footer: logo,
      header-ascent: if title != none {
        65%
      } else {
        66%
      },
      header: [
        #align(right)[
          #text(
            fill: white,
            weight: "semibold",
            size: 12pt,
          )[#page-num]
        ]
      ],
      margin: if title != none {
        (x: 1.5cm, top: 2.5cm, bottom: 2cm)
      } else {
        (x: 1.5cm, top: 1.75cm, bottom: 2cm)
      },
      background: place(_slide-header(title, outlined, theme-color.get())),
    )

    set text(size: 20pt)
    set par(justify: true)
    set align(horizon)

    v(0cm) // avoids header breaking if body is empty
    body
  }
)

//**************************************** Blank slide ****************************************\\

#let blank-slide(body) = (
  context {
    let page-num = context counter(page).display(
      "1/1",
      both: true,
    )

    set page(header: [
      #align(right)[
        #text(
          fill: theme-color.get(),
          weight: "semibold",
          size: 12pt,
        )[#page-num]
      ]
    ])

    set list(marker: text(theme-color.get(), [•]))

    set enum(numbering: (it => context text(fill: theme-color.get())[*#it.*]))

    set text(size: 20pt)
    set par(justify: true)
    set align(horizon)
    body
  }
)

//**************************************** Bibliography ***************************************\\

#let bibliography-slide(
  bib-call,
  title: "References",
  logo: align(right, image("logos/ucph_1_standard.svg", width: 12%)),
) = (
  context {
    set page(footer: logo, margin: (top: 2cm, bottom: 2cm))
    set text(size: 16pt)
    set par(justify: true)

    set bibliography(title: text(size: 25pt)[#smallcaps(title) #v(-.85cm) #_divider(color: theme-color.get()) #v(.5cm)])

    bib-call
  }
)
