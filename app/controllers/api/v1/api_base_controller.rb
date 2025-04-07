module Api
  module V1
    class ApiBaseController < ApplicationController::API
      respond_to :json
    end
  end
end
