class Api::V1::TradeEventSerializer < Api::V1::ModelSerializer
  attributes :content, :user_id, :account_id
end