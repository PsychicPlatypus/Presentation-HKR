defmodule MathOperations do
  def calculate(a, b) do
    with {:ok, result} when is_float(result) <- divide(a, b),
         {:ok, squared} when is_float(squared) <- square(result) do
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
