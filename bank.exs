defmodule Bank do
  def handle(data, :start) do
    name = IO.gets("Please enter your name?\n") |> String.trim()
    last_name = IO.gets("Please enter your last name?\n") |> String.trim()
    data = data |> Map.put("name", name) |> Map.put("last_name", last_name)
    IO.inspect("Good Day #{name} #{last_name}!")
    handle(data, :menu)
  end

  def handle(%{"last_name" => _, "name" => _, "total" => total} = data, :menu) do
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
        handle(data, :exit)
    end
  end

  def handle(data, :deposit) do
    {amount, _} = IO.gets("How much to deposit?\n> ") |> String.trim() |> Integer.parse()

    if amount < 0 do
      IO.puts("The amount must be higher than 0!")
      handle(data, :menu)
    else
      data = data |> Map.update("total", 0, fn prev -> prev + amount end)
      handle(data, :menu)
    end
  end

  def handle(%{"total" => total} = data, :withdraw) do
    {amount, _} = IO.gets("How much to withdraw?\n> ") |> String.trim() |> Integer.parse()

    if amount < 0 or amount > total do
      IO.puts("The amount must be higher than 0 and lower than #{total}!")
      handle(data, :menu)
    else
      data = data |> Map.update("total", 0, fn prev -> prev - amount end)
      handle(data, :menu)
    end
  end

  def handle(data, :exit) do
    data |> tap(&IO.inspect(&1, label: "💵"))
    {:ok, :exit}
  end
end


Bank.handle(%{"total" => 0}, :start)
