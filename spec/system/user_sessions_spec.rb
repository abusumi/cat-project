require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let!(:user) { create(:user) }

  describe 'ログイン' do
    it 'ユーザーは正しい情報でログインできること' do
      visit new_user_session_path # ログインページに移動

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in' # ログインボタンをクリック

      expect(page).to have_content('Signed in successfully.') # ログイン成功のメッセージが表示されることを確認
      expect(current_path).to eq(root_path) # ホームページにリダイレクトされることを確認
    end

    it '誤った情報ではログインできないこと' do
      visit new_user_session_path

      fill_in 'Email', with: 'wrong@example.com'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'

      expect(page).to have_content('Invalid Email or password.') # エラーメッセージが表示されることを確認
      expect(current_path).to eq(new_user_session_path) # ログインページにとどまることを確認
    end
  end
end
