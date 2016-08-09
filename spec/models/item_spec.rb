require "spec_helper"

describe Item do
  subject(:item) { Item.new(name: "Yogurt", category: dairy) }
  let(:dairy) { Category.new(name: "Dairy") }

  it "is valid with a name and category" do
    item.should be_valid
  end

  it "is not valid without a category" do
    item.category = nil
    item.should_not be_valid
  end

  it "is not valid without a name" do
    item.name = nil
    item.should_not be_valid
  end

  it "is not valid if its name already exists" do
    item.save
    item2 = Item.new(name: "Yogurt", category: dairy)
    item2.should_not be_valid
  end

  it "is not valid if its name already exists with any case" do
    item.save
    item2 = Item.new(name: "yoGuRt", category: dairy)
    item2.should_not be_valid
  end

  # Associations
  it { should belong_to(:category) }
end
