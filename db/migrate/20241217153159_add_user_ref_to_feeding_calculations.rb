class AddUserRefToFeedingCalculations < ActiveRecord::Migration[7.2]
  def change
    add_reference :feeding_calculations, :user, null: false, foreign_key: true
  end
end
