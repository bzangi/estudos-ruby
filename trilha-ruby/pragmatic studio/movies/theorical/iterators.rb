def three_times
  puts 'ready'
  yield 1
  puts 'Set'
  yield 2
  puts 'Go!'
  yield 3
end

three_times { |n| puts n }

def compute
  if block_given?
    puts yield
  else
    puts 'Does not compute!'
  end
end

compute do
  'Hello'
end