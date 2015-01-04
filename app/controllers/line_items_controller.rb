class LineItemsController < ApplicationController
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	# Create
	def new
		@line_item = LineItem.new
	end

	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		if @line_item.save
			redirect_to @line_item.cart
		else
			flash[:alert] = "Problem with adding item to cart"
		end

	end

	
	private

	def set_line_item
		@line_item = LineItem.find(params[:id])
	end

end
