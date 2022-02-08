class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title, :released_on, :duration, presence: true

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, format: {
    with: /\w+\.(jpg|jpeg|png)\z/i,
    message: "must be a JPG, JPEG or PNG image"
  }

  validates :rating, inclusion: { in: RATINGS}

  def self.released
    Movie.where("released_on < ?", Time.now).order(released_on: :desc)
  end

  def self.upcoming
    Movie.where("released_on > ?", Time.now).order(released_on: :asc)
  end

  def flop?
    total_gross < 225000000
  end

end
