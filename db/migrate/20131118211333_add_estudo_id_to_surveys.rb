class AddEstudoIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :estudo_id, :integer
  end
end
