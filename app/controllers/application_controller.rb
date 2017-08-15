class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionHelper
  before_action :load_session_user

  def load_session_user
    @session_user = current_user
  end

  def redirect_to_home_without_session
    return redirect_to '/' if @session_user.blank?
  end
end