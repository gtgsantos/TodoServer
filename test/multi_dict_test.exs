defmodule MultiDictTest do
  use ExUnit.Case

  test "check if MultiDict is adding correctly" do
    teste =
      MultiDict.new()

    teste =
      MultiDict.new()
      |> MultiDict.add_entries(~D[2023-02-03], "nome 1")
      |> MultiDict.add_entries(~D[2023-02-04], "nome 4")
      |> MultiDict.add_entries(~D[2023-02-05], "nome 5")

    assert MultiDict.get_entries(teste, ~D[2023-02-03]) == ["nome 1"]

    teste = MultiDict.add_entries(teste, ~D[2019-01-02], "another")

    assert MultiDict.get_entries(teste, ~D[2023-02-03]) == ["nome 1"]
    assert MultiDict.get_entries(teste, ~D[2019-01-02]) == ["another"]
  end
end
