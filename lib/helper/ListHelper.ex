defmodule ListHelper do
  def sum([]), do: 0

  def sum([head | tail]) do
    IO.puts(head)
    IO.puts(tail)
    IO.puts("---")
    head + sum(tail)
  end
end
