module TradeEventHelper
  def self.trade_event_for_credits_changed(old_value, session_user, account)
    return if old_value == account.credit_count
    value_dif = account.credit_count - old_value
    value_str = "#{value_dif < 0 ? '' : '+'}#{value_dif}"
    @trade_event = TradeEvent.new({user_id: session_user.id, account_id: account.id, content: "New balance: #{account.credit_count} credits. #{value_str} credits."})
    @trade_event.save
  end

  def self.trade_events_for_order_changed(old_status, old_user_id, order, session_user)
    return if old_status == order.status && old_user_id == order.user_id

    # If the order status has changed reflect that with an event
    if old_status != order.status
      @trade_event = TradeEvent.new({user_id: session_user.id, order_id: order.id, content: "Order changed from #{OrderHelper.status_text(old_status).downcase} to #{order.status_text.downcase}."})

      # If the order was completed or canceled then reflect that on the parent account
      @trade_event.account_id = order.account_id if order.status == ORDER_CLOSED || order.status == ORDER_CANCELED

      # Finally, just save the new event to the database 
      @trade_event.save
    end

    # If a new CMDR has been assigned to the order then reflect that with an event
    if old_user_id != order.user_id
      if order.user_id.blank?
        @trade_event = TradeEvent.new({user_id: session_user.id, order_id: order.id, content: "Order was set to unassigned."})
      else
        @trade_event = TradeEvent.new({user_id: session_user.id, order_id: order.id, content: "Order assigned to CMDR #{order.user.username}."})
      end
      @trade_event.save
    end
  end
end