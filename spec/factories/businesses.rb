FactoryBot.define do
  factory :business do
    uuid { "MyString" }
    name { "MyString" }
    name_kana { "MyString" }
    branch_name { "MyString" }
    representative_name { "MyString" }
    email { "MyString" }
    address { "MyString" }
    post_code { "MyString" }
    phone_number { "MyString" }
    carrier_up_id { "MyString" }
    stamp_images { "" }
    business_type { 1 }
  end
end
