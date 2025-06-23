class Api::V1::UserSerializer < Api::V1::ModelSerializer
  attributes :username, :image_url, :rank, :tags, :admin
end