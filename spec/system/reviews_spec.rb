require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food) }

  before do
    driven_by(:rack_test)
  end

  describe "GET /foods/:food_id/reviews/new" do
    context "ログイン済みの場合" do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'password_field', with: user.password
        click_button 'ログイン'
      end

      it "正常にレスポンスが返ること" do
        visit new_food_review_path(food)
        expect(page).to have_current_path(new_food_review_path(food))
        expect(page).to have_content("レビュー") # 適宜調整
      end

      it "レビュー作成用のインスタンスがあること" do
        visit new_food_review_path(food)
        expect(page).to have_selector("form") # フォームが存在することを確認
        expect(page).to have_field("comment") # commentフィールドがあることを確認
      end
    end
  end
end
