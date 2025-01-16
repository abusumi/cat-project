class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :helpful
end
