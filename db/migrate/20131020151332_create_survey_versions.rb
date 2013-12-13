# -*- encoding : utf-8 -*-
class CreateSurveyVersions < ActiveRecord::Migration
  def change
    create_table :survey_versions do |t|
      t.string :name
      t.references :survey, index: true
      t.text :description
      t.string :file

      t.timestamps
    end
  end
end
