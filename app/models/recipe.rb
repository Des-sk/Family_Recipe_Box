class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe_creator
end
