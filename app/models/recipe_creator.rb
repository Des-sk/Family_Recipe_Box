class RecipeCreator < ApplicationRecord
    has_many :recipes
    has_many :contributors, through: :recipes
    
end
