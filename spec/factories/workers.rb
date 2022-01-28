FactoryBot.define do
  factory :worker do
    name { "MyString" }
    name_kana { "MyString" }
    country { "MyString" }
    my_address { "MyString" }
    my_phone_number { "MyString" }
    family_address { "MyString" }
    family_phone_number { "MyString" }
    birth_day_on { "2022-01-28" }
    abo_blood_type { 1 }
    rh_blood_type { 1 }
    job_type { 1 }
    hiring_on { "2022-01-28" }
    experience_term_before_hiring { 1 }
    blank_term { 1 }
    carrier_up_id { "MyString" }
    images { "" }
  end
end
