FactoryBot.define do
  factory :worker_special_education do
    got_on { '2022-02-12' }
    images { '' }
    association :worker
    association :special_education
  end
end
