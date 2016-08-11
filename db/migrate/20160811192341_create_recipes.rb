class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :desc
      t.string :steps, array: true, default: []
      t.timestamps
    end
  end
end
