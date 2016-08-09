class DropFoodItemsAndFoodCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :food_items
    drop_table :food_categories
  end
end
