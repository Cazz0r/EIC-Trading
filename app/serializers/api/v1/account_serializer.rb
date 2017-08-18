class API::V1::AccountSerializer < API::V1::ModelSerializer
  attributes :name, :discord_name, :account_type, :credits
end