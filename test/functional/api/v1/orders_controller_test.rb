require "test_helper"
class Api::V1::OrdersControllerTest < ActionController::TestCase
  setup do
    @user, @account = gen_user, gen_account
    @order_params = {
      "order_type"=>"0",
      "status"=>"0",
      "platform"=>"1",
      "time_window"=>"3",
      "description"=>"123 Bromellite",
      "order_quantity"=>"123",
      "order_commodity"=>"Bromellite",
      "user_id"=>""
    } # "account_id"=>"1"
    @event_params = {
      "initial_note"=>"This is an initial note."
    }
  end

  def check_order_response(json)
    @order = Order.last
    assert_equal(@account.id, json['order']['account_id'])
    assert_equal(@order.order_type, json['order']['order_type'])
    assert_equal(@order.status, json['order']['status'])
    assert_equal(@order.platform, json['order']['platform'])
    assert_equal(@order.time_window, json['order']['time_window'])
    assert_equal(@order.time_window, json['order']['time_window'])
    assert_equal(@order.order_quantity, json['order']['order_quantity'])
    assert_equal(@order.order_commodity, json['order']['order_commodity'])
  end

  test "can create an order using api_key and user_id and account name" do
    @order_params["account_name"] = @account.name
    assert_difference(['Order.count'], 1) do
      post :create, params: { api_key: 'test_token', user_id: @user.id, order: @order_params, event: @event_params}
      assert_response 201
      check_order_response(ActiveSupport::JSON.decode(response.body))
    end
  end

  test "can create an order using api_key and user_id and account id" do
    @order_params["account_id"] = @account.id
    assert_difference(['Order.count'], 1) do
      post :create, params: { api_key: 'test_token', user_id: @user.id, order: @order_params, event: @event_params}
      assert_response 201
      check_order_response(ActiveSupport::JSON.decode(response.body))
    end
  end
end