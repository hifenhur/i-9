# == Schema Information
#
# Table name: estudos
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  image             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  buttom_color      :string(255)
#  description       :text
#  brief_description :text
#  anexo             :string(255)
#

# -*- encoding : utf-8 -*-
class Estudo < ActiveRecord::Base
	mount_uploader :image, MapUploader
	mount_uploader :anexo, AnexoUploader
	mount_uploader :button_img, ButtonImgUploader
	has_many :maps
	has_many :surveys
	has_many :documents

	def to_s
		self.title
	end
end
