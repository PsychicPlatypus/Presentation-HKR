defmodule ListUtils do
  defp sum_list([], total), do: total
  defp sum_list([head | tail], total) when is_number(head) do
    sum_list(tail, total + head)
  end
  defp sum_list([_ | tail], total), do: sum_list(tail, total)
end


defmodule MathOperations do
  def calculate(a, b) do
    with {:ok, result} when is_integer(result) <- divide(a, b),
         {:ok, squared} when is_integer(squared) <- square(result) do
      {:ok, squared}
    else
      {:ok, result} when is_integer(result) ->
        {:error, "Squaring failed for #{result}"}
      {:ok, _} ->
        {:error, "Division failed"}
      :error ->
        {:error, "Invalid input"}
    end
  end

  defp divide(a, b) do
    if b != 0, do: {:ok, a / b}, else: :error
  end

  defp square(x) do
    if x >= 0, do: {:ok, x * x}, else: :error
  end
end

IO.inspect(MathOperations.calculate(16, 2))  # Output: {:ok, 256}

list = [1, 2, 3, "four", 5]

result = ListUtils.sum_list(list, 0)
IO.puts("Sum of numbers in the list: #{result}")
