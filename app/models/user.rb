class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { general: 0, admin: 1 } # 役割の定義

  has_many :cats
  has_many :review
  has_many :helpful
  has_many :feeding_calculations, dependent: :destroy


  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
