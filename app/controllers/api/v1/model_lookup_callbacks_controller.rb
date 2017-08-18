class Api::V1::ModelLookupCallbacksController < ErrorsController
  def load_account
    @account = not_found?(Account.find_by_id(params[:id]))
  end

  def load_trade_event
    @trade_event = not_found?(TradeEvent.find_by_id(params[:id]))
  end
end