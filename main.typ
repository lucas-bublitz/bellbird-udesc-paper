//tUDESC é um delo para trabalhos acadêmicos da UDESC,
//sua utilização é livre e gratuita.

#import "macros.typ": *
#import "template.typ": udesc
#let config = (
  abstract: [pipoca],  
  title : [Manual de Trabalho Acadêmico da UDESC],
  authors : "é",
  epigraph : none,
  congratulations : none,
)
//Chamamento da função udesc para todo o documento.
//Essa função aplica o modelo.
#show: doc => udesc(
  config,
  doc
)

= 0000
== ----------
