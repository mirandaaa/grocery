class GroceryList < ApplicationRecord
  has_many :grocery_items, dependent: :destroy
  has_many :items, :through => :grocery_items

  validates_presence_of :name, :desc

  scope :recent, ->{ order("created_at desc").limit(3) }
end
