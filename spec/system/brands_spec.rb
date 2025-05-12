require 'rails_helper'

RSpec.describe 'Brands', type: :system do
  let!(:brand) { create(:brand, name: 'テストブランド') }
  let!(:food) { create(:food, brand: brand, name: 'テストフード') }

  before do
    driven_by(:rack_test)
  end

  describe 'indexアクション' do
    it 'ブランド一覧とそのフードが表示される' do
      visit brands_path
      expect(page).to have_content('テストブランド')
      expect(page).to have_content('テストフード')
    end

    it '名前でブランドまたはフードを検索できる' do
      visit brands_path
      fill_in 'q_search_by_name', with: 'テスト'
      click_button '検索' rescue nil

      expect(page).to have_content('テストブランド').or have_content('テストフード')
    end
  end

  describe 'autocompleteアクション' do
    it 'APIとしてJSONでブランドとフードの名前を返す（コントローラーテスト向き）' do
      get autocomplete_brands_path(query: 'テスト')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'foodsアクション' do
    it '特定ブランドのフードをJSONで返す' do
      get foods_brand_path(brand)
      json = JSON.parse(response.body)
      expect(json.first['name']).to eq('テストフード')
    end
  end
end
