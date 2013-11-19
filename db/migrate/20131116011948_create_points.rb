class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :map, index: true
      t.string :image
      t.string :title

      t.timestamps
    end
  end
end
