#!/usr/bin/env ruby

require 'minitest/autorun'

PASSPORT_FIELD_REGEX = /(\w+{3})\:(\S+)/

class PassportValidatorTest < Minitest::Test
  def test_valid_test_input
    passport_batch = File.read('test-input.txt').split("\n\n").map do |passport|
      passport.scan(PASSPORT_FIELD_REGEX).to_h
    end

    assert passport_includes_all_fields(passport_batch) == 2
  end

  def test_valid_fields
    passport_batch = File.read('test-valid-input.txt').split("\n\n").map do |passport|
      passport.scan(PASSPORT_FIELD_REGEX).to_h
    end

    assert passport_includes_all_valid_fields(passport_batch) == 4
  end

  def test_invalid_fields
    passport_batch = File.read('test-invalid-input.txt').split("\n\n").map do |passport|
      passport.scan(PASSPORT_FIELD_REGEX).to_h
    end

    assert passport_includes_all_valid_fields(passport_batch) == 0
  end
end

passport_batch = File.read('passport-batch.txt').split("\n\n").map do |passport|
  passport.scan(PASSPORT_FIELD_REGEX).to_h
end

VALID_FIELDS = %w(byr iyr eyr hgt hcl ecl pid)

def passport_includes_all_fields(passports)
  count = 0
  passports.each do |passport|
    count += 1 if VALID_FIELDS.all? { |field| passport.key? field }
  end
  count
end

puts passport_includes_all_fields(passport_batch)

HAIR_COLOR_REGEX = /\A#[0-9a-f]{6}\z/
PASSPORT_ID_REGEX = /\A\d{9}\z/
VALID_EYE_COLORS = %w(amb blu brn gry grn hzl oth)

def valid_height?(height)
  if height[-2] == 'c'
    height.between?('150cm', '193cm')
  elsif height[-2] == 'i'
    height.between?('59in', '76in')
  end
end

def passport_fields_valid?(passport)
  (passport['byr'].between?('1920', '2002') && passport['iyr'].between?('2010', '2020') && passport['eyr'].between?('2020', '2030') &&
  valid_height?(passport['hgt']) &&
  passport['hcl'].match?(HAIR_COLOR_REGEX) && VALID_EYE_COLORS.include?(passport['ecl']) && passport['pid'].match?(PASSPORT_ID_REGEX))
end

def passport_includes_all_valid_fields(passports)
  count = 0
  passports.each do |passport|
    if (VALID_FIELDS.all? { |field| passport.key? field })
      count += 1 if passport_fields_valid?(passport)
    end
  end
  count
end

puts passport_includes_all_valid_fields(passport_batch)