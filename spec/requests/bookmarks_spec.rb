require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  let(:user) { create(:user) }
  let(:food) { create(:food) }

  describe "POST /bookmarks" do
    context "ログイン済みの場合" do
      before { sign_in user }

      it "ブックマークを作成し、リダイレクトされる" do
        expect {
          post bookmarks_path, params: { food_id: food.id }
        }.to change(Bookmark, :count).by(1)
        expect(response).to redirect_to(food_path(food))
        follow_redirect!
        expect(response.body).to include("ブックマークしました。")
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトされる" do
        post bookmarks_path, params: { food_id: food.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "DELETE /bookmarks/:id" do
    let!(:bookmark) { create(:bookmark, user: user, food: food) }

    context "ログイン済みの場合" do
      before { sign_in user }

      it "ブックマークを削除し、リダイレクトされる" do
        expect {
          delete bookmark_path(bookmark)
        }.to change(Bookmark, :count).by(-1)
        expect(response).to redirect_to(food_path(food))
        follow_redirect!
        expect(response.body).to include("ブックマークを解除しました。")
      end
    end
  end

  describe "GET /bookmarks" do
    context "ログイン済みの場合" do
      before do
        sign_in user
        create(:bookmark, user: user, food: food)
      end

      it "自分のブックマーク一覧が表示される" do
        get bookmarks_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(food.name)
      end
    end

    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトされる" do
        get bookmarks_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
