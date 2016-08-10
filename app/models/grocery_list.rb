class GroceryList < ApplicationRecord
  has_many :grocery_items, dependent: :destroy 
  has_many :items, :through => :grocery_items

  validates_presence_of :name, :desc

  scope :recent, ->{ order("created_at desc").limit(3) }

  def add_item(item_name, category_name)
    category = Category.where(name: category_name).first
    new_or_found_item = Item.find_or_create_by(name: item_name, category: category)
    grocery_item = GroceryItem.create(item: new_or_found_item, grocery_list: self)
  end

  def categories
    self.items.map { |item| item.category }.uniq
  end

end
