class Product < ActiveRecord::Base

	# Validations:
	validates :title, :description, presence: true 
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format:
		{
			with: %r{\.(gif|jpg|png)\Z}i,  
			message: 'image must be a .png, .gif or .jpg /.jpeg'
		}	

	# ActiveRelations:
	has_many :line_items
end
