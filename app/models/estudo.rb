# == Schema Information
#
# Table name: estudos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :string(255)
#  image        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  buttom_color :string(255)
#

class Estudo < ActiveRecord::Base
	mount_uploader :image, MapUploader
	has_many :maps
	has_many :surveys
	has_many :documents
end
