class DropDescriptionFromEstudo < ActiveRecord::Migration
  def change
  	remove_column :estudos, :description, :string
  end
end
