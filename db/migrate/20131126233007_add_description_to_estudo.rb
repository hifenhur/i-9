class AddDescriptionToEstudo < ActiveRecord::Migration
  def change
    add_column :estudos, :description, :text
    add_column :estudos, :brief_description, :text
  end
end
