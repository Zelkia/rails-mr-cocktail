class Ingredient < ApplicationRecord
  has_many :doses, :dependent => :restrict_with_error
  validates :name, presence: true
  validates :name, uniqueness: true

end
