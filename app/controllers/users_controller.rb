class UsersController < ApplicationController

	#Create
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
			respond_to do |format|
				if @user.save
					session[:user_id] = @user.id 
					format.html { redirect_to home_path, notice: 'User has been created' }
				else
	        		format.html { render :new }
	        		format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
	end
	
	# Read
	def show
		@user = current_user
	end

	# Update
	def edit
		@user = current_user
	end

	def update
		@user = current_user
		respond_to do |format|
			if @user.update(user_params)
				format.html {redirect_to home_path, notice: "Changes have been saved"}
			else
				format.html {render :edit}
				format.json { render json: @user.errors, status: :unprocessable_entity }
	      	end
    	end

	end

	private
	def user_params
		params.require(:user).permit(:fname,:lname,:email,:password,:password_confirmation)
	end
end
