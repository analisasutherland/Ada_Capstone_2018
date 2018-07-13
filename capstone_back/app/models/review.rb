class Review < ApplicationRecord
  belongs_to :game
  validates :title, :content, presence: true
end
