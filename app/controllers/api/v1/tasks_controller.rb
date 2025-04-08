module Api
  module V1
    class TasksController < Api::V1::ApiBaseController
      def index
        @tasks = Task.all
        if @tasks.any?
          render json: @tasks, methods: [ :image_url ], status: :ok
        else
          render_error({ error: "No Task Found" }, :not_found)
        end
      end
    end
  end
end
