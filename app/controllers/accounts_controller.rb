class AccountsController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session, except: [:statement]

  def index
    @accounts_on = true
    @socialmeta = {title: "EIC: Accounts"}

    # N + 1, but there aren't more than a handful of accounts.
    # Side project logic FTW!
    @accounts = Account.where('id > 0').order('name asc')
  end

  def show
    @account = Account.includes(:trade_events, trade_events: :user).find_by_id(params[:id])
    @trade_events = TradeEvent.includes(:user).where(account_id: @account.id).order("created_at desc")
    @accounts_on = true
    @socialmeta = {title: "EIC: #{@account.name}"}
  end

  def statement
    @account = Account.find_by_account_hash(params[:hash])
    return redirect_to_route('/') if @account.blank?
    @socialmeta = {title: ": #{@account.name} Statement"}
    @hide_nav = true
  end
end