class Cocktail < ApplicationRecord
  has_many :doses, :dependent => :destroy
  has_many :ingredients, :through => :doses

  validates :complexity, :rating, :inclusion => { in: [nil, 1, 2, 3, 4, 5] }
  validates :name, :photo, presence: true
  validates :name, uniqueness: true

  mount_uploader :photo, PhotoUploader
end
