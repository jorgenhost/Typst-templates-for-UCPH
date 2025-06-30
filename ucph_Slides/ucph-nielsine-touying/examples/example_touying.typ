#import "../src/lib.typ" as uc
#import "@preview/touying:0.6.1" as ty
#import "@preview/numbly:0.1.0": numbly

#show: uc.ucph-metropolis-theme.with(
  header-right: align(right, image("../assets/ucph_1_seal.svg", height: 1.1cm)),
  ty.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: image("../assets/ucph_1_seal.svg"),
  ),
)

#uc.title-slide()


// If you want a table of contents
// #uc.components.adaptive-columns(outline(indent: 1em))

= First section
Is it true?

== First slide
Wow, this is a slide.

== Second slide
wqewqe

== Third slide
#uc.cols(columns: (1fr, 1fr))[
  #set align(center)
  #uc.framed(title: "Wow")[
    $
      y_(i t) =
    $
  ]
][
  #set align(center)
  _write something over here_ #cite(<Ananat_2011>, form: "prose")#footnote("a footnote")
]


= Colors

== Let me show you the colors

#uc.show_color_pallette()

== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)
