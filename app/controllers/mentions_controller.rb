class MentionsController < ApplicationController
  before_action :set_user

  def index
  	# raise :test
  	if params[:search]
	  	if params[:search].start_with? '@'
	  		@search = params[:search]
	  	else
	  		@search = "@" + params[:search]
	  	end
	end
  end

  def create
  	@saved_image = SavedImage.new(saved_images_params)
  	@saved_image.save
  	redirect_to mentions_index_path
  end

  def show
  	@saved_image = SavedImage.where(user_id: current_user.id)
  end

  private
  	def set_user
  		@twitter = current_user.twitter
  	end

  	def saved_images_params
  		params.permit(:user_id, :image_url)
  	end
end
