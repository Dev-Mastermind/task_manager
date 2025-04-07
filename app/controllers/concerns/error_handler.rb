module ErrorHandler
  extend ActiveSupport::Concern

  private

  def render_error(resource, status = :ok)
    render json: resource, status: status
  end
end
