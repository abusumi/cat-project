# spec/system/bookmarks_spec.rb
require 'rails_helper'

RSpec.describe "Bookmarks", type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food) }

  before do
    driven_by(:rack_test)
  end

  describe "ブックマーク作成" do
    context "ログイン済みの場合" do
      it "ブックマークを作成し、リダイレクトされる" do
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'password_field', with: user.password
        click_button 'ログイン'

        visit food_path(food)
        click_link id: "bookmark-button-for-food-#{food.id}"

        expect(page).to have_content("ブックマークしました。")
        expect(user.bookmarks.exists?(food: food)).to be true
      end
    end
  end

  describe "ブックマーク削除" do
    let!(:bookmark) { create(:bookmark, user: user, food: food) }

    it "ブックマークを削除できる" do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'password_field', with: user.password
      click_button 'ログイン'

      visit food_path(food)
      click_link id: "unbookmark-button-for-food-#{food.id}"
      expect(page).to have_content("ブックマークを解除しました。")
      expect(user.bookmarks.exists?(id: bookmark.id)).to be false
    end
  end

  describe "ブックマーク一覧表示" do
    before do
      create(:bookmark, user: user, food: food)
    end

    it "ログインしていると自分のブックマーク一覧が表示される" do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'password_field', with: user.password
      click_button 'ログイン'

      visit bookmarks_foods_path
      expect(page).to have_content(food.name)
    end
  end
end
