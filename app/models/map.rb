# == Schema Information
#
# Table name: maps
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  estudo_id  :integer
#  info       :text
#

# -*- encoding : utf-8 -*-
class Map < ActiveRecord::Base
	mount_uploader :image, MapUploader
	belongs_to :estudo
	has_many :points
end
