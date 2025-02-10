module Api
  class BaseController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActionController::ParameterMissing, with: :parameter_missing_response

    private

    def not_found_response(exception)
      render json: { error: exception.message }, status: :not_found
    end

    def parameter_missing_response(exception)
      render json: { error: exception.message }, status: :unprocessable_entity
    end
  end
end 