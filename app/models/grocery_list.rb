class GroceryList < ApplicationRecord
  has_many :grocery_items
  has_many :items, :through => :grocery_items

  validates_presence_of :name, :desc

  scope :recent, ->{ order("created_at desc").limit(3) }

  def item_list
    self.grocery_items
  end

  def item_list=(item_name)
    new_or_found_item = Item.find_or_create_by(name: item_name)
    # Get category too...
    self.grocery_items += new_or_found_item
  end

end
