require_relative '../lib/flicks/movie'

File.readlines("movies.csv").each do |line|
  title, rank = line.split(',')
  movie = Movie.new(title, rank.to_i)
  puts movie
end

movie1 = Movie.new('Taxi Driver', 10)
movie2 = Movie.new('The Avengers', 6)
movie3 = Movie.new('Casino', 8)

movies = [movie1, movie2, movie3]

File.open("movie_rankings.csv", "w") do |file|
  movies.sort.each do |movie|
    file.puts "#{movie.title},#{movie.rank}"
  end
end