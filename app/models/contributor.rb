class Contributor < ApplicationRecord
    has_many :recipes
    has_many :recipe_creators, through: :recipes

    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    
    has_secure_password

    def self.contribs_recipes
        joins(:recipes).group('contributors.name')
    end

end
