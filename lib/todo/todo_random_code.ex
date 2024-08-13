defmodule TodoRandomCode do
  @moduledoc """
  Documentation for `TodoServer`.
  """

  @doc """
  Random snippets for practicing.

  ## Examples

      iex> TodoServer.factorial(3)
      6

  """
  @spec factorial(integer) :: integer
  def factorial(val \\ 0) do
    IO.puts(val)

    case val do
      0 -> 1
      _ -> val * factorial(val - 1)
    end
  end

  def hello do
    :world
  end
end
