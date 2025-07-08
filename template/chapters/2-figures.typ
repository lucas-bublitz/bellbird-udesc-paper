
#import "../pacakges.typ": *

= Figuras

Em Typst, todas as figuras devem ser declaradas utilizando a função ``` figure()``` para que façam parte do escopo de contagem do documento, sendo imagem, tabela, gráfico ou mesmo código fonte. O tipo da figura é determinando automaticamente pelo compilador com base sem seu conteúdo, e posse ser definido, manualmente, por meio do atributo ``` supplement:``` conforme no exemplos seguintes.

#figure(
  caption: [Implementação funcional de Fibonacci em Julia],

```julia
function naiveFibonacci(n::Integer)::Integer
  if n == 0
    return 0
  end
  if n == 1
    return 1
  end
  naiveFibonacci(n - 1) + naiveFibonacci(n - 2)
end

```)

#figure(
  caption: [Implementação funcional de Fibonacci em Julia],
  [
    ```
    asd
    ```
  ]
)