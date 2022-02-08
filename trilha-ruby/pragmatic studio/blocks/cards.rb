cards = %w[Jack Queen King Ace Joker]

cards.reverse_each { |c| puts c.upcase + ' - ' + c.length.to_s}

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

scores.each { |name, score| puts "#{name} scored a #{score}!" }