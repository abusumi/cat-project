class Brand < ApplicationRecord
  has_many :foods

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["foods"] # ここでfoodsを許可
  end

  # カスタム検索スコープ
  def self.ransackable_scopes(auth_object = nil)
    [:search_by_name]
  end

  # ブランド名またはフード名で検索
  def self.search_by_name(query)
    return if query.blank?

    left_outer_joins(:foods)
      .where("brands.name ILIKE :query OR foods.name ILIKE :query", query: "%#{query}%")
      .distinct
  end
end
