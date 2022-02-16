class Movie < ApplicationRecord

  before_save :set_slug

  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :critics, through: :reviews, source: :user

  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user

  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title, presence: true, uniqueness: true

  validates :released_on, :duration, presence: true

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, format: {
    with: /\w+\.(jpg|jpeg|png)\z/i,
    message: "must be a JPG, JPEG or PNG image"
  }

  validates :rating, inclusion: { in: RATINGS }

  scope :released, -> { Movie.where("released_on < ?", Time.now).order(released_on: :asc) }
  scope :upcoming, lambda { Movie.where("released_on > ?", Time.now).order(released_on: :asc) }
  scope :recent, ->(max=5) { Movie.where("released_on < ?", Time.now).order(released_on: :desc).limit(max) }
  scope :hits, -> { released.where("total_gross >= 300000000").order(total_gross: :desc) }

  scope :grossed_less_than, ->(amount) { released.where("total_gross < ?", amount) }
  scope :grossed_greater_than, ->(amount) { released.where("total_gross > ?", amount) }

  # def self.released
  #   Movie.where("released_on < ?", Time.now).order(released_on: :desc)
  # end

  # def self.upcoming
  #   Movie.where("released_on > ?", Time.now).order(released_on: :asc)
  # end

  def upcoming?
    released_on > Time.now
  end

  def flop?
    !upcoming? && bleus?
  end

  def average_stars
    reviews.average(:stars) || 0.0
  end

  def to_param
    slug
  end

  private

  def bleus?
    (average_stars < 4 && reviews.size <= 5) &&  total_gross < 225000000
  end

  def set_slug
    self.slug = title.parameterize
  end
end
