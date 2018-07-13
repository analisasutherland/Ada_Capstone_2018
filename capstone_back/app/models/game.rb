class Game < ApplicationRecord
  has_many :reviews
  has_many :recommendations

  validates :game_title, presence: true
end
