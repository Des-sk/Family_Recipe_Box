class CreateRecipeCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_creators do |t|
      t.string :name
      t.integer :phone_number
      t.string :secret_ingredient

      t.timestamps
    end
  end
end
