FactoryBot.define do
  factory :task do
<<<<<<< HEAD
    sequence(:name) do |n| "タスク#{n}" end
    description do "説明文" end
    sequence(:deadline) do Faker::Date.forward end
=======
    name   do "タスク" end
    description  do "説明文" end
    deadline  do "2029-04-01" end
    association :status_id, factory: :status
    association :priority, factory: :priority
    # statusとpriorityのみでも可
>>>>>>> 4290583e5e5dfd909bd58a41e2de5e31ff249c30
  end
end
