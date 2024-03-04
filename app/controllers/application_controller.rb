class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  private

  def record_not_found
    render status: :not_found
  end

  def unprocessable_entity
    render status: :unprocessable_entity
  end
end
