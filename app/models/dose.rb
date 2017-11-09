class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates_uniqueness_of :ingredient_id, :scope => :cocktail_id
end
