def n_times(n)
  1.upto(n){ |i| yield(i) }
end

n_times(5) do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end