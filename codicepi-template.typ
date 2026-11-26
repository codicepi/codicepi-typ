// Template del Codice di prevenzione incendi

// Configurazioni

#let colore-blu = rgb("#21409a")
#let colore-grigio = rgb("#dddddd")

#let tratto-capitolo = stroke(2pt + black)
#let tratto-paragrafo = stroke(1pt + black)
#let tratto-pie-pagina = stroke(.5pt + black)
#let tratto-tabella = .5pt
#let inset-tabella = 6pt

#let nota-text-size = 9pt

#let stroke-debug = none

#let page-margin-left = 2.5cm
#let comma-body-margin-left = 6cm
#let comma-label-width = .6cm
#let comma-body-indent = .1cm
#let nota-grid-column-gutter = .2cm

#let heading-body-margin-left = 5cm
#let heading-grid-column-gutter = .2cm

// Gestione avanzata liste e commi
// Usa con:
// show: comma-list-style

#import "@preview/itemize:0.3.1" as el

#let comma-indent = (
  comma-body-margin-left - page-margin-left - comma-label-width - comma-body-indent
)

#let comma-list-style = el.inline-enum-list.with(
  label-align: right,
  label-width: comma-label-width,
  body-indent: comma-body-indent,
  indent: it => if it.level == 1 { comma-indent } else { auto },
)

#let normal-list-style = el.inline-enum-list.with(
  label-align: right,
  label-width: comma-label-width,
  body-indent: comma-body-indent,
  indent: auto,
)

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


// Funzione per celle header e footer tabelle
// in attesa di fix a Typst #3640

#let th(body, colspan: 1, rowspan: 1) = table.cell(
  colspan: colspan,
  rowspan: rowspan,
  align: center + horizon,
  fill: colore-grigio,
)[#text(weight: "bold")[#body]]

#let tf(body, colspan: 1, rowspan: 1) = table.cell(
  colspan: colspan,
  rowspan: rowspan,
  align: left + horizon,
  fill: colore-grigio,
)[#body]

// Funzione per nota

#let nota-grid-column = (
  comma-body-margin-left - page-margin-left - nota-grid-column-gutter
)

#let nota(body) = [
  #set text(
    fill: colore-blu,
    size: nota-text-size,
  )
  #block()[
    #grid(
      columns: (nota-grid-column, 1fr),
      column-gutter: nota-grid-column-gutter,
      stroke: stroke-debug,
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
    block(
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
    ]
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
    margin: (left: page-margin-left),
    numbering: "1",
    footer: pie-pagina,
  )

  set heading(
    numbering: "A.1",
    supplement: "Paragrafo", // default
  )

  show heading.where(level: 1): set heading(supplement: "Sezione")
  show heading.where(level: 2): set heading(supplement: "Capitolo")

  let heading-grid-column = (
    heading-body-margin-left - page-margin-left - heading-grid-column-gutter
  )

  let show-heading(
    it,
    size: 11pt,
    weight: "normal",
    supplement: none,
    align: right,
    pad-left: 0cm,
    above: 0cm,
    below: 0cm,
    inset: (top: .2cm),
    stroke: none,
  ) = block(
    above: above,
    below: below,
    inset: inset,
    stroke: (top: stroke),
  )[
    #set text(
      font: "Liberation Sans",
      fill: colore-blu,
      size: size,
      weight: weight,
    )
    #grid(
      columns: (heading-grid-column + pad-left, 1fr),
      column-gutter: heading-grid-column-gutter,
      align: (align, left),
      stroke: stroke-debug,
      [#supplement #counter(heading).display(it.numbering)], it.body,
    )
  ]

  // Heading Sezione
  show heading.where(level: 1): it => {
    pagebreak()
    show-heading(
      it,
      size: 14pt,
      weight: "bold",
      supplement: it.supplement,
      align: left,
      pad-left: 1cm,
      above: 0cm,
      below: 2cm,
      inset: (top: 5cm),
      stroke: tratto-capitolo,
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
      pad-left: 1cm,
      above: 0cm,
      below: 1cm,
      inset: (top: 2cm),
      stroke: tratto-capitolo,
    )
  }

  show heading.where(level: 3): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "bold",
      supplement: none,
      align: left,
      pad-left: 0cm,
      above: 0.8cm,
      below: 0.4cm,
      inset: (top: .2cm),
      stroke: tratto-paragrafo,
    )
  }

  show heading.where(level: 4): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "bold",
      supplement: none,
      align: left,
      pad-left: 0cm,
      above: 0.4cm,
      below: 0.2cm,
      inset: (top: 0cm),
      stroke: none,
    )
  }

  show heading.where(level: 5): it => {
    show-heading(
      it,
      size: 12pt,
      weight: "regular",
      supplement: none,
      align: left,
      pad-left: 0cm,
      above: 0.2cm,
      below: 0.2cm,
      inset: (top: 0cm),
      stroke: none,
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

  show figure.caption: it => {
    set text(
      font: "Liberation Serif",
      size: 11pt,
      style: "italic",
      fill: colore-blu,
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

  show table.cell: cell => {
    show: normal-list-style
    cell
  }

  // Equazioni

  set math.equation(
    numbering: (..nums) => context {
      let headings = counter(heading).get()
      text(
        font: "Liberation Serif",
        size: 11pt,
        style: "italic",
        fill: colore-blu,
      )[
        #numbering("Eq. A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
      ]
    },
  )

  body
}
