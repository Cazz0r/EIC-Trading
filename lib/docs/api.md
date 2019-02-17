# Blueshift JSON API
The following docs describe the external intefaces provided for the Blueshift trade platform. Note that not all API endpoints are described below so contact CMDR Drieton(@raddedd#9657 on discord) if you don't see the function you're looking for.

## Orders

### Create Order
- **METHOD:** `POST`
- **ROUTE:** `/orders`
- **PARAMS:** `{"api_key"=>[REDACTED], "user_id"=>"21", "event"=>{"initial_note"=>"This is an initial note."}, "order"=>{"account_name"=>"ACNT-790", "description"=>"123 Bromellite", "order_commodity"=>"Bromellite", "order_quantity"=>"123", "order_type"=>"0", "platform"=>"1", "status"=>"0", "time_window"=>"3", "user_id"=>""}}`