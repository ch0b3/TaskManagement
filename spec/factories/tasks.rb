FactoryBot.define do
  factory :task do
    sequence(:name) {|n| "タスク#{n}"}
    description { "説明文" }
    deadline { "2020-04-01" }
    status  { [1,2,3].sample }
    priority_id { [1,2,3].sample } 
  end
end
