class InviteController < ApplicationController
  def new
  end

  def create
    user = find_github_user(current_user.token("github"), params[:"Github Handle"])
    if user.keys.include?(:message) && user[:message] == "Not Found"
      flash[:error] = "Github user not found!"
    elsif user[:email].nil?
      flash[:error] = "The Github user you selected doesn't have an email address associated with their account."
    else
      flash[:success] = "Successfully sent invite!"
      ActivateMailer.invite(user, current_user.github_handle).deliver_now
    end
    redirect_to dashboard_path
  end

  private

  def service(token)
    @_service ||= GithubService.new(token)
  end

  def find_github_user(token, handle)
    @_user_data ||= service(token).user_lookup(handle)
  end
end
