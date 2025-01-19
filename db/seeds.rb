# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



User.create!(
  email: "user1@example.com",
  password: "password",
  name: "user1",
  role: "general"
)


require "csv"
# brands.csvを読み込んでbrandsテーブルにデータを追加
# brands.csvを読み込んでbrandsテーブルにデータを追加
CSV.foreach('db/brands.csv', headers: true) do |row|
  Brand.find_or_create_by(name: row['brand'])
end

# foods.csvを読み込んでfoodsテーブルにデータを追加
CSV.foreach('db/foods.csv', headers: true) do |row|
  Food.find_or_create_by(name: row['name']) do |food| # nameを使って重複をチェック
    food.brand_id = row['brand_id']
    food.calories_per_gram = row['calories_per_gram']
    food.seventy = row['seventy']
    food.coefficient = row['coefficient']
    food.external_url = row['external_url']
  end
end
