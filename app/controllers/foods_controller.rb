class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
  end

  def bookmarks
    @bookmark_foods = current_user.bookmark_foods.includes(:brand).order(created_at: :desc)
  end
end
