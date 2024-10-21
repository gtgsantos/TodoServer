defmodule Todo.DatabaseServer do
  def start do
    spawn(&loop/0)
  end

  defp loop do
    IO.puts("aaa")

    receive do
      :m ->
        IO.puts("www")

      {:message_type, value} ->
        IO.puts("teste teste")

      {:run_query, caller, query_def} ->
        send(caller, {:query_result, run_query(query_def)})
    end

    loop()
  end

  defp run_query(query_def) do
    :timer.sleep(2000)
    "#{query_def} result"
  end

  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  def get_result do
    receive do
      {:query_result, result} -> result
    after
      5000 ->
        {:error, :timeout}
    end
  end
end
