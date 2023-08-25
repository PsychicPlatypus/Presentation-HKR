defmodule Bank do
  @spec start :: {:ok, :exit}
  def start(), do: handle(%{total: 0}, :start)

  defp handle(data, :start) do
    name = IO.gets("Please enter your name?\n") |> String.trim()
    last_name = IO.gets("Please enter your last name?\n") |> String.trim()

    data = data |> Map.put(:name, name) |> Map.put(:last_name, last_name)

    IO.puts("Good Day #{name} #{last_name}!")
    handle(data, :menu)
  end

  defp handle(%{total: total} = data, :menu) do
    IO.gets("\nBalance #{total}\nWould you like to?\n1. Deposit\n2. Withdraw\n3. Exit\n> ")
    |> String.trim()
    |> Integer.parse()
    |> case do
      {1, _} ->
        handle(data, :deposit)

      {2, _} ->
        handle(data, :withdraw)

      {3, _} ->
        handle(data, :exit)

      _ ->
        handle(data, :menu)
    end
  end

  defp handle(data, :deposit) do
    with {amount, _} <- IO.gets("How much to deposit?\n> ") |> String.trim() |> Integer.parse() do
      if amount < 0 do
        IO.puts("The amount must be higher than 0!")
        handle(data, :menu)
      else
        data = data |> Map.update(:total, 0, fn prev -> prev + amount end)
        handle(data, :menu)
      end
    else
      _ ->
        IO.puts("Invalid input")
        handle(data, :deposit)
    end
  end

  defp handle(%{total: total} = data, :withdraw) do
    with {amount, _} <- IO.gets("How much to withdraw?\n> ") |> String.trim() |> Integer.parse() do
      if amount < 0 or amount > total do
        IO.puts("The amount must be higher than 0 and lower than #{total}!")
        handle(data, :menu)
      else
        data = data |> Map.update(:total, 0, fn prev -> prev - amount end)
        handle(data, :menu)
      end
    else
      _ ->
        IO.puts("Invalid input")
        handle(data, :withdraw)
    end
  end

  defp handle(data, :exit) do
    data |> tap(&IO.inspect(&1, label: "💵"))
    {:ok, :exit}
  end
end
