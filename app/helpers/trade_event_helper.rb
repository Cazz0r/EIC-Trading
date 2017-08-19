module TradeEventHelper
  def self.trade_event_for_credits_changed(old_value, session_user, account)
    return if old_value == account.credit_count
    value_dif = account.credit_count - old_value
    value_str = "#{value_dif < 0 ? '' : '+'}#{value_dif}"
    @trade_event = TradeEvent.new({user_id: session_user.id, account_id: account.id, content: "New balance: #{account.credit_count} credits. #{value_str} credits."})
    @trade_event.save
  end
end