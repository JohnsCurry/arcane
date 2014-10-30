require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
describe CategoriesController do

  context "With valid inputs" do
    it "creates a category item" do
      expect{
      post :create, category: {name: "code"}
             }.to change(Category, :count).by (1)
    end

    it "redirects to the root path" do
      post :create, category: {name: "code"}
      expect(response).to redirect_to root_path
    end
  end
end
