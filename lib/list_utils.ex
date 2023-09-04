defmodule ListUtils do
  @spec sum_list(list, Integer.t()) :: any
  def sum_list([], total), do: total

  def sum_list([head | tail], total) when is_number(head) do
    sum_list(tail, total + head)
  end

  def sum_list([_ | tail], total), do: sum_list(tail, total)
end
