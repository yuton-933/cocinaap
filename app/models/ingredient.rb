class Ingredient < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :ingredients_in_dishes
  has_many :dishes, through: :ingredients_in_dishes
end
