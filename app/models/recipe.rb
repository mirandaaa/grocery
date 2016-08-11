class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :items, :through => :ingredients

  validates_presence_of :name, :desc

  # def add_item(item_name, category_name)
  #   category = Category.where(name: category_name).first
  #   new_or_found_item = Item.find_or_create_by(name: item_name, category: category)
  #   ingredient = Ingredient.create(item: new_or_found_item, recipe: self)
  # end

end
