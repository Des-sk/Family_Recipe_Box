class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.text :directions
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :recipe_creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
