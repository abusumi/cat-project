class ReviewsController < ApplicationController
  def create
    @review = @food.reviews.new
    @review.user = current_user

    if @review.save
      redirect_to food_path, notice: "レビューを投稿しました。"
    else
      redirect_to food_path, alert: "レビューの投稿に失敗しました。"
    end
end
