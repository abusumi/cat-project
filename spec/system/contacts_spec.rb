require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts/new" do
    it "正常に表示される" do
      get new_contact_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("お問い合わせ") # ビューに含まれる文字列
    end
  end

  describe "POST /contacts/confirm" do
    context "有効なパラメータのとき" do
      let(:valid_params) do
        {
          contact: {
            name: "太郎",
            email: "taro@example.com",
            title: "お問い合わせタイトル",
            message: "本文です"
          }
        }
      end

      it "確認画面が表示される" do
        post confirm_contacts_path, params: valid_params
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("確認") # 確認画面にある文言
      end
    end

    context "無効なパラメータのとき" do
      it "new テンプレートが再表示される" do
        post confirm_contacts_path, params: { contact: { name: "", email: "", title: "", message: "" } }
        expect(response.body).to include("入力してください") # エラーメッセージを確認
      end
    end
  end

  describe "POST /contacts" do
    let(:valid_params) do
      {
        contact: {
          name: "太郎",
          email: "taro@example.com",
          title: "タイトル",
          message: "内容"
        }
      }
    end

    it "連絡先を作成しリダイレクトする" do
      expect {
        post contacts_path, params: valid_params
      }.to change(Contact, :count).by(1)

      expect(response).to redirect_to(done_contacts_path)
    end
  end

  describe "GET /contacts/done" do
    it "完了画面が表示される" do
      get done_contacts_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("お問い合わせありがとうございました。")
    end
  end
end
