class BrandsController < ApplicationController
  def index
    @brand_foods = Brand.joins(:foods)
                        .order("brands.id ASC")
                        .pluck("brands.name", "foods.name")
  end

  def foods
    @foods = Food.where(brand_id: params[:id]) # メーカーに関連するフードを取得
    render json: @foods # フード情報をJSON形式で返す
  end
end
