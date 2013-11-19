module ApplicationHelper
	def admin_link(name, url, params = {})
		if current_user
			link_to name, url, params
		end
	end


	

end
