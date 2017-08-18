class Api::V1::AccountsController < Api::V1::BaseController
  before_action :load_account, only: [:show, :update, :destroy]

  def index
    return custom_error([:lookup_params_required]) unless @filter && @filter[:account_id]
    @account = Account.all.order("name asc")
    render_accounts(200)
  end

  def show
    render_account(200)
  end

  def create
    @account = Account.new(account_params)
    return ar_error(@account) unless @account.save
    render_account(201)
  end

  def update
    return ar_error(@account) unless @account.update_attributes(account_params)
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
    outputs = [{ model: @trade_events, key: :trade_events, serializer: API::V1::AccountSerializer }]
    render_json(status, outputs)
  end

  def render_account(status)
    outputs = [{ model: @account, key: :account, serializer: API::V1::AccountSerializer }]
    render_json(status, outputs)
  end
end