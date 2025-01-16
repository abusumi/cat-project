class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @average_rating = @food.average_rating
    @total_reviews = @food.total_reviews
    @rating_percentage = @food.rating_percentage
  end

  def bookmarks
    @bookmark_foods = current_user.bookmark_foods.includes(:brand).order(created_at: :desc)
  end
end
