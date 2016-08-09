class DropItemsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :items_tables
  end
end
