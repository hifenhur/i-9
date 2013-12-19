# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  picture    :string(255)
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#

class Employee < ActiveRecord::Base
	mount_uploader :picture, EmployeeUploader
end
