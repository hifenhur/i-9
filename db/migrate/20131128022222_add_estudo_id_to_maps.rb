# -*- encoding : utf-8 -*-
class AddEstudoIdToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :estudo_id, :integer
  end
end
