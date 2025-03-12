require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "関連付けのテスト" do
    it "Brand に属している" do
      expect(Food.reflect_on_association(:brand).macro).to eq(:belongs_to)
    end

    it "Review を複数持つ" do
      expect(Food.reflect_on_association(:reviews).macro).to eq(:has_many)
    end

    it "FeedingCalculation を複数持つ" do
      expect(Food.reflect_on_association(:feeding_calculation).macro).to eq(:has_many)
    end

    it "Bookmark を複数持つ" do
      expect(Food.reflect_on_association(:bookmarks).macro).to eq(:has_many)
    end

    it "bookmarked_users を through :bookmarks で取得できる" do
      expect(Food.reflect_on_association(:bookmarked_users).macro).to eq(:has_many)
      expect(Food.reflect_on_association(:bookmarked_users).options[:through]).to eq(:bookmarks)
    end
  end

  describe "Ransackの設定テスト" do
    it "ransackable_attributes に name, external_url, brand_id, created_at, updated_at が含まれる" do
      expect(Food.ransackable_attributes).to include("name", "external_url", "brand_id", "created_at", "updated_at")
    end

    it "ransackable_associations に brand, reviews が含まれる" do
      expect(Food.ransackable_associations).to include("brand", "reviews")
    end
  end

  describe "インスタンスメソッドのテスト" do
    let(:brand) { create(:brand) }
    let(:food) { create(:food, brand: brand) }

    describe "#average_rating" do
      it "レビューがない場合は0を返す" do
        expect(food.average_rating).to eq(0)
      end

      it "レビューの平均値を計算して返す" do
        create(:review, food: food, rating: 5)
        create(:review, food: food, rating: 3)
        create(:review, food: food, rating: 4)
        expect(food.average_rating).to eq(4.0) # (5 + 3 + 4) / 3 = 4.0
      end
    end

    describe "#total_reviews" do
      it "レビュー数を正しくカウントする" do
        create_list(:review, 5, food: food)
        expect(food.total_reviews).to eq(5)
      end
    end

    describe "#rating_percentage" do
      it "レビューがない場合はすべての星の割合が0%になる" do
        expect(food.rating_percentage).to eq({ 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 })
      end

      it "各評価の割合を正しく計算する" do
        create(:review, food: food, rating: 5)
        create(:review, food: food, rating: 5)
        create(:review, food: food, rating: 4)
        create(:review, food: food, rating: 3)
        expect(food.rating_percentage).to eq({ 1 => 0, 2 => 0, 3 => 25, 4 => 25, 5 => 50 })
      end
    end
  end
end
