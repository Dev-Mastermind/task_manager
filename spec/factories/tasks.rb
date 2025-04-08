FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task Title #{n}" }
    description { Faker::Lorem.sentence }
    due_date { Faker::Date.forward(days: 1) }
    completed { false }
  end
end
