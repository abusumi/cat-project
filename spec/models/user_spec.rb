require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションのテスト" do
    let(:user) { build(:user) }

    it "名前が1文字以上10文字以下であること" do
      user.name = "A"
      expect(user).to be_valid
      user.name = "A" * 11
      expect(user).not_to be_valid
    end

    it "emailが存在し、形式が正しいこと" do
      user.email = "test@example.com"
      expect(user).to be_valid
      user.email = "invalid_email"
      expect(user).not_to be_valid
    end

    it "passwordが6文字以上であること" do
      user.password = "12345"
      expect(user).not_to be_valid
      user.password = "123456"
      expect(user).to be_valid
    end

    it "uidが一意であること" do
      user.save
      user2 = build(:user, uid: user.uid, provider: user.provider)
      expect(user2).not_to be_valid
    end
  end

  describe "アソシエーションのテスト" do
    it "User は複数のCatを持っている" do
      expect(User.reflect_on_association(:cats).macro).to eq(:has_many)
    end

    it "User は複数のReviewを持っている" do
      expect(User.reflect_on_association(:review).macro).to eq(:has_many)
    end

    it "User は複数のHelpfulを持っている" do
      expect(User.reflect_on_association(:helpful).macro).to eq(:has_many)
    end

    it "User は複数のFeedingCalculationを持っている" do
      expect(User.reflect_on_association(:feeding_calculations).macro).to eq(:has_many)
    end

    it "User は複数のBookmarkを持っている" do
      expect(User.reflect_on_association(:bookmarks).macro).to eq(:has_many)
    end

    it "User はBookmarkFoodを多対多の関係で持っている" do
      expect(User.reflect_on_association(:bookmark_foods).macro).to eq(:has_many)
    end
  end

  describe "インスタンスメソッドのテスト" do
    let(:user) { create(:user) }
    let(:food) { create(:food) }

    describe "#bookmark" do
      it "Foodをブックマークできる" do
        expect { user.bookmark(food) }.to change { user.bookmark_foods.count }.by(1)
      end
    end

    describe "#unbookmark" do
      it "Foodのブックマークを解除できる" do
        user.bookmark(food)
        expect { user.unbookmark(food) }.to change { user.bookmark_foods.count }.by(-1)
      end
    end

    describe "#bookmark?" do
      it "Foodがブックマークされているか確認できる" do
        user.bookmark(food)
        expect(user.bookmark?(food)).to be true
        user.unbookmark(food)
        expect(user.bookmark?(food)).to be false
      end
    end
  end

  describe "クラスメソッドのテスト" do
    let(:auth) { OmniAuth.config.mock_auth[:google_oauth2] }
    
    describe ".from_omniauth" do
      it "Google認証でユーザーを作成または取得する" do
        # OmniAuthのモックを設定した後
        auth = OmniAuth.config.mock_auth[:google_oauth2]
        
        user = User.from_omniauth(auth)
        expect(user).to be_persisted
        expect(user.email).to eq(auth.info.email)
        expect(user.name).to eq(auth.info.name)
      end
    end
  end
end
