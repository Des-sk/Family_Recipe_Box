class Recipe < ApplicationRecord
  belongs_to :contributor
  belongs_to :recipe_creator
  accepts_nested_attributes_for :recipe_creator

  validates :title, :ingredients, :directions, :recipe_creator, presence: :true

  def new
  end

end
