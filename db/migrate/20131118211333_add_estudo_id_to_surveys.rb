# -*- encoding : utf-8 -*-
class AddEstudoIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :estudo_id, :integer
  end
end
