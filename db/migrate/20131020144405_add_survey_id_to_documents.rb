class AddSurveyIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :survey_id, :integer
  end
end
