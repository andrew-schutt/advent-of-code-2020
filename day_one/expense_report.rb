#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'expense_report_input'

class ExpenseReportTest < Minitest::Test
  def test_brute_force_returns_correct_value
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert value_finder(test_input) == 514579
  end

  def test_permutation_returns_correct_value_for_two
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert find_2020_sum_value(test_input, 2) == 514579
  end

  def test_permutation_returns_correct_value_for_three
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert find_2020_sum_value(test_input, 3) == 241861950
  end
end

def value_finder(expense_report_input)
  twenty_twenty_together = []
  expense_report_input.each do |x|
    expense_report_input.each do |y|
      if x + y == 2020
        twenty_twenty_together << x
        twenty_twenty_together << y
      end
    end
    if twenty_twenty_together.length > 0
      break
    end
  end
  puts twenty_twenty_together.inject(:*)
  return twenty_twenty_together.inject(:*)
end

def find_2020_sum_value(expense_report_input, number_count)
  # .permutation returns all possible permutations of an arry of the size "number_count"
  # the block passed in then finds the permutation that sums to the value of "2020"
  # when that block breaks it will return the permuation array which has ".inject(:*)" called on it
  # the result of inject returns the product of the array permuation that sums to 2020
  sum = expense_report_input.permutation(number_count) { |perm| break perm if perm.sum == 2020 }.inject(:*)
  puts sum
  sum
end

value_finder(expense_report_input)
find_2020_sum_value(expense_report_input, 2)
find_2020_sum_value(expense_report_input, 3)