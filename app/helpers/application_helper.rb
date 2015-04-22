module ApplicationHelper
	def IsActivePage(path)
		if current_page?(path)
			"active"
		elsif !current_page?(path)
			""
		end
	end
end
