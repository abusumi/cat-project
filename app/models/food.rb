class Food < ApplicationRecord
  belongs_to :brand
  has_many :reviews
  has_many :feeding_calculation
end
