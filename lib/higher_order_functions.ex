defmodule HigherOrderFunctions do
  # write Live
  @spec convert_player_times_to_hours(list({:string, integer})) :: map()
  def convert_player_times_to_hours(player_times) when is_list(player_times) do
    player_times
    |> Enum.map(fn {player_name, time} -> {player_name, time / 60} end)
    |> Enum.map(fn {player_name, time} -> {Macro.camelize(player_name), time} end)
    |> Enum.reduce(%{}, fn {player_name, hours}, acc -> Map.put(acc, player_name, hours) end)
  end

  def pipeline_demonstration(value) do
    value
    |> Enum.map(fn x -> x * 2 end)
    |> Enum.reduce([1, 2], fn x, acc -> [x | acc] end)
    |> Enum.filter(fn x -> div(x, 2) == 0 end)
  end
end
