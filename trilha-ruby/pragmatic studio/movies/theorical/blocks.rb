require_relative '../lib/flicks/movie'

3.times { puts 'Echo'} #single line block

10.times do |number|
    puts "#{number} iteração doida 1 a 1, partindo do zero"
end

1.upto(10) do |number|
    puts "#{number} iteração maluca 1 a 1, partindo de onde quiser"
end

movies = ["Casino", "Avengers", "Spider-Man"]

movies.each do |movie|
    puts movie
end
