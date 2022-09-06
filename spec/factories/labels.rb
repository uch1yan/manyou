FactoryBot.define do
  factory :label do
    name { "label_name" }
  end

  factory :label2, class: Label do
    name { "label_name2" }
  end
end
