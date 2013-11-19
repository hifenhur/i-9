class AddEstudoToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :estudo_id, :integer
  end
end
