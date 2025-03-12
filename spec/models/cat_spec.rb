require 'rails_helper'

RSpec.describe Cat, type: :model do
  let(:user) { create(:user) }
  let(:cat) { build(:cat, user: user) }

  describe "バリデーションのテスト" do
    it "有効なCatの場合は保存できる" do
      expect(cat).to be_valid
    end

    context "nameのバリデーション" do
      it "nameがない場合は無効" do
        cat.name = nil
        expect(cat).to be_invalid
        expect(cat.errors[:name]).to include("を入力してください")
      end

      it "nameが1文字未満の場合は無効" do
        cat.name = ""
        expect(cat).to be_invalid
        expect(cat.errors[:name]).to include("は1文字以上で入力してください")
      end

      it "nameが20文字を超える場合は無効" do
        cat.name = "あ" * 21
        expect(cat).to be_invalid
        expect(cat.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "cat_introductionのバリデーション" do
      it "cat_introductionが250文字以内なら有効" do
        cat.cat_introduction = "a" * 250
        expect(cat).to be_valid
      end

      it "cat_introductionが250文字を超える場合は無効" do
        cat.cat_introduction = "a" * 251
        expect(cat).to be_invalid
        expect(cat.errors[:cat_introduction]).to include("は250文字以内で入力してください")
      end
    end
  end

  describe "関連付けのテスト" do
    it "User に属している" do
      expect(Cat.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
