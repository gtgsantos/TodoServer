defmodule TodoServer do
  def start do
    spawn(fn -> loop(TodoList.new()) end)
  end

  defp loop(todo_list) do
    IO.puts("#5")

    new_todo_list =
      receive do
        message ->
          IO.puts("#2")
          process_message(todo_list, message)
      end

    loop(new_todo_list)
  end

  def add_entry(todo_server, new_entry) do
    IO.puts("#1")
    send(todo_server, {:add_entry, new_entry})
  end

  defp process_message(todo_list, {:add_entry, new_entry}) do
    IO.puts("#3")
    TodoList.add_entries(todo_list, new_entry)

    # IO.puts("zz")
  end

  defp process_message(todo_list, {:entries, caller, date}) do
    send(caller, {:todo_entries, TodoList.entries(todo_list, date)})
    todo_list
  end

  def entries(todo_server, date) do
    send(todo_server, {:entries, self(), date})

    receive do
      {:todo_entries, entries} -> entries
    after
      5000 ->
        {:error, :timeout}
    end
  end
end
