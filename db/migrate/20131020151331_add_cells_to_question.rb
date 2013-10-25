class AddCellsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :cells, :integer
  end
end
