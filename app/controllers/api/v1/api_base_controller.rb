module Api
  module V1
    class ApiBaseController < ActionController::API
      include ErrorHandler

      before_action :json_format

      private

      def json_format
        request.format = :json
      end
    end
  end
end
