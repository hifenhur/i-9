class AddImgTitleToEstudos < ActiveRecord::Migration
  def change
    add_column :estudos, :img_title, :string
  end
end
