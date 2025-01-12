class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
  end

  def bookmark
    @bookmark_foods = current_user.bookmark_foods.includes(:user).order(created_at: :desc)
  end
end
