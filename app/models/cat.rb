class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :cat_profile

  validates :name, presence: true, length: { in: 1..20 }
  validates :cat_introduction, length: {in: 0..250}
end
