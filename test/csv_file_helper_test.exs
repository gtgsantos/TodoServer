defmodule CsvFileHelperTest do
  use ExUnit.Case

  test "test should return an array of values for todo lists" do
    path =
      "/Users/gtgsantos/Documents/projects/elixir/TodoServer/test/resources/todo_list_example.csv"

    value = Todo.CsvFileHelper.read_from_file!(path)

    val1 =
      value
      |> Enum.at(0)
      |> Enum.at(0)

    assert val1 == "João"
  end
end
