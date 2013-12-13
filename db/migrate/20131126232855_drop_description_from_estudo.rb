# -*- encoding : utf-8 -*-
class DropDescriptionFromEstudo < ActiveRecord::Migration
  def change
  	remove_column :estudos, :description, :string
  end
end
