class Order < ActiveRecord::Base
	# ActiveRelations:
	belongs_to :users
	belongs_to :card
	has_and_belongs_to_many :line_items
end
