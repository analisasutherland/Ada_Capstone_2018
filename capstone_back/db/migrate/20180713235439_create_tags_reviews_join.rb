class CreateTagsReviewsJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_reviews_joins do |t|
      t.belongs_to :tags, index: true
      t.belongs_to :reviews, index: true
    end
  end
end
