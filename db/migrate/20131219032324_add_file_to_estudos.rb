class AddFileToEstudos < ActiveRecord::Migration
  def change
    add_column :estudos, :anexo, :string
  end
end
