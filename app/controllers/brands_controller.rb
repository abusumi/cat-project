class BrandsController < ApplicationController
  def index
    @brands = Brand.includes(:foods).order(:id)
    @foods = Food.all
  end

  def foods
    brand = Brand.find(params[:id])
    foods = brand.foods.select(:id, :name) # 必要なカラムだけ選択
    render json: foods
  end
end
