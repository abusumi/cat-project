class Food < ApplicationRecord
  belongs_to :brand
  has_many :reviews, dependent: :destroy
  has_many :feeding_calculation
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user

  # Ransackで検索可能な属性を明示的に定義
  def self.ransackable_attributes(auth_object = nil)
    [ "name", "external_url", "brand_id", "created_at", "updated_at" ]
  end

  # Ransackで関連を検索可能にするためのメソッド
  def self.ransackable_associations(auth_object = nil)
    [ "brand", "reviews" ]
  end

  def average_rating
    reviews.average(:rating)&.round(1) || 0 # nilの場合は0を返す
  end

  def total_reviews
    reviews.count
  end

  def rating_percentage
    total = total_reviews.to_f
    return { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 } if total.zero?

    (1..5).each_with_object({}) do |star, percentages|
      percentages[star] = ((reviews.where(rating: star).count / total) * 100).round
    end
  end
end
