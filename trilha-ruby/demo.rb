class Movie
  @@count = 0

  def initialize(name)
    @name = name
    @@count += 1
  end

  def print_count
    puts @@count
  end

  def print_name
    puts @name
  end

  def rename(name)
    @name = name
  end
end

movie_1 = Movie.new('bruno')
movie_1.print_name
movie_1.print_count
movie_2 = Movie.new('Edu')

movie_2.print_name

movie_2.print_count

movie_1.rename('Renata')
movie_1.print_name