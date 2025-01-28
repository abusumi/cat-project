class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cats = @user.cats
    @last_calculation = current_user.feeding_calculations.includes(:main_food, :cat).order(created_at: :desc).first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー情報が更新されました"
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :self_introduction, :profile)
  end
end
