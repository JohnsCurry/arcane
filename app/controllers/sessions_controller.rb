class SessionsController < ApplicationController
  before_action :set_categories
  def new
    redirect_to root_path if current_user
  end
  
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "you are logged in!"
      redirect_to root_path
    else
      flash[:error] = "Something is wrong with your username or password, try again please"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out. Have a great day!"
    redirect_to root_path
  end
end
