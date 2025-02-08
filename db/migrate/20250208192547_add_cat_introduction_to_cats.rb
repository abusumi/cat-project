class AddCatIntroductionToCats < ActiveRecord::Migration[7.2]
  def change
    add_column :cats, :cat_introduction, :text
  end
end
