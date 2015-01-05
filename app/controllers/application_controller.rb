class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart,:current_user


	
	def set_cart
	  	@cart = Cart.find(session[:cart_id])
	  	rescue ActiveRecord::RecordNotFound #creates a new cart if session cart id is not found. What happens when Devise session is deleted? 
	  	@cart = Cart.create
	  	session[:cart_id] = @cart.id  	
	end

	def current_user
		if session[:user_id] 
			@current_user ||= User.find(session[:user_id])
		else
			return
		end
		
	end	
 	

end
