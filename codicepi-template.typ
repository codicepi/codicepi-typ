// Template del Codice di prevenzione incendi

// Gestione liste
#import "@preview/itemize:0.3.1" as el

// Gestione unità di misura

#import "@preview/unify:0.8.1": num, numrange, qty as unify-qty, qtyrange
#let qty = unify-qty.with(per: "\\/") // config frazioni in unità

// Macros

#let Rvita = $"R"_"vita"$
#let Rbeni = $"R"_"beni"$
#let Rambiente = $"R"_"ambiente"$
#let qf = $"q"_"f"$
#let qfd = $"q"_"f","d"$

// Configurazioni titoli

#let colore-titoli = rgb("#21409a")
#let tratto-capitolo = stroke(2pt + black)
#let tratto-paragrafo = stroke(1pt + black)
#let tratto-pie-pagina = stroke(.5pt + black)

// Configurazioni tabelle

#let colore-tabelle = rgb("#dddddd")
#let tratto-tabella = .5pt
#let inset-tabella = 6pt

// Funzione celle header e footer tabelle
// in attesa di fix a Typst #3640

#let th(body, colspan: 1, rowspan: 1) = table.cell(
  colspan: colspan,
  rowspan: rowspan,
  align: center + horizon,
  fill: colore-tabelle,
)[#text(weight: "bold")[#body]]

#let tf(body, colspan: 1, rowspan: 1) = table.cell(
  colspan: colspan,
  rowspan: rowspan,
  align: left + horizon,
  fill: colore-tabelle,
)[#body]

// Funzione per nota

#let nota-text-size = 9pt

#let nota(body) = [
  #set text(
    fill: colore-titoli,
    size: nota-text-size,
  )
  #block(inset: (left: -2.9cm))[
    #grid(
      columns: (3.4cm, 1fr),
      column-gutter: .2cm,
      //stroke: red,
      align(right)[Nota], align(left)[#body],
    )
  ]
]

// Inizializzazione doc

#let codicepi-template(body) = {
  set page(
    paper: "a4",
    margin: (left: 5.3cm),
    numbering: "1",
  )

  set heading(
    numbering: "A.1",
    supplement: "paragrafo", // default
  )
  show heading.where(level: 1): set heading(supplement: "sezione")
  show heading.where(level: 2): set heading(supplement: "capitolo")

  let show-titolo(label, body, stroke: none) = pad(left: -2.8cm, block(
    inset: (top: .2cm),
    stroke: (top: stroke),
  )[
    #grid(
      columns: (3.3cm, 1fr),
      column-gutter: .2cm,
      // stroke: red,
      align(right)[#label], align(left)[#body],
    )
  ])

  show heading: it => {
    set text(
      fill: colore-titoli,
      font: "Liberation Sans",
    )
    if it.numbering == none {
      it
    } else if it.level == 1 {
      set text(size: 15pt)
      let label = [Sezione #counter(heading).display(it.numbering)]
      let body = it.body
      pagebreak()
      show-titolo(label, body, stroke: tratto-capitolo)
    } else if it.level == 2 {
      set text(size: 15pt)
      let label = [Capitolo #counter(heading).display(it.numbering)]
      let body = it.body
      pagebreak()
      show-titolo(label, body, stroke: tratto-capitolo)
    } else if it.level == 3 {
      set text(size: 12pt)
      let label = [#counter(heading).display(it.numbering)]
      let body = it.body
      show-titolo(label, body, stroke: tratto-paragrafo)
    } else {
      set text(size: 12pt)
      let label = [#counter(heading).display(it.numbering)]
      let body = it.body
      show-titolo(label, body)
    }
  }

  set text(
    font: "Liberation Serif",
    size: 11pt,
    lang: "it",
    region: "IT",
    hyphenate: true,
  )

  set par(
    justify: true,
  )

  let enum-label-width = .6cm
  let enum-body-indent = .1cm

  show: el.inline-enum-list.with(
    label-align: right,
    label-width: enum-label-width,
    body-indent: enum-body-indent,
    label-format: (stroke: red), // debug label
  )

  set enum(
    numbering: "1.a.i.",
  )

  set list(
    marker: ([\u{2022}], [\u{25E6}]),
  )

  show figure: it => pad(left: -2.8cm)[#it]

  body
}
