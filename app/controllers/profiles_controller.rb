class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user = current_user

		if @profile.save
			flash[:success] = "Profile Created"
			redirect_to profile_path(@profile.profile_name)
		else
			flash.now[:error] = "Please Try Again"
			render 'new'
		end
	end

	def show
		@profile = Profile.where(profile_name: params[:id]).first
		@relationship=Relationship.new
	end

	private
	def profile_params
		params.require(:profile).permit(:picture, :profile_name)
	end
end
