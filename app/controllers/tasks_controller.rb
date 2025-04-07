class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = case params[:status]
    when "completed" then Task.where(completed: true)
    when "pending" then Task.where(completed: false)
    else Task.all
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    if @task.save
      TaskNotificationJob.perform_later(@task)

      redirect_to task_url(@task), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if params[:task][:remove_image] == "1" && @task.image.attached?
      @task.image.purge
    end

    if @task.update(task_params.except(:remove_image))
      if request.format.html?
        redirect_to task_url(@task), notice: "Task was successfully updated."
      else
        render :show, status: :ok, location: @task
      end
    else
      if request.format.html?
        render :edit, status: :unprocessable_entity
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

    def set_task
      @task = Task.find_by(id: params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :due_date, :completed, :image, :remove_image)
    end
end
