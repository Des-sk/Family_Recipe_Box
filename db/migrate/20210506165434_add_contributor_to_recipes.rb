class AddContributorToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :contributor, index: true, null: false, foreign_key: true
  end
end
