class Review < ApplicationRecord
  belongs_to :game
  has_and_belongs_to_many :tags
  validates :title, :content, presence: true
end
