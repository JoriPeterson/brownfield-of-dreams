class WelcomeController < ApplicationController
  def index
		@tutorials = Tutorial.user_tutorials(current_user, params[:tag], params[:page])
  end
end
