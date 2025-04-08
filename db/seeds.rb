# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  task = Task.create!(
    title: "Task #{i + 1}",
    description: "This is a task created for the #{i + 1} time.",
    due_date: Date.tomorrow,
    completed: i.even?
  )

  image_path = Rails.root.join("spec", "fixtures", "files", "sample.jpg")
  task.image.attach(io: File.open(image_path), filename: "sample.jpg", content_type: "image/jpeg")
end
