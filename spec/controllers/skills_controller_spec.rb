require 'spec_helper'

describe SkillsController do
  describe "POST create" do
    context "With Valid Inputs" do
      it "redirects to the skills page" do
        session[:user_id] = Fabricate(:user).id
        post :create, skill: {title: "Codecademy", url: "www.codecademy.com", description: "learn to code"}
        expect(response).to redirect_to skills_path
      end

      it "creates the skill item" do
        session[:user_id] = Fabricate(:user).id
        expect{post :create, skill: {title: "Codecademy", url: "www.codecademy.com", description: "learn to code"}}.to change(Skill, :count).by (1)
      end
    end
  end
  
  describe "GET show" do
    it "sets @video for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      skill = Fabricate(:skill)
      get :show, id: skill.id
      expect(assigns(:skill)).to eq(skill)
    end
  end
end
