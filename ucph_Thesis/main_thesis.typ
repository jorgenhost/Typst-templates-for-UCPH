
// Online editor
// #import "@preview/ucph-thesis:0.1.0" as thesis

// How do I change this?
#import "ucph-thesis/lib.typ": *

// to this
// #import "ucph-thesis/lib.typ" as thesis


#let chapters-on-odd = false
#show: ucph-thesis.with(
  title: [A UCPH thesis for all],
  short-title: [],
  authors: ("Hello",),
  short-author: "Hello et. al.",
  titlepage: true,
  chapters-on-odd: chapters-on-odd,
  bibliography: bibliography("bibliography.bib"),
  figure-index: (enabled: true, title: "Figures"),
  table-index: (enabled: true, title: "Tables"),
  listing-index: (enabled: true, title: "Code listings"),
  abstract-en: [
    Hello på engelsk
  ],
  abstract-dk: [
    Hello på dansk
  ],
)

= Introduction
