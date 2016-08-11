class ChangeStepsTypeInTable < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :steps, :string
  end
end
