#import "./utils.typ" as utils
#import "./colors.typ" as colors

// state or func?
#let theme-color = state("theme-color", none)
#let language-state = state("language", "en")
#let sections = state("sections", ())

#let ucph-base-color = colors.ucph_dark.red

#let ucph_slides(
  ratio: "16-9",
  language: "en",
  base-color: ucph-base-color,
  font: "Libertinus Serif",
  link-style: "color",
  body,
) = {
  theme-color.update(base-color)
  language-state.update(language)
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
  let current_lang = language

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
  framed-color: colors.ucph_dark.petroleum,
  block-width: 100%,
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
      stack(
        block(
          fill: if framed-color == none { theme-color.get() } else { framed-color },
          inset: (x: .6cm, y: .55cm),
          radius: (top: .2cm, bottom: 0cm),
          stroke: 2pt,
          width: block-width,
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
          width: block-width, // Set width directly on this block
          radius: (top: 0cm, bottom: .2cm),
          stroke: 2pt,
          content,
        ),
      )
    } else {
      stack(block(
        width: block-width,
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
    let current-lang = language-state.get()
    let logos = utils.get-logos(current-lang)
    set align(align_arg)

    set page(
      footer: [#logos.wide #v(0.5cm)],
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
    let current-lang = language-state.get()
    let logos = utils.get-logos(current-lang)
    set page(
      margin: if title != none {
        (x: 1.6cm, top: 2.5cm, bottom: 2.5cm)
      } else {
        (x: 1.6cm, top: 1.75cm, bottom: 2.5cm)
      },
      footer: logos.standard,
    )
    text(size: 35pt, weight: "bold")[
      #smallcaps(title)
      #v(-.9cm)
      #utils._divider(color: theme-color.get())
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
    let current-lang = language-state.get()
    let logos = utils.get-logos(current-lang)
    set page(footer: logos.standard, margin: (x: 2cm, top: 2.5cm, bottom: 2.5cm))
    show heading: text.with(size: text-size, weight: "semibold")

    set align(left + horizon)

    [#heading(depth: 1, smallcaps(body)) #metadata(body) <section>]

    utils._divider(color: theme-color.get())
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
    utils._resize-text(body)
  }
)

//****************************************** Slide ********************************************\\

#let slide(
  title: none,
  back-color: white,
  outlined: false,
  body,
) = (
  context {
    let page-num = context counter(page).display(
      "1/1",
      both: true,
    )

    let current-lang = language-state.get()
    let logos = utils.get-logos(current-lang)
    set page(
      fill: back-color,
      footer: logos.standard,
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
        (x: 1.5cm, top: 2.2cm, bottom: 2.2cm)
      } else {
        (x: 1.5cm, top: 1.75cm, bottom: 2.2cm)
      },
      background: place(utils._slide-header(title, outlined, theme-color.get())),
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
    let current-lang = language-state.get()
    let logos = utils.get-logos(current-lang)
    set page(footer: logos.standard, margin: (top: 2cm, bottom: 2cm))
    set text(size: 16pt)
    set par(justify: true)

    set bibliography(title: text(size: 25pt)[#smallcaps(title) #v(-.85cm) #utils._divider(color: theme-color.get()) #v(
        .5cm,
      )])

    bib-call
  }
)
