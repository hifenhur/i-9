class AddInfoToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :info, :text
  end
end
