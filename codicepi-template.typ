// Template del Codice di prevenzione incendi

// Gestione avanzata liste

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

// Configurazioni

#let colore-titoli = rgb("#21409a")
#let tratto-capitolo = stroke(2pt + black)
#let tratto-paragrafo = stroke(1pt + black)
#let tratto-pie-pagina = stroke(.5pt + black)
#let colore-tabelle = rgb("#dddddd")
#let tratto-tabella = .5pt
#let inset-tabella = 6pt

// Funzione per celle header e footer tabelle
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
      stroke: red,
      // debug
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

// Funzione per riferimento

#let ref-title(label) = context {
  let el = query(label).first()
  link(el.location())[#ref(label) _#el.body _]
}  // con numero e titolo

#let ref-num(label) = ref(label, supplement: none)  // solo numero


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
    supplement: "Paragrafo", // default
  )

  show heading.where(level: 1): set heading(supplement: "Sezione")
  show heading.where(level: 2): set heading(supplement: "Capitolo")

  let show-heading(
    it,
    size: 11pt,
    weight: "normal",
    supplement: none,
    align: right,
    stroke: none,
    above: 0cm,
    below: 0cm,
  ) = pad(left: -2.8cm, block(
    above: above,
    below: below,
    inset: (top: .2cm),
    stroke: (top: stroke),
  )[
    #set text(font: "Liberation Sans", fill: colore-titoli, size: size, weight: weight)
    #grid(
      columns: (3.3cm, 1fr),
      column-gutter: .2cm,
      align: (align, left),
      stroke: red,
      // debug
      [#supplement #counter(heading).display(it.numbering)], it.body,
    )
  ])

  show heading.where(level: 1): it => {
    pagebreak()
    show-heading(
      it,
      size: 14pt,
      weight: "bold",
      supplement: it.supplement,
      align: left,
      stroke: tratto-capitolo,
      above: 1.5em,
      below: 0.8em,
    )
  }

  show heading.where(level: 2): it => {
    pagebreak()
    // Reset counters
    counter(page).update(1)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: image)).update(0)
    show-heading(
      it,
      size: 14pt,
      weight: "bold",
      supplement: it.supplement,
      align: left,
      stroke: tratto-capitolo,
      above: 1.5em,
      below: 0.8em,
    )
  }

  show heading.where(level: 3): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "bold",
      supplement: none,
      align: left,
      stroke: tratto-paragrafo,
      above: 1.5em,
      below: 0.8em,
    )
  }

  show heading.where(level: 4): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "bold",
      supplement: none,
      align: left,
      stroke: none,
      above: 1.5em,
      below: 0.8em,
    )
  }

  show heading.where(level: 5): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "regular",
      supplement: none,
      align: left,
      stroke: none,
      above: 1.5em,
      below: 0.8em,
    )
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
    label-format: (stroke: red), // debug
  )

  set enum(
    numbering: "1.a.i.",
  )

  set list(
    marker: ([\u{2022}], [\u{25E6}]),
  )

  // Figure

  set figure(
    numbering: (..nums) => context {
      let headings = counter(heading).get()
      numbering("A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
    },
    supplement: none, // default
  )

  show figure.where(kind: image): set figure(supplement: "Illustrazione")
  show figure.where(kind: table): set figure(supplement: "Tabella")

  show figure: it => pad(left: -2.8cm)[#it]

  show figure.caption: it => {
    set text(
      font: "Liberation Serif",
      size: 11pt,
      style: "italic",
      fill: colore-titoli,
    )
    block(width: 100%, align(left, it))
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
