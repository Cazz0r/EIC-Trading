class OrdersController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session, except: [:summary]

  def index
    @params = params
    @orders_on = true
    @socialmeta = {title: "EIC: Orders"}
    query = QueryHelper.get_simple_query({
      keys: [
        {key: :order_type, operator: :and},
        {key: :platform, operator: :and},
        {key: :status, operator: :and},
        {key: :account_id, operator: :and}],
      params: params
    })
    is_csv = params[:format] && params[:format] == "csv"

    # Tailor query to use case
    if is_csv
      @orders = Order.includes(:user, :account).where(query).order('created_at desc').paginate(page: params[:page], per_page: 10000)
    else
      @orders = Order.includes(:user, :account).where(query).includes(:ordered_trade_events).order('created_at desc').paginate(page: params[:page], per_page: 200)
    end

    respond_to do |format|
      format.html
      if @session_user.admin?
        format.csv
      end
    end
  end

  def show
    @order = Order.includes(:account, :user).find_by_id(params[:id])
    @trade_events = TradeEvent.includes(:user).where("order_id=#{@order.id}").order("created_at desc")
    @testimonials = Testimonial.includes(:account).where(order_id: @order.id).order("created_at desc")
    @orders_on = true
    @socialmeta = {title: "EIC: #{@order.account.name}"}
    @all_users = User.all.order("username asc").collect {|a| [a.username, a.id]}
    @all_users.unshift(["Unassigned", nil]) unless @order.user.blank?
  end

  def summary
    @order = Order.includes(:account, :user).find_by_order_hash(params[:hash])
    return redirect_to_route('/') if @order.blank?
    @socialmeta = {title: "EIC: #{@order.account.name} Summary"}
    @hide_nav = true
    @trade_events = TradeEvent.includes(:user).where("order_id=#{@order.id}").order("created_at desc")
    @testimonials = Testimonial.includes(:account).where(order_id: @order.id).order("created_at desc")
  end
end