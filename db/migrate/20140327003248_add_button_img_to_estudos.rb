class AddButtonImgToEstudos < ActiveRecord::Migration
  def change
    add_column :estudos, :button_img, :string
  end
end
