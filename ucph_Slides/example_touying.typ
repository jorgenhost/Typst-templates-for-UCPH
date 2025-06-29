#import "@preview/touying:0.6.1" as ty
#import "touying/ucph-metropolis.typ" as tym
#import "touying/src/exports.typ" as tye
#import "ucph-slides/colors.typ" as colors
#import "ucph-slides/utils.typ" as utils
#import "@preview/numbly:0.1.0": numbly
// Helper function to get current section number
#let get-current-section() = {
  context {
    let current-page = here().page()
    let sections = query(heading.where(level: 1))

    if sections.len() == 0 {
      return 0
    }

    let current-section = 0
    for (i, section) in sections.enumerate() {
      if section.location().page() <= current-page {
        current-section = i + 1
      } else {
        break
      }
    }
    current-section
  }
}

// Add this helper function to generate section links
#let section-links(self) = {
  context {
    let sections = query(heading.where(level: 1))
    let current-section = get-current-section()

    if sections.len() == 0 {
      return []
    }

    sections
      .enumerate()
      .map(((i, section)) => {
        let is-current = (i + 1) == current-section
        let link-text = if is-current {
          text(weight: "bold", fill: self.colors.primary, section.body)
        } else {
          text(fill: self.colors.neutral-darkest.lighten(30%), section.body)
        }

        // Create a clickable link to the section
        link(section.location(), link-text)
      })
      .join(text(fill: self.colors.neutral-darkest.lighten(50%), " • "))
  }
}

#show: tym.ucph-metropolis-theme.with(
  header-right: align(right, image("ucph-slides/logos/ucph_1_seal.svg", height: 1.1cm)),
  footer: self => section-links(self),
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



#tym.components.adaptive-columns(outline(indent: 1em))

= First section <wow>

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
