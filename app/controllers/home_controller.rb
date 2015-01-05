class HomeController < ApplicationController
	# Read
	def index
		@products = Product.all
	end

end
