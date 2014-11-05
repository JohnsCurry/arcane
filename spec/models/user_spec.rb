require 'spec_helper'

describe User do
  context "With valid inputs" do
    it "is valid with a username and password" do
      user = User.new(
                      username: 'curry',
                      password_digest: 'poop'
                      )
      expect(user).to be_valid
    end
  end
end
