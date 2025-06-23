class Api::V1::TradeEventsController < Api::V1::BaseController
  before_action :load_trade_event, only: [:show, :update, :destroy]

  def index
    return custom_error([:lookup_params_required]) unless @filter && @filter[:account_id]
    @trade_events = TradeEvent.where(account_id: @filter[:account_id]).order("created_at desc")
    @users = User.where(id: @trade_events.map{|te| te.user_id})
    render_trade_events(200)
  end

  def show
    render_trade_event(200)
  end

  def create
    @trade_event = TradeEvent.new(trade_event_params)
    @trade_event.user = @session_user
    return ar_error(@trade_event) unless @trade_event.save
    render_trade_event(201)
  end

  def update
    return ar_error(@trade_event) unless @trade_event.update_attributes(trade_event_params)
    render_trade_event(202)
  end

  def destroy
    @trade_event.destroy
    head :no_content
  end

  private
  def trade_event_params
    params.require(:trade_event).permit(:content, :account_id, :order_id)
  end

  def render_trade_events(status)
    outputs = [{ model: @trade_events, key: :trade_events, serializer: Api::V1::TradeEventSerializer }]
    outputs << { model: @users, key: :users, serializer: Api::V1::UserSerializer }
    render_json(status, outputs)
  end

  def render_trade_event(status)
    outputs = [{ model: @trade_event, key: :trade_event, serializer: Api::V1::TradeEventSerializer }]
    render_json(status, outputs)
  end
end