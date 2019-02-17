# Blueshift JSON API
The following docs describe the external intefaces provided for the Blueshift trade platform. Note that not all API endpoints are described below so contact CMDR Drieton(@raddedd#9657 on discord) if you don't see the function you're looking for.

## API Key
The following API key can be sent to the API to make any API request. If this key is sent, a `user_id` MUST ALSO be sent in the request payload.

`a627356d861be44dfbef1d9ed7678ab0`

## Orders
Orders have certain attributes which map ids to other data. Those mappings are as follows:
```ruby
# order_type: 0 - order, 1 - contribution
# status: 0 - open, 1 - underway, 2 - closed, 3 - canceled
# platform: 0 - PC, 1 - XBOX, 2 - PS4
# time_window: 0 = UTC 0000 - 0400, 1 = UTC 0400 - 0800, 2 = UTC 0800 - 1200, 3 = UTC 1200 - 1600, 4 = UTC 1600 - 2000, 5 = UTC 2000 - 0000
```

### Create Order
- **METHOD:** `POST`
- **ROUTE:** `/orders`
- **PARAMS:** (Using Account Name) `{"api_key"=>[REDACTED], "user_id"=>"21", "event"=>{"initial_note"=>"This is an initial note."}, "order"=>{"account_name"=>"ACNT-790", "description"=>"123 Bromellite", "order_commodity"=>"Bromellite", "order_quantity"=>"123", "order_type"=>"0", "platform"=>"1", "status"=>"0", "time_window"=>"3", "user_id"=>""}}`
- **PARAMS:** (Using Account ID) `{"api_key"=>"test_token", "event"=>{"initial_note"=>"This is an initial note."}, "order"=>{"account_id"=>"23", "description"=>"123 Bromellite", "order_commodity"=>"Bromellite", "order_quantity"=>"123", "order_type"=>"0", "platform"=>"1", "status"=>"0", "time_window"=>"3", "user_id"=>""}, "user_id"=>"23"}`