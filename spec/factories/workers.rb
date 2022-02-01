FactoryBot.define do
  factory :worker do
    name { 'TEST作業員' }
    name_kana { 'テストサギョウイン' }
    country { '日本' }
    my_address { '東京都港区1-1-1' }
    my_phone_number { '09012341234' }
    family_address { '東京都新宿区1-1-1' }
    family_phone_number { '0987654321' }
    birth_day_on { '2000-01-01' }
    abo_blood_type { 0 }
    rh_blood_type { 0 }
    job_type { 1 }
    hiring_on { '2010-01-01' }
    experience_term_before_hiring { '3' }
    blank_term { '2' }
    business
  end
end
