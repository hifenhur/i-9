class CreateEstudos < ActiveRecord::Migration
  def change
    create_table :estudos do |t|
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
