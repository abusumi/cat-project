require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  let!(:user) { create(:user) }
  let!(:food) { create(:food) }
  let!(:review) { create(:review, food: food, user: user, rating: 4) }

  before do
    driven_by(:rack_test)
  end

  describe 'showアクション' do
    it 'フードの詳細ページが正しく表示される' do
      visit food_path(food)

      expect(page).to have_content(food.name)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(@total_reviews)
      expect(page).to have_content(@average_rating)
    end
  end

  describe 'bookmarksアクション' do
    before do
      create(:bookmark, user: user, food: food)
      sign_in user
    end

    it 'ログインユーザーのブックマーク一覧が表示される' do
      visit bookmarks_foods_path
      expect(page).to have_content(food.name)
    end
  end
end
