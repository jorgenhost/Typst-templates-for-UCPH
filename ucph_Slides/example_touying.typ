#import "@preview/touying:0.6.1" as ty
#import "touying/metropolis.typ" as tym
#import "ucph-slides/colors.typ" as colors
#import "ucph-slides/utils.typ" as utils
#import "@preview/numbly:0.1.0": numbly

#show: tym.metropolis-theme.with(
  tym.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [Institution],
    logo: image("ucph-slides/logos/ucph_1_seal.svg"),
  ),
  tym.config-colors(
    primary: colors.ucph_dark.red,
    secondary: colors.ucph_dark.petroleum,
    tertiary: purple,
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
#tym.


