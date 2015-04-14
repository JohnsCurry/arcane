require 'spec_helper'

describe Skill do

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:url)}
  it { should validate_presence_of(:description)}
  it { should have_many(:reviews).order("created_at DESC")}

  describe "#average_rating" do
    it "calculates the average" do
      user = Fabricate(:user)
      user2 = Fabricate(:user)
      skill = Fabricate(:skill)
      review = Fabricate(:review, rating: 1.0, user: user, skill: skill)
      review2 = Fabricate(:review, rating: 5.0, user: user2, skill: skill)
      expect(skill.average_rating).to eq(3)
    end

    it "returns 'no ratings yet' if no ratings are present" do
      user = Fabricate(:user)
      user2 = Fabricate(:user)
      skill = Fabricate(:skill)
      expect(skill.average_rating).to eq("no ratings yet")
    end
  end
  
end
