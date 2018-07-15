class Tag < ApplicationRecord
  has_and_belongs_to_many :reviews
  validates :tag_word, presence: true
end
