require 'rails_helper'
require 'faker'

RSpec.describe Bookmark, type: :model do
  let(:user) { create(:user) }
  let(:food) { create(:food) } # Food は自動で Brand に関連付けされる
  let(:bookmark) { build(:bookmark, user: user, food: food) }

  describe "バリデーションのテスト" do
    it "有効なBookmarkの場合は保存できる" do
      expect(bookmark).to be_valid
    end

    it "userがない場合は無効" do
      bookmark.user = nil
      expect(bookmark).to be_invalid
      expect(bookmark.errors[:user]).to include("を入力してください")
    end

    it "foodがない場合は無効" do
      bookmark.food = nil
      expect(bookmark).to be_invalid
      expect(bookmark.errors[:food]).to include("を入力してください")
    end
  end

  describe "関連付けのテスト" do
    it "User に属している" do
      expect(Bookmark.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it "Food に属している" do
      expect(Bookmark.reflect_on_association(:food).macro).to eq(:belongs_to)
    end
  end
end
