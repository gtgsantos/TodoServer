defmodule Todo.CsvFileHelper do
  def read_from_file!(path) do
    File.stream!(path)
    |> Enum.map(&String.trim_trailing(&1))
    |> Enum.map(&String.split(&1, ", "))

    # rescue
    #   e in File.Error ->
    #     case e.reason do
    #       :enoent ->
    #         IO.puts("Arquivo não encontrado: #{e.path}")
    #         []

    #       _ ->
    #         raise e
    #     end
  end
end
