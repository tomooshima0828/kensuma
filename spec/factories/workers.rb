FactoryBot.define do
  factory :worker do
    name { "TestWorker" }
    name_kana { "テストワーカー" }
    country { "日本" }
    my_address { "東京都" }
    my_phone_number { "090-1234-5678" }
    family_address { "東京都" }
    family_phone_number { "080-8765-4321" }
    birth_day_on { "2022-01-20" }
    abo_blood_type { 0 }
    rh_blood_type { 0 }
    job_type { 0 }
    hiring_on { "2022-01-01" }
    experience_term_before_hiring { 0 }
    blank_term { 0 }
    carrier_up_id { "test_carrier_id" }
    images { "" }
  end
end
