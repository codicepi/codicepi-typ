// Template del Codice di prevenzione incendi

// Gestione liste
#import "@preview/itemize:0.3.1" as el

// Gestione unità di misura

#import "@preview/unify:0.8.1": num, numrange, qty as unify-qty, qtyrange
#let qty = unify-qty.with(per: "\\/") // config frazioni in unità

// Macros

#let Rvita = [R#sub[vita]]
#let Rbeni = [R#sub[beni]]
#let Rambiente = [R#sub[ambiente]]
#let qf = $"q"_"f"$
#let qfd = $"q"_"f,d"$
#let delta-occ = $"δ"_"occ"$
#let delta-alpha = $"δ"_"α"$
#let t-alpha = $"t"_"α"$
#let h = $"h"$
#let metri-quadrati = $"m"^2$ // FIXME units


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
      //stroke: red, // debug
      align(right)[Nota], align(left)[#body],
    )
  ]
]

// Funzione per pié di pagina

#let pie-pagina = context {
  let headings = query(heading.where().before(here()))
  let chapters = query(heading.where(level: 2).before(here()))
  if headings.len() > 0 and headings.last().level != 1 and chapters.len() > 0 {
    let chapter = chapters.last()
    let nums = counter(heading).at(chapter.location())
    let chapter-number = numbering("A.1", nums.at(0), nums.at(1))
    pad(left: -2.9cm, block(
      inset: (top: 4pt),
      stroke: (top: tratto-pie-pagina),
    )[
      #grid(
        columns: (1fr, auto),
        column-gutter: 1em,
        align: (left, right),
        text(font: "Liberation Sans", size: 9pt)[Capitolo #chapter-number #chapter.body],
        text(font: "Liberation Sans", size: 9pt)[Pagina #chapter-number#"-"#counter(page).display()],
      )
    ])
  }
}


// Inizializzazione doc

#let codicepi-template(body) = {
  set page(
    paper: "a4",
    margin: (left: 5.3cm),
    numbering: "1",
    footer: pie-pagina,
  )

  set heading(
    numbering: "A.1",
    supplement: "paragrafo", // default
  )
  show heading.where(level: 1): set heading(supplement: "sezione")
  show heading.where(level: 2): set heading(supplement: "capitolo")

  let show-heading(label, body, label-align: right, stroke: none) = pad(left: -2.8cm, block(
    inset: (top: .2cm),
    stroke: (top: stroke),
  )[
    #grid(
      columns: (3.3cm, 1fr),
      column-gutter: .2cm,
      align: (label-align, left),
      // stroke: red, // debug
      [#label], [#body],
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
      set text(size: 14pt)
      let label = [Sezione #counter(heading).display(it.numbering)]
      let body = it.body
      pagebreak()
      show-heading(label, body, label-align: left, stroke: tratto-capitolo)
    } else if it.level == 2 {
      set text(size: 14pt)
      let label = [Capitolo #counter(heading).display(it.numbering)]
      let body = it.body
      pagebreak()
      counter(page).update(1)
      show-heading(label, body, label-align: left, stroke: tratto-capitolo)
    } else if it.level == 3 {
      set text(size: 12pt)
      let label = [#counter(heading).display(it.numbering)]
      let body = it.body
      show-heading(label, body, label-align: left, stroke: tratto-paragrafo)
    } else {
      set text(size: 12pt)
      let label = [#counter(heading).display(it.numbering)]
      let body = it.body
      show-heading(label, body)
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

  // Liste

  let enum-label-width = .6cm
  let enum-body-indent = .1cm

  show: el.inline-enum-list.with(
    label-align: right,
    label-width: enum-label-width,
    body-indent: enum-body-indent,
    // label-format: (stroke: red), // debug
  )

  set enum(
    numbering: "1.a.i.",
  )

  set list(
    marker: ([\u{2022}], [\u{25E6}]),
  )

  // Figure

  show figure: set figure(
    numbering: (..nums) => context {
      let headings = counter(heading).get()
      numbering("A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
    },
  )

  show figure.where(kind: image): set figure(supplement: "Illustrazione")

  show figure: it => pad(left: -2.8cm)[#it]

  show figure.caption: it => {
    set text(
      font: "Liberation Serif",
      size: 11pt,
      style: "italic",
      fill: colore-titoli,
    )
    set align(left)
    it
  }

  // Tabelle

  set table(
    inset: inset-tabella,
    stroke: tratto-tabella,
  )

  show table: it => {
    set text(
      font: "Liberation Sans",
      size: 9pt,
      style: "normal",
      fill: black,
    )
    set par(leading: .1cm, spacing: .2cm)
    it
  }

  // Equazioni

  set math.equation(
    numbering: (..nums) => context {
      let headings = counter(heading).get()
      text(
        font: "Liberation Serif",
        size: 11pt,
        style: "italic",
        fill: colore-titoli,
      )[
        #numbering("Eq. A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
      ]
    },
  )

  body
}
