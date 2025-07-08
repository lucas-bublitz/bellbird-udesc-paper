// Modelo de trabalhos acadêmicos da UDESC
// Não é um projeto oficial!

// Atualemnte, o typst não fornece uma modo de alterar o código do template que está no @preview.
// Assim, caso seja necessário aditar os elementos de texto gerados internamente na função do template, 
// deve-se adicionar o arquivo .typ localmente, que pode ser obtido em https://github.com/lucas-bublitz/udesc/blob/main/src/lib.typ.

// #import "@preview/udesc:0.0.1": udesc
#import "../src/lib.typ": paper-udesc

#import "pacakges.typ": *

#show: codly-init.with()
#codly(languages: codly-languages)

#show: paper-udesc.with(
  // ARGUMENTOS OBRIGATÓRIOS 
  campus: [Centro de Ciências Tecnológicas -- CCT],
  departament: [Programa de Pós-Graduação em Engenharia Mecânica],
  abstract: lorem(100),
  keywords: ("Primeira", "Segunda", "Terceira"),
  foreignAbstract: lorem(100),
  foreignKeywords: ("First", "Second", "Third"),
  title : [Modelo de Trabalhos Acadêmicos da Udesc],
  subtitle: [em Typst!],
  city: "Joinville",
  date: (
    day: 01,
    month: "janeiro",
    year: 1970
  ),
  author : "Lucas Vinícius Bublitz",
  obverse: [Artigo apresentado ao curso de graduação em alguma coisa do campous tal como requisito parcial para obtenção do título de Bacharel naquela coisa.],
  advisor: (
    name: "Manoel Gomes",
    titulation: "Dr.",
    institution: "Universidade do Estado de Santa Catarina"
  ),
  committee: (
    (
      name: "Stephen Timoshenko",
      titulation: "Dr.",
      institution: "Petersburg State Transport University"
    ),
    (
      name: "Willis Carrier",
      titulation: "Dr. h. c.",
      institution: "Cornell University"
    ),
    (
      name: "Leonhard Euler",
      titulation: "Dr.",
      institution: "University of Basel"
    )
  ),
  class: "Dissertação",
  // ARGUMENTOS OPCIONAIS
  // Estes argumentos quando omitidos fazem com que suas respectivas páginas também o sejam.
  dedication: [Aos alunos da Universidade do Estado de Santa Catarina, altissíssimo.],
  acknowledgments : [Eu quero me agradecer por acreditar em mim mesmo, quero me agradecer por todo esse trabalho duro. Quero me agradecer por não tirar folgas. Quero me agradecer por nunca desistir. Quero me agradecer por ser generoso e sempre dar mais do que recebo. Quero me agradecer por tentar sempre fazer mais o certo do que o errado. Quero me agradecer por ser eu mesmo o tempo inteiro.],
  epigraph : [_Somos por essa causa, essa somente,\ perdidos, mas nossa pena é só esta:\ sem esperança, ansiar eternamente._\ \ (A Divina Comédia, Canto IV, 40-42, Dante Alighieri)],
)


#include "chapters/1-introduction.typ"
#include "chapters/2-figures.typ"


// BIBLIOGRAFIA

#bibliography("bibliography.bib")  

// AENXOS

#set heading(numbering: none)
