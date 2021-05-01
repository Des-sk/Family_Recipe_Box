class Contributor < ApplicationRecord
    has_many :recipes
    has_many :recipe_creators, through: :recipes
    has_secure_password
end
