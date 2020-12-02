#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'password_input'

class PasswordValidatorTest < Minitest::Test
  def test_returns_two_valid_passwords_style_1
    password_input = [
      '1-3 a: abcde', # valid
      '1-3 b: cdefg', # invalid
      '2-9 c: ccccccccc' # valid
    ]

    assert password_validator(password_input, 1) == 2
  end

  def test_returns_zero_no_valid_passwords_style_1
    password_input = [
      '1-3 b: cdefg',
      '2-9 c: cccccccccc'
    ]

    assert password_validator(password_input, 1) == 0
  end

  def test_returns_msg_for_invalid_style
    password_input = [
      '1-3 b: cdefg',
      '2-9 c: cccccccccc'
    ]

    assert password_validator(password_input, 99) == "You wat m8"
  end

  def test_returns_one_valid_passwords_style_2
    password_input = [
      '1-3 a: abcde', # valid
      '1-3 b: cdefg', # invalid
      '2-9 c: ccccccccc' # invalid
    ]

    assert password_validator(password_input, 2) == 1
  end

  def test_returns_zero_valid_passwords_style_2
    password_input = [
      '1-3 b: cdefg',
      '2-9 c: ccccccccc'
    ]

    assert password_validator(password_input, 2) == 0
  end
end

def password_validator(passwords, style)
  return "You wat m8" unless [1, 2].include?(style)
  valid_password_count = 0
  passwords.each do |password_to_validate|
    valid_password_count += 1 if valid_password?(password_to_validate, style)
  end
  return valid_password_count
end

def valid_password?(password_to_validate, style)
  policy, rule, password = password_to_validate.split(' ')
  x, y = policy.split('-')
  rule.sub!(':', '')
  if style == 1
    return (x.to_i..y.to_i).include?(password.count(rule))
  elsif style == 2
    return (password[x.to_i - 1] == rule) ^ (password[y.to_i - 1] == rule)
  end
end

puts password_validator(passwords, 1)
puts password_validator(passwords, 2)
