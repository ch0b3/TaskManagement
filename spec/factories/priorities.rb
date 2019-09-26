FactoryBot.define do
  factory :priority do
<<<<<<< HEAD
    
=======
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
>>>>>>> 4290583e5e5dfd909bd58a41e2de5e31ff249c30
  end
end
