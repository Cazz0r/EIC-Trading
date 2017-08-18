class API::V1::TradeEventSerializer < API::V1::ModelSerializer
  attributes :content, :user_id, :account_id
end