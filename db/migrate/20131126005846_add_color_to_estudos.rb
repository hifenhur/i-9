# -*- encoding : utf-8 -*-
class AddColorToEstudos < ActiveRecord::Migration
  def change
    add_column :estudos, :buttom_color, :string
  end
end
