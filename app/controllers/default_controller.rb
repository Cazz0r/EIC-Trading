class DefaultController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session, only: [:dashboard]

  def index
  	return redirect_to '/dashboard' unless @session_user.blank?
    @socialmeta = {title: 'EIC'}
  end

  def dashboard
  	@socialmeta = {title: 'EIC Dashboard'}
  end
end