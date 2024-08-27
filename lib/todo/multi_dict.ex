defmodule MultiDict do
  defstruct title: nil, date: nil

  def new(), do: %{}

  def add_entries(list \\ new(), key \\ Date.utc_today(), value) do
    Map.update(list, key, [value], &[value | &1])
  end

  def get_entries(list, dict) do
    Map.get(list, dict, [])
  end
end
