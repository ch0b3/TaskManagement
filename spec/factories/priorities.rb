FactoryBot.define do
  factory :priority do
    value do "MyString" end
  end

  factory :priority_high, class: Priority do
    id do 1 end
    name do "高" end
  end

  factory :priority_medium, class: Priority do
    id do 2 end
    name do "中" end
  end

  factory :priority_low, class: Priority do
    id do 3 end
    name do "低" end
  end
end
