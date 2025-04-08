# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

image_path = Rails.root.join("spec", "fixtures", "files", "sample.jpg")

task1 = Task.create!(
  title: "Task 1",
  description: "This is a valid task with all necessary attributes.",
  due_date: Date.tomorrow,
  completed: false
)
task1.image.attach(io: File.open(image_path), filename: "sample.jpg", content_type: "image/jpeg")

task2 = Task.create!(
  title: "Task 2",
  description: "This task does not have an image attached.",
  due_date: Date.tomorrow,
  completed: false
)

task3 = Task.create!(
  title: "Task 3",
  description: "This task has an image attached.",
  due_date: Date.tomorrow,
  completed: true
)
task3.image.attach(io: File.open(image_path), filename: "sample.jpg", content_type: "image/jpeg")


task4 = Task.create!(
  title: "Task 4",
  description: "This task will have an image attached.",
  due_date: Date.tomorrow,
  completed: false
)
task4.image.attach(io: File.open(image_path), filename: "sample.jpg", content_type: "image/jpeg")
