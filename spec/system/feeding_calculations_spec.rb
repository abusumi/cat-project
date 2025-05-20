require 'rails_helper'

RSpec.describe "FeedingCalculations", type: :request do
  describe "POST /feeding_calculation/calculate" do
    let(:main_brand) { create(:brand) }
    let(:main_food) { create(:food, brand: main_brand, calories_per_gram: 400) }
    let(:sub_brand) { create(:brand) }
    let(:sub_food) { create(:food, brand: sub_brand, calories_per_gram: 350) }

    context "サブフードがある場合" do
      it "計算結果ページが表示されること" do
        post calculate_feeding_calculation_index_path, params: {
          main_brand_id: main_brand.id,
          main_food_id: main_food.id,
          sub_brand_id: sub_brand.id,
          sub_food_id: sub_food.id,
          weight: 4.8
        }

        expect(response).to have_http_status(:success)
        expect(response.body).to include("計算結果")
        expect(response.body).to include(main_brand.name)
        expect(response.body).to include(main_food.name)
        expect(response.body).to include(sub_brand.name)
        expect(response.body).to include(sub_food.name)
        expect(response.body).to include("kg")
        expect(response.body).to include("g")
        expect(response.body).to include("kcal")
      end
    end

    context "サブフードがない場合" do
      it "計算結果ページが正しく表示されること" do
        post calculate_feeding_calculation_index_path, params: {
          main_brand_id: main_brand.id,
          main_food_id: main_food.id,
          weight: 5.2
        }

        expect(response).to have_http_status(:success)
        expect(response.body).to include("計算結果")
        expect(response.body).to include(main_brand.name)
        expect(response.body).to include(main_food.name)
        expect(response.body).to include("5.2")
        expect(response.body).to include("kg")
        expect(response.body).to include("kcal")
        expect(response.body).to include("g")
      end
    end
  end
end
