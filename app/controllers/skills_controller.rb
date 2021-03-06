class SkillsController < ApplicationController
  before_action :set_categories
  before_action :require_user, only: [:edit, :update, :new, :create]
  def index
    @skills = Skill.all
  end
  
  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill was updated"
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "New skill added!!!"
      redirect_to skills_path
    else
      flash[:error] = "You need to have a title"
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @reviews = @skill.reviews
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to root_path
  end

  def home
  end

  
  private

  
  def skill_params
    params.require(:skill).permit!
  end
end
