class CreateGroceryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :grocery_items do |t|
      t.references :item, foreign_key: true
      t.references :grocerylist, foreign_key: true

      t.timestamps
    end
  end
end
