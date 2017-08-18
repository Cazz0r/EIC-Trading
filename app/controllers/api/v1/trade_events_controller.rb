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
    @trade_event = TradeEvent.new(params[:trade_event])
    return ar_error(@trade_event) unless @trade_event.save
    render_trade_event(201)
  end

  def update
    return ar_error(@trade_event) unless @trade_event.update_attributes(params[:trade_event])
    render_trade_event(202)
  end

  def destroy
    @trade_event.destroy
    head :no_content
  end

  private
  def render_trade_events(status)
    outputs = [{ model: @trade_events, key: :trade_events, serializer: API::V1::TradeEventSerializer }]
    outputs << { model: @users, key: :users, serializer: API::V1::UserSerializer }
    render_json(status, outputs)
  end

  def render_trade_event(status)
    outputs = [{ model: @trade_event, key: :trade_event, serializer: API::V1::TradeEventSerializer }]
    render_json(status, outputs)
  end
end