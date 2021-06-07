class Ingredient < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
