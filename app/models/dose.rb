class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
