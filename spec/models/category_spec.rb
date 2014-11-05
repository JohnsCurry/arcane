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
      record = Category.create(name: nil)

      record.valid?
      expect(record.errors[:name].size).to eq(1)
    end
    it "is invalid with a duplicate name" do
      Category.create(name: "Swimming")
      record = Category.create(name: "Swimming")

      record.valid?
      expect(record.errors[:name].size).to eq(1)
    end
  end
end
