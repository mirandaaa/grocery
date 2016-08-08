class GroceryList < ApplicationRecord
  has_many :grocery_items
  has_many :items, through: :grocery_items

  # def item_list
  #   items.collect(&:name).join(', ')
  # end

  # def item_list=(item_name)
  #   new_or_found_item = Item.find_or_create_by(name: item_name)
  #   self.items += new_or_found_item
  # end
end
