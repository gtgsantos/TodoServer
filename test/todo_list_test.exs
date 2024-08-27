defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "check if TodoList is adding correctly" do
    teste =
      TodoList.new()

    teste =
      TodoList.add_entries(teste, ~D[2023-02-03], "nome 1")
      |> TodoList.add_entries(~D[2023-02-04], "nome 4")
      |> TodoList.add_entries(~D[2023-02-05], "nome 5")

    assert TodoList.get_entries(teste, ~D[2023-02-03]) == ["nome 1"]

    teste = TodoList.add_entries(teste, ~D[2019-01-02], "another")

    assert TodoList.get_entries(teste, ~D[2023-02-03]) == ["nome 1"]
    assert TodoList.get_entries(teste, ~D[2019-01-02]) == ["another"]

    assert TodoServer.hello() == :world
  end
end
