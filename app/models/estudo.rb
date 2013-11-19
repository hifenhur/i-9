# == Schema Information
#
# Table name: estudos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Estudo < ActiveRecord::Base
end
