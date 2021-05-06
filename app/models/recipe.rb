class Recipe < ApplicationRecord
  belongs_to :contributor
  belongs_to :recipe_creator
  accepts_nested_attributes_for :recipe_creator

  def new
  end

end
