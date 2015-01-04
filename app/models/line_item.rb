class LineItem < ActiveRecord::Base
	# ActiveRelations:
	belongs_to :product
	belongs_to :cart
	has_and_belongs_to_many :orders

	# Model-level methods:
	def total_price
		product.price * quantity #interesting how I can set a var in controller and then refer to it in the model. 
	end

end
