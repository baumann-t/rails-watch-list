require_relative '../../.api_key.rb'

class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def self.search_movie(title)
    url = "http://www.omdbapi.com/?apikey=#{OMDB}&t=#{title}"
    movie_serialized = URI.open(url).read
    JSON.parse(movie_serialized)
  end
end
