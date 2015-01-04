class User < ActiveRecord::Base

	# Validations:
	validates :fname,:lname, :email, presence: true
	validates :password, length: {in: 4..12},confirmation: true,presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	# ActiveRelations:
	has_many :cards
	has_many :carts #not sure if this relation is needed.
	has_many :orders


end
