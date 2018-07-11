class Review < ApplicationRecord
  validates :title, :content, presence: true
end
