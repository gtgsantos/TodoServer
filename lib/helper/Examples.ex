defmodule Examples do
  def adicionar_valor([], valor), do: [valor] ## apesar de colocar valor no final, ele náo é eficiente O(n)
  def adicionar_valor([head | tail], valor) do
    IO.puts("x")
    [head | adicionar_valor(tail, valor)]
  end

  def ex do
    tupla = {10, "dez"}
    {numero, descricao} = tupla

    {_, b} = tupla

    IO.inspect(b)
    # tupla = {11, "onze"}            /// descomentando este bloco,
    # {numero, ^descricao} = tupla    /// esta linha vai dar erro, pois descricao é diferente
    # {^numero, descricao} = tupla    /// esta linha vai dar erro, pois numero é diferente

    {date, time} = :calendar.local_time()
    {year, month, day} = date
    {hour, minute, second} = time

    # IO.inspect(year)
    # IO.inspect(minute)

    # maneiras diferentes de se referenciar à uma lista
    #  uma lista se constitui de head e tail, [head | tail] ; head é o primeiro valor e tail é o restante da lista
    [1 | [2, 3]] == [1 | [2 | [3]]]
    [1 | [2, 3]] == [1, 2, 3]
    [1 | [2 | [3]]] == [1, 2, 3]
    [1 | [2 | [3 | []]]] == [1 | [2 | [3]]]

    # head O(1)
    hd([1, 2, 3, 4])
    # tail O(1)
    tl([1, 2, 3, 4])

    # é mais interessante adicionar objetos na lista através do topo do que do final, pois é mais eficiente

    # concatenar listas
    [1, 2, 3] ++ [4, 5]

    :ok_ok
  end
end
