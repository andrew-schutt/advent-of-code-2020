#!/usr/bin/env ruby

require 'minitest/autorun'

class BoardingPassTest < Minitest::Test
  def test_computes_seat_id_FBFBBFFRLR
    assert boarding_pass_calc('FBFBBFF'.split(''), 'RLR'.split(''), (0..127).to_a, (0..7).to_a) == 357
  end

  def test_computes_seat_id_BFFFBBFRRR
    seat_id = boarding_pass_calc('BFFFBBF'.split(''), 'RRR'.split(''), (0..127).to_a, (0..7).to_a)
    assert seat_id == 567
  end

  def test_computes_seat_id_FFFBBBFRRR
    seat_id = boarding_pass_calc('FFFBBBF'.split(''), 'RRR'.split(''), (0..127).to_a, (0..7).to_a)
    assert seat_id == 119
  end

  def test_computes_seat_id_BBFFBBFRLL
    seat_id = boarding_pass_calc('BBFFBBF'.split(''), 'RLL'.split(''), (0..127).to_a, (0..7).to_a)
    assert seat_id == 820
  end
end

def boarding_pass_calc(row_nav, column_nav, rows, columns)
  return (rows[0] * 8 + columns[0]) if rows.size == 1 && columns.size == 1
  if columns.size > 1
    half = columns.size / 2
    columns.slice!(half..columns.size) if column_nav[0] == 'L'
    columns.slice!(0..half - 1) if column_nav[0] == 'R'
    column_nav.shift
  end

  half = rows.size / 2
  rows.slice!(half..rows.size) if row_nav[0] == 'F'
  rows.slice!(0..half - 1) if row_nav[0] == 'B'
  row_nav.shift

  boarding_pass_calc(row_nav, column_nav, rows, columns)
end

seat_ids = File.read('boarding-pass-input.txt').split("\n").map do |pass|
  boarding_pass_calc(pass.slice(0..6).split(''), pass.slice(7..9).split(''), (0..127).to_a, (0..7).to_a)
end

puts seat_ids.max()

puts ((seat_ids.min..seat_ids.max).to_a - seat_ids).to_a.first