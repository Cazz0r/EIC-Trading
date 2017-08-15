class ErrorsController < ApplicationController

  # A base function meant for errors we manually check for in controllers
  def custom_error(errors)
    response_json = { errors: [] }
    errors.each do |error_name|
      error = t(:errors)[error_name]
      response_json[:errors] << {
        id: error[:id] || nil,          # A unique identifier for this particular occurrence of the problem.
        href: error[:href] || nil,      # A URI that MAY yield further details about this particular occurrence of the problem.
        status: error[:status] || nil,  # The HTTP status code applicable to this problem, expressed as a string value.
        code: error[:code] || nil,      # An application-specific error code, expressed as a string value.
        title: error[:title] || nil,    # A short, human-readable summary of the problem. It SHOULD NOT change from occurrence to occurrence of the problem, except for purposes of localization.
        detail: error[:detail] || nil,  # A human-readable explanation specific to this occurrence of the problem.
        links: error[:links] || nil,    # Associated resources which can be dereferenced from the request document.
        path: error[:path] || nil       # The relative path to the relevant attribute within the associated resource(s). Only appropriate for
      }
    end
    return render json: response_json, status: t(:errors)[errors.first][:status]
  end
end