require "spec_helper"

describe GroceryList do
  let (:my_list) { GroceryList.new(name: "My List", desc: "This is my list.") }

  it "is valid with a name and description" do
    my_list.should be_valid
  end
  it "is not valid without a name" do
    my_list.name = nil
    my_list.should_not be_valid
  end

  it "is not valid without a description" do
    my_list.desc = nil
    my_list.should_not be_valid
  end

  #Associations
  it { should have_many(:grocery_items) }
end
