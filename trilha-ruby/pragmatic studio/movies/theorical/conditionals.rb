require_relative '../lib/flicks/movie'

movie = Movie.new("Casino", 10)

if movie.rank >= 8
    puts 'Hit'
else
    puts 'Flop'
end

# ou
# puts 'Hit' if movie.rank >=8