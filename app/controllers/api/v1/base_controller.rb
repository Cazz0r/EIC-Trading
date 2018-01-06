class Api::V1::BaseController < Api::V1::ModelLookupCallbacksController
  before_action :load_includes, except: [:not_found]
  before_action :load_filter, except: [:not_found]
  before_action :load_sort, except: [:not_found]
  before_action :require_session, except: [:not_found]

  # A function which all output rendering should eventually call
  def render_json(status, data, meta = nil)
    render json: {}, output: data, request: request, includes: @includes, session_user: @session_user, params: params, meta: meta, serializer: API::V1::BaseSerializer, status: status
  end

  # Callback to load any include data
  def load_includes
    @includes = params[:include] ? params[:include].split(',') : []
  end

  # Callback to load any filter data
  def load_filter
    @filter = params[:filter].is_a?(Hash) ? params[:filter] : nil

    # Rails backend doesn't filter null values passed via paraters as "NaN", so we have to remove multiple cases of nil here
    @filter.delete_if { |k, v| v.empty? || v == 'NaN' || v.blank? } if @filter
  end

  # Callback to load any sort data
  def load_sort
    @sort = params[:sort].is_a?(Hash) ? params[:sort] : nil

    # Rails backend doesn't filter null values passed via paraters as "NaN", so we have to remove multiple cases of nil here
    @sort.delete_if { |k, v| v.empty? || v == 'NaN' || v.blank? } if @sort
  end

  # Callback to load the session user if one exists.
  def load_session_user
    @session_user = current_user
  end

  # Callback to require a session to access resource.
  def require_session
    custom_error([:session_required]) unless @session_user
  end

  # Callback to require user is an admin to access resource.
  def require_admin_session
    custom_error([:admin_session_required]) unless @session_user.admin?
  end

  # Callback to produce a general resource not found error if the model passed in doesn't exist
  def not_found?(model)
    raise ActionController::RoutingError.new(t(:errors)[:resource_not_found][:detail]) unless model
    return model
  end

  # A function meant to handle/parse errors on an active record object into our json format
  def ar_error(model)
    response_json = { errors: [] }
    model.errors.each do |attribute, message|
      response_json[:errors] << {
        id: nil,            # A unique identifier for this particular occurrence of the problem.
        href: nil,          # A URI that MAY yield further details about this particular occurrence of the problem.
        status: 422,        # The HTTP status code applicable to this problem, expressed as a string value.
        code: 0,            # An application-specific error code, expressed as a string value.
        title: attribute,   # A short, human-readable summary of the problem. It SHOULD NOT change from occurrence to occurrence of the problem, except for purposes of localization.
        detail: message,    # A human-readable explanation specific to this occurrence of the problem.
        links: nil,         # Associated resources which can be dereferenced from the request document.
        path: nil           # The relative path to the relevant attribute within the associated resource(s). Only appropriate for
      }
    end
    return render json: response_json, status: 422
  end
end