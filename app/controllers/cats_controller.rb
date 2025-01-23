class CatsController < ApplicationController
  before_action :set_user

  def new
    @cat = @user.cats.build
  end

  def create
    @cat = @user.cats.build(cat_params)
    if @cat.save
      redirect_to user_path(@user), notice: "猫が登録されました"
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def cat_params
    params.require(:cat).permit(:name, :weight, :cat_profile)
  end
end
