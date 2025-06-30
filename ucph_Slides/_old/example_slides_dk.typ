#import "ucph-slides/ucph-slides.typ" as us
#import "ucph-slides/colors.typ" as uc
// #import "@preview/ucph-slides:0.1.0" as us

// Project configuration
#show: us.ucph_slides.with(
  ratio: "16-9",
  base-color: uc.ucph_dark.red,
  language: "da",
)

// how to get the front logo back??
// The front slide is the first slide of your presentation
#us.front-slide(
  title: "En præsentation",
  subtitle: [#set text(size: 22pt)
    En substitel, _wow_],
  authors: [John McClane & Kier Eagan],
  info: [Institut for Pseudovidenskab],
)

// Dark colors
#let gradient_darks = gradient.linear(
  uc.ucph_dark.red,
  uc.ucph_dark.blue,
  uc.ucph_dark.petroleum,
  uc.ucph_dark.green,
  uc.ucph_dark.green,
  uc.ucph_dark.gray,
)

#let gradient_medium = gradient.linear(
  uc.ucph_medium.red,
  uc.ucph_medium.blue,
  uc.ucph_medium.petroleum,
  uc.ucph_medium.green,
  uc.ucph_medium.green,
  uc.ucph_medium.gray,
)

#let gradient_light = gradient.linear(
  uc.ucph_light.red,
  uc.ucph_light.blue,
  uc.ucph_light.petroleum,
  uc.ucph_light.green,
  uc.ucph_light.green,
  uc.ucph_light.yellow,
)

#us.slide(title: "Colors of UCPH")[
  #us.framed(title: "Darks (Standard for UCPH)", framed-color: black, back-color: gradient_darks)[]
  #us.framed(title: "Medium", framed-color: gray, back-color: gradient_medium)[]
  #us.framed(title: text(fill: black, "Light"), framed-color: white, back-color: gradient_light)[]
]

// Table of contents that registers "uc.title-slides()" in your .typ-file
#us.table-of-contents()

#let my_gradient = gradient.linear(uc.ucph_dark.red, uc.ucph_dark.blue)

#us.focus-slide()[The music experience is cancelled.]
#us.focus-slide(page-fill: my_gradient)[... With a gradient background]


// Custom outline
#us.slide(title: "Overview")[
  #set text(size: 18pt)
  - *Motivation*:
  - *Research Question*:
  - *Methods*:
  - *Resulus*:
  - *Heterogeneity Analysis*:
  - *Conclusion*
]

#us.slide(title: "Overview")[
  #us.framed([
    Very cool, much wow:
    $ hat(beta) = (X'X)^(-1)X'y $
  ])
  #us.framed(
    [123 #footnote("Cool!")],
    title: "123",
    framed-color: uc.ucph_dark.petroleum,
  )
]



// Introduction and motivation
// logo to the left
#us.title-slide[
  Introduction
]


#us.slide(title: "Theoretical Background:")[
  #set text(size: 18pt)
  #us.cols(columns: (1fr, 1fr))[
    - You can cite things too. Wow!! #cite(<schelling1971dynamic>, form: "prose") proposed that neighborhoods may "tip" when minority share reaches a threshold
  ][
    #set align(center)
    _insert image over here_
  ]
]

// Methods
#us.title-slide[
  Methods
]


#us.slide(title: "Identification Challenge")[
  #set text(size: 18pt)
  $
    V_(i,j,t) = f(Z_(i,t), X_(j,t), xi_(j,t)) + sum_(k) g(Z_(i,t), Z_(k,t), D_(i,k)) + delta E[V_(i,j,t+1)] + epsilon_(i,j,t)
  $
  Where:
  - $f(·)$: Utility from neighborhood amenities
  - $g(·)$: Utility from characteristics of each neighbor $k$ at distance $D_(i,k)$
  - $Z_i$: Observable household attributes
  - $X_j$: Observable neighborhood attributes
  - $xi_j$: Unobservable neighborhood attributes
  - $epsilon_(i,j,t)$: Idiosyncratic preferences

  #strong[Key identification challenges:]
  - Unobserved neighborhood amenities
  - Dynamic preferences (expectations of future changes)
  - Selection effecus (who moves where is not random)
]


#us.slide(title: "Nearest neighbor research design")[
  #set text(size: 15pt)
  #strong[Innovative approach from #cite(<Bayer_2022_nearest_neighbor>, form: "prose"):]

  Compare households within the same neighborhood who receive different-type neighbors. Why does this work? Consider two households:

  - Household $a$: New different-type $e'$ neighbor among their nearest (rank 1-3) neighbors
  - Household $b$: New different-type $e'$ neighbor slightly further away (rank 4-6)

  Difference in moving propensity:

  $
    Y_a (e', k_(#text("nearest"))) - Y_b (e', k_(#text("near"))) &= (#sym.PP [e', k_(#text("nearest"))]) - #sym.PP [e', k_(#text("near"))])) \
    &+ (xi_a B(e', k_(#text("nearest"))) - xi_b B(e', k_(#text("near")))) \
    &+ (rho_a - rho_b) + (omega_j-omega_j) #sym.arrow.l.r \
    &= #sym.PP [e', k_(#text("nearest"))]^* + rho_a - rho_b
  $

  + $#sym.PP [e', k_(#text("nearest"))]) - #sym.PP [e', k_(#text("near"))]) > 0$
  + $xi_a B(e', k_(#text("nearest"))) - xi_b B(e', k_(#text("near"))) approx 0$: (almost) no difference in future neighborhood quality expectation
  + $Y_a (e', k_(#text("nearest"))) - Y_b (e', k_(#text("near")))$ #sym.bot $rho_a-rho_b$: For existing households, location of new neighbors are not related to idiosyncratic factors $rho$.
]



#us.slide(title: "Nearest neighbor research design")[
  #set text(size: 16pt)
  - #strong[Treatment group]: Households with new different-type neighbors among their 3 nearest neighbors
  - #strong[Control group]: Households with new different-type neighbors "just down the road" (ranks 4-6)

    $
      Y_(i,j,t) = beta_1 I[e', k = n_(#text("nearest"))] + beta_2 I[e', k = n_(#text("near"))] + beta_3 I[e', k = n_(#text("close"))] + gamma Z_(i,j,t) + omega_(j,t) + epsilon_(i,j,t)
    $
    #strong[Parameter of interest:] $ beta_1 - beta_2 $

  This design addresses key identification challenges by comparing households experiencing same neighborhood conditions but different micro-geography of new neighbors.
]

#us.title-slide[Data
]

// Resulus
#us.title-slide[
  Results
]

// Conclusion
#us.title-slide[
  Conclusion
]

#us.slide(title: "Key Findings")[
  #set text(size: 22pt)
  1. Native Danish households increase moving propensity by 1.6% when receiving non-Western neighbors

  2. Non-Western households show no significant response to new native neighbors

  3. Heterogeneity by SES: Low-SES native households responding to low-SES non-Western neighbors show strongest effecus (2.8%)


  5. Magnitude in Denmark (1.6%) more modest than in U.S. context (4-6%)
]

#us.slide(title: "Extensions")[
  - Do native households respond to new Western neighbors?
  - How much are native households willing to pay in premium to live in a more homogenous neighborhood?
    - Variation?
  - Those who show Schelling behavior, where do they move to?
]


#us.focus-slide[
  Thank you for your attention!

  #v(1em)
  Questions?
]

// Bibliography
#let bib = bibliography("bibliography.bib", style: "harvard-cite-them-right")
// logo to the right
#us.bibliography-slide(bib)

// Appendix slides if needed
#us.title-slide[
  Appendix
]
// make it so that you can opt-in/out of stuff
#us.blank-slide("")
