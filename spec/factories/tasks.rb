FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "タスク#{n}" }
    description { '説明文' }
    sequence(:deadline) { Faker::Date.forward }
  end
end
