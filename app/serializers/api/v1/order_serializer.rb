class API::V1::OrderSerializer < API::V1::ModelSerializer
  attributes :description, :account_id, :user_id, :order_type, :status
end