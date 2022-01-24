  class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :require_session, only: [:create]

  def show
    render_session(200)
  end

  def create
    return custom_error([:missing_login_parameters]) unless params[:session] && params[:session][:username] && params[:session][:password]

    # If using the auth flow against our local apps DB then don't reach out to parent server.
    if params[:alt_login]
      authenticate_response = User.authenticate(params[:session])
      return error([authenticate_response]) if authenticate_response.class != User
      @session_user = authenticate_response

    # Otherwise, authenticate against the parent EIC service. User creation exists here only.
    else
      payload = EicApiHelper.get_user(params[:session][:username], params[:session][:password])
      return custom_error([:missing_login_parameters]) if payload.blank?
      if payload.has_key?("error")
        return custom_error([:user_not_found]) if "#{payload["error"]}" == "User does not exist."
        return custom_error([:invalid_login_credentials]) if "#{payload["error"]}" == "Invalid Credentials."
      elsif !payload.has_key?("user")
        return custom_error([:invalid_login_credentials])
      end
      @session_user = EicApiHelper.get_user_from_payload(payload)
      return ar_error(@session_user) unless @session_user.save
    end
      
    login(@session_user)
    render_session(201)
  end

  def destroy
    logout
    head :no_content
  end

  private
  def render_session(status)
    outputs = [{ model: @session_user, key: :session, serializer: API::V1::SessionSerializer }]
    render_json(status, outputs)
  end

  def get_user_from_parent_server
    
  end

  def run_local_auth_flow
    
  end
end