class BrandsController < ApplicationController
  def index
    @foods = Food.all
    @q = Brand.ransack(params[:q])
    @q.build_grouping unless @q.groupings.any? # グループ化を有効にする
    @brands = @q.result.includes(:foods).order(:id)
    
    if params.dig(:q, :search_by_name).present?
      @foods = Food.joins(:brand)
                   .where("brands.name ILIKE :query OR foods.name ILIKE :query", query: "%#{params[:q][:search_by_name]}%")
                   .distinct
    else
      @foods = Food.all
    end
  end

  def foods
    brand = Brand.find(params[:id])
    foods = brand.foods.select(:id, :name) # 必要なカラムだけ選択
    render json: foods
  end
end
