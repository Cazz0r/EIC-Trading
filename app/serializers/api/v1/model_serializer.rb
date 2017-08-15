class API::V1::ModelSerializer < ActiveModel::Serializer
  attribute :id
  attribute :image_url
  attribute :created_at
  attribute :updated_at
end