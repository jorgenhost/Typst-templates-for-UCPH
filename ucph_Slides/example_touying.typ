#import "@preview/touying:0.6.1" as ty
#import "touying/ucph-metropolis.typ" as tym
#import "touying/src/exports.typ" as tye
#import "ucph-slides/colors.typ" as colors
#import "ucph-slides/utils.typ" as utils
#import "@preview/numbly:0.1.0": numbly

#show: tym.ucph-metropolis-theme.with(
  header-right: align(right, image("ucph-slides/logos/ucph_1_seal.svg", height: 1.1cm)),
  tym.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen  ],
    logo: image("ucph-slides/logos/ucph_1_seal.svg"),
  ),
)

#tym.title-slide()

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#tym.components.adaptive-columns(outline(indent: 1em))

= First section

== First slide
Wow, this is a slide.

== Second slide
wqewqe

== Third slide
#tym.framed(title: "Wow")[
  $
    y_(i t) =
  $
]

= Colors

== Let me show you the colors

#colors.show_color_pallette()
