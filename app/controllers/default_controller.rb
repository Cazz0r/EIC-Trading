class DefaultController < ApplicationController
  layout 'application'

  def index
    return redirect_to '/dashboard' unless @session_user.blank?
    @socialmeta = {title: 'EIC'}
  end
end