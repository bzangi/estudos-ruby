numbers = [1, 2, 3, 4]

puts numbers.reduce(0) { |sum, number| sum + number}
puts numbers.reduce(:+)

