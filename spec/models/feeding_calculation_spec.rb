require 'rails_helper'

RSpec.describe FeedingCalculation, type: :model do
  describe "関連付けのテスト" do
    it "User に属している（optional: true）" do
      expect(FeedingCalculation.reflect_on_association(:user).macro).to eq(:belongs_to)
      expect(FeedingCalculation.reflect_on_association(:user).options[:optional]).to eq(true)
    end

    it "Brand に属している（optional: true）" do
      expect(FeedingCalculation.reflect_on_association(:brand).macro).to eq(:belongs_to)
      expect(FeedingCalculation.reflect_on_association(:brand).options[:optional]).to eq(true)
    end

    it "MainFood（Foodモデル） に属している（optional: true）" do
      assoc = FeedingCalculation.reflect_on_association(:main_food)
      expect(assoc.macro).to eq(:belongs_to)
      expect(assoc.options[:class_name]).to eq("Food")
      expect(assoc.options[:foreign_key]).to eq("main_food_id")
      expect(assoc.options[:optional]).to eq(true)
    end

    it "SubFood（Foodモデル） に属している（optional: true）" do
      assoc = FeedingCalculation.reflect_on_association(:sub_food)
      expect(assoc.macro).to eq(:belongs_to)
      expect(assoc.options[:class_name]).to eq("Food")
      expect(assoc.options[:foreign_key]).to eq("sub_food_id")
      expect(assoc.options[:optional]).to eq(true)
    end
  end

  describe "インスタンスメソッドのテスト" do
    let(:brand1) { create(:brand) }
    let(:brand2) { create(:brand) }
    let(:main_food) { create(:food, brand: brand1) }
    let(:sub_food) { create(:food, brand: brand2) }
    let(:feeding_calculation) { create(:feeding_calculation, main_food: main_food, sub_food: sub_food) }

    describe "#main_brand" do
      it "main_food が存在する場合、brand を返す" do
        expect(feeding_calculation.main_brand).to eq(brand1)
      end

      it "main_food が存在しない場合、nil を返す" do
        feeding_calculation.main_food = nil
        expect(feeding_calculation.main_brand).to be_nil
      end
    end

    describe "#sub_brand" do
      it "sub_food が存在する場合、brand を返す" do
        expect(feeding_calculation.sub_brand).to eq(brand2)
      end

      it "sub_food が存在しない場合、nil を返す" do
        feeding_calculation.sub_food = nil
        expect(feeding_calculation.sub_brand).to be_nil
      end
    end
  end
end
