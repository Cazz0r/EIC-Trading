class DefaultController < ApplicationController
  layout 'application'

  def index
    return redirect_to '/accounts' unless @session_user.blank?
    @socialmeta = {title: 'EIC'}
  end
end