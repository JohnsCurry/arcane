require 'spec_helper'

describe Skill do

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:url)}
  it { should validate_presence_of(:description)}
  it { should have_many(:reviews).order("created_at DESC")}

  describe "#average_rating" do
    it "calculates the average"
  end
  
end
