# -*- encoding : utf-8 -*-
class AddColorToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :color, :string
  end
end
