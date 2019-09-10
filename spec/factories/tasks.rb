FactoryBot.define do
  factory :task do
    name   do "タスク" end
    description  do "説明文" end
    deadline  do "2029-04-01" end
    association :status_id, factory: :status
    association :priority, factory: :priority
    # statusとpriorityのみでも可
  end
end
