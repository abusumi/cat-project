class AddWeightToFeedingCalculations < ActiveRecord::Migration[7.2]
  def change
    add_column :feeding_calculations, :weight, :decimal, precision: 3, scale: 1, null: true
  end
end
