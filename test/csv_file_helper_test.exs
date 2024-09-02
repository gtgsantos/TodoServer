defmodule CsvFileHelperTest do
  use ExUnit.Case

  @valid_todo_list_file
  "/Users/gtgsantos/Documents/projects/elixir/TodoServer/test/resources/todo_list_example.csv"

  test "test should return an array of values for todo lists" do
    value = Todo.CsvFileHelper.read_from_file(@valid_todo_list_file)
    assert value == 1
  end
end
