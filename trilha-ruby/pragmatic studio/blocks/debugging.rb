require 'benchmark'

def with_debugging
  puts 'Got here'
  result = yield
  puts "result was #{result}"
end

def with_expectation(expected)
  puts 'running test...'
  result = yield
  if result == expected
    puts 'PASSED!'
  else
    puts "FAILED!\nGot #{result}, expected #{expected}"
  end
end

time = Benchmark.realtime do
  with_debugging do
    magic_number = (23 - Time.now.hour) * Math::PI
  end

  with_expectation(19) do
    magic_number = (23 - Time.now.hour) * Math::PI
  end
end
puts time