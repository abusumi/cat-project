class RemoveCatIdFromFeedingCalculations < ActiveRecord::Migration[7.2]
  def change
    remove_column :feeding_calculations, :cat_id, :bigint
  end
end
