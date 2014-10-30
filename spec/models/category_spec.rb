require 'spec_helper'

describe Category do
  it {should have_many(:skills) }
  it {should validate_presence_of(:name) }

  it "is valid with a name" do
    category = Category.new(
                            name: "code"
                            )
    expect(category).to be_valid
  end
  
  context "with Invalid inputs" do
    it "is invalid without a name" do
      expect(Category.new(name: nil)).to have(1).errors_on(:name)
    end
    it "is invalid with a duplicate name" do
      Category.create(name: "Swimming")
      new = Category.new(name: "Swimming")
      expect(new).to have(1).errors_on(:name)
    end
  end
end
