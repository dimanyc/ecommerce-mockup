class SessionsController < ApplicationController

	def new
		
	end


	# Create
	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password 
			flash[:notice] = "Login successful"
			session[:user_id] = @user.id
			redirect_to home_path
		else
			flash[:alert] = "Problem"
			redirect_to home_path
		end
	end

	# Destroy
	def destroy
		session[:user_id] = nil
		flash[:alert] = "Logout successful!"
		redirect_to home_path
	end
end