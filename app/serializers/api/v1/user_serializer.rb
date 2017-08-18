class API::V1::UserSerializer < API::V1::ModelSerializer
  attributes :username, :image_url, :rank, :tags
end