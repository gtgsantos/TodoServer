defmodule TodoList do
  @moduledoc """
  Documentation for `TodoList`.
  """

  @type t :: %__MODULE__{
          next_id: integer(),
          entries: %{integer() => map()}
        }

  defstruct next_id: 1, entries: %{}

  @doc """
  Creates a new `TodoList` struct.

  ## Examples

      iex> TodoList.new()
      %TodoList{next_id: 1, entries: %{}}
  """
  @spec new() :: t()
  def new(), do: %TodoList{}

  @doc """
  Adds a new entry to the `TodoList`.

  ## Examples

      iex> list = TodoList.new()
      %TodoList{next_id: 1, entries: %{}}
      iex> list = TodoList.add_entries(list, %{date: ~D[2023-01-01], title: "Charles"})
      %TodoList{next_id: 2, entries: %{1 => %{date: ~D[2023-01-01], title: "Charles", id: 1}}}
      iex> TodoList.add_entries(list, %{date: ~D[2023-01-01], title: "John"})
      %TodoList{next_id: 3, entries: %{1 => %{date: ~D[2023-01-01], title: "Charles", id: 1}, 2 => %{date: ~D[2023-01-01], title: "John", id: 2}}}
  """
  @spec add_entries(t(), map()) :: t()
  def add_entries(todo_list, entry) do
    # adds an id to entry
    entry = Map.put(entry, :id, todo_list.next_id)

    # adds new entry to todo's list entries, generating new entry list
    new_entries = Map.put(todo_list.entries, todo_list.next_id, entry)

    %TodoList{todo_list | entries: new_entries, next_id: todo_list.next_id + 1}
  end

  @doc """
  Retrieves all entries for a given date in the `TodoList`.

  ## Examples

      iex> list = TodoList.new()
      %TodoList{next_id: 1, entries: %{}}
      iex> list = TodoList.add_entries(list, %{date: ~D[2023-01-01], title: "Charles"})
      %TodoList{next_id: 2, entries: %{1 => %{date: ~D[2023-01-01], title: "Charles", id: 1}}}
      iex> TodoList.get_entries(list, ~D[2023-01-01])
      [%{date: ~D[2023-01-01], title: "Charles", id: 1}]
  """
  @spec get_entries(t(), Date.t()) :: [map()]
  def get_entries(todo_list, date) do
    todo_list.entries
    |> Map.values()
    |> Enum.filter(fn value -> Map.get(value, :date, []) == date end)
  end

  def update_entry(todo_list, key, update_function) do
    case Map.fetch(todo_list.entries, key) do
      :error ->
        todo_list

      {:ok, value} ->
        new_entry = update_function.(value)
        new_entries = Map.put(todo_list.entries, key, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end
end
