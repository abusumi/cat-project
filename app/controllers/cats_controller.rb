class CatsController < ApplicationController
  before_action :set_user
  before_action :set_user, except: [ :index ]
  helper_method :prepare_meta_tags

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

  def index
    @cats = Cat.includes(:user).order(created_at: :desc)
  end

  def show
    @cat = Cat.find(params[:id])
    prepare_meta_tags(@cat)
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

  def prepare_meta_tags(cat)
    image_url = "#{request.base_url}/ogp2/#{cat.id}.png"
  
    set_meta_tags og: {
                    site_name: 'CatFoodMate',
                    title: cat.name,
                    description: 'ユーザーによるペットの投稿です',
                    type: 'website',
                    url: "#{request.base_url}/users/#{cat.user_id}/cats/#{cat.id}",
                    image: image_url,
                    locale: 'ja-JP'
                  },
                  twitter: {
                    card: 'summary_large_image',
                    site: '@CatFoodMat45083',
                    image: image_url
                  }
  end  
end
