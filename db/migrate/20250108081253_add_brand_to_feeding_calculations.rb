class AddBrandToFeedingCalculations < ActiveRecord::Migration[7.2]
  def change
    add_reference :feeding_calculations, :brand, null: true, foreign_key: true
  end
end