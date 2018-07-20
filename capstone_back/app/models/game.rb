class Game < ApplicationRecord
  has_many :reviews
  has_many :recommendations

  validates :game_title, :image, presence: true

  # we have an array of tags coming from front

  @selected_games = []

  def self.find_by_tags(test_tags)
    filtered_reviews = Review.joins(:tags).merge(Tag.where({ tag_word: test_tags }))

    filtered_reviews.each do |review|
      # return game associated with filtered reviews
      @selected_games << review.game.id
    end
    @selected_games
  end
end
