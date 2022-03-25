FactoryBot.define do
  factory :worker_exam do
    got_on { '2022-03-17' }
    images { '' }
    association :worker_medical
    association :special_med_exam
  end
end
