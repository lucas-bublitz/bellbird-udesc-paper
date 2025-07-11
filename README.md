# paper-udesc

This is an academic template for dissertations and theses, based on the formatting guidelines provided by the **Universidade do Estado de Santa Catarina (UDESC)**. This is **not an official project**.

All **pre-textual elements** have been automated, along with a few style conventions. The goal of this template is to simplify the formatting process for academic writing according to institutional norms, allowing you to focus on content rather than layout.

## Configuration

The template exports the `paper-udesc` function with the following **named arguments**:

### Required Arguments

| Argument          | Description |
|-------------------|-------------|
| `title`           | Main title of the work. |
| `subtitle`        | Subtitle of the work. |
| `author`          | Name of the author (string). |
| `advisor`         | A dictionary with `name`, `titulation`, and `institution`. |
| `committee`       | An array of dictionaries (same format as `advisor`) for the examination board. |
| `campus`          | Name of the UDESC center or campus. |
| `departament`     | Name of the academic program or department. |
| `class`           | Type of work (e.g., `Tese`, `Dissertação`, `TCC`). |
| `abstract`        | Abstract in Portuguese. |
| `keywords`        | Array of keywords in Portuguese. |
| `foreignAbstract` | Abstract in a second language (usually English). |
| `foreignKeywords` | Keywords matching the foreign abstract. |
| `obverse`         | Text on the reverse of the title page. |
| `city`            | City of the institution. |
| `date`            | A dictionary with: `day` (int), `month` (string), and `year` (int). |

### Optional Arguments

These arguments are optional. If omitted, the related section is not shown:

| Argument          | Description |
|-------------------|-------------|
| `dedication`      | Dedication section. |
| `acknowledgments` | Acknowledgments section. |
| `epigraph`        | Epigraph, including optional source/citation. |


## Pre-textual Elements 

The following elements are always generated and required for the institucional manual:

| Page                         | Triggered by Arguments                                       | Notes |
|------------------------------|--------------------------------------------------------------|-------|
| **Cover** (`Capa`)           | `title`, `author`, `campus`, `departament`, `class`, `city`, `date` | Shows university info, title, author, and year. |
| **Title Page** (`Folha de rosto`) | `title`, `author`, `obverse`, `advisor`, `city`, `date`       | Includes institutional info and advisor. |
| **Abstract in Portuguese** (`Resumo`) | `abstract`, `keywords`                                   | Shown with header `RESUMO` and keywords in Portuguese. |
| **Abstract in English** (`Abstract`) | `foreignAbstract`, `foreignKeywords`                    | Usually English. Shown with header `ABSTRACT`. |
| **List of Figures** (`Lista de Figuras`)         | Auto-generated when `figure.where(kind: image)` is present   | Uses built-in `outline` logic. |
| **List of Tables** (`Lista de Tabelas`)           | Auto-generated when `figure.where(kind: table)` is present   | Uses built-in `outline` logic. |
| **Table of Contents** (`Sumário`) | Generated from headings                                    | Includes all visible headings using `outline`. |

---

### Optional 

The following sections are only rendered **if their arguments are provided** or flags enabled:

| Page                         | Trigger Argument         | Notes |
|------------------------------|--------------------------|-------|
| **Catalog Sheet** (`Ficha catalográfica`) | `index-card: true` (default) | Generates cataloging block at bottom of page. |
| **Approval Sheet** (`Folha de aprovação`) | `committee` (array of members) | Includes advisor and board members. |
| **Dedication** (`Dedicatória`) | `dedication` | Rendered as a quiet page, bottom-left aligned. |
| **Acknowledgments** (`Agradecimentos`) | `acknowledgments` | Includes centered heading and standard paragraph. |
| **Epigraph** (`Epígrafe`) | `epigraph` | Displayed at the bottom-left, similar to dedication. |

## Style Automations

The `paper-udesc` Typst template automates some visual and structural formatting aspects, like the followings:


| Element                     | Automated Behavior                                                                 |  Notes |
|----------------------------|--------------------------------------------------------------------------------------|------------|
| **Paragraphs**             | Justified text with 3em first-line indent and 1em spacing between paragraphs         | `par(justify: true, first-line-indent: 3em, spacing: 1em)` |
| **Text Font**              | Uses Arial, 12pt, with hyphenation enabled for Portuguese                           | `text(font: "Arial", size: 12pt, lang: "pt", hyphenate: true)` |
| **Headings – Level 1**     | Bold, uppercase, starts on a new page (soft break)                                  | `pagebreak(weak: true)`, `upper(...)`, `text(weight: "bold")` |
| **Headings – Level 2**     | Regular weight, uppercase                                                           | `text(weight: "regular")`, `upper(...)` |
| **Headings – Level 3**     | Bold, mixed case                                                                    | `text(weight: "bold")` |
| **Headings – Level 4**     | Regular weight, enclosed in brackets                                                | `[_ #that _]`, `text(weight: "regular")` |
| **Equations**              | Left-aligned, auto-numbered with vertical spacing                                   | `math.equation(numbering: "(1)")`, `linebreak()` |
| **Quotes – Short**         | Rendered with quotation marks                                                       | Uses Typst's native `quote` behavior |
| **Quotes – Long**          | If ≥ 243 characters: block quote, 10pt, indented 4cm, tight leading                 | `quote` with style: `text(size: 10pt)`, `pad(left: 4cm)` |
| **Figures – Caption**      | Caption shown above figure                                                          | `figure.caption(position: top)` |
| **Figures – Source**       | If a citation is present, shows “Fonte: …” (The @ must be placed at the end of the figure content.)                               | `show ref: that => [Fonte: #cite(...)]` |
| **Figures – Code blocks**  | Raw figures labeled as “Código-fonte”                                               | `show figure.where(kind: raw): set figure(supplement: [Código-fonte])` |
| **Bibliography**           | ABNT style, centered heading, no first-line indent                                  | `bibliography(..., style: "associacao-brasileira-de-normas-tecnicas.csl")` |

The template will initialize your with a sample call to the `paper-udesc` function in a show rule, along with some examples and a starter structure file to organize the text (not yet).

```typ
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
  author : "Snoop Dog",
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
  index-card: true
)

// Aqui começam os elementos textuais!
```