class CardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]
	# Create
	def new 
		@card = Card.new
	end

	def create
		@card = Card.new(card_params)
		@card.cc_type = params[:cc_type]
		@user = User.find(session[:user_id])

		if 	session[:user_id]
			respond_to do |format|
				if @card.save
					@user.cards << @card
					
					format.html { redirect_to new_order_path, notice: 'Card has been added' }
				else
	        		format.html { render :new }
	        		format.json { render json: @card.errors, status: :unprocessable_entity }
				end
			end
		else
			flash[:message] = "Please log in or create an account first"
			redirect_to new_user_path
		end

	end

	# Read
	def index
		@user = current_user
		@cards = @user.cards 
	end

	def show
		
	end

	private

		def set_card
			@card = Card.find(params[:id])
		end

		def card_params
			params.require(:card).permit(:type,:number,:ccv,:fname,:lname,:user_id)
		end	
end
