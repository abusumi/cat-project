class CreateFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :foods do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.decimal :calories_per_gram
      t.decimal :seventy
      t.decimal :coefficient
      t.timestamps
    end
  end
end
