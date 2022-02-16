module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      "Flop"
    elsif movie.upcoming?
      "Total gross: N/A"
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

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No reviews")

    else
      render "shared/stars", percent: percent_stars(movie)
      # pluralize(number_with_precision(movie.average_stars, precision: 1), "star")
    end
  end

  def percent_stars(movie)
      if movie.average_stars.zero?
        0
      else
        (movie.reviews.average(:stars) / 5) * 100
      end
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: "active")
    else
      link_to(text, url)
    end
  end
end
