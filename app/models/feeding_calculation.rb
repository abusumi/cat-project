class FeedingCalculation < ApplicationRecord
  belongs_to :user, optional: true # 未ログイン時はユーザーがいないため optional: true
  belongs_to :brand, optional: true
  belongs_to :main_food, class_name: "Food", foreign_key: "main_food_id", optional: true
  belongs_to :sub_food, class_name: "Food", foreign_key: "sub_food_id", optional: true

  def main_brand
    main_food.brand if main_food.present?
  end

  def sub_brand
    sub_food.brand if sub_food.present?
  end
end
