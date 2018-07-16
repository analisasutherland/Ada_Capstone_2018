class Game < ApplicationRecord
  has_many :reviews
  has_many :recommendations

  validates :game_title, presence: true

  # NOTE: assume we have an array of tags coming from front, HARDCODE TO REPLACE

  @selected_games = []

  def self.find_by_tags(test_tags)
    filtered_reviews = Review.joins(:tags).merge(Tag.where({tag_word: test_tags}))

    filtered_reviews.each do |review|
      # return game associated with filtered reviews
      @selected_games << review.game
    end
    @selected_games
  end
end
