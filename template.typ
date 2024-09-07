// Modelo para Trabalhos Acadêmicos da UDESC
// Criado por Lucas Vinícius Bublitz
// Licença livre nos termos do GNU
// O autor se reserva ao direito de ser citado quanto parte, ou a integralidade, deste documento for utilizado por terceiros, não assumindo qualquer risco comercial, nem exigindo qualquer.

#let udesc(
  config,
  doc
)={
  let title = config.title
  let authors = config.authors
  let abstract = config.abstract
  let epigraph = config.epigraph
  let congratulations = config.congratulations

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
  show par: set block(spacing: 1em)
  set par(
    justify: true, 
    leading: 1em, 
    first-line-indent: 3em
  )
  set text(
    size: 12pt,
    lang: "pt",
    hyphenate: false
  )
  set document(
    title: title,
    author: authors,
    date: auto
  )

  //Citações
  //Citação longa (a função nativa quotes() é usada para citação longa)
  show quote: it => {
    par(it.body)
  }
   
  //Títulos (headings)
  show heading: set block(spacing: 2em)
  show heading: it => {
    set text(12pt)
    it
    // Gambiarra! (Faz com que o próximo parágrafo seja indentado!)
    ""
    v(-1em)
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
    ""
    v(-1em)
  }
  // PARTE PRÉ-TEXTUAL
  
  let credit() = text(oklch(0%, 0, 0deg, 0%))[Este documento utiliza o Modelo de Trabalhos Acadêmidos para UDESC, criado por Lucas Bublitz]

  //Capa
  let cover() = { 
  page(numbering: none)[
      #set text(weight: "bold")
      #set align(center)
      UNIVERSIDADE DO ESTADO DE SANTA CATARINA – UDESC\
      CENTRO DE CIÊNCIAS TECNOLÓGICAS – CCT\
      DEPARTAMENTO DE ENGENHARIA ELÉTRICA – DEE\
      #upper(authors)
    
      #place(horizon + center)[
        #upper(block(title))
      ]
    
      #place(bottom + center)[
        #credit()\
        JOINVILLE\
        2024
      ]
    ]
  }

  //Anverso (obverse)
  let obverse() = page(numbering: none)[
    #set align(center)
    #v(3em)
    #upper(authors)
    #v(13em)
    #upper(block(title))
    #v(7em)
    #pad(left: 8cm)[
      #align(left)[
        #par(justify: true)[
          Artigo apresentado ao curso de graduação em direito do Centro Universitário - Católica de Santa Catarina, como requisito parcial para obtenção do título de Bacharel em Direito.\
          \
          Orientador: Dr. Prof. Jeison Heiler
        ]
      ]
    ]
    #place(bottom + center)[
      JOINVILLE\
      2024
    ]
  ]

  // Epígrafe (epigraph)
  let epigraph() = page(numbering: none)[
    #place(bottom + right)[
      #box(width: 8cm)[
       #align(left)[
          _Somos por essa causa, essa somente,\
          perdidos, mas nossa pena é só esta:\
          sem esperança, ansiar eternamente"._\
          \
          (A Divina Comédia, Canto IV, 40-42, Dante Alighieri)
        ]
      ]
    ]
  ]

  //Agradecimento
  let acknowledgments() = page(numbering: none)[
    #align(center, [*AGRADECIMENTOS*])
    #v(2em)
    #lorem(300)
  ]

  //Abstract
  let abstract(text) = page(numbering: none)[
      #align(center, [*RESUMO*])
      #v(1em)
      #set par(leading: 0.40em, first-line-indent: 0em)
      #text

      *Palavras-chave*: Seguridade Social. Crítica do Direito. Direito.

  ]
  
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
  cover()
  obverse()
  acknowledgments()
  abstract(abstract)
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
