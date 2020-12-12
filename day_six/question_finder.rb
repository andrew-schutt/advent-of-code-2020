#!/usr/bin/env ruby

puts "Test Input Answer: "
puts File.read('test-input.txt').split("\n\n").each {|char| char.gsub!("\n", '')}.map(&:chars).each { |a| a.uniq! }.inject(0) { |sum, a| sum += a.size }

puts "Part One Answer: "
puts File.read('custom-declarations.txt').split("\n\n").each {|char| char.gsub!("\n", '')}.map(&:chars).each { |a| a.uniq! }.inject(0) { |sum, a| sum += a.size }

puts "Part Two Answer: "
puts File.read('custom-declarations.txt').split("\n\n").map{ |a| a.split.map(&:chars) }.map { |chunk| chunk.reduce(:&).size }.sum