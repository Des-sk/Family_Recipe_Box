class RemoveCreatorIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column(:recipes, :creator_id)
  end
end
