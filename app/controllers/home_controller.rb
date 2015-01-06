class HomeController < ApplicationController
	# Read
	def index
		@products = Product.all
	end

	def about
		@products = Product.all
	end

end
