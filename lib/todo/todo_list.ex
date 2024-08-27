defmodule TodoList do
  
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

  def new(), do: MultiDict.new()

  # @spec add_entries(Date.t() | nil, String.t() | nil) :: %TodoList{}
  def add_entries(list \\ new(), date \\ Date.utc_today(), title \\ "Empty") do
    MultiDict.add_entries(list, date, title)
  end

  def get_entries(list, date) do
    MultiDict.get_entries(list, date)
  end
end
