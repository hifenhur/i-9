class AddAcceptedAndDescriptionToPoint < ActiveRecord::Migration
  def change
    add_column :points, :accepted, :boolean
    add_column :points, :description, :text
    add_column :points, :ip, :string
  end
end
