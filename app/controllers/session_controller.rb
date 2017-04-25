class SessionController < ApplicationController

	def new
		@user = User.new

		render :new
	end

	def create
		# if logged_in?
		# 	@user = current_user
		# 	redirect_to root_path
		# else
			@user = User.find_by(username: params[:user][:username])
			if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to(:root)
			else
				@errors=["Incorrect Username / Password Combination"]
				render :new
			end
		# end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: 'Logged out!'
	end

end
