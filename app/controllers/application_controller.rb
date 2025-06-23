class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :load_session_user

  def load_session_user
    if params[:api_key] && params[:api_key] == ENV["API_TOKEN"] && !params[:user_id].blank?
      @session_user = User.find_by_id(params[:user_id])
    else
      @session_user = User.find_by_id(session[:user_id]) if session[:user_id]
    end
  end

  def redirect_to_home_without_session
    return redirect_to '/' if @session_user.blank?
  end

  def redirect_to_route(route)
  	return redirect_to route
  end
end