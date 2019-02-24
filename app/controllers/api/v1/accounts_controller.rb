class Api::V1::AccountsController < Api::V1::BaseController
  before_action :load_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all.order("name asc")
    render_accounts(200)
  end

  def show
    render_account(200)
  end

  def create
    @account = Account.new(account_params)
    return ar_error(@account) unless @account.save

    # Track how many credits this account was opened with
    @trade_event = TradeEvent.new({user_id: @session_user.id, account_id: @account.id, content: "Credit account opened with #{@account.credit_count} credits."})
    @trade_event.save

    render_account(201)
  end

  def update
    credit_count = @account.credit_count
    return ar_error(@account) unless @account.update_attributes(account_params)
    TradeEventHelper.trade_event_for_credits_changed(credit_count, @session_user, @account)
    render_account(202)
  end

  def destroy
    @account.destroy
    head :no_content
  end

  private
  def account_params
    params.require(:account).permit(:name, :discord_name, :account_type, :credits)
  end

  def render_accounts(status)
    outputs = [{ model: @accounts, key: :accounts, serializer: API::V1::AccountSerializer }]
    render_json(status, outputs)
  end

  def render_account(status)
    outputs = [{ model: @account, key: :account, serializer: API::V1::AccountSerializer }]
    render_json(status, outputs)
  end
end