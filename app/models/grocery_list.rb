class GroceryList < ApplicationRecord
  has_many :grocery_items
  has_many :items, through: :grocery_items

  def item_list
    items.collect(&:name).join(', ')
  end
end
