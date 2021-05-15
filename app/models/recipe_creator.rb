class RecipeCreator < ApplicationRecord
    has_many :recipes
    has_many :contributors, through: :recipes

    
    validates :name, presence: true
    validates :phone_number, uniqueness: true 
    
    validate :only_one_recipe_box_for_recipe_creator

    def only_one_recipe_box_for_recipe_creator
        #if contributor creates a new recipe creator when creating a new recipe , show error
        if RecipeCreator.find_by(name: name, phone_number: phone_number)
            errors.add(:name, "already has a Recipe Box")
        end
    end        
end
