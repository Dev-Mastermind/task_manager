class TaskNotificationJob < ApplicationJob
  queue_as :default

  def perform(task)
    puts "Task Created: #{task.title}"
  end
end
