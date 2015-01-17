require 'spec_helper'

describe PagesController do
  describe "GET home" do
    it "sets @categories" do
      code = Fabricate(:category)
      fitness = Fabricate(:category)
      get :front
      expect(assigns(:categories)).to match_array([fitness, code])
    end
  end
end
