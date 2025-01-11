class AddExternalUrlToFoods < ActiveRecord::Migration[7.2]
  def change
    add_column :foods, :external_url, :string
  end
end
