class RecipeCreator < ApplicationRecord
    has_many :recipes
    has_many :contributors, through: :recipes

    
    validates :name, presence: true
    validates :phone_number, uniqueness: true 
    
        
end
