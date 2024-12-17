class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @last_calculation = @user.feeding_calculations.order(created_at: :desc).first
  end
end
