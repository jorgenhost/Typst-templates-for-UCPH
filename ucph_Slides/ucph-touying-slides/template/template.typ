#import "@preview/ucph-touying-slides:0.1.0" as uts
// should this have #import "@preview/touying:0.6.1": *??

#show: uts.ucph-metropolis-theme.with(
  header-right: align(right, image("assets/ucph_1_seal.svg", height: 1.1cm)),
  footer: self => utils.section-links(self),
  uts.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: image("assets/ucph_1_seal.svg"),
  ),
)

#uts.title-slide()


// If you want a table of contents
// #uts.components.adaptive-columns(outline(indent: 1em))

= First section
Is it true?

== First slide
Wow, this is a slide.

== Second slide
wqewqe

== Third slide
#uts.cols(columns: (1fr, 1fr))[
  #set align(center)
  #uts.framed(title: "Wow")[
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

#colors.show_color_pallette()

== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)


