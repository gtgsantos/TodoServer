defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "check if TodoList is adding correctly" do
    teste =
      TodoList.new()

    teste =
      TodoList.add_entries(teste, %{date: ~D[2023-02-03], name: "nome 1"})
      |> TodoList.add_entries(%{date: ~D[2023-02-04], name: "nome 4"})
      |> TodoList.add_entries(%{date: ~D[2023-02-05], name: "nome 5"})

    assert TodoList.get_entries(teste, ~D[2023-02-03]) == [
             %{id: 1, name: "nome 1", date: ~D[2023-02-03]}
           ]

    teste = TodoList.add_entries(teste, %{date: ~D[2019-01-02], name: "another"})

    assert TodoList.get_entries(teste, ~D[2023-02-03]) == [
             %{id: 1, name: "nome 1", date: ~D[2023-02-03]}
           ]

    assert TodoList.get_entries(teste, ~D[2019-01-02]) == [
             %{id: 4, name: "another", date: ~D[2019-01-02]}
           ]
  end

  test "test when update entry inside todo list" do
    teste =
      TodoList.new()
      |> TodoList.add_entries(%{date: ~D[2023-02-03], name: "nome 1"})
      |> TodoList.add_entries(%{date: ~D[2023-02-04], name: "nome 4"})
      |> TodoList.add_entries(%{date: ~D[2023-02-05], name: "nome 5"})

    teste =
      TodoList.update_entry(
        teste,
        2,
        # fn value -> Map.put(value, :date, ~D[2025-01-01]) end
        &Map.put(&1, :date, ~D[2025-01-01])
      )

    response_name =
      TodoList.get_entries(teste, ~D[2025-01-01])
      |> Enum.at(0)
      |> Map.fetch(:name)

    assert response_name == {:ok, "nome 4"}
  end

  test "test an simplified way to update value" do
    todo_list_entries = %{
      1 => %{date: ~D[2024-02-01], name: "nome 1"},
      2 => %{date: ~D[2024-02-02], name: "nome 2"},
      3 => %{date: ~D[2024-02-03], name: "nome 3"}
    }

    todo_list = %TodoList{entries: todo_list_entries, next_id: 4}

    teste = TodoList.update_entry_2(todo_list, [1, :name], "updated name")

    assert TodoList.get_entries(teste, ~D[2024-02-01])
           |> Enum.at(0)
           |> Map.fetch(:name) == {:ok, "updated name"}
  end
end
