require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:food) { create(:food) }
  let(:review) { build(:review, user: user, food: food) }

  describe "バリデーションのテスト" do
    it "有効なReviewの場合は保存できる" do
      expect(review).to be_valid
    end

    it "userがない場合は無効" do
      review.user = nil
      expect(review).to be_invalid
      expect(review.errors[:user]).to include("を入力してください")
    end

    it "foodがない場合は無効" do
      review.food = nil
      expect(review).to be_invalid
      expect(review.errors[:food]).to include("を入力してください")
    end
  end

  describe "関連付けのテスト" do
    it "User に属している" do
      expect(Review.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it "Food に属している" do
      expect(Review.reflect_on_association(:food).macro).to eq(:belongs_to)
    end
  end
end
