class RemoveRecommendationAssociation < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :recommendation_id, :integer
  end
end
