require_relative '../lib/flicks/movie'

movie1 = Movie.new("Taxi Driver", 10)
movie2 = Movie.new("The Avengers", 6)
movie3 = Movie.new("Casino", 8)

movies = [movie1, movie2, movie3]

# caso não desse override no método spaceship na classe Movie
# puts movies.sort_by { |movie| movie.rank}.reverse
puts movies.sort