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

  def autocomplete
    query = params[:query].to_s.strip.downcase
    return render json: [] if query.blank?

    brands = Brand.where("name ILIKE ?", "%#{query}%").select(:name).limit(5)
    foods = Food.where("name ILIKE ?", "%#{query}%").select(:name).limit(5)

    results = (brands + foods).uniq { |item| item.name }
    render json: results
  end
end
