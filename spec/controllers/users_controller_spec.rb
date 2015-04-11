require 'spec_helper'

describe UsersController do

  describe "POST create" do
    context "with valid inputs" do
      it "redirects to the root path" do
        post :create, user: {username: "John", password: "password" }
        expect(response).to redirect_to root_path
      end

      it "Creates A user" do
        post :create, user: {username: "John", password: "password" }
        expect(User.count).to eq(1)
      end
    end

    context "With Invalid Inputs" do
      it "redirects the user back to new user page if there is an error" do
        post :create, user: {username: "John", password: "password"}
        post :create, user: {username: "John", password: "padfadfssword"}
        expect(response).to render_template(:new)
      end
    end
  end
end
