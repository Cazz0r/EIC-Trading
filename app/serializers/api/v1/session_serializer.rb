class API::V1::SessionSerializer < API::V1::ModelSerializer
  attributes :username, :password, :user_id, :image_url

  def password
    nil
  end

  def user_id
    object.id
  end
end