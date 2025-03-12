class DropHelpfulsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :helpfuls
  end

  def down
    create_table :helpfuls do |t|
      t.bigint "user_id", null: false
      t.bigint "review_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index :helpfuls, :user_id
    add_index :helpfuls, :review_id
  end
end
