class GroceryList < ApplicationRecord
  has_many :grocery_items
  has_many :items, through: :grocery_items
end
