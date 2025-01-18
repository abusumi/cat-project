class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    Rails.logger.debug "Reached the create action in BookmarksController"
    food = Food.find(params[:food_id])
    current_user.bookmark(food)
    redirect_to food_path(food), notice: "ブックマークしました。"
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    food = bookmark.food
    bookmark.destroy
    redirect_to food_path(food), notice: "ブックマークを解除しました。"
  end

  def bookmarks
    @bookmark_foods = current_user.bookmark_foods # 例: 現在のユーザーのブックマークを取得
  end
end
