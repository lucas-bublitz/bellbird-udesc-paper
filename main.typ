//tUDESC é um delo para trabalhos acadêmicos da UDESC,
//sua utilização é livre e gratuita.

#import "macros.typ": *
#import "template.typ": udesc
#let config = (
  campus: [Centro de Ciências Tecnológicas -- CCT],
  departament: [PROGRAMA DE PÓS-GRADUAÇÃO – SIGLA OU NOME DO CURSO],
  abstract: lorem(100),  
  title : [Manual de Trabalho Acadêmico da UDESC],
  city: "Joinville",
  year: 2024,
  author : "Lucas Bublitz",
  obverse: [Artigo apresentado ao curso de graduação em direito do Centro Universitário - Católica de Santa Catarina, como requisito parcial para obtenção do título de Bacharel em Direito.\ \
            Orientador: Dr. Prof. Miguel de Cervantes],
  epigraph : [_Somos por essa causa, essa somente,\
            perdidos, mas nossa pena é só esta:\
            sem esperança, ansiar eternamente._\ \
            (A Divina Comédia, Canto IV, 40-42, Dante Alighieri)],
  acknowledgments : [Eu quero me agradecer por acreditar em mim mesmo, quero me agradecer por todo esse trabalho duro. Quero me agradecer por não tirar folgas. Quero me agradecer por nunca desistir. Quero me agradecer por ser generoso e sempre dar mais do que recebo. Quero me agradecer por tentar sempre fazer mais o certo do que o errado. Quero me agradecer por ser eu mesmo o tempo inteiro.],
  keywords: ("Primeira", "Segunda", "Terceira")
)
#show: doc => udesc(
  config,
  doc
)
 
= Introdução

#lorem(100)

#quote[
  #lorem(100)
  @Borges2014  
]

#lorem(100)

#range(0,1)

== C


dfsdfs sbb