#import "typslides/1.2.6/typslides.typ" as ts

#let ucph-theme-color = rgb("#901a1e")


// Project configuration
#show: ts.typslides.with(
  ratio: "16-9",
  theme: ucph-theme-color,
)


// The front slide is the first slide of your presentation
#ts.front-slide(
  title: "Love thy neighbor?",
  subtitle: [#set text(size: 22pt)
    An empirical test of neighborhood ethnicity change and Schelling behavior],
  authors: "Jørgen Baun Høst",
  info: [University of Copenhagen · Department of Economics · May 2025],
)

// make it so that you can opt-in/out of stuff
#ts.blank-slide("")

// change link-color
#ts.table-of-contents()

#ts.focus-slide("Hello yes yes yes")

// Custom outline
#ts.slide(title: "Overview")[
  #set text(size: 18pt)
  - *Motivation*: Demographic transition and Schelling's model
  - *Research Question*: Does the ethnicity of your nearest neighbor affect propensity to move?
  - *Methods*: Nearest-neighbor research design with comprehensive administrative data
  - *Results*: Schelling behavior?
  - *Heterogeneity Analysis*: SES
  - *Conclusion*

  _Defintions_:
  + Native households: All members are of Danish origin
  + Non-Western households: At least 1 member is of non-Western origin
  + Western households: At least 1 member is of Western origin (but no non-Western household members)
]

// Introduction and motivation
// logo to the left
#ts.title-slide[
  Introduction
]


#ts.slide(title: "Theoretical Background: Schelling's Model")[
  #set text(size: 18pt)
  #ts.cols(columns: (1fr, 1fr))[
    - @schelling1971dynamic proposed that neighborhoods may "tip" when minority share reaches a threshold
    - Even with relatively tolerant preferences toward diversity
    - Three types of segregation:
      1. Organized segregation (e.g., historical Jim Crow laws)
      2. Economically induced segregation (clustering by income/education)
      3. #ts.reddy[Individually motivated segregation] #sym.arrow.l #strong[Focus of this paper]
      Schelling's key insight: Small individual preferences can lead to macro-level segregation
  ][
    123
  ]
]

// Methods
#ts.title-slide[
  Methods
]


#ts.slide(title: "Identification Challenge")[
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
  - Selection effects (who moves where is not random)
]


#ts.slide(title: "Nearest neighbor research design")[
  #set text(size: 16pt)
  #strong[Innovative approach from @Bayer_2022_nearest_neighbor:]

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



#ts.slide(title: "Nearest neighbor research design")[
  #set text(size: 16pt)
  - #strong[Treatment group]: Households with new different-type neighbors among their 3 nearest neighbors
  - #strong[Control group]: Households with new different-type neighbors "just down the road" (ranks 4-6)

    $
      Y_(i,j,t) = beta_1 I[e', k = n_(#text("nearest"))] + beta_2 I[e', k = n_(#text("near"))] + beta_3 I[e', k = n_(#text("close"))] + gamma Z_(i,j,t) + omega_(j,t) + epsilon_(i,j,t)
    $
    #strong[Parameter of interest:] $ beta_1 - beta_2 $

  This design addresses key identification challenges by comparing households experiencing same neighborhood conditions but different micro-geography of new neighbors.
]

#ts.title-slide[Data
]

// Results
#ts.title-slide[
  Results
]

// Conclusion
#ts.title-slide[
  Conclusion
]

#ts.slide(title: "Key Findings")[
  #set text(size: 22pt)
  1. Native Danish households increase moving propensity by 1.6% when receiving non-Western neighbors

  2. Non-Western households show no significant response to new native neighbors

  3. Heterogeneity by SES: Low-SES native households responding to low-SES non-Western neighbors show strongest effects (2.8%)


  5. Magnitude in Denmark (1.6%) more modest than in U.S. context (4-6%)
]

#ts.slide(title: "Extensions")[
  - Do native households respond to new Western neighbors?
  - How much are native households willing to pay in premium to live in a more homogenous neighborhood?
    - Variation?
  - Those who show Schelling behavior, where do they move to?
]


#ts.focus-slide[
  Thank you for your attention!

  #v(1em)
  Questions?
]

// Bibliography
#let bib = bibliography("bibliography.bib", style: "harvard-cite-them-right")
// logo to the right
#ts.bibliography-slide(bib)

#pagebreak()
// Appendix slides if needed
#ts.title-slide[
  Appendix
]

