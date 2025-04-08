class UsersController < ApplicationController
  before_action :authorize_user, only: [ :edit, :update ]
  def show
    @user = User.find(params[:id])
    @cats = @user.cats.order(created_at: :desc)
    if current_user
      @calculation_result = current_user.feeding_calculations.includes(:main_food).order(created_at: :desc)
    else
      @calculation_result = [] # 適当なデフォルト値を設定
    end
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

  def authorize_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path, alert: "権限がありません"
    end
  end
end
