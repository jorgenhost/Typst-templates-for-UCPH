// Taken from https://designguide.ku.dk/download/ku_farvepalet_rgb.pdf

#let white = rgb("ffffff")

#let ucph_dark = (
  red: rgb("901a1E"),
  blue: rgb("122947"),
  petroleum: rgb("0a5963"),
  green: rgb("39641c"),
  gray: rgb("3d3d3d"),
  white: white,
)

#let ucph_medium = (
  red: rgb("c73028"),
  blue: rgb("425570"),
  petroleum: rgb("197f8e"),
  green: rgb("4b8325"),
  gray: rgb("666666"),
  champagne: rgb("fefaf2"),
)

#let ucph_light = (
  red: rgb("dB3B0A"),
  blue: rgb("bac7d9"),
  petroleum: rgb("b7d7de"),
  green: rgb("becaa8"),
  grey: rgb("e1dfdf"),
  yellow: rgb("ffbd38"),
)

#let gradient_darks = gradient.linear(
  ucph_dark.red,
  ucph_dark.blue,
  ucph_dark.petroleum,
  ucph_dark.green,
  ucph_dark.green,
  ucph_dark.gray,
)

#let gradient_medium = gradient.linear(
  ucph_medium.red,
  ucph_medium.blue,
  ucph_medium.petroleum,
  ucph_medium.green,
  ucph_medium.green,
  ucph_medium.gray,
)

#let gradient_light = gradient.linear(
  ucph_light.red,
  ucph_light.blue,
  ucph_light.petroleum,
  ucph_light.green,
  ucph_light.green,
  ucph_light.yellow,
)
