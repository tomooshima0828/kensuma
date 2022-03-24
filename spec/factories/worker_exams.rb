FactoryBot.define do
  factory :worker_exam do
    worker_medical { nil }
    special_med_exam { nil }
    got_on { '2022-03-17' }
    images { '' }
  end
end
