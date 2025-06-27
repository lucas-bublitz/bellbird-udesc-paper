// Modelo para Trabalhos Acadêmicos da UDESC
// Criado por Lucas Vinícius Bublitz
// Licença livre nos termos do GNU
// O autor se reserva ao direito de ser citado quanto parte, ou a integralidade, deste documento for utilizado por terceiros, não assumindo qualquer risco comercial, nem exigindo qualquer.

#let udesc(
  config,
  doc
)={

  //Dependências
  
  //Formatação básica
  set page(
    "a4",
    margin: (
      top: 3cm,
      left: 3cm,
      right: 2cm,
      bottom: 2cm
    ),
    number-align: right + top,
    numbering: "1"
  )
  
  set par(
    justify: true, 
    leading: 1em,
    first-line-indent: (amount: 3em, all: true),
    spacing: 1em,
  )
  set text(
    size: 12pt,
    lang: "pt",
    hyphenate: true,
    font: "Liberation Sans"
  ) 
  set document( //Metadados
    title: config.title,
    author: config.author,
    date: auto
  )

  // Funções auxiliares
  // função de quebra de linha
  let multiLinebreak(n) ={
      for VALUE in range(0,n) {
      linebreak()
      }
    }

  //Citações
  //Citação longa (a função nativa quotes() é usada para citação longa)
  show quote: it => {
    set text(size: 10pt)
    linebreak()
    pad(
      left: 4cm,
      par(leading: 0.65em, first-line-indent: 0em, it.body)
    )
    linebreak()
  }
   
  //Títulos (headings)
  show heading: set block(above: 2em, below: 1em)
  show heading: it => {
    set text(12pt)
    it
  }
  set heading(
    numbering: "1.1.1."
  )
  show heading.where(level: 1): it => [
    #pagebreak()
    #upper(it)
  ]
  show heading.where(level: 2): it => text(weight: "regular")[
    #upper(it)
  ]

  // Figuras (tabelas, imagens, gráficos....)
  set figure.caption(position: top)
  show figure: it => {
    show ref: that => [Fonte: #cite(form: "prose", that.target)]
    it
  }
  // PARTE PRÉ-TEXTUAL
  
  let credit() = text(oklch(0%, 0, 0deg, 0%))[Este documento utiliza o Modelo de Trabalhos Acadêmidos tUDESC] 

  //Capa
  let cover(title, campus, departament, author, city, year) = page(numbering: none, {
      set text(weight: "bold")
      set align(center)

      [UNIVERSIDADE DO ESTADO DE SANTA CATARINA – UDESC\ ]
      upper(campus)
      linebreak()
      upper(departament)

      multiLinebreak(6)
      upper(author)

      place(horizon + center,
        upper(title)
      )

      place(bottom + center, {
        credit()
        linebreak()
        upper(city)
        linebreak()
        str(year)
      })
    })

  //Anverso (obverse)
  let obverse(title, author, observe_text, city, year) = page(numbering: none, {
    set align(center)
    set text(weight: "bold")

    upper(author)
    multiLinebreak(13)

    upper(title)
    multiLinebreak(4)
    pad(left: 8cm,
      align(left,{
        set text(weight: "regular")
        par(leading: 0.65em, justify: true, first-line-indent: 0em, observe_text)
      })
    )
    place(bottom + center, {
      credit()
      linebreak()
      upper(city)
      linebreak()
      str(year)
    })
  })

  // Epígrafe (epigraph)
  let epigraph() = page(numbering: none,
    place(bottom + right,
      box(width: 8cm,
        align(left, {
          config.epigraph
          multiLinebreak(2)
        })
      )
    )
  )

  //Agradecimento
  let acknowledgments(acknowledgments_text) = page(numbering: none, {
    align(center, [*AGRADECIMENTOS*])
    multiLinebreak(2)
    parbreak()
    acknowledgments_text
  })

  //Abstract
  let abstract(text, keywords) = page(
    numbering: none, {
      set par(leading: 1em, first-line-indent: 0em)
      align(center, [*RESUMO*])
      multiLinebreak(2)
      text
      multiLinebreak(3)
      [*Palavras-chave*: ];keywords.join("; ");[.]
  })
  
  // Sumários
  // Sumários dos capítulos e derivados
  show outline.where(target: selector(heading.where(outlined: true))): it => {
    show outline.entry: that => {
       if that.body.has("children") {
          box({
            place(box(that.body.children.at(0), width: 3.5em))
            box([], width: 3.5em)
            box({
              that.body.children.at(2) 
              box(width: 1fr, that.fill)
              box(width: 0.5em)
              box(width: 1em,align(left,that.page))
            }, width: 1fr)
          }, height: auto)
        } else {
          that.body
          box(width: 1fr, that.fill)
          box(width: 0.5em)
          box(width: 1em,align(left,that.page))
        }
    }
    show outline.entry.where(level: 1): it => [
      *#upper(it)*
    ]
    show outline.entry.where(level: 2): it => [
      #upper(it)
    ]
    show outline.entry.where(level: 3): it => [
     *#it*
    ]
    it
  }
  
  // Sumário das figuras
  show outline.where(target: selector(figure)): it => {
    if query(figure).len() > 0 {
      show outline.entry: that => {
        that.body
        box({
              box(width: 1fr, that.fill)
                 box(width: 0.5em)
              box(width: 1em,align(left,that.page))
            }, width: 1fr)
      }
      it
      
    }
  }
  show outline: set page(numbering: none)


  // PARTE PRÉ-TEXTUAL
  cover(config.title, config.campus, config.departament, config.author, config.city, config.year)
  obverse(config.title, config.author, config.obverse, config.city, config.year)
  acknowledgments(config.acknowledgments)
  abstract(config.abstract, config.keywords)
  epigraph()
  outline(title: [Lista de figuras], target: figure)
  outline()
  
  
  // PARTE TEXTUAL
  doc

  // PARTE PÓS-TEXTUAl
  show bibliography: set par(first-line-indent: 0em, justify: false)
  bibliography("bibliography.bib", title: "Referências", style: "abnt.csl")
  
}

#let p(ref) = cite(ref, form: "prose")
