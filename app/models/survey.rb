# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  file        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Survey < ActiveRecord::Base
	has_many :questions, through: :survey_versions
	has_many :survey_versions
	has_one :document
	mount_uploader :file, DocumentUploader
	accepts_nested_attributes_for  :document

	
end
