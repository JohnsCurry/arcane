require 'spec_helper'


describe ReviewsController do
  describe "POST create" do
    let(:skill) { Fabricate(:skill)}
    context "with authenticated users" do
      
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }
      
      context "with valid inputs" do
        it "redirects to the skill show page" do
          post :create, review: Fabricate.attributes_for(:review), skill_id: skill.id
          expect(response).to redirect_to skill
        end
        it "creates a review" do
          post :create, review: Fabricate.attributes_for(:review), skill_id: skill.id
          expect(Review.count).to eq(1)
        end
        it "creates a review associated with the skill" do
          post :create, review: Fabricate.attributes_for(:review), skill_id: skill.id
          expect(Review.first.skill).to eq(skill)
        end
        it "creates a review associated with the signed in user" do
          post :create, review: Fabricate.attributes_for(:review), skill_id: skill.id
          expect(Review.first.user_id).to eq(current_user.id)
        end
      end

      context "with invalid inputs" do
        it "does not create a review" do
          post :create, review: {rating: 4}, skill_id: skill.id
          expect(Review.count).to eq(0)
        end
        it "renders the skills/show template" do
          post :create, review: {rating: 4}, skill_id: skill.id
          expect(response).to render_template "skills/show"
        end
        it "sets @skill" do
          post :create, review: {rating: 4}, skill_id: skill.id
          expect(assigns(:skill)).to eq(skill)
        end
        it "sets @reviews" do
          review = Fabricate(:review, skill: skill)
          post :create, review: {rating: 4}, skill_id: skill.id
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end
    context "with unauthenticated users" do
      it "redirects to the sign_in_path" do
        post :create, review: Fabricate.attributes_for(:review), skill_id: skill.id
        expect(response).to redirect_to login_path
      end
    end
  end
end
