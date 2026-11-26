// Template del Codice di prevenzione incendi

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
#let tratto-pie-pagina = .5pt + black
#let tratto-apertura = 1pt + black
#let tratto-paragrafo = .25pt + black

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

// Inizializzazione doc

#let codicepi-template(
  titolo: "Titolo del Documento",
  sottotitolo: none,
  body,
) = {
  // Costruzione piè di pagina

  let pie-pagina = context {
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

  // Config pagina

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    numbering: "1",
    footer: pie-pagina,
  )

  // Config testo e paragrafo

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

  // Elenchi puntati

  set list(
    marker: ([\u{2022}], [\u{25E6}]),
  )

  // Numerazione commi e lettere

  let comma-indent-first = 3cm
  let comma-indent = .4cm
  let comma-body-indent = .2cm
  let comma-spacing = .4cm

  set enum(
    numbering: "1.a.i.1.a.i.1.a.i.",
    indent: comma-indent-first,
    body-indent: comma-body-indent,
    spacing: comma-spacing,
  )

  show enum: it => {
    set enum(
      indent: comma-indent,
      body-indent: comma-body-indent,
      spacing: comma-spacing,
    )
    it
  }

  // Contatori

  let contatore-tabella = counter(figure.where(kind: "table"))

  // Didascalia tabelle, illustrazioni

  let numerazione-figura = (..nums) => context {
    let headings = counter(heading).get()
    numbering("A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
  }

  show figure.where(kind: "table"): set figure(
    supplement: "Tabella",
    numbering: numerazione-figura,
  )

  show figure.where(kind: "illustration"): set figure(
    supplement: "Illustrazione",
    numbering: numerazione-figura,
  )

  show figure.where(kind: "illustration"): it => block(
    above: 0.4cm,
    below: 0.4cm,
  )[#it]

  // Le figure appartengono semanticamente al comma, ma conservano la larghezza del corpo pagina.
  show figure: it => pad(left: -3.5cm)[#it]

  show figure.caption: it => {
    // didascalia
    set text(
      font: "Liberation Serif",
      size: 11pt,
      style: "italic",
      fill: colore-titoli,
    )
    set align(left)
    it
  }

  set table(
    inset: inset-tabella,
    stroke: tratto-tabella,
  )

  show table: it => {
    // contenuto tabella
    set text(
      font: "Liberation Sans",
      size: 9pt,
      style: "normal",
      fill: black,
    )
    it
  }

  // FIXME header tabella

  let numerazione-struttura(..nums) = {
    let n = nums.pos()
    let sez = numbering("A", n.at(0))
    if n.len() == 1 {
      "Sezione " + sez
    } else if n.len() == 2 {
      "Capitolo " + sez + "." + str(n.at(1))
    } else {
      sez + "." + n.slice(1).map(str).join(".")
    }
  }

  let barra-titolo(body, column-width, above, below, inset, stroke) = block(
    above: above,
    below: below,
    inset: inset,
    stroke: (top: stroke),
  )[
    #grid(
      columns: (column-width, 1fr),
      column-gutter: 0pt,
      align(left)[#counter(heading).display()], align(left)[#body],
    )
  ]

  set heading(
    numbering: numerazione-struttura,
    supplement: none,
  )

  show heading: it => {
    // testo default per titoli
    set text(
      font: "Liberation Sans",
      size: 15pt,
      fill: colore-titoli,
      weight: "bold",
    )

    if it.level == 1 {
      // Sezione
      pagebreak()
      barra-titolo(
        it.body,
        3.5cm,
        0pt,
        2cm,
        (top: 5cm),
        tratto-apertura,
      )
    } else if it.level == 2 {
      // Capitolo
      contatore-tabella.update(0)
      pagebreak()
      counter(page).update(1)
      barra-titolo(
        it.body,
        3.5cm,
        0pt,
        1cm,
        (top: 2cm),
        tratto-apertura,
      )
    } else if it.level == 3 {
      // Paragrafo A.1.1
      set text(size: 11pt)
      barra-titolo(
        it.body,
        3.5cm,
        0.8cm,
        .4cm,
        (top: 0.2cm),
        tratto-paragrafo,
      )
    } else if it.level == 4 {
      // Paragrafo A.1.1.1
      set text(size: 11pt)
      block(
        above: 0.4cm,
        below: 0.2cm,
      )[
        #grid(
          columns: (3cm, 1fr),
          column-gutter: 0pt,
          align: (left, left),
          [#counter(heading).display()], [#it.body],
        )
      ]
    } else if it.level == 5 {
      // Paragrafo A.1.1.1.1
      set text(
        size: 11pt,
        weight: "regular",
      )
      block(
        above: 0.2cm,
        below: 0.2cm,
      )[
        #grid(
          columns: (3cm, 1fr),
          column-gutter: 0pt,
          align: (left, left),
          [#counter(heading).display()], [#it.body],
        )
      ]
    } else {
      // Ogni altro sotto paragrafo
      set text(
        size: 9pt,
        weight: "bold",
      )
      block(
        above: 0.1cm,
        below: 0.1cm,
      )[
        #grid(
          columns: (3cm, 1fr),
          column-gutter: 0pt,
          align: (left, left),
          [#counter(heading).display()], [#it.body],
        )
      ]
    }
  }

  // Equazioni: numerazione e distanza

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

  show math.equation.where(block: true): it => block(
    above: 0.4cm,
    below: 0.4cm,
  )[#it]

  // Frontespizio

  align(center)[
    #text(size: 20pt, weight: "bold")[#titolo]
    #if sottotitolo != none [
      \ #v(0.4em)
      #text(size: 13pt, style: "italic")[#sottotitolo]
    ]
  ]

  v(1.5em)
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.body()),
  )
  outline(title: "Indice", indent: auto)
  v(1.5em)

  // Contenuto documento

  let supplemento-riferimento = element => {
    if element.func() == heading and element.level >= 3 {
      [Paragrafo]
    } else {
      element.supplement
    }
  }

  show ref.where(form: "normal"): set ref(
    supplement: supplemento-riferimento,
  )

  body
}

// Funzione per nota

#let nota(body) = block(
  above: 0.2cm,
  below: 0.4cm,
  inset: (left: -1.1cm),
)[
  #set par(justify: true, leading: 0.4em, first-line-indent: 0pt)
  #set text(fill: colore-titoli, size: 9pt)
  #grid(
    columns: (0.8cm, 1fr),
    column-gutter: 0.3cm,
    align: (right, left),
    [Nota], [#body],
  )
]

// Nota immediatamente successiva a un header.
#let nota-header(body) = context {
  let headings = query(heading.where().before(here()))
  let level = if headings.len() > 0 { headings.last().level } else { 0 }
  let offset = if level == 1 {
    6cm
  } else if level == 2 {
    5cm
  } else if level == 3 {
    3cm
  } else {
    3cm
  }
  pad(left: offset)[#nota(body)]
}

#let n = nota

