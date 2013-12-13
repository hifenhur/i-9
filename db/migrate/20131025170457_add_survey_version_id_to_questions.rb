# -*- encoding : utf-8 -*-
class AddSurveyVersionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :survey_version_id, :integer
  end
end
