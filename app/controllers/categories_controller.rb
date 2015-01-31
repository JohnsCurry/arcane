class CategoriesController < ApplicationController
  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save!
      flash[:notice] = "New Category!"
      redirect_to root_path
    else
 #     flash[:error] = "You messed something up!"
      redirect_to new_category_path
    end
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
