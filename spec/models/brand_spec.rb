require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe "関連付けのテスト" do
    it "複数のFoodを持つことができる" do
      expect(Brand.reflect_on_association(:foods).macro).to eq(:has_many)
    end
  end

  describe "Ransackの設定テスト" do
    let(:brand) { create(:brand) }

    it "ransackable_attributes に name が含まれる" do
      expect(Brand.ransackable_attributes).to include("name")
    end

    it "ransackable_associations に foods が含まれる" do
      expect(Brand.ransackable_associations).to include("foods")
    end

    it "ransackable_scopes に search_by_name が含まれる" do
      expect(Brand.ransackable_scopes).to include(:search_by_name)
    end
  end

  describe "検索スコープのテスト" do
    let!(:brand1) { create(:brand, name: "ブランドA") }
    let!(:brand2) { create(:brand, name: "ブランドB") }
    let!(:food1) { create(:food, name: "フードA", brand: brand1) }
    let!(:food2) { create(:food, name: "フードB", brand: brand2) }

    it "ブランド名で検索できる" do
      result = Brand.search_by_name("ブランドA")
      expect(result).to include(brand1)
      expect(result).not_to include(brand2)
    end

    it "フード名で検索できる" do
      result = Brand.search_by_name("フードA")
      expect(result).to include(brand1)
      expect(result).not_to include(brand2)
    end

    it "検索クエリが空の場合は nil を返す" do
      expect(Brand.search_by_name("")).to be_nil
    end
  end
end
