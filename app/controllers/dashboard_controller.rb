class DashboardController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session, only: [:index]

  def index
  	@dash_on = true
    @socialmeta = {title: 'EIC Dashboard'}
  end
end