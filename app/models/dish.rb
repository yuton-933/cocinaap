class Dish < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many: ingredients, through: :ingredients_dishes
  has_many: ingredients_dishes
end
