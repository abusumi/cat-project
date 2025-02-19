class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  enum role: { general: 0, admin: 1 } # 役割の定義

  has_many :cats, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :helpful, dependent: :destroy
  has_many :feeding_calculations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_foods, through: :bookmarks, source: :food
  has_one_attached :profile

  def bookmark(food)
    bookmark_foods << food
  end

  def unbookmark(food)
    bookmarks.find_by(food_id: food.id)&.destroy
  end

  def bookmark?(food)
    bookmark_foods.include?(food)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]

      # プロフィール画像をアタッチする
      # user.profile.attach(io: URI.open(auth.info.image), filename: 'profile.jpg', content_type: 'image/jpeg')
    end
  end

  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password.present? }
  validates :uid, uniqueness: { scope: :provider }, allow_nil: true
end
