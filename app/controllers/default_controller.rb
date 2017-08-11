class DefaultController < ApplicationController
  layout 'application'

  def index
    @socialmeta = {title: 'EIC Sister Server'}
  end
end