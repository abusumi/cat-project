class CatsController < ApplicationController
  before_action :set_cat, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  helper_method :prepare_meta_tags

  def new
    @user = User.find(params[:user_id])
    @cat = @user.cats.build
  end

  def create
    @user = User.find(params[:user_id])
    @cat = @user.cats.build(cat_params)
    if @cat.save
      redirect_to cats_path, notice: "猫が登録されました"
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

    if request.referer&.include?(cats_path)
      session[:return_to] = request.referer
    end
  end

  def edit
    @user = User.find(params[:user_id])
    # 編集処理
  end

  def update
    if @cat.update(cat_params)
      redirect_to cats_path, notice: "情報が更新されました"
    else
      flash.now[:alert] = @cat.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @user = @cat.user # 作成者の取得
    @cat.destroy!
    flash[:notice] = "削除しました"
    redirect_to user_path(@user)
  end

  private

  

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def authorize_user
    # 作成者でない場合、アクセス拒否
    unless @cat.user == current_user
      redirect_to cats_path, alert: "権限がありません"
    end
  end

  def cat_params
    params.require(:cat).permit(:name, :weight, :cat_profile, :cat_introduction)
  end

  def prepare_meta_tags(cat)
    image_url = "#{request.base_url}/images/ogp.png?cat_id=#{cat.id}"

    set_meta_tags og: {
                    site_name: "CatFoodMate",
                    title: cat.name,
                    description: "ユーザーによるペットの投稿です",
                    type: "website",
                    url: "#{request.base_url}/users/#{cat.user_id}/cats/#{cat.id}",
                    image: image_url,
                    locale: "ja-JP"
                  },
                  twitter: {
                    card: "summary_large_image",
                    site: "@CatFoodMat45083",
                    image: image_url
                  }
  end
end
