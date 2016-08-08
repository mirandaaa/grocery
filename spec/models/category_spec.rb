require "spec_helper"

describe Category do
  let(:dairy) { Category.new(name: "dairy") }
  let(:items) { [Item.new(name: "milk", category: dairy), Item.new(name: "eggs", category: dairy)] }

  it "is valid with a name" do
    dairy.should be_valid
  end

  it "is not valid without a name" do
    dairy.name = nil
    dairy.should_not be_valid
  end

  # Associations
  it { should have_many(:items) }

end
