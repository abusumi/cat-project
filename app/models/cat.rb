class Cat < ApplicationRecord
  belongs_to :user
  has_many :feeding_calculations, dependent: :destroy
end
