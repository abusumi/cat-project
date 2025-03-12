require 'rails_helper'

RSpec.describe 'UserRegistrations', type: :system do
  describe 'ユーザー登録' do
    it '正しい情報でユーザーを登録できること' do
      visit new_user_registration_path # サインアップページに移動

      fill_in 'user_name', with: 'Test User'
      fill_in 'user_email', with: 'testuser@example.com'
      fill_in 'password_field', with: 'password123'
      fill_in 'password_confirmation_field', with: 'password123'
      click_button 'アカウント登録'

      expect(current_path).to eq(root_path) # ホームページにリダイレクトされること
    end

    it '無効な情報ではユーザー登録できないこと' do
      visit new_user_registration_path

      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'invalid_email'
      fill_in 'password_field', with: 'short'
      fill_in 'password_confirmation_field', with: 'short'
      click_button 'アカウント登録'

      expect(current_path).to eq(user_registration_path) # サインアップページにとどまること
    end
  end
end
