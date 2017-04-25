module ApplicationHelper
	def logged_in?
		return session[:user_id] != nil
	end

	def authorize
		redirect_to (:root) unless logged_in?
	end

	def current_user
		if logged_in?
			return User.find(session[:user_id])
		end
	end
end
