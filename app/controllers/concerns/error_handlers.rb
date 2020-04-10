module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403

    def rescue404
      render 'errors/not_found', status: 404
    end
  end

  private

  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end

  def rescue500(e)
    @exception = e
    render '/errors/internal_server_error', status: 500
  end
end
