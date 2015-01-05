class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]

	# Create
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@user = User.find(session[:user_id])
		@line_items = @cart.line_items

		respond_to do |format|
			if @order.save
				@order.line_items << @line_items
				@user.orders << @order 
				format.html{ redirect_to home_path,notice:'Order has been placed'}
				#flash[:notice] = "Order has been placed"
				#redirect_to home_path
			else
				format.html { render :new, notice:"Problem! See the JSON response" }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end

	end

	# Read
	def index
		@user = current_user
		@orders = @user.orders
	end

	def show
		@order = params[:order]
	end

	private
	    def set_order
	    	@order = Order.find(params[:id])
	    end

	    def order_params
	    	params[:order]
	    end	
end
