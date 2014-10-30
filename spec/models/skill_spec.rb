require 'spec_helper'

describe Skill do
  context "With valid inputs" do
    it "is valid with a Title, URL, Description, and price" do
      skill = Skill.new(
                        title: 'codecademy',
                        url: 'http://www.codecademy.org',
                        description: "Hello world",
                        price: "$30/month"
                        )
      expect(skill).to be_valid
    end
    it "is created with valid parameters"
  end

  context "With invalid inputs" do
    it "is invalid without a url" do
      expect(Skill.new(url: nil)).to have(1).errors_on(:url)
    end
    it "is invalid without a Title" do
      expect(Skill.new(title: nil)).to have(1).errors_on(:title)
    end
    it "is invalid without a description" do
      expect(Skill.new(description: nil)).to have(1).errors_on(:title)
    end
  end
end
