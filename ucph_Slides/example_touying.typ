#import "@preview/touying:0.6.1" as ty
#import "touying/metropolis.typ" as tym

#show: tym.metropolis-theme.with(aspect-ratio: "16-9", tym.config-info(
  title: [Title],
  subtitle: [Subtitle],
  author: [Authors],
  date: datetime.today(),
  institution: [Institution],
))

= First section

== First slide
Wow, this is a slide.
