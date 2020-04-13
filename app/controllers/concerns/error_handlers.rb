module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403

    def rescue404
      render 'errors/not_found', status: :not_found
    end
  end

  private

  def rescue403(error)
    @exception = error
    render 'errors/forbidden', status: :forbidden
  end

  def rescue500(error)
    @exception = error
    render '/errors/internal_server_error', status: :internal_server_error
  end
end
