class WelcomeController < ApplicationController
  def index
    if current_user.nil?
      @tutorials = Tutorial.visitor_tutorials(params[:tag], params[:page])
    elsif current_user.admin?
      @tutorials = Tutorial.admin_tutorials(params[:tag], params[:page])
    else
      @tutorials = Tutorial.user_tutorials(params[:tag], params[:page])
    end
  end
end
