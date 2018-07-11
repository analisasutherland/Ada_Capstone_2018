class Recommendation < ApplicationRecord
  # TODO: User prescence will need a validation eventually
  validates :game_id, presence: true
  # TODO: Eventually will need relations for both Customer and Game
end
