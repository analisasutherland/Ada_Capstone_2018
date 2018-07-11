class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.integer :score
      t.integer :game_id
      t.integer :user_id

      t.timestamps
    end
  end
end
