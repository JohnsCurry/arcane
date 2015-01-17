class PagesController < ApplicationController
  def front
    @categories = Category.all
  end
end
