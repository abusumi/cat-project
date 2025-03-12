require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let!(:user) { create(:user) }

  describe 'ログイン' do
    it 'ユーザーは正しい情報でログインできること' do
      visit new_user_session_path # ログインページに移動

      fill_in 'user_email', with: user.email
      fill_in 'password_field', with: user.password
      click_button 'Sign in' # ボタンのラベルが 'Sign in' の場合
    end

    it '誤った情報ではログインできないこと' do
      visit new_user_session_path

      fill_in 'user_email', with: 'wrong@example.com'
      fill_in 'password_field', with: 'wrongpassword'
      click_button 'Sign in' # ボタンラベルに合わせて修正

      expect(current_path).to eq(new_user_session_path) # ログインページにとどまることを確認
    end
  end

  describe 'ログアウト' do
    it 'ユーザーはログアウトできること' do
      # まずログインする
      sign_in user

      visit root_path # ホームページに移動
      click_link 'ログアウト' # ログアウトリンクをクリック（ビューで定義されたリンクテキストに合わせる）

      expect(current_path).to eq(root_path) # ホームページにリダイレクトされること
    end
  end
end
