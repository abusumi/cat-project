class CreateCats < ActiveRecord::Migration[7.2]
  def change
    create_table :cats do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :weight
      t.string :name
      t.timestamps
    end
  end
end
