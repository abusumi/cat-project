class ChangeFoodReferencesInReviews < ActiveRecord::Migration[7.2]
  def change
    remove_column :reviews, :main_food_id, :bigint
    remove_column :reviews, :sub_food_id, :bigint
    add_column :reviews, :food_id, :bigint, null: false

    add_foreign_key :reviews, :foods, column: :food_id
    add_index :reviews, [ :user_id, :food_id ], unique: true
  end
end
