require 'rails_helper'

RSpec.describe "FeedingCalculations", type: :request do
  let(:user) { create(:user) }
  let(:brand) { create(:brand) }
  let(:main_food) { create(:food, brand: brand, seventy: 70, coefficient: 0.75, calories_per_gram: 3.5) }
  let(:sub_food) { create(:food, brand: brand, seventy: 70, coefficient: 0.75, calories_per_gram: 4.0) }

  describe "GET #new" do
    it "returns a successful response" do
      get new_feeding_calculation_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #calculate" do
    context "with valid parameters" do
      it "renders result template" do
        post calculate_feeding_calculation_path, params: {
          main_brand_id: brand.id,
          main_food_id: main_food.id,
          weight: 4.0
        }
        expect(response.body).to include("給与量") # 結果ページで表示される文字などで確認
        expect(response).to render_template(:result)
      end
    end

    context "without main_food_id" do
      it "redirects to new with alert" do
        post calculate_feeding_calculation_path, params: { weight: 4.0 }
        expect(response).to redirect_to(new_feeding_calculation_path)
        follow_redirect!
        expect(response.body).to include("メインフードを選択してください。")
      end
    end
  end

  describe "POST #save" do
    before { sign_in user }

    it "saves feeding calculation and redirects" do
      expect {
        post save_feeding_calculation_path, params: {
          main_brand_id: brand.id,
          sub_brand_id: brand.id,
          main_food_id: main_food.id,
          sub_food_id: sub_food.id,
          weight: 4.0
        }
      }.to change(FeedingCalculation, :count).by(1)

      expect(response).to redirect_to(user_path(user))
      follow_redirect!
      expect(response.body).to include("給与量の計算結果を保存しました")
    end
  end

  describe "DELETE #destroy" do
    before { sign_in user }

    context "when record exists" do
      let!(:calculation) { create(:feeding_calculation, user: user) }

      it "deletes the record and redirects" do
        expect {
          delete feeding_calculation_path(calculation)
        }.to change(FeedingCalculation, :count).by(-1)

        expect(response).to redirect_to(user_path(user))
        follow_redirect!
        expect(response.body).to include("計算結果を削除しました")
      end
    end

    context "when record does not exist" do
      it "redirects with alert" do
        delete feeding_calculation_path(-1)
        expect(response).to redirect_to(user_path(user))
        follow_redirect!
        expect(response.body).to include("削除に失敗しました")
      end
    end
  end
end
