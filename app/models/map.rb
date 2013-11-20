# == Schema Information
#
# Table name: maps
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Map < ActiveRecord::Base
	mount_uploader :image, MapUploader
	has_many :points
end
