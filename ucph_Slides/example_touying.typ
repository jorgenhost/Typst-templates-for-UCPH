#import "@preview/touying:0.6.1" as ty
#import "ucph-slides-touying/src/ucph-metropolis.typ" as tym
#import "ucph-slides-touying/src/exports.typ" as tye
#import "ucph-slides-touying/src/colors.typ" as colors
#import "ucph-slides-touying/src/utils.typ" as utils
#import "@preview/numbly:0.1.0": numbly

#show: tym.ucph-metropolis-theme.with(
  header-right: align(right, image("ucph-slides/logos/ucph_1_seal.svg", height: 1.1cm)),
  footer: self => utils.section-links(self),
  tym.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: image("ucph-slides/logos/ucph_1_seal.svg"),
  ),
  tym.config-methods(),
)

#tym.title-slide()


// If you want a table of contents
// #tym.components.adaptive-columns(outline(indent: 1em))

= First section <wow>

== First slide
Wow, this is a slide.

== Second slide
wqewqe

== Third slide
#tym.cols(columns: (1fr, 1fr))[
  #set align(center)
  #tym.framed(title: "Wow")[
    $
      y_(i t) =
    $
  ]
][
  #set align(center)
  _write something over here_
]


= Colors

== Let me show you the colors

#colors.show_color_pallette()
