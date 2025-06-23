class Api::V1::UsersController < Api::V1::BaseController
  before_action :require_admin_session
  before_action :load_user, only: [:update]

  def update
    return ar_error(@user) unless @user.update(user_params)
    render_user(202)
  end

  private
  def user_params
    params.require(:user).permit(:admin, :password)
  end

  def render_user(status)
    outputs = [{ model: @user, key: :user, serializer: Api::V1::UserSerializer }]
    render_json(status, outputs)
  end
end