FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task Title #{n}" }
    description { "Some description" }
    due_date { Date.today + 1.day }
    completed { false }
  end
end
