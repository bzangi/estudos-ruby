module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      "Flop"
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def formatted_date(movie)
    # movie.released_on.year
    if movie.released_on < Date.today
      time_tag(movie.released_on) + " (#{time_ago_in_words(movie.released_on)} ago)"
    else
      time_tag(movie.released_on) + " (#{time_ago_in_words(movie.released_on)} until release)"
    end
  end
end
