class Review < ApplicationRecord
  belongs_to :user
  belongs_to :main_food, class_name: "Food"
  belongs_to :sub_food, class_name: "Food", optional: true
  has_many :helpful
end
