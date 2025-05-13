require 'rails_helper'

RSpec.describe "Cats", type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:cat) { create(:cat, user: user) }

  before do
    driven_by(:rack_test)
  end

  def login(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'password_field', with: user.password
    click_button 'ログイン'
  end

  describe "ペットの一覧ページ" do
    it "一覧にペットの名前が表示される" do
      visit cats_path
      expect(page).to have_content(cat.name)
    end
  end

  describe "ペットの詳細ページ" do
    it "詳細情報が表示される" do
      visit user_cat_path(user_id: cat.user_id, id: cat.id)
      expect(page).to have_content(cat.name)
      expect(page).to have_content(cat.cat_introduction)
    end
  end

  describe "ペットの登録" do
    it "ログインしたユーザーがペットを登録できる" do
      login(user)

      visit new_user_cat_path(user)
      fill_in 'cat_name', with: 'ねこ'
      fill_in 'cat_weight', with: '4.2'
      fill_in 'cat_cat_introduction', with: '元気な猫です'

      click_button '登録する'

      expect(page).to have_content('猫が登録されました')
      expect(page).to have_content('ペット')
    end
  end

  describe "ペットの編集" do
    it "作成者がペットの情報を編集できる" do
      login(user)

      visit edit_user_cat_path(user, cat)
      fill_in 'cat_name', with: '編集後のペット'
      click_button '登録する'

      expect(page).to have_content('情報が更新されました')
      expect(page).to have_content('編集後のペット')
    end

    it "他のユーザーは編集ページにアクセスできない" do
      login(other_user)

      visit edit_user_cat_path(user, cat)
      expect(current_path).to eq(cats_path)
      expect(page).to have_content('権限がありません')
    end
  end
end
