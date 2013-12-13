# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  map_id     :integer
#  image      :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  longitude  :float
#  latitude   :float
#

class Point < ActiveRecord::Base
  mount_uploader :image, MapUploader
  belongs_to :map
end
