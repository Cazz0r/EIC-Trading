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
    @user = User.find_by(id: params[:id])
    return if @user.blank?
    @trade_events = TradeEvent.where(user_id: @user.id).order("created_at desc").limit(50)
    @socialmeta = {title: "EIC: CMDR #{@user.username}"}
    @cmdr_session_on = @user.id == @session_user.id
    @cmdrs_on = !@cmdr_session_on
  end
end