class Card < ActiveRecord::Base
	# Validations
		validates :number, presence: true, numericality: true, length: {
		minimum: 2, 
		maximum: 16,
		message: "Credit Card number you entered is incorrect"
	}

	validates :ccv, presence: true, numericality: true, length: {
		minimum: 3,  
		maximum: 4,
		message: "CCV / CVC / CVV code you entered is incorrect"
	}

	# ActiveRelations:
	belongs_to :user
	has_many :orders


end
