#!/usr/bin/env ruby

require 'minitest/autorun'

tree_map = File.read('tree-map.txt').split("\n").map(&:chars).map { |line| line * 100 }

class TobogganTreeMapTraverserTest < Minitest::Test
  def test_returns_correct_count
    test_tree_map = File.read('test-input.txt').split("\n").map(&:chars).map { |line| line * 100 }
    assert toboggan_tree_map_traversal(test_tree_map) == 7
  end
end

# Part 1
def toboggan_tree_map_traversal(tree_map)
  tree_count = 0
  tree_map.each_with_index do |row, index|
    tree_count += 1 if tree_map[index][index * 3] == "#"
  end
  tree_count
end

puts toboggan_tree_map_traversal(tree_map)

# Part 2

class TobogganSlopeTest < Minitest::Test
  def test_returns_correct_count
    test_tree_map = File.read('test-input.txt').split("\n").map(&:chars).map { |line| line * 100 }
    assert toboggan_slope(test_tree_map) == 336
  end
end

def toboggan_slope(tree_map)
  slopes = [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2]
  ]

  slopes.map do |slope|
    tree_count = 0

    column = 0
    row_count= 0

    while row_count < tree_map.size
      tree_count += 1 if tree_map[row_count][column] == '#'
      column += slope[0]
      row_count += slope[1]
    end

    tree_count
  end.reduce { |acc, res| acc * res }
end

puts toboggan_slope(tree_map)