# -*- encoding : utf-8 -*-
module ApplicationHelper
	def admin_link(name, url, params = {})
		params[:class] = "btn btn-primary"
		if current_user
			link_to name, url, params
		end
	end


	

end
