class Game < ApplicationRecord
  # TODO: add back in the associations 
  # has_many :reviews
  # has_many :recommendations
  validates :game_title, presence: true
end
