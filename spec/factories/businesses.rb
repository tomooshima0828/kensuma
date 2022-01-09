FactoryBot.define do
  factory :business do
    association :user

    uuid { "1" }
    name { "TEST企業" }
    name_kana { "テストキギョウ" }
    branch_name { "TEST支店" }
    representative_name { "TEST代表" }
    sequence(:email) { |n| "test#{n}@example.com" }
    address { "TEST" }
    post_code { "0120123" }
    phone_number { "090-0123-0123" }
    carrier_up_id { "0001" }
    business_type { 0 }
  end
end
