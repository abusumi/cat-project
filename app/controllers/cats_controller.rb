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

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      redirect_to @user, notice: "情報が更新されました"
    else
      flash.now[:alert] = @cat.errors.full_messages.join(", ")
      render :show
    end
  end

  def destroy
    @cat = Cat.find(params[:id]) # まずは@catを見つける
    @user = @cat.user # @catから@userを取得する
    @cat.destroy! # その後に削除する
    flash[:notice] = "削除しました"
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def cat_params
    params.require(:cat).permit(:name, :weight, :cat_profile, :cat_introduction)
  end
end
