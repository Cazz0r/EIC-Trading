class Api::V1::AccountSerializer < Api::V1::ModelSerializer
  attributes :name, :discord_name, :account_type, :credits
end