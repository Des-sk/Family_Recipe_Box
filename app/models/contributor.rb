class Contributor < ApplicationRecord
    has_many :recipes
    has_many :recipe_creators, through: :recipes
    validates :email, uniqueness: true, presence: true
    has_secure_password
end
