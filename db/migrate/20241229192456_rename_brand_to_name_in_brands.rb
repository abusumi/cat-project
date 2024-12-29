class RenameBrandToNameInBrands < ActiveRecord::Migration[7.2]
  def change
    rename_column :brands, :brand, :name
  end
end
