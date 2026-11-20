// Template del Codice di prevenzione incendi

#let heading-blue = rgb("#21409a")

#let codicepi-template(
  titolo: "Titolo del Documento",
  sottotitolo: none,
  body,
) = {
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    numbering: "1",
    footer: context {
      let headings = query(heading.where().before(here()))
      let chapters = query(heading.where(level: 2).before(here()))
      if headings.len() > 0 and headings.last().level != 1 and chapters.len() > 0 {
        let chapter = chapters.last()
        let nums = counter(heading).at(chapter.location())
        let chapter-number = numbering("A.1", nums.at(0), nums.at(1))
        block(
          inset: (top: 4pt),
          stroke: (top: 0.26pt + black),
        )[
          #grid(
            columns: (1fr, auto),
            column-gutter: 1em,
            align: (left, right),
            text(font: "Liberation Sans", size: 9pt)[Capitolo #chapter-number #chapter.body],
            text(font: "Liberation Sans", size: 9pt)[Pagina #chapter-number#("-")#counter(page).display()],
          )
        ]
      }
    },
  )

  set text(
    font: "Liberation Serif",
    size: 11pt,
    lang: "it",
    region: "IT",
    hyphenate: true,
  )

  set par(
    justify: true,
    leading: 0.5em,
    first-line-indent: 1em,
  )

  // Elenchi puntati e numerati

  set list(
    marker: ([\u{2022}], [\u{25E6}]),
  )

  set enum(
    numbering: "1.a.i.",
  )

  // Contatori globali

  let contatore-comma = counter("comma")
  let contatore-tabella = counter(figure.where(kind: "table"))

  // Didascalia figure tabelle

  set figure(
    kind: "table",
    supplement: "Tabella",
    numbering: (..nums) => context {
      let headings = counter(heading).get()
      numbering("A.1-1", headings.at(0), headings.at(1), nums.pos().at(0))
    },
  )

  // Tabelle e relative didascalie

  show figure.where(kind: "table"): it => {  // didascalia
    set text(
      font: "Liberation Serif",
      size: 11pt,
      style: "italic",
      fill: heading-blue,
    )
    set align(left)
    it
  }

  show table: it => {
    set text(
      font: "Liberation Sans",
      size: 9pt,
      style: "normal",
      fill: black,
    )
    it
  }

  // Numerazione struttura

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

  set heading(numbering: numerazione-struttura)



  show heading: it => {
      contatore-comma.update(0)
      set text(
        font: "Liberation Sans",
        fill: heading-blue,
        weight: "bold",
      )

      if it.level == 1 {
        // Sezione
        pagebreak()
        set text(size: 16pt)
        block(
          above: 0pt,
          below: 2cm,
          inset: (top: 5cm),
          stroke: (top: 0.26pt + black),
        )[
          #grid(
            columns: (4cm, 1fr),
            column-gutter: 0pt,
            align(left)[#counter(heading).display()],
            align(left)[#it.body],
          )
        ]
      } else if it.level == 2 {
        // Capitolo
        contatore-tabella.update(0)
        pagebreak()
        counter(page).update(1)
        set text(size: 16pt)
        block(
          above: 0pt,
          below: 1cm,
          inset: (top: 2cm),
          stroke: (top: 0.26pt + black),
        )[
          #grid(
            columns: (4cm, 1fr),
            column-gutter: 0pt,
            align(left)[#counter(heading).display()],
            align(left)[#it.body],
          )
        ]
      } else if it.level == 3 {
        // Paragrafo A.1.1
        set text(size: 11pt)
        block(
          above: 0.8cm,
          below: 0.4cm,
          inset: (top: 0.2cm),
          stroke: (top: 0.26pt + black),
        )[
          #grid(
            columns: (3cm, 1fr),
            column-gutter: 0pt,
            align(left)[#counter(heading).display()],
            align(left)[#it.body],
          )
        ]
      } else if it.level == 4 {
        // Paragrafo A.1.1.1
        set text(size: 11pt)
        block(
          above: 0.4cm,
          below: 0.2cm,
          inset: (left: 3cm),
        )[
          #set par(first-line-indent: -3cm)
          #counter(heading).display() #it.body
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
          #counter(heading).display() #it.body
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
          #counter(heading).display() #it.body
        ]
      }
  }

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

  body
}

// Funzione per comma numerato

#let comma(body) = {
  let c = counter("comma")
  c.step()

  set list(indent: 1em)
  set enum(
    indent: 1em,
    numbering: "a.i.",
  )

  block(
    above: 0pt,
    below: 0.4cm,
    inset: (left: 3cm),
  )[
    #grid(
      columns: (0.2cm, 1fr),
      column-gutter: 0.3cm,
      align: (right, left),
      context c.display("1."),
      [
        #set par(first-line-indent: 0pt)
        #body
      ],
    )
  ]
}


#let c = comma

// Funzione per nota

#let nota(body) = block(
  above: 0pt,
  below: 0.38cm,
  inset: (left: 2.7cm),
)[
  #set par(justify: true, leading: 0.4em, first-line-indent: 0pt)
  #set text(fill: heading-blue, size: 9pt)
  #grid(
    columns: (0.8cm, 1fr),
    column-gutter: 0pt,
    [Nota],
    [#body],
  )
]

#let n = nota

// Funzione per cella di intestazione per tabelle
// in attesa di fix a Typst #3640

#let table-heading(body, colspan: 1) = table.cell(
  colspan: colspan,
  align: center,
  fill: rgb("#dddddd"),
)[#text(weight: "bold")[#body]]
