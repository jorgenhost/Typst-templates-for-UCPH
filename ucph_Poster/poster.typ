#import "@preview/peace-of-posters:0.5.6" as pop

#let uni-ucph = (
  "body-box-args": (
    inset: 0.6em,
    width: 100%,
  ),
  "body-text-args": (:),
  "heading-box-args": (
    inset: 0.6em,
    width: 100%,
    fill: rgb("#901a1e"),
    stroke: rgb("#666666"),
  ),
  "heading-text-args": (
    fill: white,
  ),
)

#let numbered-authors(authors, affiliations) = {
  let author-list = authors
    .zip(range(1, authors.len() + 1))
    .map(((author, num)) => {
      author + super(str(num))
    })
    .join(", ")

  let affil-list = affiliations
    .zip(range(1, affiliations.len() + 1))
    .map(((affil, num)) => {
      super(str(num)) + affil
    })
    .join(", ")

  (authors: author-list, institutes: affil-list)
}

#let author-data = numbered-authors(
  ("Jørgen Baun Høst", "Jane Smith", "John Doe"),
  ("Department of Social Data Science", "Department of Physics", "Department of Mathematics"),
)


#set page("a0", margin: 1cm)
#pop.set-poster-layout(pop.layout-a0)
#pop.set-theme(uni-ucph)
#set text(size: pop.layout-a0.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.update-poster-layout(spacing: box-spacing)

// #pop.title-box(
//   "Peace of Posters Template",
//   authors: "Jørgen Baun Høst#super[1]",
//   institutes: "Department of Social Data Science",
//   keywords: "Schelling, Econometrics",
//   logo: image("UCPH-logo_white_hh.png", width: 200%),
// )
//
#pop.title-box(
  "Poster template title",
  authors: author-data.authors,
  authors-size: 40pt,
  institutes: author-data.institutes,
  institutes-size: 30pt,
  keywords: "Schelling, Econometrics",
  logo: image("UCPH-logo_white_hh.png", width: 200%),
)


#columns(
  2,
  [
    #pop.column-box(heading: "Look at this")[
      Built on 'Peace of Posters' #cite(<poster_repo>)

      #figure(
        caption: [
          Econ papers.
        ],
      )[
        #image("econ_papers.png", width: 40%)
      ]
    ]

    // These properties will be given to the function which is responsible for creating the heading
    #let hba = uni-ucph.heading-box-args
    #hba.insert("stroke", (paint: gradient.linear(green, red, blue), thickness: 10pt))

    // and these are for the body.
    #let bba = uni-ucph.body-box-args
    #bba.insert("inset", 30pt)
    #bba.insert("stroke", (paint: gradient.linear(green, red, blue), thickness: 10pt))

    #pop.column-box(
      heading: "Tablez",
      heading-box-args: hba,
      body-box-args: bba,
    )[
      #table(
        columns: (auto, 1fr),
        inset: 0.5cm,
        stroke: (x, y) => if y >= 0 { (bottom: 0.2pt + black) },
        [Word1], [Word2],
        [Word3], [Word4],
      )

      This box is styled differently compared to the others.
      To make such changes persistent across the whole poster, we can use these functions:
      ```typst
      #pop.update-poster-layout(...)
      #pop.update-theme()
      ```
    ]

    #pop.column-box(heading: "Peace of Posters Documentation")[
      You can find more information on the documentation site under
      #text(fill: red)[
        #link("https://jonaspleyer.github.io/peace-of-posters/")[
          jonaspleyer.github.io/peace-of-posters/
        ]
      ].

      #figure(
        caption: [
          The poster from the thumbnail can be viewed at the documentation website as well.
        ],
      )[
        #link("https://jonaspleyer.github.io/peace-of-posters/")[
          #image("thumbnail.png", width: 50%)
        ]
      ]
    ]

    #colbreak()

    #pop.column-box(heading: "OLS estimator")[
      Very cool, much wow.
      $ hat(beta) = (X'X)^(-1)X'y $

      #lorem(40)
    ]

    #pop.column-box(heading: "What?")[
      #lorem(25)
    ]

    #pop.column-box()[
      #bibliography("bibliography.bib")
    ]

    #pop.column-box(heading: "Fill space with a box", stretch-to-next: true)[
      Notice that this box would not fill the entire space up to the bottom of the page but we
      can stretch it such that it does so anyway.
    ]
  ],
)

#pop.bottom-box()[
  Bottom Boxes are displayed at the bottom of a page.
  #linebreak()
  Download more RAM: #link("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
]
