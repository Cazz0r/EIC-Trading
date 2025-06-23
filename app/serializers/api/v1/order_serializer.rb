class Api::V1::OrderSerializer < Api::V1::ModelSerializer
  attributes :description, :account_id, :user_id, :order_type, :status, :order_hash, :time_window, :order_quantity, :order_commodity, :platform, :location
end