class DropGroceryItemsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :grocery_items
  end
end
