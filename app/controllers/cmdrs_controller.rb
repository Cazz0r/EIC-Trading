class CmdrsController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session

  def index
  	@cmdrs_on = true
    @socialmeta = {title: "EIC: CMDRS"}

    # N + 1, but there aren't more than a handful of contributing EIC members.
    # Side project logic FTW!
    @users = User.where('id > 0').order('username asc')
  end

  def show
  	@cmdr_session_on = true
    @socialmeta = {title: "EIC: CMDR #{@session_user.username}"}
    @user = User.find_by_id(params[:id])
  end
end