class ReviewsController < ApplicationController
  before_filter :require_user
  def create
    @skill = Skill.find(params[:skill_id])
    review = @skill.reviews.build(params[:review].permit!.merge!(user: current_user))
    if review.save
      @skill.average = @skill.average_rating
      @skill.save
      redirect_to skill_path(@skill)
    else
      @reviews = @skill.reviews.reload
      render 'skills/show'
    end
  end
end
