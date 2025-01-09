class FeedingCalculation < ApplicationRecord
  belongs_to :user, optional: true # 未ログイン時はユーザーがいないため optional: true
  belongs_to :cat, optional: true # 未ログイン時は猫の情報を保存しないため optional: true
  belongs_to :brand, optional: true
  belongs_to :main_food, class_name: "Food", foreign_key: "main_food_id", optional: true
  belongs_to :sub_food, class_name: "Food", foreign_key: "sub_food_id", optional: true
end
