class SkillsController < ApplicationController
  def index
    @categories = Category.all
    @skills = Skill.all
    #left, middle, right = Skill.all.sort_all_my_skills
  end
  def new
    @skill = Skill.new
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

  private

  def skill_params
    params.require(:skill).permit!
  end
end
