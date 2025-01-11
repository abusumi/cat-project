class BrandsController < ApplicationController
  def index
    @brand_foods = Brand.joins(:foods)
                        .order("brands.id ASC, foods.id ASC")
                        .pluck("brands.name", "foods.id", "foods.name")
  end

  def foods
    brand = Brand.find(params[:id])
    foods = brand.foods.select(:id, :name) # 必要なカラムだけ選択
    render json: foods
  end
end
