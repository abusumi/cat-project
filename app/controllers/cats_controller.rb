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

  def destroy
    @cat = Cat.find(params[:id]) # まずは@catを見つける
    @user = @cat.user # @catから@userを取得する
    @cat.destroy! # その後に削除する
    flash.now[:notice] = "削除しました"
    render turbo_stream: [
      turbo_stream.remove(@user),
    ]
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def cat_params
    params.require(:cat).permit(:name, :weight, :cat_profile)
  end
end
