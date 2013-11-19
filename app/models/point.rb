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
#

class Point < ActiveRecord::Base
  
  belongs_to :map
end
