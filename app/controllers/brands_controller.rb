class BrandsController < ApplicationController
  def index
    @brand_foods = Brand.joins(:foods)
                        .order("brands.id ASC")
                        .pluck("brands.name", "foods.name")
  end
end
