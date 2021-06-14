class Dish < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :ingredients, through: :ingredients_in_dishes
  has_many :ingredients_in_dishes
end
