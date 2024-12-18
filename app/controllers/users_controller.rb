class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @last_calculation = current_user.feeding_calculations.includes(:main_food, :cat).order(created_at: :desc).first  end
end
