class BrandsController < ApplicationController
  def index
    @brand_foods = Brand.joins(:foods).pluck('brands.name', 'foods.name')
  end
end
