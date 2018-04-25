class Api::V1::OrdersController < Api::V1::BaseController
  before_action :load_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.where("id > 0").order("created_at desc").limit(200)
    render_orders(200)
  end

  def show
    remder_order(200)
  end

  def create
    return custom_error([:account_required]) unless order_params && !order_params[:account_id].blank?
    @order = Order.new(order_params)
    return ar_error(@order) unless @order.save
    TradeEvent.new({content: "Order opened.", user_id: @session_user.id, order_id: @order.id, account_id: @order.account_id}).save
    remder_order(201)
  end

  def update
    old_status, old_user_id = @order.status, @order.user_id
    return ar_error(@order) unless @order.update_attributes(order_params)
    TradeEventHelper.trade_events_for_order_changed(old_status, old_user_id, @order, @session_user)
    remder_order(202)
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private
  def order_params
    params.require(:order).permit(:description, :account_id, :user_id, :time_window, :order_type, :status, :platform, :order_quantity, :order_commodity)
  end

  def render_orders(status)
    outputs = [{ model: @orders, key: :orders, serializer: API::V1::OrderSerializer }]
    render_json(status, outputs)
  end

  def remder_order(status)
    outputs = [{ model: @order, key: :order, serializer: API::V1::OrderSerializer }]
    render_json(status, outputs)
  end
end
