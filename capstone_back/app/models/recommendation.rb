class Recommendation < ApplicationRecord
  # TODO: Eventually will need relations for Customers
  belongs_to :game
  # TODO: User prescence will need a validation eventually
  validates :game_id, presence: true
end
