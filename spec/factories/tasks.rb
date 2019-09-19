FactoryBot.define do
  factory :task do
    sequence(:name) do |n| "タスク#{n}" end
    description do "説明文" end
    sequence(:deadline) do Faker::Date.forward end
  end
end
