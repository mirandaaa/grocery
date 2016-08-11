class ChangeStepsToNotBeArray < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :steps, :string, array: false
  end
end
