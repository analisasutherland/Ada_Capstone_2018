class CreateJoinTableTagReview < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :reviews do |t|
      t.index [:tag_id, :review_id]
      t.index [:review_id, :tag_id]
    end
  end
end
