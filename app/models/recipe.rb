class Recipe < ApplicationRecord
  belongs_to :contributor
  belongs_to :recipe_creator
  accepts_nested_attributes_for :recipe_creator

  validates :title, :ingredients, :directions, :recipe_creator, presence: :true

  validate :only_one_recipe_for_recipe_creator

    def only_one_recipe_for_recipe_creator
        #if contributor creates a new recipe creator when creating a new recipe , show error
        if Recipe.find_by(title: title, recipe_creator_id: recipe_creator_id)
            errors.add(:title, "already exists in this Family Member's Recipe Box")
        end
    end

   
    
    def recipe_creator_attributes=(attributes)
      self.recipe_creator = RecipeCreator.find_or_create_by(attributes) if !attributes['name'].empty?
      self.recipe_creator
    end

  def new
  end

end
