class CreateFeedingCalculations < ActiveRecord::Migration[7.2]
  def change
    create_table :feeding_calculations do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :main_food, foreign_key: { to_table: :foods }
      t.references :sub_food, foreign_key: { to_table: :foods }
      t.decimal :main_food_amount
      t.decimal :sub_food_amount
      t.float :total_daily_calories
      t.timestamps
    end
  end
end
