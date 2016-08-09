class Createitemandcategorytables < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.timestamps
    end
    create_table :categories do |t|
      t.string :name
      t.references :item
      t.timestamps
    end
  end
end
