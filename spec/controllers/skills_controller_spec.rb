require 'spec_helper'

describe SkillsController do

  describe "POST create" do
    context "With Valid inputs" do
      it "redirects to the skills page" do
        post :create, skill: {title: "Codecademy", url: "www.codecademy.com", description: "learn to code"}
        expect(response).to redirect_to skills_path
      end
      it "creates a skill item" do
        expect{post :create, skill: {title: "Codecademy", url: "www.codecademy.com", description: "learn to code"}}.to change(Skill, :count).by (1)
      end
    end
  end
  describe "GET index" do
  end
end
