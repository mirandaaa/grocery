require 'spec_helper'

describe Recipe do
  let (:my_recipe) { Recipe.new(name: "My Recipe", desc: "This is my recipe.", steps: "Step 1, Step 2, Step 3") }

  it "is valid with a name and description" do
    my_recipe.should be_valid
  end

  it "is not valid without a name" do
    my_recipe.name = nil
    my_recipe.should_not be_valid
  end

  it "is not valid without a description" do
    my_recipe.desc = nil
    my_recipe.should_not be_valid
  end

  # Associations
  it { should have_many(:ingredients) }
end
