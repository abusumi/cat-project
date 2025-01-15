class Food < ApplicationRecord
  belongs_to :brand
  has_many :reviews, dependent: :destroy
  has_many :feeding_calculation
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
end
