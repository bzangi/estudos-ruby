require 'timeout'

def try_with_timeout(time)
  begin
    Timeout.timeout(time) do
      yield
    end
  rescue Timeout::Error
    puts "Demorou demais"
  end
end

try_with_timeout(2.0) do
  sleep 3.0
  puts "Yawn..."
end