class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :cat_profile
end
