class DeleteColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :review_id
  end
end
