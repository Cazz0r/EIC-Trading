class OrdersController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session, except: [:summary]

  def index
    @orders_on = true
    @socialmeta = {title: "EIC: Orders"}
    @orders = Order.where("id > 0").order('created_at desc').limit(500)
  end

  def show
    @order = Order.includes(:account, :user).find_by_id(params[:id])
    @trade_events = TradeEvent.includes(:user).where("order_id=#{@order.id} AND account_id IS NULL").order("created_at desc")
    @testimonials = Testimonial.includes(:account).where(order_id: @order.id).order("created_at desc")
    @orders_on = true
    @socialmeta = {title: "EIC: #{@order.account.name}"}
  end

  def summary
    @order = Order.includes(:account, :user).find_by_order_hash(params[:hash])
    return redirect_to_route('/') if @order.blank?
    @socialmeta = {title: "EIC: #{@order.account.name} Summary"}
    @hide_nav = true
    @trade_events = TradeEvent.includes(:user).where("order_id=#{@order.id} AND account_id IS NULL").order("created_at desc")
    @testimonials = Testimonial.includes(:account).where(order_id: @order.id).order("created_at desc")
  end
end