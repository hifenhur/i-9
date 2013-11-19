class AddLonAndLatToPoints < ActiveRecord::Migration
  def change
    add_column :points, :longitude, :float
    add_column :points, :latitude, :float
  end
end
