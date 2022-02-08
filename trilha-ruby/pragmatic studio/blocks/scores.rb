scores = [83, 71, 92, 64, 98, 87, 75, 69]
high_scores = scores.select { |s| s > 80 }
# puts high_scores
low_scores = scores.reject { |s| s > 80 }
# puts '--------'
# puts low_scores
# puts scores.any? { |s| s < 70 }
# puts scores.detect { |s| s < 70 }
p scores
puts '------------'
evens, odds = scores.partition { |s| s.even?}
p evens
p odds
puts '------------'
scores.select! { |s| s > 70 }
p scores
puts '------------'
scores.reject!(&:even?)
p scores
puts '------------'

scores_doubled = scores.map { |s| s * 2 }
p scores_doubled
puts scores.reduce(0, :+)