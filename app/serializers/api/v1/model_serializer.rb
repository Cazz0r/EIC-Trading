class Api::V1::ModelSerializer < ActiveModel::Serializer
  attribute :id
  attribute :created_at
  attribute :updated_at
end