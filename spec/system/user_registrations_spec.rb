require 'rails_helper'

RSpec.describe 'UserRegistrations', type: :system do
  describe 'ユーザー登録' do
    it '正しい情報でユーザーを登録できること' do
      visit new_user_registration_path # サインアップページに移動

      fill_in 'Name', with: 'Test User'
      fill_in 'Email', with: 'testuser@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.') # サインアップ成功のメッセージ
      expect(current_path).to eq(root_path) # ホームページにリダイレクトされること
    end

    it '無効な情報ではユーザー登録できないこと' do
      visit new_user_registration_path

      fill_in 'Name', with: ''
      fill_in 'Email', with: 'invalid_email'
      fill_in 'Password', with: 'short'
      fill_in 'Password confirmation', with: 'short'
      click_button 'Sign up'

      expect(page).to have_content('Name can\'t be blank') # 名前が空であればエラーメッセージ
      expect(page).to have_content('Email is invalid') # メールが無効ならエラーメッセージ
      expect(page).to have_content('Password is too short') # パスワードが短すぎればエラーメッセージ
      expect(current_path).to eq(user_registration_path) # サインアップページにとどまること
    end
  end
end
