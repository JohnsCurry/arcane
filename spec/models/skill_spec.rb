require 'spec_helper'

describe Skill do

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:url)}
  it { should validate_presence_of(:description)}
  
end
