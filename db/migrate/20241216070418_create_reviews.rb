class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :main_food, foreign_key: { to_table: :foods }
      t.references :sub_food, foreign_key: { to_table: :foods }
      t.decimal :rating
      t.timestamps
    end
  end
end
