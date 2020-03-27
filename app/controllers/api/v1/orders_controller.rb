class Api::V1::OrdersController < Api::V1::BaseController
  before_action :load_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.where("id > 0").order("created_at desc").limit(200)
    render_orders(200)
  end

  def show
    render_order(200)
  end

  def create

    # Inject account into order params if only a name is passed
    if params[:order][:account_name]
      @account = Account.find_by_name(params[:order][:account_name])
      return custom_error([:account_required]) if @account.blank?
      params[:order][:account_id] = @account.id
      params[:order].delete :account_name
    end

    # Perform order creation as normal
    return custom_error([:account_required]) unless order_params && !order_params[:account_id].blank?
    return custom_error([:account_required]) unless order_note && !order_note[:initial_note].blank?
    @order = Order.new(order_params)
    return ar_error(@order) unless @order.save
    TradeEvent.new({content: order_note[:initial_note], user_id: @session_user.id, order_id: @order.id, account_id: @order.account_id}).save
    render_order(201)
  end

  def update
    old_status, old_user_id = @order.status, @order.user_id
    return ar_error(@order) unless @order.update_attributes(order_params)
    TradeEventHelper.trade_events_for_order_changed(old_status, old_user_id, @order, @session_user)
    render_order(202)
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private
  def order_params
    params.require(:order).permit(:description, :account_id, :user_id, :time_window, :location, :order_type, :status, :platform, :order_quantity, :order_commodity)
  end

  def order_note
    params.require(:event).permit(:initial_note)
  end

  def render_orders(status)
    outputs = [{ model: @orders, key: :orders, serializer: API::V1::OrderSerializer }]
    render_json(status, outputs)
  end

  def render_order(status)
    outputs = [{ model: @order, key: :order, serializer: API::V1::OrderSerializer }]
    render_json(status, outputs)
  end
end

