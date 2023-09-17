defmodule BinaryTree do
  defstruct value: nil, left: nil, right: nil

  def insert(nil, value), do: %BinaryTree{value: value}

  def insert(%BinaryTree{value: existing_value, left: left} = tree, value)
      when value < existing_value do
    %BinaryTree{tree | left: insert(left, value)}
  end

  def insert(%BinaryTree{value: existing_value, right: right} = tree, value)
      when value >= existing_value do
    %BinaryTree{tree | right: insert(right, value)}
  end

  def contains(nil, _value), do: false
  def contains(%BinaryTree{value: value}, value), do: true

  def contains(%BinaryTree{value: existing_value, left: left}, value)
      when value < existing_value do
    contains(left, value)
  end

  def contains(%BinaryTree{value: existing_value, right: right}, value)
      when value >= existing_value do
    contains(right, value)
  end
end

# tree = BinaryTree.insert(nil, 5)
# tree = BinaryTree.insert(tree, 3)
# tree = BinaryTree.insert(tree, 8)
# tree = BinaryTree.insert(tree, 1)
# tree = BinaryTree.insert(tree, 4)
# tree = BinaryTree.insert(tree, 7)
# tree = BinaryTree.insert(tree, 9)

# IO.puts("Contains 4? #{BinaryTree.contains(tree, 4)}")  # Output: Contains 4? true
# IO.puts("Contains 6? #{BinaryTree.contains(tree, 6)}")  # Output: Contains 6? false
