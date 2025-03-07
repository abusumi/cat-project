class ReviewsController < ApplicationController
  before_action :set_food, only: [ :new, :create, :index ]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @review = @food.reviews.new
  end

  def create
    @review = @food.reviews.find_or_initialize_by(user_id:  current_user.id, food_id: @food.id)
    if @review.update(review_params)
      redirect_to food_path(@food), notice: "レビューを投稿しました。"
    else
      flash[:alert] = "レビューの投稿に失敗しました。"
      render :new
    end
  end

  def index
    @reviews = @food.reviews.includes(:user).order(created_at: :desc)
  end

  private

  def set_food
    @food = Food.find(params[:food_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id)
  end
end
