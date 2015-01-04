class CartsController < ApplicationController
	  before_action :set_cart, only: [:show, :edit, :update, :destroy]

		# Create
		def new 
			@cart = Cart.new
		end

		def create
			@cart = Cart.new(cart_params)

			if @cart.save
				redirect_to @cart
				flash[:notice] = "Added!"
			else
				render :new
				flash[:alert] = "Problem with adding item(s) to your cart"
			end

		end

		# Destroy
		def destroy
			@cart.destroy if @cart.id == session[:cart_id]
			session[:cart_id] = nil
			redirect_to home_path
			flash[:notice] = "Your cart is now empty"
		end

end
