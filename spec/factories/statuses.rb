FactoryBot.define do
  factory :status do
    name do "MyString" end
  end

  factory :status_done, class: Status do
    id do 1 end
    name do "完了" end
  end

  factory :status_underway, class: Status do
    id do 2 end
    name do "着手中" end
  end

  factory :status_untouched, class: Status do
    id do 3 end
    name do "未着手" end
  end
end
