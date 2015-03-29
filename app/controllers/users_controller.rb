class UsersController < ApplicationController
  before_action :set_categories
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Hello!"
      redirect_to root_path
    else
      flash[:error] = "There is an error somewhere! try again!"
      render :new
    end
  end
  private
  
  def user_params
    params.require(:user).permit!
  end
end
