class AccountsController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session

  def index
    @accounts_on = true
    @socialmeta = {title: "EIC: Accounts"}

    # N + 1, but there aren't more than a handful of accounts.
    # Side project logic FTW!
    @accounts = Account.where('id > 0').order('credits desc')
  end

  def show
    @account = Account.find_by_id(params[:id])
    @accounts_on = true
    @socialmeta = {title: "EIC: #{@account.name}"}
  end
end