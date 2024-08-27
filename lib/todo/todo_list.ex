defmodule TodoList do
  defstruct title: nil, date: nil

  @moduledoc """
  Documentation for `TodoList`.
  """

  @doc """
  Base code to declare a TodoList as a TodoServer's List.

  ## Examples

      iex> list = TodoList.new()
      %{}
      iex> list = TodoList.add_entries(list, ~D[2023-01-01], "Charles")
      %{~D[2023-01-01] => ["Charles"]}
      iex> list = TodoList.add_entries(list, ~D[2023-01-01], "John")
      %{~D[2023-01-01] => ["John", "Charles"]}

  """

  def new(), do: %{}

  # @spec add_entries(Date.t() | nil, String.t() | nil) :: %TodoList{}
  def add_entries(list \\ new(), date \\ Date.utc_today(), title \\ "Empty") do
    Map.update(
      list,
      date,
      [title],
      # %TodoList{date: date, title: title}, #TODO to next version
      fn titles -> [title | titles] end
    )
  end

  def get_entries(list, date) do
    Map.get(list, date, [])
  end
end
